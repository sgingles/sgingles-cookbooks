node[:deploy].each do |application, deploy|
  execute "update crontab" do
    cwd deploy[:current_path]
    user "deploy"
    # We include a sha to work around a whenever bug
    command "bundle exec whenever --set environment=#{deploy[:rails_env]} --update-crontab #{application}"
    action :run

    only_if do
      File.exists?(deploy[:current_path])
    end
  end
end
