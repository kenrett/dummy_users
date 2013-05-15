get '/' do
  
  erb :index
end

# log in, log out, create account, viewing secret page

post '/login' do
  @user = User.authenticate(params[:username], params[:password])

  if @user
    session[:user_id]= @user.id
    redirect '/my_profile'
  else
    #@errors = User.errors.full_messages
    'Nope!'
    erb :index
  end
end

get '/logout' do
 session.destroy
 redirect '/'
end

post '/create_account' do
  @user = User.new(params)
    @user.save
  if @save
    session[:user_id] = user_id
    redirect '/my_profile'
  else
    @errors = @user.errors.full_messages
    erb :index
  end
end

get '/my_profile' do
  unless current_user
    redirect '/'
  else
    erb :my_profile
  end
end

