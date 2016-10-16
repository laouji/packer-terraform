username = "crimson"

group "crimson" do
  gid 1001
end

user "#{username}" do
  uid 1001
  gid 1001
  shell '/bin/zsh'
  password data_bag_item('ssh', 'crimson')['password']
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
  content data_bag_item('ssh', 'crimson')['public_key']
end
