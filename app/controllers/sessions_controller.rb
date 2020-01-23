class SessionsController < ApplicationController

#user can login
get '/login' do
  erb :'/users/login'
end

post '/login' do

  if params["username"].empty? || params["password"].empty?
    @error = "Username and password can't be blank. Please enter valid credentials"
    erb :'users/login'

  else
    if User.find_by(username: params["usersname"], password: params["password"])
      session[:user_id] = user.id
      redirect '/records'
    else
      @error = "Account not found"
      erb :'/users/signup'
end
end

end
get '/logout' do
  session.clear
  redirect '/'
end
end
