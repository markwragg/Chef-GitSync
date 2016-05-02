require 'serverspec'
# Required by serverspec
set :backend, :cmd
set :os, family: 'windows'

# Check the repo has been download
describe file('C:\code\Chef-GitSync\.git') do 
    it { should exist }
end