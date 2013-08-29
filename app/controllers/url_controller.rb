post '/' do
  if Url.find_by_original(normalize(params[:long_url]))
    redirect '/'
  else
    url = Url.new(original: params[:long_url])
    url.user_id = current_user.id if logged_in?

    if url.save
      redirect '/'
    else
      @available_urls = Url.where(user_id: nil)
      @errors = url.errors.full_messages
      erb :index
    end

  end
end

### Bug patch -- so that /logout doesn't match the below wildcard url ###
get '/logout' do
  session.clear
  redirect '/'
end
### Bug patch -- so that /logout doesn't match the below wildcard url ###

get '/:short_url' do
  url = Url.where(shortened: params[:short_url]).first
  url.update_attribute(:counter, url.counter + 1)
  redirect "#{url.original}"
end
