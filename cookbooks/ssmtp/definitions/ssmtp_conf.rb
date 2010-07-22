define :ssmtp_conf, :mailhub => nil, :rewrite_domain => "", :from_line_override => true do
  username = node.engineyard.environment.users.first[:username]

  template "/etc/ssmtp/ssmtp.conf" do
    cookbook "ssmtp"
    source "ssmtp.conf.erb"
    owner username
    group username
    mode 0644
    backup 2
    variables(:p => params)
  end
end

package "mail-client/mailx" do
  action :install
end
