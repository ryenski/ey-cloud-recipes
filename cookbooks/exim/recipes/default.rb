#
# Cookbook Name:: exim
# Recipe:: default
#
# Configuration settings

#if ['solo', 'util'].include?(node[:instance_role])

  package "mail-mta/ssmtp" do
    action :remove
    ignore_failure true
  end

  package "mail-mta/exim" do
    action :install
  end

  directory "/data/exim" do
    action :create
    owner "root"
    group "root"
    mode "0755"
  end

  execute "copy dist-config over to shared" do
    command "cp /etc/exim/exim.conf.dist /data/exim/exim.conf"
    not_if { FileTest.exists?("/data/exim/exim.conf") }
    only_if { FileTest.directory?("/data/exim") }
  end

  execute "copy system_filter.exim" do
    command "cp /etc/exim/system_filter.exim /data/exim/system_filter.exim"
    not_if { FileTest.exists?("/data/exim/system_filter.exim") }
    only_if { FileTest.directory?("/data/exim") }
  end

  execute "copy auth_conf.sub" do
    command "cp /etc/exim/auth_conf.sub /data/exim/auth_conf.sub"
    not_if { FileTest.exists?("/data/exim/auth_conf.sub") }
    only_if { FileTest.directory?("/data/exim") }
  end

  execute "remove /etc/exim" do
    command "rm -rf /etc/exim"
    only_if { FileTest.driectory("/data/exim") && FileTest.exists?("/data/exim/exim.conf") }
  end

  link "/data/exim" do
    to "/etc/exim"
  end

package "mail-client/mailx" do
  action :install
end

execute "ensure-exim-is-running" do
  command %Q{
    /etc/init.d/exim start
  }
  not_if "pgrep exim"
end
#end
