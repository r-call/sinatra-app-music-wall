# Homepage (Root path)

helpers do
  def current_user
    if session[:user_id]
      User.find(session[:user_id])
    end
  end
end

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

get '/signup' do
  erb :'/signup'
end

post '/signup' do
  @user = User.new(
    email: params[:email],
    password: params[:password]
  )
  @user.save
  session[:user_id] = @user.id

  redirect '/'
end

post '/login' do
  response.set_cookie("username", params[:username])
  redirect "/"  
end