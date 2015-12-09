set :rails_env, 'production'
set :user, 'deployer'
server 'myfamilyweb.local', user: 'deployer', roles: %w{app db web}
set :ssh_options, {:forward_agent => true, keys: ['~/.vagrant.d/insecure_private_key']}
