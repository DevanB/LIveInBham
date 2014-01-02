require 'bundler/capistrano'
require 'sidekiq/capistrano'

server "192.241.170.82", :web, :app, :db, primary: true

set :application, 'liveinbham'
set :user, 'deployer'
set :deploy_to, "/home/#{user}/apps/#{application}"
set :deploy_via, :remote_cache
set :use_sudo, false
set :rails_env, "production"

set :scm, "git"
set :repository,  "git@github.com:DevanB/LIveInBham.git" #GitHub clone URL
set :branch, "master"
set :scm_verbose, true
set :git_shallow_clone, 1
set :git_enable_submodules, 1

default_run_options[:pty] = true
ssh_options[:forward_agent] = true

after "deploy", "deploy:cleanup" # keep only the last 5 releases

namespace :deploy do
  %w[start stop restart].each do |command|
    desc "#{command} unicorn server"
    task command, roles: :app, except: {no_release: true} do
      run "/etc/init.d/unicorn_#{application} #{command}"
    end
  end

  task :setup_config, roles: :app do
    sudo "ln -nfs #{current_path}/config/nginx.conf /etc/nginx/sites-enabled/#{application}"
    sudo "ln -nfs #{current_path}/config/unicorn_init.sh /etc/init.d/unicorn_#{application}"
    run "mkdir -p #{shared_path}/config"
    put File.read("config/database.example.yml"), "#{shared_path}/config/database.yml"
    puts "Now edit the config files in #{shared_path}"
  end
  after "deploy:setup", "deploy:setup_config"

  task :symlink_config, roles: :app do
    run "ln -nfs #{shared_path}/config/database.yml #{release_path}/config/database.yml"
  end
  after "deploy:finalize_update", "deploy:symlink_config"

  desc "Make sure local git is in sync with remote."
  task :check_revision, roles: :web do
    # unless `git rev-parse HEAD` == `git rev-parse origin/master`
    #   puts "WARNING: HEAD is not the same as origin/master"
    #   puts "Run `git push` to sync changes."
    #   exit
    # end
  end
  before "deploy", "deploy:check_revision"

  desc "Symlinking uploads folders"
  task :symlink_uploads, :roles => :app do
    run "ln -nfs #{shared_path}/public/uploads #{release_path}/public/uploads"
  end
  before "deploy:restart", "deploy:symlink_uploads"
end

desc "tail log files"
task :tail, :roles => :app do
  run "tail -f /home/#{user}/apps/#{application}/current/log/production.log" do |channel, stream, data|
    puts "#{channel[:host]}: #{data}"
    break if stream == :err
  end
end

desc "Open the rails console on one of the remote servers"
task :console, :roles => :app do
  hostname = find_servers_for_task(current_task).first
  exec "ssh -l #{user} #{hostname} -t 'source ~/.profile && #{current_path}/script/rails c #{rails_env}'"
end
 
desc "Run a task on a remote server."   
task :clean_events do  
  run("cd #{deploy_to}/current; /usr/bin/env rake clean_events RAILS_ENV=production")  
end