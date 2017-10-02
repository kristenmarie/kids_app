require("bundler/setup")
require "pry"
Bundler.require(:default)

Dir[File.dirname(__FILE__) + '/lib/*.rb'].each { |file| require file }
enable :sessions

before do
  @user = session[:id]
end

get "/" do
  erb(:index)
end

post "/login" do
  session[:id] = params.fetch("username")
  password = params.fetch("password")
  user = User.new({name: params["username"], score: 0})
  if user.save
    redirect back
  else
    @error_type = user
    session.clear
    erb(:errors)
  end
end

post "/logout" do
  session.clear
  redirect "/"
end

get "/number1" do
  @current_user = User.find_by name: @user
  erb(:number1)
end

post "/number1" do
  answer = params["answer"].to_i
  if answer == 1
    @current_user = User.find_by name: @user
    score = user.score.to_i + 1
    user.update({score: score})
    redirect '/number2'
  else
    flash[:number1] = 'INCORRECT. <a href="/number1">Back</a> '
  end
end

get "/number2" do
  erb(:number2)
end
