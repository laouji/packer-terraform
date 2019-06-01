users = ["crimson","builder","appuser"]

users.to_enum.with_index(1).each do |username, i|
  group "#{username}" do
    gid "100#{i}"
  end

  user "#{username}" do
    uid "100#{i}"
    gid "100#{i}"
    shell '/bin/bash'
    password data_bag_item('ssh', "#{username}")['password']
  end

  directory "/home/#{username}" do
    mode 0755
    owner username
    action :create
  end

  directory "/home/#{username}/.ssh" do
    mode 0700
    owner username
  end

  file "/home/#{username}/.ssh/authorized_keys" do
    mode 0644
    content data_bag_item('ssh', "#{username}")['public_key']
  end

  template "/home/#{username}/.bash_profile" do
    source "bash_profile.erb"
    owner "#{username}"
    group "#{username}"
    mode 0644
  end
end

sudo "crimson" do
  groups "crimson"
  nopasswd true
end
