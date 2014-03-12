# Install required packages
%w{curl unzip}.each do |pkg|
  package pkg do
    action :install
  end
end

# Install Pandoc binary

remote_file "#{Chef::Config[:file_cache_path]}/#{node[:pandoc][:filename]}" do
  source "#{node[:pandoc][:remote_path]}"
  action :create_if_missing
end

bash "install_pandoc_binary" do
  user "vagrant"
  cwd Chef::Config[:file_cache_path]
  code <<-EOH
    export PATH="$HOME/pandoc:$PATH"
    mkdir $HOME/pandoc
    unzip -j #{node[:pandoc][:filename]}" pandoc-#{node[:pandoc][:version]}"/linux/debian/x86_64/pandoc -d $HOME/pandoc
    chmod +x $HOME/pandoc/pandoc
  EOH
end