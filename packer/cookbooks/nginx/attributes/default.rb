default[:nginx] = {
  :user                 => "nginx",
  :group                => "nginx",
  :root_dir             => "/etc/nginx",
  :config_dir           => "/etc/nginx/conf.d",
  :include_dir          => "/etc/nginx/include",
  :gzip                 => "on",
  :set_real_ip_from     => "127.0.0.1/32",
  :worker_processes     => 1,
  :worker_connections   => 1024,
  :server_names_hash_bucket_size => 128,
  :variables_hash_max_size       => 1024,
}
