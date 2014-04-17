class Reminder < ActionMailer::Base
  default from: "no-reply@khanacademy.org"

  def deadline_approaching(recipient)
  	@account = recipient
  	mail(to: recipient.email, subject: "Video Deadlines Approaching!", from: "no-reply@khanacademy.org")
  end
end
