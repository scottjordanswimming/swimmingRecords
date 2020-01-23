class UsersController < ApplicationController

#users can sign up
get "/signup" do
  erb :'users/signup'
#users can delete account

end

post '/signup' do
  #users should not be able to create an account with any black creds
  #users should not be able to create an account with a username that already exists

  user = User.new(params)
  if user.username.empty? || user.password.empty?
    @error = "Username and password can't be black. Please enter valid credentials"
    erb :'users/signup'
  elsif User.find_by(username: user.username)
    @error = "Account with that username already exists"
    erb :'users/signup'
else
  user.save
  session[:user_id] = user.id
  redirect '/records'
end
end
end
