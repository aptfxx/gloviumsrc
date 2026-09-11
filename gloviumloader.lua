--[[
  ▄████  ██▓     ▒█████   ██▒   █▓ ██▓ █    ██  ███▄ ▄███▓
 ██▒ ▀█▒▓██▒    ▒██▒  ██▒▓██░   █▒▓██▒ ██  ▓██▒▓██▒▀█▀ ██▒
▒██░▄▄▄░▒██░    ▒██░  ██▒ ▓██  █▒░▒██▒▓██  ▒██░▓██    ▓██░
░▓█  ██▓▒██░    ▒██   ██░  ▒██ █░░░██░▓▓█  ░██░▒██    ▒██ 
░▒▓███▀▒░██████▒░ ████▓▒░   ▒▀█░  ░██░▒▒█████▓ ▒██▒   ░██▒
 ░▒   ▒ ░ ▒░▓  ░░ ▒░▒░▒░    ░ ▐░  ░▓  ░▒▓▒ ▒ ▒ ░ ▒░   ░  ░
  ░   ░ ░ ░ ▒  ░  ░ ▒ ▒░    ░ ░░   ▒ ░░░▒░ ░ ░ ░  ░      ░
░ ░   ░   ░ ░   ░ ░ ░ ▒       ░░   ▒ ░ ░░░ ░ ░ ░      ░   
      ░     ░  ░    ░ ░        ░   ░     ░            ░   
                              ░                           

Glovy This, Glovy That

]]

ascii = [[


      ::::::::  :::        ::::::::  :::     ::: ::::::::::: :::    :::   :::   ::: 
    :+:    :+: :+:       :+:    :+: :+:     :+:     :+:     :+:    :+:  :+:+: :+:+: 
   +:+        +:+       +:+    +:+ +:+     +:+     +:+     +:+    +:+ +:+ +:+:+ +:+ 
  :#:        +#+       +#+    +:+ +#+     +:+     +#+     +#+    +:+ +#+  +:+  +#+  
 +#+   +#+# +#+       +#+    +#+  +#+   +#+      +#+     +#+    +#+ +#+       +#+   
#+#    #+# #+#       #+#    #+#   #+#+#+#       #+#     #+#    #+# #+#       #+#    
########  ########## ########      ###     ###########  ########  ###       ###     
                                                  - Glovium is so sick

]]
warn(ascii)


print("[GloviumLoader] Checking your game...")
local gameId = game.GameId
local supportedGames = {
   [111958650] = "Arsenal",
}
print("[GloviumLoader] Game Checked!")
if supportedGames[gameId] then
    print("[GloviumLoader] Your game is supported!")
    local impropGame = supportedGames[gameId]
    local loadurl = string.format("https://raw.githubusercontent.com/aptfxx/gloviumsrc/refs/heads/main/games/%s.lua", impropGame)
    if game:HttpGet(loadurl) then print("[GloviumLoader] URL formatted, loading Glovium.") end
    loadstring(game:HttpGet(loadurl))()
    print("[GloviumLoader] Glovium has finished loading!")
end
