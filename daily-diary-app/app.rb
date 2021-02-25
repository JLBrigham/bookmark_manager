require 'sinatra/base'

class DailyDiary < Sinatra::Base 
    enable :sessions
    set :session_secret, 'super secret'

  get '/' do
    erb :index
  end

  post '/add_diary_entry' do
    session[:diary_entry] = params[:diary_entry]
    redirect '/'
  end

  get '/view_diary' do
    @diary_entry = session[:diary_entry]
    erb :view_diary
  end

    run! if app_file == $0
end