get '/' do
  if logged_in?
    @available_urls = current_user.urls + Url.where(user_id: nil)
  else
    @available_urls = Url.where(user_id: nil)
  end
  erb :index
end

post '/signup' do
  user = User.new(name: params[:name], email: params[:email])
  user.password=params[:password]
  user.save
  session[:user_id] = user.id
  redirect '/'
end

post '/login' do
 user = User.authenticate(params[:email], params[:password])
 if user
  session[:user_id] = user.id
 end
 redirect '/'
end

get '/logout' do
  session.clear
  redirect '/'
end
