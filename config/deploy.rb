# config valid only for Capistrano 3.1
lock '3.2.1'

set :application, 'easybakeoven'
set :repo_url, 'git@github.com:shawncatz/easybakeoven'
set :user, "deploy"
set :branch, "master"
set :rails_env, "production"

# Default branch is :master
# ask :branch, proc { `git rev-parse --abbrev-ref HEAD`.chomp }

# Default deploy_to directory is /var/www/my_app
set :deploy_to, "/srv/apps/#{fetch(:application)}"

# Default value for :scm is :git
set :scm, :git

# Default value for :format is :pretty
# set :format, :pretty

# Default value for :log_level is :debug
# set :log_level, :debug

# Default value for :pty is false
set :pty, true

# Default value for :linked_files is []
# set :linked_files, %w{config/database.yml}

# Default value for linked_dirs is []
set :linked_dirs, %w{bin log tmp/pids tmp/cache tmp/sockets}

# Default value for default_env is {}
# set :default_env, { path: "/opt/ruby/bin:$PATH" }

# Default value for keep_releases is 5
set :keep_releases, 5

set :bundle_flags, "--quiet"

set :rvm_ruby_version, '2.1.1'

# foreman
# set :foreman_cmd,          :foreman
# set :foreman_format,       "daemon"
# set :foreman_location,     "/etc/init"
# set :foreman_port,         7000
# set :foreman_root,         -> { release_path }
# set :foreman_procfile,     -> { release_path.join('Procfile.production') }
# set :foreman_app,          -> { fetch(:application) }
# set :foreman_user,         fetch(:user)
# set :foreman_log,          -> { shared_path.join('log') }
# set :foreman_pids,         false
# set :foreman_concurrency, "web=1,worker=1,socket=1"
# set :foreman_sudo,         false
# set :foreman_roles,        :all
# set :foreman_servers,      -> { release_roles(fetch(:foreman_roles)) }

# new relic
# set :newrelic_license_key, "4c61cd96d0facf2a630b1102cbfa7817e5f093b9"

namespace :deploy do

  desc 'Restart application'
  task :restart do
    #on roles(:app), in: :sequence, wait: 5 do
    on roles(:app) do
      # Your restart mechanism here, for example:
      # execute :touch, release_path.join('tmp/restart.txt')
      info "restarting..."
    end
  end

  after :publishing, :restart

  after :restart, :clear_cache do
    on roles(:web), in: :groups, limit: 3, wait: 10 do
      # Here we can do anything such as:
      # within release_path do
      #   execute :rake, 'cache:clear'
      # end
    end
  end

end

namespace :logs do
  desc 'tail logs'
  task :tail do
    on roles(:app) do
      within current_path do
        execute :tail, "-f", %w{services seer-worker-1 jobs}.map {|e| "log/#{e}.log"}.join(" ")
      end
    end
  end
end
