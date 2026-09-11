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

local gameId = game.GameId
local supportedGames = {
   [286090429] = "Arsenal",
}

if supportedGames[gameId] then
    print("[GloviumLoader] Your game is supported!")
    local game = supportedGames[gameId]
    local loadurl = string.format("https://raw.githubusercontent.com/aptfxx/gloviumsrc/refs/heads/main/games/%s.lua", game)
    if game:HttpGet(loadurl) then print("[GloviumLoader] URL formatted, loading Glovium.") end
    loadstring(game:HttpGet(loadurl))()
end
