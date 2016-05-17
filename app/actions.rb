# Homepage (Root path)
get '/' do
  erb :index
end

get '/tracks' do
  # 'testing tracks page'
  @tracks = Track.all
  erb :'tracks/index'
end

get '/tracks/new' do
  erb :'tracks/new'
end

post '/tracks' do
  @track = Track.new(
    song: params[:song],
    artist: params[:artist],
    url: params[:url]
  )
  @track.save
  redirect '/tracks'
end