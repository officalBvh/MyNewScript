-- Varbials

local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()
local Window = OrionLib:MakeWindow({Name = "Bumpy hub - discord.gg/bumpydhc", HidePremium = false, SaveConfig = true, ConfigFolder = "BumpyHub - config", IntroEnabled = false})
local RunService = game:GetService("RunService")
local userinputservice = game:GetService("UserInputService")
local VIM = game:GetService("VirtualInputManager")
local Movement = {
    SpeedEnabled = false,
    SpeedAmount = 16,
    JumpEnabled = false,
    JumpAmount = 7.2
}
local LocalPlr = game.Players.LocalPlayer
local player = game.Players.LocalPlayer

-- Functions
function autoFat()
    wait()
    local oldpos = player.Character.HumanoidRootPart.CFrame
    local Cash = player.DataFolder.Currency.Value
    local itemtobuy = game:GetService("Workspace").Ignored.Shop["[HeavyWeights] - $265"]
    player.Character.HumanoidRootPart.CFrame = itemtobuy.Head.CFrame
    wait(0.1)
    fireclickdetector(itemtobuy.ClickDetector)
    wait(0.5)
    player.Character.HumanoidRootPart.CFrame = oldpos
    local itemininvetory = player.Backpack:FindFirstChild("[HeavyWeights]")
    local char = player.Character
    local hum = char:FindFirstChildOfClass("Humanoid")
    hum:EquipTool(itemininvetory)
    local mouse = userinputservice:GetMouseLocation()
    local mousex = mouse.X
    local mousey = mouse.Y
    VIM:SendMouseButtonEvent(mousex, mousey, 1, false, "w", 10000000)
end

function buyTactAmmo()
    wait()
    local oldpos = player.Character.HumanoidRootPart.CFrame
    local Cash = player.DataFolder.Currency.Value
    local itemtobuy = game:GetService("Workspace").Ignored.Shop["20 [TacticalShotgun Ammo] - $64"]
    player.Character.HumanoidRootPart.CFrame = itemtobuy.Head.CFrame
    wait(0.1)
    fireclickdetector(itemtobuy.ClickDetector)
    wait(0.5)
    player.Character.HumanoidRootPart.CFrame = oldpos
    
end

function buyLMGAmmo()
    wait()
    local oldpos = player.Character.HumanoidRootPart.CFrame
    local  Cash = player.DataFolder.Currency.Value
    local itemtobuy = game:GetService("Workspace").Ignored.Shop["200 [LMG Ammo] - $318"]
    player.Character.HumanoidRootPart.CFrame = itemtobuy.Head.CFrame
    wait(0.1)
    fireclickdetector(itemtobuy.ClickDetector)
    wait(0.5)
    player.Character.HumanoidRootPart.CFrame = oldpos
    
end

function buyRevolverAmmo()
    wait()
    local oldpos = player.Character.HumanoidRootPart.CFrame
    local  Cash = player.DataFolder.Currency.Value
    local itemtobuy = game:GetService("Workspace").Ignored.Shop["12 [Revolver Ammo] - $53"]
    player.Character.HumanoidRootPart.CFrame = itemtobuy.Head.CFrame
    wait(0.1)
    fireclickdetector(itemtobuy.ClickDetector)
    wait(0.5)
    player.Character.HumanoidRootPart.CFrame = oldpos
    
end

function buyDBAmmo()
    wait()
    local oldpos = player.Character.HumanoidRootPart.CFrame
    local  Cash = player.DataFolder.Currency.Value
    local itemtobuy = game:GetService("Workspace").Ignored.Shop["18 [Double-Barrel SG Ammo] - $64"]
    player.Character.HumanoidRootPart.CFrame = itemtobuy.Head.CFrame
    wait(0.1)
    fireclickdetector(itemtobuy.ClickDetector)
    wait(0.5)
    player.Character.HumanoidRootPart.CFrame = oldpos
    
end


function buyTact()
    wait()
    local oldpos = player.Character.HumanoidRootPart.CFrame
    local  Cash = player.DataFolder.Currency.Value
    local itemtobuy = game:GetService("Workspace").Ignored.Shop["[TacticalShotgun] - $1857"]
    player.Character.HumanoidRootPart.CFrame = itemtobuy.Head.CFrame
    wait(0.1)
    fireclickdetector(itemtobuy.ClickDetector)
    wait(0.5)
    player.Character.HumanoidRootPart.CFrame = oldpos
    
end

function buyRevolver()
    wait()
    local oldpos = player.Character.HumanoidRootPart.CFrame
    local  Cash = player.DataFolder.Currency.Value
    local itemtobuy = game:GetService("Workspace").Ignored.Shop["[Revolver] - $1485"]
    player.Character.HumanoidRootPart.CFrame = itemtobuy.Head.CFrame
    wait(0.1)
    fireclickdetector(itemtobuy.ClickDetector)
    wait(0.5)
    player.Character.HumanoidRootPart.CFrame = oldpos
    
end


function buyLMG()
    wait()
    local oldpos = player.Character.HumanoidRootPart.CFrame
    local  Cash = player.DataFolder.Currency.Value
    local itemtobuy = game:GetService("Workspace").Ignored.Shop["[LMG] - $3978"]
    player.Character.HumanoidRootPart.CFrame = itemtobuy.Head.CFrame
    wait(0.1)
    fireclickdetector(itemtobuy.ClickDetector)
    wait(0.5)
    player.Character.HumanoidRootPart.CFrame = oldpos
    
end

function buyDB()
    wait()
    local oldpos = player.Character.HumanoidRootPart.CFrame
    local  Cash = player.DataFolder.Currency.Value
    local itemtobuy = game:GetService("Workspace").Ignored.Shop["[Double-Barrel SG] - $1485"]
    player.Character.HumanoidRootPart.CFrame = itemtobuy.Head.CFrame
    wait(0.1)
    fireclickdetector(itemtobuy.ClickDetector)
    wait(0.5)
    player.Character.HumanoidRootPart.CFrame = oldpos
    
end


function cashaura()
    while wait() do
        for i, money in ipairs(game.Workspace.Ignored.Drop:GetChildren()) do
            if money.Name == "MoneyDrop" and (money.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude <= 20 then
            fireclickdetector(money.ClickDetector)
            end  
        end
    end
end


function speedlocalplayer()

    RunService.Stepped:Connect(function()
        if Movement.SpeedEnabled == true then
            LocalPlr.Character.HumanoidRootPart.CFrame = LocalPlr.Character.HumanoidRootPart.CFrame + LocalPlr.Character.Humanoid.MoveDirection * Movement.SpeedAmount
        elseif Movement.SpeedEnabled == false then
            LocalPlr.Character.HumanoidRootPart.CFrame = LocalPlr.Character.HumanoidRootPart.CFrame
            LocalPlr.Character.Humanoid.MoveDirection = Vector3.new(0,0,0)
        end
    end)
end




function chams()
    if not game:IsLoaded() then
        game.IsLoaded:Wait()
    else
        print('loaded')
    end
    
    local run = game:GetService('RunService')
    
    function rainbow(a,b,c)
        local time = a
        local h = tick() % time / time
        local co = Color3.fromHSV(h, 1, 1)
            for i,v in pairs(b:GetChildren()) do
                if v:IsA(c) or v:FindFirstChild(c) then
                    v.Color = co
                    v.Material = 'ForceField'    
            end
        end
    end
    
    run.Stepped:Connect(function()
    for i,v in pairs(game:GetService('Players'):GetPlayers()) do
    rainbow(5,v.Character,'BasePart')
    end
    end)
end

function TeleportToBank()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-371, 29, -338)
end

function TeleportToClub()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-264.0511169433594, 8.429424285888672, -436.10113525390625)
end

function TeleportToDB()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-1042.1834716796875, 35.26856994628906, -270.8726501464844)
end

function TeleportToRevolver()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-625.2662353515625, 35.436092376708984, -128.45535278320312)
end

function TeleportToTact()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(469.8592529296875, 53, -628)
end

function TelportToMeduimArmor()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(409.6495666503906, 59.53568649291992, -46.029762268066406)
end

-- Tabs

local Tab1Player = Window:MakeTab({
    Name = "Local Player",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false
})

local Tab2Combat = Window:MakeTab({
	Name = "Combat",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

local Tab3ESP = Window:MakeTab({
	Name = "ESP",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

local Tab4Teleports = Window:MakeTab({
    Name = "Teleports",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false
})

local Tab5Cash = Window:MakeTab({
    Name = "Cash Stuff",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false
})

local Tab6OnlyDH = Window:MakeTab({
    Name = "Only dh Farms",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false
})

local Tab7AutoBuy = Window:MakeTab({
    Name = "Auto Buy (only DH)",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false
})

local Tab8AutoBuyAmmo = Window:MakeTab({
    Name = "Auto Buy Ammo (only DH)",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false
})


-- Sliders

Tab1Player:AddSlider({
	Name = "Speed",
	Min = 16,
	Max = 1000,
	Default = 16,
	Color = Color3.fromRGB(255,255,255),
	Increment = 1,
	ValueName = "Speed",
	Callback = function(Value)
        Movement.SpeedAmount = Value / 1000
	end    
})

Tab1Player:AddSlider({
	Name = "Jump",
	Min = 16,
	Max = 1000,
	Default = 16,
	Color = Color3.fromRGB(255,255,255),
	Increment = 1,
	ValueName = "Jump",
	Callback = function(Value)
        LocalPlr.Character.Humanoid.JumpPower = Value
	end    
})

-- Buttons
Tab2Combat:AddButton({
	Name = "Load Bumpy Hub (best lock ever made)",
	Callback = function()
        loadstring(game:HttpGet("https://pastebin.com/raw/TfA0c8mL"))()
  	end    
})

Tab2Combat:AddButton({
	Name = "Camlock (Q)",
	Callback = function()
      	loadstring(game:HttpGet("https://pastebin.com/raw/WzwUWskw"))()
  	end    
})

Tab2Combat:AddButton({
	Name = "0 Recoil",
	Callback = function()
      	loadstring(game:HttpGet("https://pastebin.com/raw/frsVXZS3"))()
  	end    
})

Tab2Combat:AddButton({
	Name = "Silent Aim",
	Callback = function()
      	    loadstring(game:HttpGet("https://pastebin.com/raw/mueRzXkp"))()
  	end 
}) 

Tab2Combat:AddButton({
	Name = "Strech Res",
	Callback = function()
        loadstring(game:HttpGet("https://pastebin.com/raw/mueRzXkp"))()
  	end 
}) 

Tab2Combat:AddButton({
	Name = "Box Dot Lock (only dh)",
	Callback = function()
      	loadstring(game:HttpGet("https://pastebin.com/raw/hejVSuzm"))()
  	end 
}) 

Tab3ESP:AddButton({
	Name = "Enable Esp",
	Callback = function()
        _G.ESPVisible = not _G.ESPVisible
        loadstring(game:HttpGet("https://raw.githubusercontent.com/ic3w0lf22/Unnamed-ESP/master/UnnamedESP.lua"))()
  	end    
})

Tab3ESP:AddButton({
	Name = "Enable Rainbow Chams",
	Callback = function()
        chams()
        
  	end    
})

Tab5Cash:AddButton({
	Name = "Cash aura",
	Callback = function()
      	cashaura()
  	end    
})

Tab4Teleports:AddButton({
    Name = "Teleport To Bank",
    Callback = function()
          TeleportToBank()
      end    
})

Tab4Teleports:AddButton({
    Name = "Teleport To Club",
    Callback = function()
          TeleportToClub()
      end    
})

Tab4Teleports:AddButton({
    Name = "Teleport To DB",
    Callback = function()
          TeleportToDB()
      end    
})

Tab4Teleports:AddButton({
    Name = "Teleport To Revolver",
    Callback = function()
          TeleportToRevolver()
      end    
})
Tab4Teleports:AddButton({
    Name = "Teleport to Tact",
    Callback = function()
          TeleportToTact()
      end    
})
Tab4Teleports:AddButton({
    Name = "Teleport To Meduim Armor",
    Callback = function()
          TelportToMeduimArmor()
      end    
})



Tab7AutoBuy:AddButton({
    Name = "Auto Buy DB",
    Callback = function()
          buyDB()
      end    
})

Tab7AutoBuy:AddButton({
    Name = "Auto Buy LMG",
    Callback = function()
          buyLMG()
      end    
})

Tab7AutoBuy:AddButton({
    Name = "Auto Buy Revolver",
    Callback = function()
          buyRevolver()
      end    
})

Tab7AutoBuy:AddButton({
    Name = "Auto Buy Tactical Shotgun",
    Callback = function()
          buyTact()
      end    
})

Tab8AutoBuyAmmo:AddButton({
    Name = "Auto Buy DB Ammo",
    Callback = function()
          buyDBAmmo()
      end    
})

Tab8AutoBuyAmmo:AddButton({
    Name = "Auto Buy LMG Ammo",
    Callback = function()
          buyLMGAmmo()
      end    
})

Tab8AutoBuyAmmo:AddButton({
    Name = "Auto Buy Revolver Ammo",
    Callback = function()
          buyRevolverAmmo()
      end    
})

Tab8AutoBuyAmmo:AddButton({
    Name = "Auto Buy Tact Ammo",
    Callback = function()
          buyTactAmmo()
      end    
})

Tab6OnlyDH:AddButton({
    Name = "Auto Fat",
    Callback = function()
          autoFat()
      end    
})



-- Toggles 

Tab1Player:AddToggle({
	Name = "Toggle Speed",
	Default = false,
	Callback = function(Value)
        print(Value)
        Movement.SpeedEnabled = Value
        speedlocalplayer()
	end    
})

OrionLib:Init()
