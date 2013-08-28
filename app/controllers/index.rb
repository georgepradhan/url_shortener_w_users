get '/' do
  @user = User.find(session[:user_id]) if session[:user_id]
  if @user
    erb :secret_page
  else
    erb :index
  end
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

get '/login' do
  redirect '/'
end

# We only have one model, User, so let's focus on our controllers for a bit. We need to support a few core actions:

# Logging in
# Logging out
# Creating an account
# Viewing the secret page
# Redirecting a user back to the "log in" screen if they try to view the secret page without being logged in
# There should be four routes involved. Why? Which ones are POST requests, which ones are GET requests. Why?
