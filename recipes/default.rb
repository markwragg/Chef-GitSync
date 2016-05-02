#
# Cookbook Name:: git-to-disk
# Recipe:: default
#
node['git-to-disk']['repositories'].each do |repositoryname|
  foldername = repositoryname.scan(%r{([^\/]+)(?=\.\w+$)}).last.first

  git "#{node['git-to-disk']['rootpath']}#{foldername}" do
    repository repositoryname
    revision node['git-to-disk']['branch']
    action :sync
  end
end
