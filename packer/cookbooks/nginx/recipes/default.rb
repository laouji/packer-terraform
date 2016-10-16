template "/etc/yum.repos.d/OpenResty.repo" do
  source "OpenResty.repo.erb"
  mode 0644
end

package "openresty" do
  action :install
  options "--enablerepo=openresty"
end

directory node[:nginx][:include_dir] do
  owner "root"
  mode 0755
  recursive true
end

template "/usr/lib/systemd/system/nginx.service" do
  source "nginx.service.erb"
  mode 0644
end

template "/etc/logrotate.d/nginx" do
  source "logrotate.nginx.conf.erb"
  mode 0644
end

template "#{node[:nginx][:root_dir]}/nginx.conf" do
  source "nginx.conf.erb"
  mode 0644
  notifies :reload, "service[nginx]"
end

service "nginx" do
  supports :reload => true
  action [ :enable, :start ]
end
