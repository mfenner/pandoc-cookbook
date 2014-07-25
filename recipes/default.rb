include_recipe 'cabal'

# Install required packages
# we install texlive for latex and pdf output
# we install inkscape for svg output
%w{haskell-platform texlive inkscape curl}.each do |pkg|
  package pkg do
    action :install
  end
end

# Add binaries installed by cabal to PATH
file '/etc/profile.d/cabal.sh' do
  content "export PATH=$PATH:~/.cabal/bin"
end

bash "source profile" do
  command "source .profile"
end

# Update cabal
cabal_update node[:pandoc][:user]

# Install pandoc
cabal_install "pandoc-#{node[:pandoc][:version]}" do
  user node[:pandoc][:user]
end

# Install pandoc-citeproc
cabal_install "pandoc-citeproc-#{node[:citeproc][:version]}" do
  user node[:pandoc][:user]
end
