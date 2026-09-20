--[[

As of glovium V2, we've switched to using a more modular approach to things to keep the codebase clean. 
To launch a module, pass 

getgenv().ModuleWindow = RayFieldWindow 
loadstring(game:HttpGet("raw_github_to_module"))()

If you don't want to load modules and prefer a base experience at Glovium, please run the following BEFORE running glovium
getgenv().LoadModules = false

]]

-- TBD
