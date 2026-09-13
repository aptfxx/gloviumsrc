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

if not getgenv().Glovium or not getgenv().Glovium.Access then warn("This version of Glovium expects [getgenv().Glovium.Access] and a key provided.") return end
if getgenv().Glovium.Access ~= "EADEV" then warn("This version of Glovium requires a key.") return end 

local function grab(url)
    local ok, res = pcall(function()
        return game:HttpGet(url)
    end)
    return ok, res
end

local function load(url)
    local ok, body = grab(url)
    if not ok or type(body) ~= "string" or body == "" then
        return false, body or "empty response"
    end

    local fn, parseErr = loadstring(body)
    if not fn then
        return false, parseErr or "loadstring failed"
    end

    local runOk, runErr = pcall(fn)
    if not runOk then
        return false, runErr
    end

    return true
end

local function main()
    print("[GloviumLoader] Checking your game...")
    local gameId = game and game.GameId
    local supportedGames = {
        [111958650] = "Arsenal",
        [10549097626] = "ShootABrick",
    }
    print("[GloviumLoader] Game Checked!")

    local impropGame
    if gameId and supportedGames[gameId] then
        print("[GloviumLoader] Your game is supported!")
        impropGame = supportedGames[gameId]
    else
        warn("[GloviumLoader] Your game is not supported!")
        print("[GloviumLoader] Loading Universal...")
        impropGame = "Universal"
    end

    local url = string.format(
        "https://raw.githubusercontent.com/aptfxx/gloviumsrc/refs/heads/main/games/%s.lua",
        impropGame
    )

    local checkOk, checkBody = grab(url)
    if checkOk and type(checkBody) == "string" and checkBody ~= "" then
        print("[GloviumLoader] URL formatted, loading Glovium.")
    else
        warn("[GloviumLoader] URL Did not format correctly or returned empty. Check if this game's script file is present.")
        return
    end

    local ok, err = load(url)
    if not ok then
        warn("[GloviumLoader] Failed to load Glovium: " .. tostring(err))
        return
    end

    print("[GloviumLoader] Glovium has finished loading!")
end

local ok, err = pcall(main)
if not ok then
    warn("[GloviumLoader] Unexpected error: " .. tostring(err))
end
