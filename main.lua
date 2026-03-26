local UserInputService = game:GetService("UserInputService")
local player = game.Players.LocalPlayer
local boostPower = 200
local boostCooldown = 1
local lastBoost = 0

UserInputService.InputBegan:Connect(function(input, gameProcessed)
    if gameProcessed then return end
    
    if input.KeyCode == Enum.KeyCode.E then
        local currentTime = tick()
        if currentTime - lastBoost >= boostCooldown then
            lastBoost = currentTime
            
            local char = player.Character
            if not char then return end
            
            local hrp = char:FindFirstChild("HumanoidRootPart")
            if not hrp then return end
            
            local bv = Instance.new("BodyVelocity")
            bv.Velocity = hrp.CFrame.LookVector * boostPower
            bv.MaxForce = Vector3.new(100000, 100000, 100000)
            bv.Parent = hrp
            
            game:GetService("Debris"):AddItem(bv, 0.6)
            print("BOOST ATIVADO!")
        end
    end
end)
