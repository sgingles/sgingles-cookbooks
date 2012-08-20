node[:deploy].each do |application, deploy|
execute "delayed_job restart" do
    cwd "#{deploy[:deploy_to]}/current"
    command "/usr/bin/env RAILS_ENV=#{deploy[:rails_env]} #{deploy[:deploy_to]}/current/script/delayed_job restart"
    user "deploy"
    action :run
  end
end
