class SessionsController < ApplicationController

#user can login
get '/login' do
  erb :'/users/login'
end

post '/login' do
#   @current_user = User.find_by(username: params[:username])
#   if @current_user && @current_user.authenticate(params[:password])
#       session[:user_id] = @current_user.id
#       session[:username] = @current_user.username
#
#       redirect '/records/show'
#   end
#   redirect '/signup'
# end

  if params["username"].empty? || params["password"].empty?
    @error = "Username and password can't be blank. Please enter valid credentials"
    erb :'users/login'

  else
    if user = User.find_by(username: params["username"], password: params["password"])
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
