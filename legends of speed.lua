getgenv().autogem = false;
getgenv().redorb = false;
getgenv().blueorb = false;
getgenv().yelloworb = false;
getgenv().orangeorb = false;
getgenv().autorebirth = false;
getgenv().autohoop = false;
getgenv().autohatch = false;

local Rayfield = loadstring(game:HttpGet('https://raw.githubusercontent.com/packedwatch102/cautious-meme/main/Lib.lua'))()
local Window = Rayfield:CreateWindow({
	Name = "Aspect Legends of Speed",
	LoadingTitle = "initializing script",
	LoadingSubtitle = "<3",
	ConfigurationSaving = {
		Enabled = false,
		FolderName = nil, -- Create a custom folder for your hub/game
		FileName = "Big Hub"
	},
        Discord = {
        	Enabled = false,
        	Invite = "discord.gg/duh", -- The Discord invite code, do not include discord.gg/
        	RememberJoins = true -- Set this to false to make them join the discord every time they load it up
        }
})
local Tab = Window:CreateTab("Auto Farm") -- Title, Image
local Section = Tab:CreateSection("Toggles")

-- FUNCTIONS

function doGem()
	spawn(function()
	    while getgenv().autogem == true do 
local args = {
    [1] = "collectOrb",
    [2] = "Gem",
    [3] = "City"
}
game:GetService("ReplicatedStorage").rEvents.orbEvent:FireServer(unpack(args))
            wait()
        end
    end)
end

function doRedOrb()
	spawn(function()
	    while getgenv().redorb == true do 
local args = {
    [1] = "collectOrb",
    [2] = "Red Orb",
    [3] = "City"
}
game:GetService("ReplicatedStorage").rEvents.orbEvent:FireServer(unpack(args))
            wait()
        end
    end)
end

function doBlueOrb()
	spawn(function()
	    while getgenv().blueorb == true do 
local args = {
    [1] = "collectOrb",
    [2] = "Blue Orb",
    [3] = "City"
}
game:GetService("ReplicatedStorage").rEvents.orbEvent:FireServer(unpack(args))
            wait()
        end
    end)
end

function doOrangeOrb()
	spawn(function()
	    while getgenv().orangeorb == true do 
local args = {
    [1] = "collectOrb",
    [2] = "Orange Orb",
    [3] = "City"
}
game:GetService("ReplicatedStorage").rEvents.orbEvent:FireServer(unpack(args))
            wait()
        end
    end)
end

function doYellowOrb()
	spawn(function()
	    while getgenv().yelloworb == true do 
local args = {
    [1] = "collectOrb",
    [2] = "Yellow Orb",
    [3] = "City"
}
game:GetService("ReplicatedStorage").rEvents.orbEvent:FireServer(unpack(args))
            wait()
        end
    end)
end

function doAutoRebirth()
	spawn(function()
		while getgenv().autorebirth == true do
local args = {
    [1] = "rebirthRequest"
}
game:GetService("ReplicatedStorage").rEvents.rebirthEvent:FireServer(unpack(args))
wait()
        end
    end)
end

function doHoop()
    spawn(function()
        while getgenv().autohoop == true do         
        for i,v in pairs(game:GetService("Workspace").Hoops:GetChildren()) do
        game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = v.CFrame
        wait(0.1)  
        end
        end
    end)
end

function doHatchOmega()
        while getgenv().autohatch == true do
local args = {
    [1] = "openCrystal",
    [2] = "Electro Legends Crystal"
}
game:GetService("ReplicatedStorage").rEvents.openCrystalRemote:InvokeServer(unpack(args))
wait(1)
end
end
        
--TOGGLES

local Toggle = Tab:CreateToggle({
	Name = "Auto Gem",
	CurrentValue = false,
	Flag = "Toggle1", 
	Callback = function(Value)
		getgenv().autogem = Value
		print('auto gem :', Value);
    if Value then
    	doGem();
	end
end
})
local Toggle = Tab:CreateToggle({
	Name = "Auto Red Orb",
	CurrentValue = false,
	Flag = "Toggle1",
	Callback = function(Value)
		getgenv().redorb = Value
		print('red orb :', Value);
    if Value then
    	doRedOrb();
	end
end
})

local Toggle = Tab:CreateToggle({
	Name = "Auto Blue Orb",
	CurrentValue = false,
	Flag = "Toggle1", 
	Callback = function(Value)
		getgenv().blueorb = Value
		print('blue orb :', Value);
    if Value then
    	doBlueOrb();
	end
end
})

local Toggle = Tab:CreateToggle({
	Name = "Auto Orange Orb",
	CurrentValue = false,
	Flag = "Toggle1", 
	Callback = function(Value)
		getgenv().orangeorb = Value
		print('orange orb :', Value);
    if Value then
    	doOrangeOrb();
	end
end
})

local Toggle = Tab:CreateToggle({
	Name = "Auto Yellow Orb",
	CurrentValue = false,
	Flag = "Toggle1", 
	Callback = function(Value)
		getgenv().yelloworb = Value
		print('yellow orb :', Value);
    if Value then
    	doYellowOrb();
	end
end
})

local Toggle = Tab:CreateToggle({
	Name = "Auto Rebirth",
	CurrentValue = false,
	Flag = "Toggle1", 
	Callback = function(Value)
		getgenv().autorebirth = Value
		print('auto rebirth :', Value);
    if Value then
    	doAutoRebirth();
	end
end
})

local Toggle = Tab:CreateToggle({
	Name = "Auto Hoop",
	CurrentValue = false,
	Flag = "Toggle1", 
	Callback = function(Value)
		getgenv().autohoop = Value
		print('auto hoop :', Value);
    if Value then
    	doHoop();
    else
    local initial = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame
    game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = initial
	end
end
})


--MISC

local Tab = Window:CreateTab("Misc") -- Title, Image
local selectedplace;
local places = game:GetService("Workspace").areaTeleportParts:GetChildren()
local places_table = {}
for i,v in pairs(places) do 
    table.insert(places_table,v.Name)
    end
local Dropdown = Tab:CreateDropdown({
	Name = "Area Teleport ",
	Options = {"City", "Mysterious Cave","Snow City","Inferno Cave","Magma City","Electro Cave","Legends Highway"},
	CurrentOption = "City",
	Flag = "Dropdown1", 
	Callback = function(Option)
		selectedplace = Option
        print(selectedplace)
        if selectedplace == "City" then
            tptocity();
        elseif  selectedplace == "Mysterious Cave" then
            tptomysteriouscave();
        elseif  selectedplace == "Snow City" then
            tptosnowcity();
        elseif selectedplace == "Inferno Cave" then
            tptoinfernocave();
        elseif  selectedplace == "Magma City" then
            tptomagmacity();
        elseif  selectedplace == "Electro Cave" then
            tptoelectrocave();
        elseif  selectedplace == "Legends Highway" then
        tptolegendshighway();
    end
end
})

local Toggle = Tab:CreateToggle({
	Name = "Auto Hatch",
	CurrentValue = false,
	Flag = "Toggle1", 
	Callback = function(Value)
		getgenv().autohatch = Value
		print('auto hatch :', Value);
    if Value then
    	doHatchOmega();
	end
end
})


function tptocity()
    local playerpart = game.Players.LocalPlayer.Character.HumanoidRootPart
    local location = CFrame.new(-753.824402, 17.5500031, 549.088013, 0.642763317, -0, -0.766064942, 0, 1, -0, 0.766064942, 0, 0.642763317)
    local humanoid = game.Players.LocalPlayer.Character.Humanoid
    wait(0.1)
    playerpart.CFrame = location
end

function tptomysteriouscave()
    local playerpart = game.Players.LocalPlayer.Character.HumanoidRootPart
    local location = CFrame.new(-9683.04883, 74.3799896, 3136.62695, -1, 0, 0, 0, 1, 0, 0, 0, -1)
    local humanoid = game.Players.LocalPlayer.Character.Humanoid
    wait(0.1)
    playerpart.CFrame = location
end

function tptosnowcity()
    local playerpart = game.Players.LocalPlayer.Character.HumanoidRootPart
    local location = CFrame.new(-866.386841, 15.8799839, 2165.70654, -0.499959469, 0, -0.866048813, 0, 1, 0, 0.866048813, 0, -0.499959469)
    local humanoid = game.Players.LocalPlayer.Character.Humanoid
    wait(0.1)
    playerpart.CFrame = location
end

function tptoinfernocave()
    local playerpart = game.Players.LocalPlayer.Character.HumanoidRootPart
    local location = CFrame.new(-11041.3574, 71.1799698, 4111.8252, -1, 0, 0, 0, 1, 0, 0, 0, -1)
    local humanoid = game.Players.LocalPlayer.Character.Humanoid
    wait(0.1)
    playerpart.CFrame = location
end

function tptomagmacity()
    local playerpart = game.Players.LocalPlayer.Character.HumanoidRootPart
    local location = CFrame.new(1616.82703, 14.2799845, 4330.65234, 0, 0, -1, 0, 1, 0, 1, 0, 0)
    local humanoid = game.Players.LocalPlayer.Character.Humanoid
    wait(0.1)
    playerpart.CFrame = location
end

function tptoelectrocave()
    local playerpart = game.Players.LocalPlayer.Character.HumanoidRootPart
    local location = CFrame.new(-13085.2598, 71.1799698, 4111.8252, -1, 0, 0, 0, 1, 0, 0, 0, -1)
    local humanoid = game.Players.LocalPlayer.Character.Humanoid
    wait(0.1)
    playerpart.CFrame = location
end

function tptolegendshighway()
    local playerpart = game.Players.LocalPlayer.Character.HumanoidRootPart
    local location = CFrame.new(3678.62549, 81.7799988, 5592.35254, 0, 0, -1, 0, 1, 0, 1, 0, 0)
    local humanoid = game.Players.LocalPlayer.Character.Humanoid
    wait(0.1)
    playerpart.CFrame = location
end
    