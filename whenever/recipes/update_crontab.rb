# Set your application name here
appname = "sgingles"

if ['solo', 'util'].include?(node[:instance_role])

  # be sure to replace "app_name" with the name of your application.
  local_user = node[:users].first
  execute "whenever" do
    cwd "/data/#{appname}/current"
    user local_user[:username]
    command "bundle exec whenever --update-crontab '#{appname}_#{node[:environment][:framework_env]}'"
    action :run
  end

end
