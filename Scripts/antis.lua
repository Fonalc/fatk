local RunService = game:GetService("RunService")
local Player = game.Players.LocalPlayer

RunService.Stepped:Connect(function()
    if Player.Character:FindFirstChild("ice") then
        game.Players:Chat("thaw me")
    end
end) 

RunService.Stepped:Connect(function()
    if game.Lighting:FindFirstChild(Player.Character.Name) then
        game.Players:Chat("unpunish me")
    end
end) 

RunService.Stepped:Connect(function()
    if Player.PlayerGui:FindFirstChild("EFFECTGUIBLIND") then
        game.Players:Chat("unblind me")
    end
end) 

RunService.Stepped:Connect(function()
    if workspace.Terrain._Game.Folder:FindFirstChild(Player.Name.."'s jail") then
        game.Players:Chat("unjail me")
    end
end) 

RunService.Stepped:Connect(function()
    if workspace.Terrain._Game.Folder:FindFirstChild(Player.Name) then
        game.Players:Chat("unclone me")
    end
end) 

RunService.Stepped:Connect(function()
    if game.Players.LocalPlayer.Character:FindFirstChild("Seizure") then
        game.Players:Chat("unseizure me")
    end
end) 

RunService.Stepped:Connect(function()
    if not game.Players.LocalPlayer.Character:FindFirstChild("Seizure") and game.Players.LocalPlayer.Character.Humanoid:GetState().Name=="PlatformStanding" then
        game.Players:Chat("unfly me")
        game.Players:Chat("clip me")
    end
end) 