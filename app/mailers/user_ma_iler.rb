class UserMaIler < ActionMailer::Base
  default from: "spsiddhu@gmail.com"
	def welcome_email(user)
    @user = user
    @url  = "http://localhost:3000/programmers"
    mail(:to => user.email, :subject => "Congrats! You have signed up for Meet and Hack. Happy Hacking!")
  end
end
