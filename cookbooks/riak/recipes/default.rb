#
# Cookbook Name:: riak
# Recipe:: default
#
#
include_recipe "erlang::src"

remote_file "/usr/src/riak-0.9.1.tar.gz" do
  source "http://downloads.basho.com/riak/riak-0.9/riak-0.9.1.tar.gz"
  mode "0655"
  owner "root"
  group "root"
end

execute "rm old riak directory" do
  command "rm -rf /usr/src/riak-0.9.1 && sync"
end

execute "untar riak" do
  command "cd /usr/src;tar zxfv riak-0.9.1.tar.gz"
end

execute "make riak" do
  command "cd /usr/src/riak-0.9.1;make all rel"
end

execute "install riak" do
  command "cd /usr/src/riak-0.9.1/rel/riak;rsync -av * /usr"
end

template "/usr/etc/app.config" do
  source "app.config.erb"
  owner "root"
  mode "0655"
  group "root"
  backup 0
end

template "/usr/etc/vm.args" do
  source "vm.args.erb"
  owner "root"
  group "root"
  mode "0655"
  backup 0
end

directory "/data/riak" do
  action :create
  owner "root"
  group "root"
  mode "0755"
end

directory "/data/riak/dets" do
  action :create
  owner "root"
  group "root"
  mode "0755"
end

directory "/data/riak/ring" do
  action :create
  owner "root"
  group "root"
  mode "0755"
end

execute "ensure-riak-is-running" do
  command %Q{
   /usr/bin/riak start
  }
  not_if "pgrep -f \"/usr/erts-5.7.5/bin/beam -K true -A 5 -- -root /usr -progname riak\""
end
