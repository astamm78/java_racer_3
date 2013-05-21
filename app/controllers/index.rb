get '/' do
  erb :index
end

post '/login' do
  @game = Game.create
  params.each do |value|
    new_player = Player.find_or_create_by_name(:name => value[1])
    Round.create(:player => new_player, :game => @game)
  end
  redirect "/game/#{@game.id}"
end

get '/game/:game_id' do
  @game = Game.find(params[:game_id])
  @players = @game.players
  erb :track
end

post '/game/:game_id' do
  @winner = Player.find_by_name(params[:winner])
  @result_time = params[:result_time]
  @game = Game.find(params[:game_id])
  @game.save_results!({:winner => @winner.id, :result_time => @result_time})
  redirect "/results/game/#{@game.id}"
end

get '/results/game/:id' do
  @game = Game.find(params[:id])
  erb :results
end

get '/newgame/:game_id' do
  @new_game = Game.create
  @old_game = Game.find(params[:game_id])
  @old_game.players.each do |player|
    Round.create(:player => player, :game => @new_game)
  end
  redirect "/game/#{@new_game.id}"
end

get '/player/:id' do
  player = Player.find(params[:id])
  erb :player, :locals => { :player => player }
end
