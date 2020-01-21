
class RecordsController < ApplicationController

  #Create
    #New
      #make a get request to '/records'
      get '/records/new' do
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
        @records = Record.all.reverse
        erb :'records/index'
      end
    #show
      #make a get request to '/records/:id'
get '/records/:id' do
  @record = Record.find(params["id"])
  erb :'records/show'
end
  #Update
    #Edit
      #make a get request to display '/records/:id/edit'
get '/records/:id/edit' do
  @record = Record.find(params["id"])
  erb :'/records/edit'
end
    #Update
      #make a put request to '/records/:id'
patch '/records/:id' do
  record = Reccord.find(params[:id])
  if record.update
redirect '/records'
  else
erb :'/records/new'
end
  record.update(swimmer: params["swimmer"], time: params["time"], event: params["event"])

end
  #Destroy
    # make a delete request to '/'
end
