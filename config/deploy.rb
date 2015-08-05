# config valid only for current version of Capistrano
lock '3.3.5'

set :application, 'family_gallery_impl'
set :repo_url, 'https://github.com/kaspernj/family_gallery_impl.git'

# Default branch is :master
# ask :branch, proc { `git rev-parse --abbrev-ref HEAD`.chomp }.call

# Default deploy_to directory is /var/www/my_app_name
set :deploy_to, '/var/www/family_gallery_impl'

# Default value for :scm is :git
# set :scm, :git

# Default value for :format is :pretty
# set :format, :pretty

# Default value for :log_level is :debug
# set :log_level, :debug

# Default value for :pty is false
set :pty, true

# Default value for :linked_files is []
set :linked_files, fetch(:linked_files, []).push('config/database.yml', 'config/family_gallery.yml')

# Default value for linked_dirs is []
set :linked_dirs, fetch(:linked_dirs, []).push('bin', 'log', 'tmp/pids', 'tmp/cache', 'tmp/sockets', 'vendor/bundle', 'public/system')

# Default value for default_env is {}
# set :default_env, { path: "/opt/ruby/bin:$PATH" }

# Default value for keep_releases is 5
set :keep_releases, 5

# RVM
set :rvm_ruby_version, '2.2.0'

namespace :deploy do
  after :restart, :clear_cache do
    on roles(:web), in: :groups, limit: 3 do
      # Here we can do anything such as:
      # within release_path do
      #   execute :rake, 'cache:clear'
      # end
    end
  end

  after :publishing, :restart

  task :restart do
    on roles(:web), in: :sequence do
      execute :sudo, 'apache2ctl graceful'

      within release_path do
        with rails_env: fetch(:rails_env) do
          execute :rake, 'plugin_migrator:migrate'
        end
      end
    end
  end
end
