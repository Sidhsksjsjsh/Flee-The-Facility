local lib = loadstring(game:HttpGet("https://raw.githubusercontent.com/Sidhsksjsjsh/VAPE-UI-MODDED/main/.lua"))()

local workspace = game:GetService("Workspace")

local wndw = lib:Window("VIP Turtle Hub V4.2")

local T1 = wndw:Tab("Player stuff")
local products = require(game:GetService("ReplicatedStorage")["DeveloperProductIds"])
local RunService = game:GetService("RunService")
local jump = 50
local speed = 16
local CurrentMap = game:GetService("ReplicatedStorage")["CurrentMap"] --> "Haunted Mansion by BreifAwesomeDude" • Instance

local tag = env.Create.Tag()

local function LocalPowerScript()
	if user.Character:FindFirstChild("PowersLocalScript") then
		user.Character.PowersLocalScript:Destroy()
	else
		lib:notify(lib:ColorFonts("Failed to destroy PowersLocalScript ( Missing_Script : PowersLocalScript )","Bold,Red"),10)
	end
end

local function toolHandle1()
	if user.Character:FindFirstChild("Gemstone") then
		user.Character.Gemstone.Handle.PointLight:Destroy()
	else
		lib:notify(lib:ColorFonts("Failed to destroy Gemstone.Handle.PointLight ( Missing_Tool : Gemstone )","Bold,Red"),10)
	end
end

local function GetClosestPlayer(funct)
	for i,v in pairs(Players:GetPlayers()) do 
		if (user.Character.HumanoidRootPart.Position - v.Character.HumanoidRootPart.Position).Magnitude < 25 then
			funct(v)
		end
	end
end

T1:Button("Respawn",function()
    user.Character:Destroy()
end)

T1:Button("Fixcam",function()
	workspace.CurrentCamera.CameraSubject = user.Character:FindFirstChildWhichIsA('Humanoid')
	workspace.CurrentCamera.CameraType = "Custom"
	user.CameraMinZoomDistance = 0.5
	user.CameraMaxZoomDistance = math.huge
	user.CameraMode = "Classic"
	user.Character.Head.Anchored = false
end)

T1:Slider("Speed",0,100,16,function(value)
	speed = value
	user.Character.Humanoid.WalkSpeed = value
end)

T1:Slider("Jump",0,500,50,function(value)
	jump = value
	user.Character.Humanoid.JumpPower = value
end)

T1:Toggle("Hitbox",false,function(state)
	if state == true then
		for i,v in pairs(game.Players:GetPlayers()) do
			if v.Name ~= user.Name then
				pcall(function()
					v.Character.HumanoidRootPart.Size = Vector3.new(6.5,6.5,6.5)
					v.Character.HumanoidRootPart.Transparency = 0.8
				end)
			end
		end
    elseif state == false then
		for i,v in pairs(game.Players:GetPlayers()) do
			if v.Name ~= user.Name then
				pcall(function()
					v.Character.HumanoidRootPart.Size = Vector3.new(2,2,1)
					v.Character.HumanoidRootPart.Transparency = 1
				end)
			end
		end
    end
end)

local T2 = wndw:Tab("Visuals")
local loop = nil
local PlayerESP = false

env:GetPlayer(function(v)
	local RuntimeLoop = nil
	local line = env.Create.Line()
	local body = env.Create.BodyColor()
	body:Set(v.Character)
	RuntimeLoop = RunService.RenderStepped:Connect(function()
		body:SetVisible(PlayerESP)
		line:SetVisible(PlayerESP)
		if game:GetService("Players"):FindFirstChild(v.Name) then
			if PlayerESP == true then
				line:SetLinePosition(v.Character.HumanoidRootPart)
			end
			if v.TempPlayerStatsModule.IsBeast.Value == true then
				body:SetColor("Body",Color3.new(205,98,152))
				line:SetColor(Color3.fromRGB(205,98,152))
			elseif v.TempPlayerStatsModule.IsBeast.Value == false then
				body:SetColor("Body",Color3.new(1,1,1))
				line:SetColor(Color3.fromRGB(1,1,1))
			end
		else
			body:SetVisible(false)
			line:SetVisible(false)
			RuntimeLoop:Disconnect()
		end
	end)

	env.getCharacter(v,function(chr,humanoid,root,head) -- to prevent the loop being broke if the players was reseting
		body:Set(chr)
	end)
end)

env.onPlayerJoin(function(v)
	local RuntimeLoop = nil
	local line = env.Create.Line()
	local body = env.Create.BodyColor()
	body:Set(v.Character)
	RuntimeLoop = RunService.RenderStepped:Connect(function()
		body:SetVisible(PlayerESP)
		line:SetVisible(PlayerESP)
		if game:GetService("Players"):FindFirstChild(v.Name) then
			if PlayerESP == true then
				line:SetLinePosition(v.Character.HumanoidRootPart)
			end
			if v.TempPlayerStatsModule.IsBeast.Value == true then
				body:SetColor("Body",Color3.new(205,98,152))
				line:SetColor(Color3.fromRGB(205,98,152))
			elseif v.TempPlayerStatsModule.IsBeast.Value == false then
				body:SetColor("Body",Color3.new(1,1,1))
				line:SetColor(Color3.fromRGB(1,1,1))
			end
		else
			body:SetVisible(false)
			line:SetVisible(false)
			RuntimeLoop:Disconnect()
		end
	end)

	env.getCharacter(v,function(chr,humanoid,root,head) -- to prevent the loop being broke if the players was reseting
		body:Set(chr)
	end)
end)

T2:Toggle("ESP Player",false,function(state)
	PlayerESP = state
end)

local dooresp = false
local pcesp = false
local FreezePodESP = false
--CurrentMap
--game:GetService("Workspace")["School By Shortfingers"].ExitDoor.Door.Part
env:children(CurrentMap["Value"],function(v)
	if v.Name == "ExitDoor" then --if v.Name == "SingleDoor" or v.Name == "SingleDoor" or v.Name == "ExitDoor" then
		local RuntimeLoop = nil
		local line = env.Create.Line()
		local body = env.Create.BodyColor()
		body:Set(v.Door)
		RuntimeLoop = RunService.RenderStepped:Connect(function()
			body:SetVisible(dooresp)
			line:SetVisible(dooresp)
			if CurrentMap["Value"]:FindFirstChild(v.Name) then
				if dooresp == true then
					if v:FindFirstChild("Door") and v["Door"]:FindFirstChild("Part") then
						line:SetLinePosition(v["Door"]["Part"])
					end
				end
			else
				body:SetVisible(false)
				line:SetVisible(false)
				RuntimeLoop:Disconnect()
			end
		end)
	end
	if v.Name == "ComputerTable" then
		local RuntimeLoop = nil
		local line = env.Create.Line()
		local body = env.Create.BodyColor()
		body:Set(v)
		RuntimeLoop = RunService.RenderStepped:Connect(function()
			body:SetVisible(pcesp)
			line:SetVisible(pcesp)
			if CurrentMap["Value"]:FindFirstChild(v.Name) then
				if pcesp == true then
					line:SetLinePosition(v)
				end
				if v.Screen.BrickColor == BrickColor.new("Bright blue") then
					body:SetColor("Body",Color3.new(0,0,1))
					line:SetColor(Color3.new(0,0,1))
				elseif v.Screen.BrickColor == BrickColor.new("Dark green") then
					body:SetColor("Body",Color3.new(0,1,0))
					line:SetColor(Color3.new(0,1,0))
				end
			else
				body:SetVisible(false)
				line:SetVisible(false)
				RuntimeLoop:Disconnect()
			end
		end)
	end
	if v.Name == "FreezePod" then
		local RuntimeLoop = nil
		local line = env.Create.Line()
		local body = env.Create.BodyColor()
		body:Set(v)
		RuntimeLoop = RunService.RenderStepped:Connect(function()
			body:SetVisible(FreezePodESP)
			line:SetVisible(FreezePodESP)
			body:SetColor("Body",Color3.new(0,0,1))
			line:SetColor(Color3.new(0,0,1))
			if CurrentMap["Value"]:FindFirstChild(v.Name) then
				if pcesp == true then
					line:SetLinePosition(v)
				end
			else
				body:SetVisible(false)
				line:SetVisible(false)
				RuntimeLoop:Disconnect()
			end
		end)
	end
end)
--CurrentMap
env.getElementChanged(CurrentMap,"Value",function(v)
	if v.Name == "ExitDoor" then --if v.Name == "SingleDoor" or v.Name == "SingleDoor" or v.Name == "ExitDoor" then
		local RuntimeLoop = nil
		local line = env.Create.Line()
		local body = env.Create.BodyColor()
		body:Set(v.Door)
		RuntimeLoop = RunService.RenderStepped:Connect(function()
			body:SetVisible(dooresp)
			line:SetVisible(dooresp)
			if CurrentMap["Value"]:FindFirstChild(v.Name) then
				if dooresp == true then
					if v:FindFirstChild("Door") and v["Door"]:FindFirstChild("Part") then
						line:SetLinePosition(v["Door"]["Part"])
					end
				end
			else
				body:SetVisible(false)
				line:SetVisible(false)
				RuntimeLoop:Disconnect()
			end
		end)
	end
	if v.Name == "ComputerTable" then
		local RuntimeLoop = nil
		local line = env.Create.Line()
		local body = env.Create.BodyColor()
		body:Set(v)
		RuntimeLoop = RunService.RenderStepped:Connect(function()
			body:SetVisible(pcesp)
			line:SetVisible(pcesp)
			if CurrentMap["Value"]:FindFirstChild(v.Name) then
				if pcesp == true then
					line:SetLinePosition(v)
				end
				if v.Screen.BrickColor == BrickColor.new("Bright blue") then
					body:SetColor("Body",Color3.new(0,0,1))
					line:SetColor(Color3.new(0,0,1))
				elseif v.Screen.BrickColor == BrickColor.new("Dark green") then
					body:SetColor("Body",Color3.new(0,1,0))
					line:SetColor(Color3.new(0,1,0))
				end
			else
				body:SetVisible(false)
				line:SetVisible(false)
				RuntimeLoop:Disconnect()
			end
		end)
	end
	if v.Name == "FreezePod" then
		local RuntimeLoop = nil
		local line = env.Create.Line()
		local body = env.Create.BodyColor()
		body:Set(v)
		RuntimeLoop = RunService.RenderStepped:Connect(function()
			body:SetVisible(FreezePodESP)
			line:SetVisible(FreezePodESP)
			body:SetColor("Body",Color3.new(0,0,1))
			line:SetColor(Color3.new(0,0,1))
			if CurrentMap["Value"]:FindFirstChild(v.Name) then
				if pcesp == true then
					line:SetLinePosition(v)
				end
			else
				body:SetVisible(false)
				line:SetVisible(false)
				RuntimeLoop:Disconnect()
			end
		end)
	end
end)

T2:Toggle("Exit Door ESP",false,function(state)
	dooresp = state
end)

T2:Toggle("Computers ESP",false,function(state)
	pcesp = state
end)

T2:Toggle("FreezePod ESP",false,function(state)
	FreezePodESP = state
end)

local T3 = wndw:Tab("Beast")
local stamina = false
T3:Toggle("Inf stamina",false,function(value)
	stamina = value
	if self.TempPlayerStatsModule.IsBeast.Value == true then
		if value == true then
			user.Character.Humanoid.WalkSpeed = 30
		else
			user.Character.Humanoid.WalkSpeed = 16
		end
		LocalPowerScript()
	else
		lib:notify(lib:ColorFonts("Missing_Role : Beast","Bold,Red"),10)
	end
end)

T3:Button("No slow",function()
	if user.TempPlayerStatsModule.IsBeast.Value == true then
		LocalPowerScript()
	else
		lib:notify(lib:ColorFonts("Missing_Role : Beast","Red"),10)
	end
end)

T3:Button("Enable crawl",function()
	if user.TempPlayerStatsModule.IsBeast.Value == true then
		user.TempPlayerStatsModule.DisableCrawl.Value = false
	else
		lib:notify(lib:ColorFonts("Missing_Role : Beast","Red"),10)
	end
end)

T3:Button("Remove sounds and glow",function()
	if user.TempPlayerStatsModule.IsBeast.Value == true then
		for i,v in pairs(user.Character.Hammer.Handle:GetChildren()) do
			if v:IsA("Sound") then
				v:Destroy()
			end
		end
		toolHandle1()
	else
		lib:notify(lib:ColorFonts("Missing_Role : Beast","Bold,Red"),10)
	end
end)

T3:Button("Make round glitching",function()
	if user.TempPlayerStatsModule.IsBeast.Value == true then
		user.Character:Destroy()
	else
		lib:notify(lib:ColorFonts("Missing_Role : Beast","Bold,Red"),10)
	end
end)

local autotie = false
T3:Toggle("Auto tie",false,function(state)
	autotie = state
end)

local T4 = wndw:Tab("Non beast")
local InfSprint = false
T4:Toggle("Sprint",false,function(value)
	InfSprint = value
	if value == true then
		user.Character.Humanoid.WalkSpeed = 30
	else
		user.Character.Humanoid.WalkSpeed = 16
	end
	LocalPowerScript()
end)

local noerror = false
T4:Toggle("No error while hacking the computers",false,function(value)
	noerror = value
	--[[while wait() do
		if noerror == false then break end
		game:GetService("ReplicatedStorage")["RemoteEvent"]:FireServer("SetPlayerMinigameResult",true)
	end]]
end)

--[[env:HookCalled(function(path,args)
	if path.Name == "RemoteEvent" then
		if args[1] == "SetPlayerMinigameResult" and noerror == true then
			args[2] = true
			return path.FireServer(path,unpack(args))
		end
	end
end)]]

local T5 = wndw:Tab("Misc")

T5:Textbox("Send trade",false,function(value)
    game:GetService("ReplicatedStorage")["RemoteEvent"]:FireServer("SendTradeRequest",game:GetService("Players")[value]["UserId"])
end)

T5:Button("Close trade UI",function()
	if game.PlaceId == 1738581510 then
	    user["PlayerGui"]["MenusScreenGui"]["TradingMenuWindow"]["Visible"] = false
		lib:notify(lib:ColorFonts("Vanguard-Alert : Visual scam wont work if u close the gui while doing the visual scam.","Bold,Yellow"),10)
	else
		lib:notify(lib:ColorFonts("Vanguard-Alert : Your not in the trading server.","Yellow"),10)
	end
end)

T5:Button("Visual scam",function()
	if game.PlaceId == 1738581510 then
		firesignal(self["PlayerGui"]["MenusScreenGui"]["TradingMenuWindow"]["TopBar"]["CloseButton"].MouseButton1Click)
		task.wait(3)
		self["PlayerGui"]["MenusScreenGui"]["TradingMenuWindow"]["Visible"] = true
	else
		lib:notify(lib:ColorFonts("Vanguard-Alert : Your not in the trading server.","Yellow"),10)
	end
end)

--[[T5:Button("Inf credits ( Only work on bundles )",function()
	lib:notify("This only works on bundles",10)
    while wait() do
        self.SavedPlayerStatsModule.Credits.Value = math.huge
    end
end)]]

T5:Dropdown("Buy unavailable bundles ( go to shop to buy it )",{"2ndAniversaryBundle (Rarest)","AnniversaryClassicBundle","SpookySweetsBundle"},function(item)
	if item == "2ndAniversaryBundle (Rarest)" then
		user.PlayerGui.MenusScreenGui.ShopMenuWindow.Body.SideBarTabsFrame.BuyBundleButton2.LocalScript.Enabled = true
      	user.PlayerGui.MenusScreenGui.ShopMenuWindow.Body.SideBarTabsFrame.BuyBundleButton2.Visible = true
      	products["RedNutcrackerBundle"] = 592709755
	elseif item == "AnniversaryClassicBundle" then
      	user.PlayerGui.MenusScreenGui.ShopMenuWindow.Body.SideBarTabsFrame.BuyBundleButton2.LocalScript.Enabled = true
      	user.PlayerGui.MenusScreenGui.ShopMenuWindow.Body.SideBarTabsFrame.BuyBundleButton2.Visible = true
      	products["RedNutcrackerBundle"] = 307455363
	elseif item == "SpookySweetsBundle" then
      	user.PlayerGui.MenusScreenGui.ShopMenuWindow.Body.SideBarTabsFrame.BuyBundleButton2.LocalScript.Enabled = true
     	user.PlayerGui.MenusScreenGui.ShopMenuWindow.Body.SideBarTabsFrame.BuyBundleButton2.Visible = true
      	products["RedNutcrackerBundle"] = 1111394671
	end
end)

env:Loop(function()
	if noerror == true then
		game:GetService("ReplicatedStorage")["RemoteEvent"]:FireServer("SetPlayerMinigameResult",true)
	end
	if InfSprint == true then
		user.Character.Humanoid.WalkSpeed = speed
	end
	if stamina == true then
		if self.TempPlayerStatsModule.IsBeast.Value == true then
			user.Character.Humanoid.WalkSpeed = 30
		end
	end
	if autotie == true then
		if user.TempPlayerStatsModule.IsBeast.Value == true then
			env:GetPlayer(function(v)
				if env.getRootDistance(v.Character.HumanoidRootPart) < 25 then
					user.Character["Hammer"]["HammerEvent"]:FireServer("HammerTieUp",v.Character.Torso,v.Character.HumanoidRootPart.Position)
				end
			end)
		end
	end
end)

lib.DeveloperEncrypt(wndw,false)
