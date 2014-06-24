class SummaryMailer < ActionMailer::Base
  default from: "nordstrom@beverage-innovations.com"
  
  def summary_email(day)
    mail(to: "holger.von.ameln@me.com", subject: "Daily summary: #{day}")
  end
  
end
