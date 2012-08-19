node[:deploy].each do |application, deploy|
  execute "update crontab" do
    cwd deploy[:current_path]
    user "deploy"
    # We include a sha to work around a whenever bug
    command "cd #{deploy[:deploy_to]}/current && bundle exec whenever --update-crontab"
    action :run
  end
end
