
class RecordsController < ApplicationController

  #Create
    #New
      #make a get request to '/records'
      get '/records/new' do
        require_login
        erb :'/records/new'
    end

post '/records' do
  record = Record.new(params)
  if record.save
redirect '/records'
  else
erb :'/records/new'
end
end
    # Create
      #make a post request to '/records'

  #Read
    #index
      #make a get request to '/records'

      get '/records' do

        if logged_in?
        @records = Record.all.reverse
        erb :'records/index'
      else
        redirect '/login'
      end
      end
    #show
      #make a get request to '/records/:id'
get '/records/:id' do
  if logged_in?
  @record = Record.find_by(id: params["id"])
  if @record
  erb :'records/show'
else
  redirect '/records'
end
else
  redirect '/login'
end
end
  #Update
    #Edit
      #make a get request to display '/records/:id/edit'
get '/records/:id/edit' do
    if logged_in?
  @record = Record.find(params["id"])
  erb :'/records/edit'
else
  redirect '/login'
end
end
    #Update
      #make a put request to '/records/:id'
patch '/records/:id' do
  record = Reccord.find(params[:id])
  if !record.swimmer.empty? && !record.time.empty?
    record.update
redirect '/records'
  else
    @error = "Data invalid. Please try again."
erb :'/records/new'
end
  record.update(swimmer: params["swimmer"], time: params["time"], event: params["event"])

end
  #Destroy
    # make a delete request to '/records/:id'
    delete '/records/:id' do
      record = Record.find(params[:id])
      record.destroy
      redirect '/records'
    end
end
