#execute "testing" do
#  command %Q{
#    echo "i ran at #{Time.now}" >> /root/cheftime
#  }
#end

#require_recipe 'postgres'

# uncomment if you want to run couchdb recipe
# require_recipe "couchdb"

# uncomment to turn use the MBARI ruby patches for decreased memory usage and better thread/continuationi performance
# require_recipe "mbari-ruby"

# uncomment to turn on thinking sphinx 
# require_recipe "thinking_sphinx"

# uncomment to turn on ultrasphinx 
# require_recipe "ultrasphinx"

#uncomment to turn on memcached
# require_recipe "memcached"

#uncomment to run the authorized_keys recipe
#require_recipe "authorized_keys"

#uncomment to run the eybackup_slave recipe
#require_recipe "eybackup_slave"

#uncomment to run the ssmtp recipe
#require_recipe "ssmtp"

#uncomment to run the sunspot recipe
# require_recipe "sunspot"

#uncomment to run the exim recipe
#require_recipe "exim"

#uncomment to run the ruby-heaps-stack recipe
#require_recipe "ruby-heaps-stack"

#require_recipe "solr"

#uncomment to run the riak recipe
#require_recipe "riak"
#exim_instance = if node.engineyard.environment.solo_cluster?
#                  node.engineyard.environment.instances.first
#                else
#                  node.engineyard.environment.utility_instances.find {|x| x.name == "exim"}
#                end
#
#if node.engineyard == exim_instance
#  exim_auth "auth" do
#    my_hostname "example.com"
#    smtp_host "smtp.gmail.com:587"
#    username 'username'
#    password 'password'
#  end
#else
#  Chef::Log.info "Util server is #{exim_instance.id}"
#  ssmtp_conf "default" do
#    mailhub exim_instance.public_hostname
#    rewrite_domain "hostname.com"
#    from_line_override true
#  end
#end

