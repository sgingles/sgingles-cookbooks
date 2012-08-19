# Set your application name here
appname = "sgingles"

  local_user = node[:users].first
  execute "whenever" do
    cwd deploy[:current_path]
    user local_user[:username]
    command "bundle exec whenever --update-crontab '#{appname}_#{node[:environment][:framework_env]}'"
    action :run
  end


