local lib = loadstring(game:HttpGet("https://raw.githubusercontent.com/Sidhsksjsjsh/VAPE-UI-MODDED/main/.lua"))()

local self = game.Players.LocalPlayer
local workspace = game:GetService("Workspace")

local wndw = lib:Window("VIP Turtle Hub V4 - boring...")
local T1 = wndw:Tab("Player stuff")
local products = require(game:GetService("ReplicatedStorage")["DeveloperProductIds"]);

local function LocalPowerScript()
  if self.Character:FindFirstChild("PowersLocalScript") then
    self.Character.PowersLocalScript:Destroy()
  else
    lib:notify(lib:ColorFonts("Failed to destroy PowersLocalScript ( Missing_Script : PowersLocalScript )","Red"),10)
  end
end

local function toolHandle1()
  if self.Character:FindFirstChild("Gemstone") then
    self.Character.Gemstone.Handle.PointLight:Destroy()
  else
    lib:notify(lib:ColorFonts("Failed to destroy Gemstone.Handle.PointLight ( Missing_Tool : Gemstone )","Red"),10)
  end
end

local function GetClosestPlayer(funct)
   for i,v in pairs(Players:GetPlayers()) do
       if (self.Character.HumanoidRootPart.Position - v.Character.HumanoidRootPart.Position).Magnitude < 25 then
           funct(v)
      end
   end
end

T1:Button("Respawn",function()
    self.Character:Destroy()
end)

T1:Button("Fixcam",function()
	workspace.CurrentCamera.CameraSubject = self.Character:FindFirstChildWhichIsA('Humanoid')
	workspace.CurrentCamera.CameraType = "Custom"
	self.CameraMinZoomDistance = 0.5
	self.CameraMaxZoomDistance = math.huge
	self.CameraMode = "Classic"
	self.Character.Head.Anchored = false
end)

T1:Slider("Speed",0,100,16,function(value)
	    self.Character.Humanoid.WalkSpeed = value
end)

T1:Slider("Slider",0,500,50,function(value)
	    self.Character.Humanoid.JumpPower = value
end)

T1:Toggle("Hitbox",false,function(state)
    if state == true then
      for i,v in pairs(game.Players:GetPlayers()) do
      if v.Name ~= self.Name then
          pcall(function()
              v.Character.HumanoidRootPart.Size = Vector3.new(6.5,6.5,6.5)
              v.Character.HumanoidRootPart.Transparency = 0.8
          end)
      end
      end
    else
      for i,v in pairs(game.Players:GetPlayers()) do
      if v.Name ~= self.Name then
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

T2:Toggle("ESP Player",false,function(state)
if state == true then
	for i,v in pairs(game.Players:GetChildren()) do
		if v:IsA("Player") and v.Name ~= game.Players.LocalPlayer.Name then
			pcall(function()
				local transparency = 0.5
				local Folder = Instance.new("Folder",v.Character)
				Folder.Name = v.Name .. "'s ESP"
				--Head
				local Head = Instance.new("BoxHandleAdornment",Folder)
				Head.AlwaysOnTop = true
				Head.Adornee = v.Character.Head
				Head.ZIndex = 1
				Head.Name = "Head"
				Head.Transparency = transparency
				Head.Size = v.Character.Head.Size
				--Torso
				local Torso = Instance.new("BoxHandleAdornment",Folder)
				Torso.AlwaysOnTop = true
				Torso.Adornee = v.Character.Torso
				Torso.ZIndex = 1
				Torso.Name = "Torso"
				Torso.Transparency = transparency
				Torso.Size = v.Character.Torso.Size
				--Left Arm
				local LeftArm = Instance.new("BoxHandleAdornment",Folder)
				LeftArm.AlwaysOnTop = true
				LeftArm.Adornee = v.Character["Left Arm"]
				LeftArm.ZIndex = 1
				LeftArm.Name = "LeftArm"
				LeftArm.Transparency = transparency
				LeftArm.Size = v.Character["Left Arm"].Size
				--Right Arm
				local RightArm = Instance.new("BoxHandleAdornment",Folder)
				RightArm.AlwaysOnTop = true
				RightArm.Adornee = v.Character["Right Arm"]
				RightArm.ZIndex = 1
				RightArm.Name = "RightArm"
				RightArm.Transparency = transparency
				RightArm.Size = v.Character["Right Arm"].Size
				--Right Leg
				local RightLeg = Instance.new("BoxHandleAdornment",Folder)
				RightLeg.AlwaysOnTop = true
				RightLeg.Adornee = v.Character["Right Leg"]
				RightLeg.ZIndex = 1
				RightLeg.Name = "RightLeg"
				RightLeg.Transparency = transparency
				RightLeg.Size = v.Character["Right Leg"].Size
				--Left Leg
				local LeftLeg = Instance.new("BoxHandleAdornment",Folder)
				LeftLeg.AlwaysOnTop = true
				LeftLeg.Name = "LeftLeg"
				LeftLeg.Adornee = v.Character["Left Leg"]
				LeftLeg.ZIndex = 1
				LeftLeg.Transparency = transparency
				LeftLeg.Size = v.Character["Left Leg"].Size
				--Colors if beast or not
				loop = game.RunService.Stepped:Connect(function()
				if v.TempPlayerStatsModule.IsBeast.Value == true then
					Head.Color3 = Color3.fromRGB(205, 98, 152)
					Torso.Color3 = Color3.fromRGB(205, 98, 152)
					LeftArm.Color3 = Color3.fromRGB(205, 98, 152)
					RightArm.Color3 = Color3.fromRGB(205, 98, 152)
					RightLeg.Color3 = Color3.fromRGB(205, 98, 152)
					LeftLeg.Color3 = Color3.fromRGB(205, 98, 152)
				elseif v.TempPlayerStatsModule.IsBeast.Value == false then
					Head.Color3 = Color3.new(225,1,1)
					Torso.Color3 = Color3.new(1,1,1)
					LeftArm.Color3 = Color3.new(1,1,1)
					RightArm.Color3 = Color3.new(1,1,1)
					RightLeg.Color3 = Color3.new(1,1,1)
					LeftLeg.Color3 = Color3.new(1,1,1)
				end
				end)
        --[[
        --BillboardGui
        local BillboardGui = Instance.new("BillboardGui",Folder)
        BillboardGui.AlwaysOnTop = true
        BillboardGui.Enabled = true
        BillboardGui.Adornee = v.Character.Head
        BillboardGui.Size = UDim2.new(0,100,0,100)
        --NameTag
        local NameTag = Instance.new("TextLabel",BillboardGui)
        NameTag.BackgroundTransparency = 1
        NameTag.Size = UDim2.new(0,100,0,10)
        if v.TempPlayerStatsModule.IsBeast.Value == true then
        NameTag.TextColor3 = Color3.new(1,0,0)
        elseif v.TempPlayerStatsModule.IsBeast.Value == false then
        NameTag.TextColor3 = Color3.new(1,1,1)
        end
        NameTag.ZIndex = 10
        NameTag.Visible = true
        NameTag.TextSize = 20
        NameTag.Text = "Name: " .. v.Name
        ]]
			end)
		end
	end
else
loop:Disconnect()
for i,v in pairs(game.Players:GetChildren()) do
    if v:IsA("Player") then
   for i,e in pairs(v.Character:GetChildren()) do
   if e:IsA("Folder") then
       pcall(function()
       e:Destroy()
       end)
end
end
end
end

end
end)

local dooresp = false
T2:Toggle("Door ESP",false,function(state)
dooresp = state
if state == true then
	spawn(function()
		--single doors
		for i,v in pairs(workspace:GetDescendants()) do
			if v.Name == "SingleDoor" then
				pcall(function()
					local ESP = Instance.new("Highlight")
					ESP.Parent = v.Door
				end)

			end
		end
		wait(1)

		for i,v in pairs(workspace:GetDescendants()) do
			if v.Name == "SingleDoor" then
				spawn(function()
					while true do
						pcall(function()
							if v.DoorTrigger.ActionSign.Value == 11 then
								v.Door.Highlight.FillColor = Color3.new(0,1,0)
							elseif v.DoorTrigger.ActionSign.Value == 10 then
								v.Door.Highlight.FillColor = Color3.new(1,0,0)
							end
						end)
						if dooresp == true then
						    break;
						end
						wait(0.1)
					end
				end)
				
				
			end
		end
		
	end)
	--double doors
	spawn(function()
		for i,v in pairs(workspace:GetDescendants()) do
			if v.Name == "DoubleDoor" then
				pcall(function()
					local ESP = Instance.new("Highlight")
					ESP.Parent = v
				end)

			end
		end
		wait(1)

		for i,v in pairs(workspace:GetDescendants()) do
			if v.Name == "DoubleDoor" then
				spawn(function()
					while true do
						pcall(function()
							if v.DoorTrigger.ActionSign.Value == 11 then
								v.Highlight.FillColor = Color3.new(0,1,0)
							elseif v.DoorTrigger.ActionSign.Value == 10 then
								v.Highlight.FillColor = Color3.new(1,0,0)
							end
						end)
                        if dooresp == true then
                             print("Stopped itLop!2")
                             break;
                        end
                        wait(0.1)
					end
				end)
			end
		end
	end)
else
	--signle door
	for i,v in pairs(workspace:GetDescendants()) do
		if v.Name == "SingleDoor" then
			pcall(function()
				v.Door.Highlight:Destroy()
			end)

		end
	end

	--double doors
	for i,v in pairs(workspace:GetDescendants()) do
		if v.Name == "DoubleDoor" then
			pcall(function()
				v.Highlight:Destroy()
			end)

		end
	end
end
end)

local pcesp = false
T2:Toggle("Computers ESP",false,function(state)
pcesp = state
if state == true then
for i,v in pairs(workspace:GetDescendants()) do 
    if v.Name == "ComputerTable" then
        pcall(function()
        local ESP = Instance.new("Highlight",v)
        end)
    end
end

spawn(function()
while true do
for i,v in pairs(workspace:GetDescendants()) do
    if v.Name == "ComputerTable" then
        if v.Screen.BrickColor == BrickColor.new("Bright blue") then
            pcall(function()
          v.Highlight.FillColor = Color3.new(0,0,1)
            end)
        elseif v.Screen.BrickColor == BrickColor.new("Dark green") then
            pcall(function()
          v.Highlight.FillColor = Color3.new(0,1,0)
            end)
        end
        if pcesp == true then
          print("Stopped itLop!PC")
          break;
        end
    end
end
wait(1)
end
end)
else
for i,v in pairs(workspace:GetDescendants()) do 
    if v.Name == "ComputerTable" then
        pcall(function()
        v.Highlight:Destroy()
        end)
    end
end
end
end)

T2:Toggle("FreezePod ESP",false,function(state)
if state == true then
for i,v in pairs(workspace:GetDescendants()) do 
    if v.Name == "FreezePod" then
        pcall(function()
        local ESP = Instance.new("Highlight",v)
        end)
    end
end
else
for i,v in pairs(workspace:GetDescendants()) do 
    if v.Name == "FreezePod" then
        pcall(function()
        v.Highlight:Destroy()
        end)
    end
end
end
end)

local T3 = wndw:Tab("Beast")
T3:Toggle("Inf stamina",false,function(value)
if self.TempPlayerStatsModule.IsBeast.Value == true then
      if value == true then
        self.Character.Humanoid.WalkSpeed = 30
      else
        self.Character.Humanoid.WalkSpeed = 16
      end
      LocalPowerScript()
else
      lib:notify(lib:ColorFonts("Missing_Role : Beast","Red"),10)
end
end)

T3:Button("No slow",function()
if self.TempPlayerStatsModule.IsBeast.Value == true then
      LocalPowerScript()
else
      lib:notify(lib:ColorFonts("Missing_Role : Beast","Red"),10)
end
end)

T3:Button("Enable crawl",function()
if self.TempPlayerStatsModule.IsBeast.Value == true then
      self.TempPlayerStatsModule.DisableCrawl.Value = false
else
      lib:notify(lib:ColorFonts("Missing_Role : Beast","Red"),10)
end
end)

T3:Button("Remove sounds and glow",function()
if self.TempPlayerStatsModule.IsBeast.Value == true then
for i,v in pairs(self.Character.Hammer.Handle:GetChildren()) do
    if v:IsA("Sound") then
        pcall(function()
        v:Destroy()
        end)
    end
end
toolHandle1()
else
      lib:notify(lib:ColorFonts("Missing_Role : Beast","Red"),10)
end
end)

T3:Button("Make round glitching",function()
if self.TempPlayerStatsModule.IsBeast.Value == true then
      self.Character:Destroy()
else
      lib:notify(lib:ColorFonts("Missing_Role : Beast","Red"),10)
end
end)

local autotie = false
T3:Toggle("Auto tie",false,function(state)
autotie = state
if state == true then
if self.TempPlayerStatsModule.IsBeast.Value == true then
while wait() do
if self.TempPlayerStatsModule.IsBeast.Value == true then
GetClosestPlayer(function(get)
    game:GetService("Players").LocalPlayer.Character.Hammer.HammerEvent:FireServer("HammerTieUp",get.Character.Torso,get.Character.HumanoidRootPart.Position)
end)
end
if autotie == true then
    break;
end
end
else
      lib:notify(lib:ColorFonts("Missing_Role : Beast","Red"),10)
end
else
      lib:notify(lib:ColorFonts("Missing_Role : Beast","Red"),10)
end
end)

local T4 = wndw:Tab("Non beast")
T4:Toggle("Sprint",false,function(value)
if value == true then
      self.Character.Humanoid.WalkSpeed = 30
else
      self.Character.Humanoid.WalkSpeed = 16
end
LocalPowerScript()
end)

local noerror = false
T4:Toggle("No error while hacking the computers",false,function(value)
noerror = value
while wait() do
    if noerror == false then break end
    game:GetService("ReplicatedStorage")["RemoteEvent"]:FireServer("SetPlayerMinigameResult",true)
end
end)

local T5 = wndw:Tab("Misc")

T5:Textbox("Send trade",false,function(value)
    game:GetService("ReplicatedStorage"):WaitForChild("RemoteEvent"):FireServer("SendTradeRequest",game:GetService("Players")[value]["UserId"])
end)

T5:Button("Close trade UI",function()
if game.PlaceId == 1738581510 then
	    self["PlayerGui"]["MenusScreenGui"]["TradingMenuWindow"]["Visible"] = false
      lib:notify(lib:ColorFonts("Vanguard-Alert : Visual scam wont work if u close the gui while doing the visual scam.","Yellow"),10)
else
      lib:notify(lib:ColorFonts("Vanguard-Alert : Your not in the trading server.","Yellow"),10)
end
end)

T5:Button("Visual scam",function()
if game.PlaceId == 1738581510 then
      firesignal(self["PlayerGui"]["MenusScreenGui"]["TradingMenuWindow"]["TopBar"]["CloseButton"].MouseButton1Click)
      wait(3)
      self["PlayerGui"]["MenusScreenGui"]["TradingMenuWindow"]["Visible"] = true
else
      lib:notify(lib:ColorFonts("Vanguard-Alert : Your not in the trading server.","Yellow"),10)
end
end)

T5:Button("Inf credits ( Only work on bundles )",function()
	    lib:notify("This only works on bundles",10)
       while wait() do
           self.SavedPlayerStatsModule.Credits.Value = math.huge
       end
end)

T5:Dropdown("Buy unavailable bundles ( go to shop to buy it )",{"2ndAniversaryBundle (Rarest)","AnniversaryClassicBundle","SpookySweetsBundle"},function(item)
if item == "2ndAniversaryBundle (Rarest)" then
      self.PlayerGui.MenusScreenGui.ShopMenuWindow.Body.SideBarTabsFrame.BuyBundleButton2.LocalScript.Enabled = true
      self.PlayerGui.MenusScreenGui.ShopMenuWindow.Body.SideBarTabsFrame.BuyBundleButton2.Visible = true
      products["RedNutcrackerBundle"] = 592709755
elseif item == "AnniversaryClassicBundle" then
      self.PlayerGui.MenusScreenGui.ShopMenuWindow.Body.SideBarTabsFrame.BuyBundleButton2.LocalScript.Enabled = true
      self.PlayerGui.MenusScreenGui.ShopMenuWindow.Body.SideBarTabsFrame.BuyBundleButton2.Visible = true
      products["RedNutcrackerBundle"] = 307455363
elseif item == "SpookySweetsBundle" then
      self.PlayerGui.MenusScreenGui.ShopMenuWindow.Body.SideBarTabsFrame.BuyBundleButton2.LocalScript.Enabled = true
      self.PlayerGui.MenusScreenGui.ShopMenuWindow.Body.SideBarTabsFrame.BuyBundleButton2.Visible = true
      products["RedNutcrackerBundle"] = 1111394671
end
end)
