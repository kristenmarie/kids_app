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

get "/false_user" do
  erb(:false_user)
end

post "/login" do
  username = params.fetch("username")
  User.all.each do |user|
    if user.name == username
      session[:id] = params.fetch("username")
      password = params.fetch("password")
      redirect '/'
    end
  end
  erb(:false_user)
end

post "/create-user" do
  session[:id] = params.fetch("username")
  password = params.fetch("password")
  age = params.fetch("age").to_i
  user = User.new({name: params["username"], score: 0, age: age, missed_math: 0, missed_science: 0, missed_spelling: 0, missed_counting: 0, missed_colors: 0})
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
  @current_user = User.find_by name: @user
  if answer == 1
    score = @current_user.score.to_i + 1
    @current_user.update({score: score})
    redirect '/number2'
  else
    missed = @current_user.missed_counting.to_i + 1
    @current_user.update({missed_counting: missed})
    erb(:incorrect)
  end
end

get "/number2" do
  @current_user = User.find_by name: @user
  erb(:number2)
end

post "/number2" do
  answer = params["answer"].to_i
  @current_user = User.find_by name: @user
  if answer == 2
    score = @current_user.score.to_i + 1
    @current_user.update({score: score})
    redirect '/number3'
  else
    missed = @current_user.missed_counting.to_i + 1
    @current_user.update({missed_counting: missed})
    erb(:incorrect)
  end
end

get "/number3" do
  @current_user = User.find_by name: @user
  erb(:number3)
end

post "/number3" do
  answer = params["answer"].to_i
  @current_user = User.find_by name: @user
  if answer == 3
    score = @current_user.score.to_i + 1
    @current_user.update({score: score})
    redirect '/number4'
  else
    missed = @current_user.missed_counting.to_i + 1
    @current_user.update({missed_counting: missed})
    erb(:incorrect)
  end
end

get "/number4" do
  @current_user = User.find_by name: @user
  erb(:number4)
end

post "/number4" do
  answer = params["answer"].to_i
  @current_user = User.find_by name: @user
  if answer == 4
    score = @current_user.score.to_i + 1
    @current_user.update({score: score})
    redirect '/number5'
  else
    missed = @current_user.missed_counting.to_i + 1
    @current_user.update({missed_counting: missed})
    erb(:incorrect)
  end
end

get "/number5" do
  @current_user = User.find_by name: @user
  erb(:number5)
end

post "/number5" do
  answer = params["answer"].to_i
  @current_user = User.find_by name: @user
  if answer == 5
    score = @current_user.score.to_i + 1
    @current_user.update({score: score})
    redirect '/grats'
  else
    missed = @current_user.missed_counting.to_i + 1
    @current_user.update({missed_counting: missed})
    erb(:incorrect)
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
  @current_user = User.find_by name: @user
  if answer == "blue"
    score = @current_user.score.to_i + 1
    @current_user.update({score: score})
    redirect '/color2'
  else
    missed = @current_user.missed_colors.to_i + 1
    @current_user.update({missed_colors: missed})
    erb(:incorrect)
  end
end

get "/color2" do
  @current_user = User.find_by name: @user
  erb(:color2)
end

post "/color2" do
  answer = params["color"]
  @current_user = User.find_by name: @user
  if answer == "green"
    score = @current_user.score.to_i + 1
    @current_user.update({score: score})
    redirect '/color3'
  else
    missed = @current_user.missed_colors.to_i + 1
    @current_user.update({missed_colors: missed})
    erb(:incorrect)
  end
end

get "/color3" do
  @current_user = User.find_by name: @user
  erb(:color3)
end

post "/color3" do
  answer = params["color"]
  @current_user = User.find_by name: @user
  if answer == "yellow"
    score = @current_user.score.to_i + 1
    @current_user.update({score: score})
    redirect '/color4'
  else
    missed = @current_user.missed_colors.to_i + 1
    @current_user.update({missed_colors: missed})
    erb(:incorrect)
  end
end

get "/color4" do
  @current_user = User.find_by name: @user
  erb(:color4)
end

post "/color4" do
  answer = params["color"]
  @current_user = User.find_by name: @user
  if answer == "red"
    score = @current_user.score.to_i + 1
    @current_user.update({score: score})
    redirect '/color5'
  else
    missed = @current_user.missed_colors.to_i + 1
    @current_user.update({missed_colors: missed})
    erb(:incorrect)
  end
end

get "/color5" do
  @current_user = User.find_by name: @user
  erb(:color5)
end

post "/color5" do
  answer = params["color"]
  @current_user = User.find_by name: @user
  if answer == "black"
    score = @current_user.score.to_i + 1
    @current_user.update({score: score})
    redirect '/grats'
  else
    missed = @current_user.missed_colors.to_i + 1
    @current_user.update({missed_colors: missed})
    erb(:incorrect)
  end
end

get "/letters" do
  @current_user = User.find_by name: @user
  letters = ['A','B','C','D','E','F','G','H','I','K','L','M','N','O','P','Q','R','S','T', 'U','V','W','X','Y','Z']

  letters.each do |letter|
    Letter.create({name: letter})
  end
  @letters = Letter.all
  erb(:letters)
end

get "/letters/:id" do
  @current_user = User.find_by name: @user
  @letter = Letter.find(params[:id])
  @words = Word.all()
  erb(:letter)
end

post('/add-word') do
  @current_user = User.find_by name: @user
  letter_id = params.fetch("letter_id").to_i
  @letter = Letter.find(letter_id)
  @word = params.fetch("word").downcase
  if @word[0] == @letter.name.downcase
    new_word = Word.new({name: params.fetch('word'), letter_id: letter_id})
    if new_word.save
      score = @current_user.score.to_i + 1
      @current_user.update({score: score})
      redirect '/letters/' + letter_id.to_s
    else
      @error_type = new_word
      erb(:errors)
    end
  else
    @error_type = ""
    erb(:errors)
  end
end

get("/math1") do
  @current_user = User.find_by name: @user
  erb(:math1)
end

post "/math1" do
  answer = params["answer"].to_i
  @current_user = User.find_by name: @user
  if answer == 10
    score = @current_user.score.to_i + 1
    @current_user.update({score: score})
    redirect '/math2'
  else
    missed = @current_user.missed_math.to_i + 1
    @current_user.update({missed_math: missed})
    erb(:incorrect)
  end
end

get("/math2") do
  @current_user = User.find_by name: @user
  erb(:math2)
end

post "/math2" do
  answer = params["answer"].to_i
  @current_user = User.find_by name: @user
  if answer == 5
    score = @current_user.score.to_i + 1
    @current_user.update({score: score})
    redirect '/math3'
  else
    missed = @current_user.missed_math.to_i + 1
    @current_user.update({missed_math: missed})
    erb(:incorrect)
  end
end

get("/math3") do
  @current_user = User.find_by name: @user
  erb(:math3)
end

post "/math3" do
  answer = params["answer"].to_i
  @current_user = User.find_by name: @user
  if answer == 20
    score = @current_user.score.to_i + 1
    @current_user.update({score: score})
    redirect '/math4'
  else
    missed = @current_user.missed_math.to_i + 1
    @current_user.update({missed_math: missed})
    erb(:incorrect)
  end
end

get("/math4") do
  @current_user = User.find_by name: @user
  erb(:math4)
end

post "/math4" do
  answer = params["answer"].to_i
  @current_user = User.find_by name: @user
  if answer == 6
    score = @current_user.score.to_i + 1
    @current_user.update({score: score})
    redirect '/math5'
  else
    missed = @current_user.missed_math.to_i + 1
    @current_user.update({missed_math: missed})
    erb(:incorrect)
  end
end

get("/math5") do
  @current_user = User.find_by name: @user
  erb(:math5)
end

post "/math5" do
  answer = params["answer"]
  @current_user = User.find_by name: @user
  if answer == "+"
    score = @current_user.score.to_i + 1
    @current_user.update({score: score})
    redirect '/grats'
  else
    missed = @current_user.missed_math.to_i + 1
    @current_user.update({missed_math: missed})
    erb(:incorrect)
  end
end

get("/spelling1") do
  @current_user = User.find_by name: @user
  erb(:spelling1)
end

post "/spelling1" do
  answer = params["answer"].downcase
  @current_user = User.find_by name: @user
  if answer == "frog"
    score = @current_user.score.to_i + 1
    @current_user.update({score: score})
    redirect '/spelling2'
  else
    missed = @current_user.missed_spelling.to_i + 1
    @current_user.update({missed_spelling: missed})
    erb(:incorrect)
  end
end

get("/spelling2") do
  @current_user = User.find_by name: @user
  erb(:spelling2)
end

post "/spelling2" do
  answer = params["answer"].downcase
  @current_user = User.find_by name: @user
  if answer == "bear"
    score = @current_user.score.to_i + 1
    @current_user.update({score: score})
    redirect '/spelling3'
  else
    missed = @current_user.missed_spelling.to_i + 1
    @current_user.update({missed_spelling: missed})
    erb(:incorrect)
  end
end

get("/spelling3") do
  @current_user = User.find_by name: @user
  erb(:spelling3)
end

post "/spelling3" do
  answer = params["answer"].downcase
  @current_user = User.find_by name: @user
  if answer == "lion"
    score = @current_user.score.to_i + 1
    @current_user.update({score: score})
    redirect '/spelling4'
  else
    missed = @current_user.missed_spelling.to_i + 1
    @current_user.update({missed_spelling: missed})
    erb(:incorrect)
  end
end

get("/spelling4") do
  @current_user = User.find_by name: @user
  erb(:spelling4)
end

post "/spelling4" do
  answer = params["answer"].downcase
  @current_user = User.find_by name: @user
  if answer == "goat"
    score = @current_user.score.to_i + 1
    @current_user.update({score: score})
    redirect '/spelling5'
  else
    missed = @current_user.missed_spelling.to_i + 1
    @current_user.update({missed_spelling: missed})
    erb(:incorrect)
  end
end

get("/spelling5") do
  @current_user = User.find_by name: @user
  erb(:spelling5)
end

post "/spelling5" do
  answer = params["answer"].downcase
  @current_user = User.find_by name: @user
  if answer == "monkey"
    score = @current_user.score.to_i + 1
    @current_user.update({score: score})
    redirect '/grats'
  else
    missed = @current_user.missed_spelling.to_i + 1
    @current_user.update({missed_spelling: missed})
    erb(:incorrect)
  end
end

get "/science1" do
  @current_user = User.find_by name: @user
  erb(:science1)
end

post "/science1" do
  answer = params["answer"]
  @current_user = User.find_by name: @user
  if answer == "desert"
    score = @current_user.score.to_i + 1
    @current_user.update({score: score})
    redirect '/science2'
  else
    missed = @current_user.missed_science.to_i + 1
    @current_user.update({missed_science: missed})
    erb(:incorrect)
  end
end

get "/science2" do
  @current_user = User.find_by name: @user
  erb(:science2)
end

post "/science2" do
  answer = params["answer"]
  @current_user = User.find_by name: @user
  if answer == "ocean"
    score = @current_user.score.to_i + 1
    @current_user.update({score: score})
    redirect '/science3'
  else
    missed = @current_user.missed_science.to_i + 1
    @current_user.update({missed_science: missed})
    erb(:incorrect)
  end
end

get "/science3" do
  @current_user = User.find_by name: @user
  erb(:science3)
end

post "/science3" do
  answer = params["answer"]
  @current_user = User.find_by name: @user
  if answer == "rainforest"
    score = @current_user.score.to_i + 1
    @current_user.update({score: score})
    redirect '/science4'
  else
    missed = @current_user.missed_science.to_i + 1
    @current_user.update({missed_science: missed})
    erb(:incorrect)
  end
end

get "/science4" do
  @current_user = User.find_by name: @user
  erb(:science4)
end

post "/science4" do
  answer = params["answer"]
  @current_user = User.find_by name: @user
  if answer == "tree"
    score = @current_user.score.to_i + 1
    @current_user.update({score: score})
    redirect '/science5'
  else
    missed = @current_user.missed_science.to_i + 1
    @current_user.update({missed_science: missed})
    erb(:incorrect)
  end
end

get "/science5" do
  @current_user = User.find_by name: @user
  erb(:science5)
end

post "/science5" do
  answer = params["answer"]
  @current_user = User.find_by name: @user
  if answer == "arctic"
    score = @current_user.score.to_i + 1
    @current_user.update({score: score})
    redirect '/grats'
  else
    missed = @current_user.missed_science.to_i + 1
    @current_user.update({missed_science: missed})
    erb(:incorrect)
  end
end

get('/word_edit/:id') do
  @current_user = User.find_by name: @user
  @word = Word.find(params[:id])
  @words = Word.all
  erb(:word_edit)
end

patch('/update-word') do
  @current_user = User.find_by name: @user
  @word = Word.find(params.fetch("word_id").to_i)
  @letter = Letter.find(@word.letter_id.to_i)
  if @word.name[0].downcase == @letter.name.downcase
    @word.update({name: params["new_word"]})
    redirect "/letters/" + @word.letter_id.to_s
  else
    @error_type = @word
    erb(:errors)
  end
end

delete('/delete-word') do
  @current_user = User.find_by name: @user
  @word = Word.find(params.fetch("word_id").to_i)
  @word.delete
  redirect "/letters"
end

get('/progress/:id') do
  @current_user = User.find(params[:id].to_i)
  erb(:user)
end
