include_recipe 'cabal'

# Install Haskell Platform
package "haskell-platform" do
  action :install
end

# Update Cabal
cabal_update node[:pandoc][:user]

# Install Pandoc
cabal_install "pandoc" do
  user node[:pandoc][:user]
end

# Install Pandoc-Citeproc
cabal_install "pandoc-citeproc" do
  user node[:pandoc][:user]
end
