print("[GloviumBootstrapper] Checking Compatibility for executor "..getexecutorname())
if string.find(getexecutorname(), "Potassium") or string.find(getexecutorname(), "Volt") then 
      print("[GloviumBootstrapper] Your executor is guaranteed to be compatible!")
else
      print("[GloviumBootstrapper] Your executor isnt confirmed to work, checking executor...")
      if not debug then warn("[GlovimBootstrapper] Your executor lacks debug, some features may not be avaliable") end
      local drawingTest = Drawing.new("Circle")
      if typeof(drawingTest) == nil then warn("[GlovimBootstrapper] Your executor lacks a drawing library, some features may not be avaliable") end
      print("[GloviumBootstrapper] Test completed.")
      task.wait(0.1)
      drawingTest:Destroy()
end

if getgenv().GloviumExecInSession == true then 
      warn("")
      warn("")
      warn("[GloviumBootloader] Glovium has detected it has been run multiple times this session.")
      warn("This may cause instability, for the best experience, please rejoin and re-execute.")
      warn("Yielding for 5s...")
      task.wait(5)
      warn("")
      warn("")
end


getgenv().GloviumExecInSession = true

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

    local dataUrl = "https://raw.githubusercontent.com/aptfxx/gloviumsrc/refs/heads/main/gloviumdata.lua"
    local dataOk, dataBody = grab(dataUrl)
    local supportedGames = {}
    if dataOk and type(dataBody) == "string" and dataBody ~= "" then
        local modified = dataBody:gsub("local gloviumdata", "gloviumdata")
        local dataFunc = loadstring(modified .. "\nreturn gloviumdata")
        if dataFunc then
            local dataOk2, data = pcall(dataFunc)
            if dataOk2 and type(data) == "table" and data.GameShortNames then
                supportedGames = data.GameShortNames
            else
                warn("[GloviumLoader] Failed to parse gloviumdata.")
            end
        else
            warn("[GloviumLoader] Failed to load gloviumdata.")
        end
    else
        warn("[GloviumLoader] Failed to fetch gloviumdata.")
    end

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
