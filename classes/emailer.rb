require 'pony'

class Emailer
  def self.mail(to, subject, body)
    Pony.mail({
      :to => to,
      :subject => subject,
      :html_body => body,
      :from => 'innovationstudio@unl.edu',
      :via => self.method,
      :via_options => self.method_options
    })
  end

  private 

  def self.method
    if ENV['RACK_ENV'] == 'development'
      :smtp
    else
      :sendmail
    end
  end

  def self.method_options
    if ENV['RACK_ENV'] == 'development'
      {
        :address => '127.0.0.1',
        :port => '1025'
      }
    else
      {}
    end
  end
end