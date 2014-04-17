class DevelopmentMailInterceptor
  def self.delivering_email(message)
    message.subject = "*development_interceptor*Video Deadlines Approaching!"
    message.from = "no_reply@khanacademy.org"
  end
end