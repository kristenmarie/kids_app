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

get "/numbers" do
  erb(:numbers)
end
