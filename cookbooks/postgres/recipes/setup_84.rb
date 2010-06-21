# Setup 8.4 binary packages on the instance nothing more.

case node[:kernel][:machine]
when "i686"

  remote_file "/engineyard/portage/packages/dev-db/postgresql-base-8.4.2.tbz2" do
    source "i686/packages/dev-db/postgresql-base-8.4.2.tbz2"
    owner "root"
    group "root"
    backup 0
    mode 0755
  end

  remote_file "/engineyard/portage/packages/dev-db/postgresql-server-8.4.2.tbz2" do
    source "i686/packages/dev-db/postgresql-server-8.4.2.tbz2"
    owner "root"
    group "root"
    backup 0
    mode 0755
  end

when "x86_64"

  remote_file "/engineyard/portage/packages/dev-db/postgresql-base-8.4.2.tbz2" do
    source "x86_64/packages/dev-db/postgresql-base-8.4.2.tbz2"
    owner "root"
    group "root"
    backup 0
    mode 0755
  end

  remote_file "/engineyard/portage/packages/dev-db/postgresql-server-8.4.2.tbz2" do
    source "x86_64/packages/dev-db/postgresql-server-8.4.2.tbz2"
    owner "root"
    group "root"
    backup 0
    mode 0755
  end
end
