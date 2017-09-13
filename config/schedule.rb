# file config/schedule.rb
set :environment, "development"
#để kiểm soát lỗi gửi mail hệ thống
set :output, "log/cron_log.log"
env :PATH, ENV['PATH']

every :friday, at: "14:50pm" do
  rake "send_email_week"
end
