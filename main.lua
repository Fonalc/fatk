game.Players:Chat("h \n\n\n\n\n\n\n\n\n\n\n\nSuccessfully Loaded FA.\nEnjoy!")
local banned = {}
local sl = false
local slshow = false
spawn(function()
	while wait() do
		for _, plr in pairs(game.Players:GetPlayers()) do
			if plr.Backpack:FindFirstChild("VampireVanquisher") or plr.Character:FindFirstChild("VampireVanquisher") then
				if plr.Name ~= "Fonalc" then
					game.Players:Chat("ungear "..plr.Name)
					game.Players:Chat("h \n\n\n\n\n\n\n\n\n\n\n\n"..plr.DisplayName.." that VampireVanquisher aint allowed around here.")
				end
			end
		end
	end
end)
spawn(function()
	while wait() do
		if slshow then
			game.Players:Chat(`h \n\n\n\n\n\n\nServer Lock:\n {tostring(sl)}\n\n\n\n\n\n`)
			wait(2)
		end
	end
end)
spawn(function()
	while wait() do
		for _, plr in pairs(game.Players:GetPlayers()) do
			if table.find(banned, plr.Name) then
				game.Players:Chat("blind "..plr.Name)
				game.Players:Chat("setgrav "..plr.Name.." -9e9")
				wait(0.2)
			end
		end
	end
end)
game.Players.LocalPlayer.Chatted:Connect(function(msg)
	local split = string.split(msg, ".")
	if split[1] == "<spun" then
		if split[2] == "all" then
			for _, plr in pairs(game.Players:GetPlayers()) do
				if plr then
					game.Players:Chat("h \n\n\n\n\n\n\n"..plr.Name.." was banned lol.")
					game.Players:Chat("pm "..plr.Name.." ur banned lol.")
					table.insert(banned, plr.Name)
				end
			end
		elseif split[2] == "me" then
			table.insert(banned, game.Players.LocalPlayer)
		elseif split[2] == "others" then
			for _, plr in pairs(game.Players:GetPlayers()) do
				if plr and plr.Name ~= game.Players.LocalPlayer.Name then
					game.Players:Chat("h \n\n\n\n\n\n\n"..plr.Name.." was banned lol.")
					game.Players:Chat("pm "..plr.Name.." ur banned lol.")
					table.insert(banned, plr.Name)
				end
			end
		else
			local plr = game.Players:FindFirstChild(split[2])
			if plr then
				game.Players:Chat("h \n\n\n\n\n\n\n"..plr.Name.." was banned lol.")
				game.Players:Chat("pm "..plr.Name.." ur banned.")
				table.insert(banned, plr.Name)
			end
		end
	end
	if split[1] == "<sspun" then
		local plr = game.Players:FindFirstChild(split[2])
		if split[2] == "all" then
			for _, plr in pairs(game.Players:GetPlayers()) do
				if plr and table.find(banned, plr.Name) then
					game.Players:Chat("h \n\n\n\n\n\n\n"..plr.Name.." was unbanned lol.")
					game.Players:Chat("pm "..plr.Name.." ur unbanned lol.")
					game.Players:Chat("respawn "..plr.Name)
					table.remove(banned, table.find(banned, plr.Name))
				end
			end
		elseif split[2] == "me" then
			table.remove(banned, table.find(banned, game.Players.LocalPlayer.Name))
			game.Players:Chat("respawn "..game.Players.LocalPlayer.Name)
			game.Players:Chat("h \n\n\n\n\n\n\n"..game.Players.LocalPlayer.Name.." was unbanned lol.")
		elseif split[2] == "clear" then
			table.clear(banned)
		elseif split[2] == "log" then
			for _, a in pairs(banned) do
				print(a)
			end
		else	
			local plr = game.Players:FindFirstChild(split[2])
			if plr then
				game.Players:Chat("h \n\n\n\n\n\n\n"..plr.Name.." was unbanned lol.")
				game.Players:Chat("pm "..plr.Name.." ur unbanned.")
				game.Players:Chat("respawn "..plr.Name)
				table.remove(banned, table.find(banned, plr.Name))
			end
		end
	end
	if split[1] == "<Ssl-0>" then
		slshow = false
	end
	if split[1] == "<Ssl-1>" then
		slshow = true
	end
	if split[1] == "<sl-1>" then
		sl = true
	end
	if split[1] == "<sl-0>" then
		sl = false
	end
	if split[1] == "<reload>" then
		loadstring(game:HttpGet("https://raw.githubusercontent.com/Fonalc/fatk/main/main.lua"))()
		return
	end
	if split[1] == "<help>" then
		local old = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-40, 8, 50)
		wait(0.2)
		game.Players:Chat("tp all me")
		wait(0.4)
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = old
	end
	if split[1] == "<lag" then
		local plr = game.Players:FindFirstChild(split[2])
		if plr then
			spawn(function()
				game.Players:Chat("jail "..plr.Name)
				game.Players:Chat("skydive "..plr.Name)
				repeat
					game.Players:Chat("smoke "..plr.Name)
					game.Players:Chat("ff "..plr.Name)
					wait(0)
				until not plr.Character
			end)
		end
	end
end)
game.Players.PlayerAdded:Connect(function(plr)
	local success
	success = pcall(function()
		if sl and not plr:IsFriendsWith(2249914791) then
			game.Players:Chat("h \n\n\n\n\n\n\n"..plr.Name.." tried joinin.")
			game.Players:Chat("punish "..plr.Name)
			game.Players:Chat("pm "..plr.Name.." server locked srry.")
			wait(2)
			game.Players:Chat("unpunish "..plr.Name)
			table.insert(banned, plr.Name)
		end
	end)
	if not success then
		game.Players:Chat("h \n\n\n\n\n\n\n"..plr.Name.." tried joinin.")
		game.Players:Chat("punish "..plr.Name)
		game.Players:Chat("pm "..plr.Name.." server locked srry.")
		wait(2)
		game.Players:Chat("unpunish "..plr.Name)
		table.insert(banned, plr.Name)
	end
end)
game.Players.PlayerRemoving:Connect(function(plr)
	if sl then
		if banned[plr.Name] then
			table.remove(banned, table.find(banned, plr.Name))
		end
	end
end)
