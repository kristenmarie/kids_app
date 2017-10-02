require("bundler/setup")
require "pry"
Bundler.require(:default)

Dir[File.dirname(__FILE__) + '/lib/*.rb'].each { |file| require file }
enable :sessions

before do
  @user = session[:id]
end

get "/" do
  @current_user = User.find_by name: @user
  erb(:index)
end

post "/login" do
  username = params.fetch("username")
  User.all.each do |user|
    if user.name == username
      session[:id] = params.fetch("username")
      password = params.fetch("password")
      redirect '/'
    else
      flash[:number1] = 'Username does not exist. <a href="/">Back</a> '
    end
  end
end

post "/create-user" do
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
    score = @current_user.score.to_i + 1
    @current_user.update({score: score})
    redirect '/number2'
  else
    flash[:number1] = 'INCORRECT. <a href="/number1">Back</a> '
  end
end

get "/number2" do
  @current_user = User.find_by name: @user
  erb(:number2)
end

post "/number2" do
  answer = params["answer"].to_i
  if answer == 2
    @current_user = User.find_by name: @user
    score = @current_user.score.to_i + 1
    @current_user.update({score: score})
    redirect '/number3'
  else
    flash[:number2] = 'INCORRECT. <a href="/number2">Back</a> '
  end
end

get "/number3" do
  @current_user = User.find_by name: @user
  erb(:number3)
end

post "/number3" do
  answer = params["answer"].to_i
  if answer == 3
    @current_user = User.find_by name: @user
    score = @current_user.score.to_i + 1
    @current_user.update({score: score})
    redirect '/number4'
  else
    flash[:number3] = 'INCORRECT. <a href="/number3">Back</a> '
  end
end

get "/number4" do
  @current_user = User.find_by name: @user
  erb(:number4)
end

post "/number4" do
  answer = params["answer"].to_i
  if answer == 4
    @current_user = User.find_by name: @user
    score = @current_user.score.to_i + 1
    @current_user.update({score: score})
    redirect '/number5'
  else
    flash[:number4] = 'INCORRECT. <a href="/number4">Back</a> '
  end
end

get "/number5" do
  @current_user = User.find_by name: @user
  erb(:number5)
end

post "/number5" do
  answer = params["answer"].to_i
  if answer == 5
    @current_user = User.find_by name: @user
    score = @current_user.score.to_i + 1
    @current_user.update({score: score})
    redirect '/grats'
  else
    flash[:number5] = 'INCORRECT. <a href="/number5">Back</a> '
  end
end

get "/grats" do
  @current_user = User.find_by name: @user
  erb(:grats)
end

get "/color1" do
  @current_user = User.find_by name: @user
  erb(:color1)
end

post "/color1" do
  answer = params["color"]
  if answer == "blue"
    @current_user = User.find_by name: @user
    score = @current_user.score.to_i + 1
    @current_user.update({score: score})
    redirect '/color2'
  else
    flash[:color1] = 'INCORRECT. <a href="/color1">Back</a> '
  end
end

get "/color2" do
  @current_user = User.find_by name: @user
  erb(:color2)
end

post "/color2" do
  answer = params["color"]
  if answer == "green"
    @current_user = User.find_by name: @user
    score = @current_user.score.to_i + 1
    @current_user.update({score: score})
    redirect '/color3'
  else
    flash[:color2] = 'INCORRECT. <a href="/color2">Back</a> '
  end
end

get "/color3" do
  @current_user = User.find_by name: @user
  erb(:color3)
end

post "/color3" do
  answer = params["color"]
  if answer == "yellow"
    @current_user = User.find_by name: @user
    score = @current_user.score.to_i + 1
    @current_user.update({score: score})
    redirect '/color4'
  else
    flash[:color3] = 'INCORRECT. <a href="/color3">Back</a> '
  end
end

get "/color4" do
  @current_user = User.find_by name: @user
  erb(:color4)
end

post "/color4" do
  answer = params["color"]
  if answer == "red"
    @current_user = User.find_by name: @user
    score = @current_user.score.to_i + 1
    @current_user.update({score: score})
    redirect '/color5'
  else
    flash[:color4] = 'INCORRECT. <a href="/color4">Back</a> '
  end
end

get "/color5" do
  @current_user = User.find_by name: @user
  erb(:color5)
end

post "/color5" do
  answer = params["color"]
  if answer == "black"
    @current_user = User.find_by name: @user
    score = @current_user.score.to_i + 1
    @current_user.update({score: score})
    redirect '/grats'
  else
    flash[:color5] = 'INCORRECT. <a href="/color5">Back</a> '
  end
end


get "/letters" do
  letters = ['A','B','C','D','E','F','G','H','I','K','L','M','N','O','P','Q','R','S','T', 'U','V','W','X','Y','Z']

  letters.each do |letter|
    Letter.create({name: letter})
  end
  @letters = Letter.all
  erb(:letters)
end

get "/letters/:id" do
  @letter = Letter.find(params.fetch('id').to_i)
  erb(:letter)
end
