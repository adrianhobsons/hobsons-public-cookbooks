%w{ pkg-config libcurl4-openssl-dev libfuse-dev libfuse2 }.each do |pkg|
  package pkg
end

remote_file "/tmp/s3fs-1.61.tar.gz" do
  source "http://s3fs.googlecode.com/files/s3fs-1.61.tar.gz"
  mode 0644
end

bash "install s3fs" do
  cwd "/tmp"
  code <<-EOH
  tar zxvf s3fs-1.61.tar.gz
  cd s3fs-1.61
  configure
  make
  make install
  mkdir -p /mnt/#{ node[:s3][:bucket] } 
  s3fs #{ node[:s3][:bucket] }  -o accessKeyId=#{ node[:access_key] } -o secretAccessKey=#{ node[:secret_key] } -o allow_other /mnt/#{ node[:s3][:bucket] } 

  EOH
  
  not_if { File.exists?("/usr/bin/s3fs") }
end

