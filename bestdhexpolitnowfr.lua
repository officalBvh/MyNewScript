local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()
local Window = OrionLib:MakeWindow({Name = "Bumpy hub - discord.gg/bumpydhc", HidePremium = false, SaveConfig = true, ConfigFolder = "BumpyHub - config", IntroEnabled = false})
local RunService = game:GetService("RunService")

local Movement = {
    SpeedEnabled = false,
    SpeedAmount = 16
}
local LocalPlr = game.Players.LocalPlayer

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
            LocalPlr.Character.Humanoid.MoveDirection = 0, 0, 0
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

local LocalPlayer = Window:MakeTab({
    Name = "Local Player",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false
})

local CashTab = Window:MakeTab({
    Name = "Cash shit",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false
})


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
LocalPlayer:AddToggle({
	Name = "Toggle Speed",
	Default = false,
	Callback = function(Value)
        print(Value)
        Movement.SpeedEnabled = Value
        speedlocalplayer()
	end    
})

CashTab:AddButton({
	Name = "Cash aura",
	Callback = function()
      		cashaura()
  	end    
})



local CombatTab = Window:MakeTab({
	Name = "Combat",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})


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


local ESPTab = Window:MakeTab({
	Name = "ESP",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
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











OrionLib:Init()