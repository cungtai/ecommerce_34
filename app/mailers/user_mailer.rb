class UserMailer < ApplicationMailer
  def email_week
    mail to: t("default.email_demo"), subject: t("default.email_week_title")
  end
end
