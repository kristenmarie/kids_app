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

  get "/letters" do
    letters = ['A','B','C','D','E','F','G','H','I','K','L','M','N','O','P','Q','R','S','T', 'U','V','W','X','Y','Z']

    letters.each do |letter|
      Letter.create({name: letter})
    end
    @letters = Letter.all
    erb(:letters)
  end

get "/letters/:id" do
  @letter = Letter.find(params[:id])
  @words = Word.all()
  erb(:letter)
end

post('/add-word') do
  letter_id = params.fetch("letter_id").to_i
  word = Word.new({name: params.fetch('word'), letter_id: letter_id})
  if word.save
    redirect '/letters/' + letter_id.to_s 
  else
    @error_type = word
    erb(:errors)
  end
end
