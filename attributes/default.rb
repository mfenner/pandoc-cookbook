default[:pandoc][:version] = "1.12.3"
default[:pandoc][:filename] = "pandoc-#{node[:pandoc][:version]}.zip"
default[:pandoc][:remote_path] = "https://s3.amazonaws.com/rstudio-buildtools/#{node[:pandoc][:filename]}"