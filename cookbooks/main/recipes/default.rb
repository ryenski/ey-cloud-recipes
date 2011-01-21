#execute "testing" do
#  command %Q{
#    echo "i ran at #{Time.now}" >> /root/cheftime
#  }
#end

# uncomment if you want to run couchdb recipe
# require_recipe "couchdb"

# uncomment to turn use the MBARI ruby patches for decreased memory usage and better thread/continuationi performance
# require_recipe "mbari-ruby"

# uncomment to turn on thinking sphinx/ultra sphinx. Remember to edit cookbooks/sphinx/recipes/default.rb first!
# require_recipe "sphinx"

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
#exim_auth "auth" do
#  my_hostname "my_hostname.com"
#  smtp_host "smtp.sendgrid.net"
#  username "username"
#  password "password"
#end

#uncomment to run the ruby-heaps-stack recipe
#require_recipe "ruby-heaps-stack"

#uncomment to run the solr recipe
#require_recipe "solr"

#uncomment to run the resque recipe
#require_recipe "resque"

#uncomment to run the resque-web recipe
#require_recipe "resque_web"

#uncomment to run the riak recipe
#require_recipe "riak"

#uncomment to run the emacs recipe
#require_recipe "emacs"

#uncomment to run the eybackup_verbose recipe
#require_recipe "eybackup_verbose"

require_recipe 'nginx'

#uncomment to include the mysql_replication_check recipe
#require_recipe "mysql_replication_check"

require_recipe "postgres::default"
