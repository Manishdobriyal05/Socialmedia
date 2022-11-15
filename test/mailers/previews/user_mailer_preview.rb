# Preview all emails at http://localhost:3000/rails/mailers/user_mailer
class UserMailerPreview < ActionMailer::Preview
  def new_user_email
    user = User.new(username: "Gaurav", email: "gaurav.codenote@gmail.com")

    UserMailer.with(username: user).new_user_email
  end


end
