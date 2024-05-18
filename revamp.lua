-- booting the libary
local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

-- Varibles
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
getgenv().KeyBindCamLock = nil


-- Windows

local Window = Rayfield:CreateWindow({
    Name = "Hermes Ware",
    LoadingTitle = "HermesWare",
    LoadingSubtitle = "by burasv",
    ConfigurationSaving = {
       Enabled = true,
       FolderName = nil, -- Create a custom folder for your hub/game
       FileName = "HermesWare"
    },
    Discord = {
       Enabled = false,
       Invite = "noinvitelink", -- The Discord invite code, do not include discord.gg/. E.g. discord.gg/ABCD would be ABCD
       RememberJoins = true -- Set this to false to make them join the discord every time they load it up
    },
    KeySystem = true, -- Set this to true to use our key system
    KeySettings = {
       Title = "HermesWare",
       Subtitle = "Key System",
       Note = "No method of obtaining the key is provided",
       FileName = "Key", -- It is recommended to use something unique as other scripts using Rayfield may overwrite your key file
       SaveKey = true, -- The user's key will be saved, but if you change the key, they will be unable to use your script
       GrabKeyFromSite = false, -- If this is true, set Key below to the RAW site you would like Rayfield to get the key from
       Key = {"elismylove"} -- List of keys that will be accepted by the system, can be RAW file links (pastebin, github etc) or simple strings ("hello","key22")
    }
})

-- Functions

function camlock()
    getgenv().Prediction = 0.1248710929171	
    getgenv().AimPart = "HumanoidRootPart"	
    getgenv().Key = getgenv().KeyBindCamLock
    getgenv().DisableKey = "P"	
        
    getgenv().FOV = true	
    getgenv().ShowFOV = false	
    getgenv().FOVSize = 50	
        
    --// Variables (Service)	
        
    local Players = game:GetService("Players")	
    local RS = game:GetService("RunService")	
    local WS = game:GetService("Workspace")	
    local GS = game:GetService("GuiService")	
    local SG = game:GetService("StarterGui")	
        
    --// Variables (regular)	
        
    local LP = Players.LocalPlayer	
    local Mouse = LP:GetMouse()	
    local Camera = WS.CurrentCamera	
    local GetGuiInset = GS.GetGuiInset	
        
    local AimlockState = true	
    local Locked	
    local Victim	
        
    local SelectedKey = getgenv().Key	
    local SelectedDisableKey = getgenv().DisableKey	
        
    --// Notification function	
        
    function Notify(tx)	
        SG:SetCore("SendNotification", {	
            Title = "Evan's Camlock",	
            Text = tx,	
    Duration = 5	
        })	
    end	
        
    --// Check if aimlock is loaded	
        
    if getgenv().Loaded == true then	
        Notify("Aimlock is already loaded!")	
        return	
    end	
        
    getgenv().Loaded = true	
        
    --// FOV Circle	
        
    local fov = Drawing.new("Circle")	
    fov.Filled = false	
    fov.Transparency = 1	
    fov.Thickness = 1	
    fov.Color = Color3.fromRGB(255, 255, 0)	
    fov.NumSides = 1000	
        
    --// Functions	
        
    function update()	
        if getgenv().FOV == true then	
            if fov then	
    fov.Radius = getgenv().FOVSize * 2	
                fov.Visible = getgenv().ShowFOV	
    fov.Position = Vector2.new(Mouse.X, Mouse.Y + GetGuiInset(GS).Y)	
        
                return fov	
            end	
        end	
    end	
        
    function WTVP(arg)	
        return Camera:WorldToViewportPoint(arg)	
    end	
        
    function WTSP(arg)	
        return Camera.WorldToScreenPoint(Camera, arg)	
    end	
        
    function getClosest()	
        local closestPlayer	
        local shortestDistance = math.huge	
        
        for i, v in pairs(game.Players:GetPlayers()) do	
            local notKO = v.Character:WaitForChild("BodyEffects")["K.O"].Value ~= true	
            local notGrabbed = v.Character:FindFirstChild("GRABBING_COINSTRAINT") == nil	
                
    if v ~= game.Players.LocalPlayer and v.Character and v.Character:FindFirstChild("Humanoid") and v.Character.Humanoid.Health ~= 0 and v.Character:FindFirstChild(getgenv().AimPart) and notKO and notGrabbed then	
                local pos = Camera:WorldToViewportPoint(v.Character.PrimaryPart.Position)	
    local magnitude = (Vector2.new(pos.X, pos.Y) - Vector2.new(Mouse.X, Mouse.Y)).magnitude	
                    
                if (getgenv().FOV) then	
                    if (fov.Radius > magnitude and magnitude < shortestDistance) then	
                        closestPlayer = v	
                        shortestDistance = magnitude	
                    end	
                else	
                    if (magnitude < shortestDistance) then	
                        closestPlayer = v	
                        shortestDistance = magnitude	
                    end	
                end	
            end	
        end	
        return closestPlayer	
    end	
        
    --// Checks if key is down	
        
    Mouse.KeyDown:Connect(function(k)	
        SelectedKey = SelectedKey:lower()	
        SelectedDisableKey = SelectedDisableKey:lower()	
        if k == SelectedKey then	
            if AimlockState == true then	
                Locked = not Locked	
                if Locked then	
                    Victim = getClosest()	
        
                    Notify("Locked onto: "..tostring(Victim.Character.Humanoid.DisplayName))	
                else	
                    if Victim ~= nil then	
                        Victim = nil	
        
                        Notify("Unlocked!")	
                    end	
                end	
            else	
                Notify("Aimlock is not enabled!")	
            end	
        end	
        if k == SelectedDisableKey then	
            AimlockState = not AimlockState	
        end	
    end)	
        
    --// Loop update FOV and loop camera lock onto target	
        
    RS.RenderStepped:Connect(function()	
        update()	
        if AimlockState == true then	
            if Victim ~= nil then	
                Camera.CFrame = CFrame.new(Camera.CFrame.p, Victim.Character[getgenv().AimPart].Position + Victim.Character[getgenv().AimPart].Velocity*getgenv().Prediction)	
            end	
        end	
    end)	
        while wait() do
            if getgenv().AutoPrediction == true then	
            local pingvalue = game:GetService("Stats").Network.ServerStatsItem["Data Ping"]:GetValueString()	
            local split = string.split(pingvalue,'(')	
    local ping = tonumber(split[1])	
    if ping < 225 then	
    getgenv().Prediction = 1.4	
    elseif ping < 215 then	
    getgenv().Prediction = 1.2	
        elseif ping < 205 then
    getgenv().Prediction = 1.0	
        elseif ping < 190 then
    getgenv().Prediction = 0.10	
    elseif ping < 180 then	
    getgenv().Prediction = 0.12	
        elseif ping < 170 then
    getgenv().Prediction = 0.15	
        elseif ping < 160 then
    getgenv().Prediction = 0.18	
        elseif ping < 150 then
    getgenv().Prediction = 0.110	
    elseif ping < 140 then	
    getgenv().Prediction = 0.113	
    elseif ping < 130 then	
    getgenv().Prediction = 0.116	
    elseif ping < 120 then	
    getgenv().Prediction = 0.120	
    elseif ping < 110 then	
    getgenv().Prediction = 0.124	
    elseif ping < 105 then	
    getgenv().Prediction = 0.127	
    elseif ping < 90 then	
    getgenv().Prediction = 0.130	
    elseif ping < 80 then	
    getgenv().Prediction = 0.133	
    elseif ping < 70 then	
    getgenv().Prediction = 0.136	
    elseif ping < 60 then	
    getgenv().Prediction = 0.140	
    elseif ping < 50 then	
    getgenv().Prediction = 0.143	
    elseif ping < 40 then	
    getgenv().Prediction = 0.145	
    elseif ping < 30 then	
    getgenv().Prediction = 0.155	
    elseif ping < 20 then	
    getgenv().Prediction = 0.157	
            end	
            end	
        end    
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

function cashaura()
    while wait() do
        for i, money in ipairs(game.Workspace.Ignored.Drop:GetChildren()) do
            if money.Name == "MoneyDrop" and (money.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude <= 20 then
            fireclickdetector(money.ClickDetector)
            end  
        end
    end
end

-- Tabs
local Tab1 = Window:CreateTab("Local Player", 4483362458) -- Title, Image

local Tab2 = Window:CreateTab("Combat ", 4483362458) -- Title, Image

local Tab3 = Window:CreateTab("ESP", 4483362458) -- Title, Image

local Tab4 = Window:CreateTab("Teleports", 4483362458) -- Title, Image

local Tab5 = Window:CreateTab("Cash Stuff", 4483362458) -- Title, Image

local Tab6 = Window:CreateTab("Only DH Farms", 4483362458) -- Title, Image

local Tab7 = Window:CreateTab("Auto Buy Guns", 4483362458) -- Title, Image

local Tab8 = Window:CreateTab("Auto Buy Ammo", 4483362458) -- Title, Image

-- sliders

local SpeedSlider = Tab1:CreateSlider({
    Name = "Speed Amount",
    Range = {16, 1000},
    Increment = 16,
    Suffix = "Speed Amount",
    CurrentValue = 16,
    Flag = "Slider1",
    Callback = function(Value)
        Movement.SpeedAmount = Value / 1000
    end,
 })

local JumpSlider = Tab1:CreateSlider({
    Name = "Jump Amount",
    Range = {16, 1000},
    Increment = 1,
    Suffix = "Jump Amount",
    CurrentValue = 10,
    Flag = "Slider1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
    Callback = function(Value)
        player.Character.Humanoid.JumpPower = Value
    end,
 })


 -- Buttons

local Lock = Tab2:CreateButton({
    Name = "Load Bumpy Hub (best lock ever made)",
    Callback = function()
        loadstring(game:HttpGet("https://pastebin.com/raw/TfA0c8mL"))()
    end,
 })

local CamLock = Tab2:CreateButton({
    Name = "CamLock (Q)",
    Callback = function()
        loadstring(game:HttpGet("https://pastebin.com/raw/WzwUWskw"))()
    end,
 })

local ZeroRecoil = Tab2:CreateButton({
    Name = "0 Recoil (works on most dh games)",
    Callback = function()
        loadstring(game:HttpGet("https://pastebin.com/raw/frsVXZS3"))()
    end,
 })

local SilentAim = Tab2:CreateButton({
    Name = "Silent Aim",
    Callback = function()
        loadstring(game:HttpGet("https://pastebin.com/raw/mueRzXkp"))()
    end,
 })

local StrechRes = Tab2:CreateButton({
    Name = "Strech Res",
    Callback = function()
        loadstring(game:HttpGet("https://pastebin.com/raw/mueRzXkp"))()
    end,
 })

local DotBoxLock = Tab2:CreateButton({
    Name = "Dot Box Lock",
    Callback = function()
        loadstring(game:HttpGet("https://pastebin.com/raw/hejVSuzm"))()
    end,
 })

local ESP = Tab3:CreateButton({
    Name = "ESP",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/ic3w0lf22/Unnamed-ESP/master/UnnamedESP.lua"))()
    end,
 })

local RainbowChams = Tab3:CreateButton({
    Name = "Enable Rainbow Chams",
    Callback = function()
        chams()
    end,
 })

local TeleportToDB = Tab4:CreateButton({
    Name = "Telport To DB",
    Callback = function()
        TeleportToDB()
    end,
 })

local TeleportToRevolver = Tab4:CreateButton({
    Name = "Telport To Revolver",
    Callback = function()
        TeleportToRevolver()
    end,
 })
local TeleportToTact = Tab4:CreateButton({
    Name = "Telport To Tact",
    Callback = function()
        TeleportToTact()
    end,
 })

local TeleportToBank = Tab4:CreateButton({
    Name = "Teleport To Bank",
    Callback = function()
        TeleportToBank()
    end,
 })

 local TeleportToClub = Tab4:CreateButton({
    Name = "Teleport To Club",
    Callback = function()
        TeleportToClub()
    end,
 })

 local CashAura = Tab5:CreateButton({
    Name = "Cash aura",
    Callback = function()
        CashAura()
    end,
 })

 local buyDB = Tab7:CreateButton({
    Name = "Auto Buy DB",
    Callback = function()
        buyDB()
    end,
 })

 local buyRevolver = Tab7:CreateButton({
    Name = "Auto Buy Revolver",
    Callback = function()
        buyRevolver()
    end,
 })

 local buyTact = Tab7:CreateButton({
    Name = "Auto Buy Tact",
    Callback = function()
        buyTact()
    end,
 })

 local buyLMG = Tab7:CreateButton({
    Name = "Auto Buy LMG",
    Callback = function()
        buyLMG()
    end,
 })

 local buyLMGAmmo = Tab8:CreateButton({
    Name = "Auto Buy LMG Ammo",
    Callback = function()
        buyLMGAmmo()
    end,
 })

 local buyDBAmmo = Tab8:CreateButton({
    Name = "Auto Buy DB Ammo",
    Callback = function()
        buyDBAmmo()
    end,
 })

 local buyRevolverAmmo = Tab8:CreateButton({
    Name = "Auto Buy Revolver Ammo",
    Callback = function()
        buyRevolverAmmo()
    end,
 })

 local buyTactAmmo = Tab8:CreateButton({
    Name = "Auto Buy Tact Ammo",
    Callback = function()
        buyTactAmmo()
    end,
 })



 -- Toggles

local SpeedToggle = Tab1:CreateToggle({
   Name = "Toggle Speed",
   CurrentValue = false,
   Flag = "Toggle1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
   Callback = function(Value)
    Movement.SpeedEnabled = Value
    speedlocalplayer()
   end,
})

-- Keybinds
local CamLockKeybind = Tab2:CreateKeybind({
    Name = "Cam Lock Keybind",
    CurrentKeybind = "Q",
    HoldToInteract = false,
    Flag = "Keybind1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
    Callback = function(Keybind)
        print(Keybind)
        getgenv().KeyBindCamLock = Keybind
    end,
 })