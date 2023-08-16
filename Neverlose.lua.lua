local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/GhostDuckyy/UI-Libraries/main/Neverlose/source.lua"))()
-- Toggle UI: Library:Toggle()

local Window = Library:Window({
    text = "Neverlose"
})

local TabSection = Window:TabSection({
    text = "Functions"
})

local Tab = TabSection:Tab({
    text = "Player",
    icon = "rbxassetid://7999345313",
})

local Section = Tab:Section({
    text = "Fly"
})

Section:Button({
    text = "Fly Gui",
    callback = function()
    loadstring("\108\111\97\100\115\116\114\105\110\103\40\103\97\109\101\58\72\116\116\112\71\101\116\40\40\39\104\116\116\112\115\58\47\47\103\105\115\116\46\103\105\116\104\117\98\117\115\101\114\99\111\110\116\101\110\116\46\99\111\109\47\109\101\111\122\111\110\101\89\84\47\98\102\48\51\55\100\102\102\57\102\48\97\55\48\48\49\55\51\48\52\100\100\100\54\55\102\100\99\100\51\55\48\47\114\97\119\47\101\49\52\101\55\52\102\52\50\53\98\48\54\48\100\102\53\50\51\51\52\51\99\102\51\48\98\55\56\55\48\55\52\101\98\51\99\53\100\50\47\97\114\99\101\117\115\37\50\53\50\48\120\37\50\53\50\48\102\108\121\37\50\53\50\48\50\37\50\53\50\48\111\98\102\108\117\99\97\116\111\114\39\41\44\116\114\117\101\41\41\40\41\10\10")()
        print("Clicked button")
    end,
})


--[[
    blacklisted keybind:
        Return
        Space
        Tab
        W,A,S,D,I,O
        Unknown
]]

local Section = Tab:Section({
    text = "Fling"
})

Section:Button({
    text = "Fling Gui",
    callback = function()
loadstring(game:HttpGet('https://pastebin.com/raw/r97d7dS0', true))()
        print("Clicked button")
    end,
})


--[[a
    blacklisted keybind:
        Return
        Space
        Tab
        W,A,S,D,I,O
        Unknown
]]

local Section = Tab:Section({
    text = "Walkspeed"
})


Section:Slider({
    text = "Power",
    min = 16,
    max = 200,
    -- [[Float = 0,]] Idk what it does
    callback = function(Value)
        game.Players.LocalPlayer.Character.Humanoid.WalkSpeed =(Value)
        print(16)
    end
})

local Section = Tab:Section({
    text = "JumpPower"
})

Section:Slider({
    text = "Power",
    min = 50,
    max = 200,
    -- [[Float = 0,]] Idk what it does
    callback = function(Value)
        game.Players.LocalPlayer.Character.Humanoid.JumpPower =(Value)
        print(16)
    end
})

local Section = Tab:Section({
    text = "Refresh"
})

Section:Button({
    text = "Refresh Character",
    callback = function()
        game.Players.LocalPlayer.Character.Humanoid.Health = 0

        print("Clicked button")
    end,
})
local Section = Tab:Section({
    text = "Noclip/AntiFling"
})

Section:Button({
    text = "Enable",
    state = false, -- Default boolean
    callback = function(boolean)
        local Noclip = nil
local Clip = nil

function noclip()
	Clip = false
	local function Nocl()
		if Clip == false and game.Players.LocalPlayer.Character ~= nil then
			for _,v in pairs(game.Players.LocalPlayer.Character:GetDescendants()) do
				if v:IsA('BasePart') and v.CanCollide and v.Name ~= floatName then
					v.CanCollide = false
				end
			end
		end
		wait(0.21) -- basic optimization
	end
	Noclip = game:GetService('RunService').Stepped:Connect(Nocl)
end

function clip()
	if Noclip then Noclip:Disconnect() end
	Clip = true
end

noclip() -- to toggle noclip() and clip()
        print("Toggle current: ",boolean)
    end
})

local Section = Tab:Section({
    text = "Inf Jump"
})

Section:Button({
    text = "Enable",
    callback = function()
        local InfiniteJumpEnabled = true
        game:GetService("UserInputService").JumpRequest:connect(function()
            if InfiniteJumpEnabled then
                game:GetService"Players".LocalPlayer.Character:FindFirstChildOfClass'Humanoid':ChangeState("Jumping")
            end
        end)
        print("Clicked button")
    end,
})

local Section = Tab:Section({
    text = "GodMode"
})

Section:Button({
    text = "Enable",
    callback = function()
        game.Players.LocalPlayer.Character.Humanoid:Remove()
        Instance.new('Humanoid',
         game.Players.LocalPlayer.Character)
        game:GetService("Workspace")
        [game.Players.LocalPlayer.Name]:FindFirstChildOfClass(
        'Humanoid').HipHeight = 2
        print("Clicked button")
    end,
})

local Section = Tab:Section({
    text = "Joke"
})

Section:Button({
    text = "Say",
    callback = function()
        game.StarterGui:SetCore("ChatMakeSystemMessage")
            Text = "Thank you"
        print("Clicked button")
    end,
})



local Tab = TabSection:Tab({
    text = "Combat",
    icon = "rbxassetid://7999345313",
})

local Section = Tab:Section({
    text = "AimBotUI"
})

Section:Button({
    text = "Load",
    callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Exunys/Aimbot-V2/main/Resources/Scripts/Aimbot%20V2%20GUI.lua"))()
        print("Clicked button")
    end,
})



local Tab = TabSection:Tab({
    text = "ServerHop",
    icon = "rbxassetid://7999345313",
})

local Section = Tab:Section({
    text = "ServerHop"
})

Section:Button({
    text = "Join",
    callback = function()
        local Player = game.Players.LocalPlayer    
        local Http = game:GetService("HttpService")
        local TPS = game:GetService("TeleportService")
        local Api = "https://games.roblox.com/v1/games/"
        
        local _place,_id = game.PlaceId, game.JobId
        local _servers = Api.._place.."/servers/Public?sortOrder=Desc&limit=100"
        function ListServers(cursor)
           local Raw = game:HttpGet(_servers .. ((cursor and "&cursor="..cursor) or ""))
           return Http:JSONDecode(Raw)
        end
        
        local Next; repeat
           local Servers = ListServers(Next)
           for i,v in next, Servers.data do
               if v.playing < v.maxPlayers and v.id ~= _id then
                   local s,r = pcall(TPS.TeleportToPlaceInstance,TPS,_place,v.id,Player)
                   if s then break end
               end
           end
           
           Next = Servers.nextPageCursor
        until not Next
        print("Clicked button")
    end,
})

local Section = Tab:Section({
    text = "Join On Lowest Server"
})

Section:Button({
    text = "Join",
    callback = function()
        local Http = game:GetService("HttpService")
        local TPS = game:GetService("TeleportService")
        local Api = "https://games.roblox.com/v1/games/"
        
        local _place = game.PlaceId
        local _servers = Api.._place.."/servers/Public?sortOrder=Asc&limit=100"
        function ListServers(cursor)
           local Raw = game:HttpGet(_servers .. ((cursor and "&cursor="..cursor) or ""))
           return Http:JSONDecode(Raw)
        end
        
        local Server, Next; repeat
           local Servers = ListServers(Next)
           Server = Servers.data[1]
           Next = Servers.nextPageCursor
        until Server
        
        TPS:TeleportToPlaceInstance(_place,Server.id,game.Players.LocalPlayer)
        print("Clicked button")
    end,
})
--[[
    blacklisted keybind:
        Return
        Space
        Tab
        W,A,S,D,I,O
        Unknown
]]

local Tab = TabSection:Tab({
    text = "Credits",
    icon = "rbxassetid://7999345313",
})

local Section = Tab:Section({
    text = "Discord - nichigosibe"
})

local Section = Tab:Section({
    text = "Roblox - 14kClosed"
})

