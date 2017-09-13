desc 'send email week'
task send_email_week: :environment do
  UserMailer.email_week.deliver!
end
