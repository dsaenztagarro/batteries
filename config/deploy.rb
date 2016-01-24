# config valid only for current version of Capistrano
lock '3.4.0'

set :application, 'myfamilyweb'
set :repo_url, 'https://github.com/dsaenztagarro/myfamilyweb.git'

set :stages, %w(vagrant production)
set :default_stage, 'vagrant'

set :use_sudo, false

set :ssh_options, forward_agent: true

# Default branch is :master
# ask :branch, `git rev-parse --abbrev-ref HEAD`.chomp

# Default deploy_to directory is /var/www/my_app_name
# set :deploy_to, '/var/www/my_app_name'

# Default value for :scm is :git
# set :scm, :git

# Default value for :format is :pretty
# set :format, :pretty

# Default value for :log_level is :debug
set :log_level, :info

# Default value for :pty is false
# set :pty, true

# Default value for :linked_files is []
set :linked_files, %w(config/database.yml config/secrets.yml)

# Default value for linked_dirs is []
set :linked_dirs, fetch(:linked_dirs, []).push(%w(
  log tmp/pids tmp/cache tmp/sockets vendor/bundle public/system))

# Default value for default_env is {}
# set :default_env, { path: "/opt/ruby/bin:$PATH" }

# Default value for keep_releases is 5
# set :keep_releases, 5

# which config files should be copied by deploy:setup_config
# see documentation in lib/capistrano/tasks/setup_config.cap
# for details of operations
# set(:config_files, %w(
#   nginx.conf
#   database.example.yml
#   log_rotation
#   monit
#   unicorn.rb
#   unicorn_init.sh
# ))

# which config files should be made executable after copying
# by deploy:setup_config
# set(:executable_config_files, %w(
#   unicorn_init.sh
# ))

namespace :deploy do
  after :restart, :clear_cache do
    on roles(:web), in: :groups, limit: 3, wait: 10 do
      # Here we can do anything such as:
      # within release_path do
      #   execute :rake, 'cache:clear'
      # end
    end
  end
end

namespace :rails do
  task :console do
    on roles(:app) do
      execute "ssh -l -t deployer@myfamilyweb.es '#{current_path}/bin/rails console production'"
    end
  end
end
