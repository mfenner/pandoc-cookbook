include_recipe 'cabal'

# Install Haskell Platform
package "haskell platform" do
  action :install
end

# Update Cabal
cabal_update

# Install Pandoc
%w{pandoc pandoc-citeproc}.each do |pkg|
cabal_install pkg do
  user 'vagrant'
end
