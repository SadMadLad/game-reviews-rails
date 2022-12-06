games_names = [
    ["Streets of Rage 4", "Beat'em up game where you select one of the numerous characters and walk through the mean streets of age.", "https://assets.nintendo.com/image/upload/c_fill,w_1200/q_auto:best/f_auto/dpr_2.0/ncom/en_US/games/switch/s/streets-of-rage-4-switch/hero"],
    ["Hollow Knight", "Bugs Everywhere", "https://cdn.akamai.steamstatic.com/steam/apps/367520/ss_47f3523dbea462aff2ca4bc9f605faaf80a792b2.1920x1080.jpg?t=1667006028"], 
    ["Max Payne 2", "Painkillers Painkillers Painkillers", "https://i.ytimg.com/vi/ebM8FylAc6U/maxresdefault.jpg"],
    ["Counter Strike 1.6", "Best FPS of all time", "https://i.ytimg.com/vi/9ZEnN2Ojoco/maxresdefault.jpg"],
]

games = []

puts "Creating Games"

games_names.each do | game_name | 
    game = Game.new(
        title: game_name[0],
        about: game_name[1],
        img_path: game_name[2]
    )
    games.push(game)
end

puts "Saving Games"

games.each { | game | game.save }