set :rails_env, 'vagrant'
set :user, 'vagrant'
server 'myfamilyweb.local', user: 'vagrant', roles: %w{app db web}
set :ssh_options, {:forward_agent => true, keys: ['~/.vagrant.d/insecure_private_key']}
