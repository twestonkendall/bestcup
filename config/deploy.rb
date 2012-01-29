set :user, "root"
set :domain, "bestcup.co"
set :application, "bestcup.co"

set :repository,  "git@github.com:twestonkendall/bestcup.git"
set :deploy_to, "/var/www/vhost/bestcup"

# default_environment['PATH']='<your paths>:/usr/local/bin:/usr/bin:/bin'
# default_environment['GEM_PATH']='<your paths>:/usr/lib/ruby/gems/1.8'

set :deploy_via, :copy
set :scm, "git"
set :branch, "master"
set :scm_verbose, true
set :use_sudo, false

role :web, "bestcup.co"                          # Your HTTP server, Apache/etc
role :app, "bestcup.co"                          # This may be the same as your `Web` server
role :db,  "bestcup.co", :primary => true         # This is where Rails migrations will run


# if you're still using the script/reaper helper you will need
# these http://github.com/rails/irs_process_scripts

# If you are using Passenger mod_rails uncomment this:
namespace :deploy do
  desc "cause Passenger to initiate a restart"
  task :restart do
    run "touch #{current_path}/temp/restart.txt"
  end
  
  # desc "reload the database with the seed data"
  #  task :seed do
  #    run "cd #{current_path}; rake db:seed RAILS_ENV=production"
  #  end
end


after "deploy:update_code", :bundle_install
desc "install the necissary prequisites"
task :bundle_install, :roles => :app do
  run "cd #{release_path} && bundle install"
end