game.Players:Chat("h \n\n\n\n\n\n\n\n\n\n\n\nSuccessfully Loaded FA.\nEnjoy!")
local banned = {}
local sl = false
local slshow = false

for _, a in pairs(game.Players:GetPlayers()) do
	if plr:IsFriendsWith(2249914791) then
		game.Players:Chat("h \n\n\n\n\n\n\n"..plr.Name.." has FA.")
		game.Players:Chat("pm "..plr.Name.." you have FA!")
		plr.Chatted:Connect(function(mesg)
			admin(mesg, plr)
		end)
	end
end

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

function admin(msg, localPlr)
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
			table.insert(banned, f)
		elseif split[2] == "others" then
			for _, plr in pairs(game.Players:GetPlayers()) do
				if plr and plr.Name ~= localPlr.Name then
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
			table.remove(banned, table.find(banned, localPlr.Name))
			game.Players:Chat("respawn "..localPlr.Name)
			game.Players:Chat("h \n\n\n\n\n\n\n"..localPlr.Name.." was unbanned lol.")
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
		game.Players:Chat("h \n\n\n\n\n\n\nReloading FA.")
		loadstring(game:HttpGet("https://raw.githubusercontent.com/Fonalc/fatk/main/main.lua"))()
		return
	end
	if split[1] == "<help>" then
		local old = localPlr.Character.HumanoidRootPart.CFrame
		localPlr.Character.HumanoidRootPart.CFrame = CFrame.new(-40, 8, 50)
		wait(0.2)
		game.Players:Chat("tp all me")
		wait(0.4)
		localPlr.Character.HumanoidRootPart.CFrame = old
	end
	if split[1] == "<lag" then
		local plr = game.Players:FindFirstChild(split[2])
		if plr then
			spawn(function()
				game.Players:Chat("skydive "..plr.Name)
				game.Players:Chat("jail "..plr.Name)
				repeat
					game.Players:Chat("smoke "..plr.Name)
					game.Players:Chat("ff "..plr.Name)
					game.Players:Chat("speed "..plr.Name.." 0")
					wait()
				until not plr.Character
			end)
		end
	end
	if split[1] == "<givefa" then
		if split[2] == "all" then
			local plr = game.Players:FindFirstChild(split[2])
			if plr then
				game.Players:Chat("h \n\n\n\n\n\n\n"..plr.Name.." has FA.")
				game.Players:Chat("pm "..plr.Name.." you have FA now!!")
				plr.Chatted:Connect(function(mesg)
					admin(mesg, plr)
				end)
			end
		else
			for _, plr in pairs() do
				if plr then
					game.Players:Chat("h \n\n\n\n\n\n\n"..plr.Name.." has FA.")
					game.Players:Chat("pm "..plr.Name.." you have FA now!!")
					plr.Chatted:Connect(function(mesg)
						admin(mesg, plr)
					end)
				end
			end
		end
	end
	if split[1] == "<cmds>" then
		game.Players:Chat("pm "..localPlr.Name.." <spun.[Player name] --Ban Player \n<sspun.[Player name] --Unban Player\n<sl-1> --Enables ServerLock\n<sl-0> --Disables ServerLock\n<help> --Teleports everyone to the house entrance\n<lag.[Player name] --Lags the player with FF and Smoke.")
	end
end

game.Players.LocalPlayer.Chatted:Connect(function(msg)
	admin(msg, game.Players.LocalPlayer)
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
		elseif not sl then
			game.Players:Chat("h \n\n\n\n\n\n\n"..plr.Name.." joined.")	
		end
	end)
	if plr.Name == plr:IsFriendsWith(2249914791) then
		game.Players:Chat("h \n\n\n\n\n\n\n"..plr.Name.." has FA.")
		game.Players:Chat("pm "..plr.Name.." you have FA!")
		plr.Chatted:Connect(function(mesg)
			admin(mesg, plr)
		end)
	end
end)
game.Players.PlayerRemoving:Connect(function(plr)
	if sl then
		if banned[plr.Name] then
			table.remove(banned, table.find(banned, plr.Name))
		end
	end
	game.Players:Chat("h \n\n\n\n\n\n\n"..plr.Name.." left.")	
end)
