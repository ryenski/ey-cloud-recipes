gem = if File.directory?("/usr/local/ey_resin")
        "/usr/local/ey_resin/ruby/bin/gem"
      else
        "gem"
      end

unless system("#{gem} list dnapi -i -v 1.0.6")
  system("cd /tmp && " \
         "wget -c http://ey-cloud.s3.amazonaws.com/dnapi-1.0.6.gem && " \
         "#{gem} install dnapi-1.0.6.gem") || abort("Failed to install dnapi")
  Gem.source_index.refresh!
  gem 'dnapi'
end

require 'dnapi'
class Chef::Node
  def engineyard
    @engineyard ||= DNApi.from(File.read("/etc/chef/dna.json"))
  end
end
