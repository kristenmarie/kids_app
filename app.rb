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
    erb(:errors)
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

  words = ['apple','ants', 'antelope']
  words.each do |word|
    Word.create({name: word})
  end
  @words = Word.all

  erb(:letter)
end
