-- Varibles

local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()
local Window = OrionLib:MakeWindow({Name = "Bumpy hub - discord.gg/bumpydhc", HidePremium = false, SaveConfig = true, ConfigFolder = "BumpyHub - config", IntroEnabled = false})
local RunService = game:GetService("RunService")




local Movement = {
    SpeedEnabled = false,
    SpeedAmount = 16,
    JumpEnabled = false,
    JumpAmount = 7.2
}
local LocalPlr = game.Players.LocalPlayer

-- Functions


function cashaura()
    while wait() do
        for i, money in ipairs(game.Workspace.Ignored.Drop:GetChildren()) do
            if money.Name == "MoneyDrop" and (money.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude <= 20 then
            fireclickdetector(money.ClickDetector)
            end  
        end
    end
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

function jumpheigtlocalplr()
    if Movement.JumpEnabled == true then
        LocalPlr.Character.HumanoidRootPart.JumpHeight = Movement.JumpAmount
    elseif Movement.JumpEnabled == false then
       LocalPlr.Character.HumanoidRootPart.JumpHeight = 7.2 
    end
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

-- Tabs

local LocalPlayer = Window:MakeTab({
    Name = "Local Player",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false
})


local CombatTab = Window:MakeTab({
	Name = "Combat",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

local ESPTab = Window:MakeTab({
	Name = "ESP",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

local TelportsTab = Window:MakeTab({
    Name = "Teleports",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false
})

local CashTab = Window:MakeTab({
    Name = "Cash Stuff",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false
})

-- Sliders

LocalPlayer:AddSlider({
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

LocalPlayer:AddSlider({
	Name = "Jump",
	Min = 16,
	Max = 1000,
	Default = 16,
	Color = Color3.fromRGB(255,255,255),
	Increment = 1,
	ValueName = "Jump",
	Callback = function(Value)
        Movement.JumpAmount = Value
	end    
})

-- Toggles

LocalPlayer:AddToggle({
	Name = "Toggle Speed",
	Default = false,
	Callback = function(Value)
        print(Value)
        Movement.SpeedEnabled = Value
        speedlocalplayer()
	end    
})


LocalPlayer:AddToggle({
	Name = "Toggle Jump",
	Default = false,
	Callback = function(Value)
        print(Value)
        Movement.JumpEnabled = Value
        jumpheigtlocalplr()
	end    
})

-- Buttons


CombatTab:AddButton({
	Name = "Load Bumpy Hub (best lock ever made)",
	Callback = function()
            loadstring(game:HttpGet("https://pastebin.com/raw/TfA0c8mL"))()
  	end    
})

CombatTab:AddButton({
	Name = "Camlock (Q)",
	Callback = function()
      		loadstring(game:HttpGet("https://pastebin.com/raw/WzwUWskw"))()
  	end    
})

CombatTab:AddButton({
	Name = "0 Recoil",
	Callback = function()
      		loadstring(game:HttpGet("https://pastebin.com/raw/frsVXZS3"))()
  	end    
})


CombatTab:AddButton({
	Name = "Silent Aim",
	Callback = function()
      		loadstring(game:HttpGet("https://pastebin.com/raw/mueRzXkp"))()
  	end    
})


ESPTab:AddButton({
	Name = "Enable Esp",
	Callback = function()
        _G.ESPVisible = not _G.ESPVisible
            loadstring(game:HttpGet("https://pastebin.com/raw/s7viVmDR"))()
  	end    
})


ESPTab:AddButton({
	Name = "Enable Rainbow Chams",
	Callback = function()
        chams()
        
  	end    
})

CashTab:AddButton({
	Name = "Cash aura",
	Callback = function()
      	ashaura()
  	end    
})

TeleportsTab:AddButton({
	Name = "Teleport To Bank",
	Callback = function()
      	TeleportToBank()
  	end    
})

TeleportsTab:AddButton({
	Name = "Teleport To Club",
	Callback = function()
      	TeleportToClub()
  	end    
})

TeleportsTab:AddButton({
	Name = "Teleport To DB",
	Callback = function()
      	TeleportToDB()
  	end    
})

TeleportsTab:AddButton({
	Name = "Teleport To Revolver",
	Callback = function()
      	TeleportToRevolver()
  	end    
})
TeleportsTab:AddButton({
	Name = "Teleport to Tact",
	Callback = function()
      	TeleportToTact()
  	end    
})
TeleportsTab:AddButton({
	Name = "Teleport To Meduim Armor",
	Callback = function()
      	TelportToMeduimArmor()
  	end    
})





OrionLib:Init()
