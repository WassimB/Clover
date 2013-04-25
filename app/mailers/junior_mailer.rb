class JuniorMailer < ActionMailer::Base
  default :from => "no-reply@#{host}"

  def forgot_password(junior, key)
    @junior, @key = junior, key
    mail( :subject => "#{app_name} -- forgotten password",
          :to      => junior.email_address )
  end


  def activation(junior, key)
    @junior, @key = junior, key
    mail( :subject => "#{app_name} -- activate",
          :to      => junior.email_address )
  end

end
