# Copyright Engine Yard 2010

remote_file "/usr/src/otp_src_R13B04.tar.gz" do
  source "http://erlang.mirror.su.se/download/otp_src_R13B04.tar.gz"
  owner "root"
  mode "0655"
  group "root"
end

execute "rm old erlang dir" do
  command "cd /usr/src;rm -rf otp_src_R130B4 && sync"
  only_if { FileTest.directory?("/usr/src/otp_src_R130B4") }
end

execute "untar erlang" do
  command "cd /usr/src;tar zxfv otp_src_R13B04.tar.gz && sync"
end

execute "configure erlang" do
  command "cd /usr/src/otp_src_R13B04;./configure --prefix=/usr --sysconfdir=/etc --enable-threads --enable-smp-support --enable-hipe"
end

execute "make erlang" do
  command "cd /usr/src/otp_src_R13B04;make -j1"
end

execute "make install" do
  command "cd /usr/src/otp_src_R13B04;make install -j1"
end


