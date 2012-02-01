set :user, 'root'
set :domain, 'bestcup.co'
set :application, 'bestcup'

set :repository,  "git@github.com:twestonkendall/bestcup.git"
set :deploy_to, "/var/www/vhost/bestcup"

set :use_sudo, false
set :deploy_via, :copy

set :scm, :git
# Or: `accurev`, `bzr`, `cvs`, `darcs`, `git`, `mercurial`, `perforce`, `subversion` or `none`

role :web, "bestcup.co"                          # Your HTTP server, Apache/etc
role :app, "bestcup.co"                          # This may be the same as your `Web` server
role :db,  "bestcup.co", :primary => true # This is where Rails migrations will run

# if you're still using the script/reaper helper you will need
# these http://github.com/rails/irs_process_scripts

# If you are using Passenger mod_rails uncomment this:
# namespace :deploy do
#   task :start do ; end
#   task :stop do ; end
#   task :restart, :roles => :app, :except => { :no_release => true } do
#     run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
#   end
# end

namespace :deploy do
  task :restart do
    run "touch #{current_path}/tmp/restart.txt"
  end
  
  task :seed do
    run "cd #{current_path}; rake db:seed RAILS_ENV=production"
  end
end

after "deploy:update_code", :bundle_install
task :bundle_install, :roles => :app do
  run "cd #{release_path} && bundle install"
end