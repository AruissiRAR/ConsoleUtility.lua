-- consile Library haha


-- // ray's console Library \\ --

--[[

// --

    this was coded in around 3 hours
    was made on solara
    was made to learn
    was coded unoptimized.

    you can find a demo of how it works in very bottom if your wondering about paramaters then just look at the function

    ill update ts once i have a working dex i coded mostly all of this without a dex

    idc if u paste off it

    
    add me on discord 4 questions: ray.sln (dont bitch about how im a shit coder i already know)
\\ --

]]

local DevConsole = game:GetService("CoreGui"):WaitForChild("DevConsoleMaster").DevConsoleWindow.DevConsoleUI:WaitForChild("MainView").ClientLog



local Library = {}

function Library:GetRefrence()
    local clone = nil
    if not game.Workspace:FindFirstChild("Refrence") then
        clone = DevConsole:FindFirstChild("3"):Clone()
        clone.Parent = game.Workspace
        clone.Name = "Refrence"
    else
        clone = game.Workspace:FindFirstChild("Refrence"):Clone()
        clone.Parent = game.Workspace
        clone.Name = "Refrence".. math.random(1,50)
    end

    return clone
end

function Library:GetTime()
    return os.date("%H:%M:%S", os.time())
end

function Library:Clear()
    for i,v in pairs(DevConsole:GetChildren()) do
        if v:IsA("Frame") then
            v:Destroy()
        end
    end
end

function Library:Edit(msg, newMsg, newLayout, color, transparency)
    task.wait(0.10)
    for _, v in pairs(DevConsole:GetDescendants()) do
        if v:IsA("TextLabel") then
            if v.Text:find(msg) then
                if not newMsg or newMsg == "_" then
                    newMsg = Library:GetTime() .. " -- ".. msg
                else
                    newMsg = Library:GetTime() .. " -- " .. newMsg
                end
                v.Text = newMsg

                if newLayout then
                    v.Parent.LayoutOrder = newLayout
                elseif newLayout == "_" then
                    v.Parent.LayoutOrder = v.Parent.LayoutOrder
                end

                if color then
                    v.TextColor3 = color
                elseif color == "_" then
                    v.TextColor3 = v.Color
                end

                if transparency then
                    v.TextTransparency = transparency
                elseif transparency == "_" then
                    v.Transparency = v.Transparency
                end

                return 'success!'
            end
        end
    end
    return 'message not found'
end

function Library:Delete(msg)
    if not msg then
        return
    end
    task.wait(0.25)
    for _, v in pairs(DevConsole:GetDescendants()) do
        if v:IsA("TextLabel") then
            if v.Text:find(msg) then
                v.Parent:Destroy()
            end
        end
    end
end

function Library:GetPrint()
    local frames = 0

    for i,v in pairs(DevConsole:GetChildren()) do
        if v:IsA("Frame") and v.Name ~= "WindowingPadding" then
            frames = frames + 1
        end
    end

    return frames + 1
end

function Library:TickWarnCount()
    -- // i needa add ts
end

function Library:TickErrorCount()
    -- // i needa add ts
end
function Library:Print(msg, color, transparency)
    local clone

    if game.Workspace:FindFirstChild("Refrence") then
        clone = game.Workspace:FindFirstChild("Refrence"):Clone()
    else
        clone = Library:GetRefrence()
    end
    clone.Name = tostring(Library:GetPrint())
    clone.LayoutOrder = Library:GetPrint()
    clone.Parent = DevConsole

    clone:FindFirstChild("image").Image = 'rbxasset://'
    clone:FindFirstChild("msg").TextTransparency = ((not transparency and 0) or transparency)
    clone:FindFirstChild("msg").TextColor3 = ((not color and Color3.fromRGB(255, 255, 255)) or color)
    clone:FindFirstChild("msg").Text = ((not msg and Library:GetTime().." -- This is a cool print message!") or Library:GetTime().." -- "..msg)
end

function Library:Warn(msg, transparency)
    local clone

    if game.Workspace:FindFirstChild("Refrence") then
        clone = game.Workspace:FindFirstChild("Refrence"):Clone()
    else
        clone = Library:GetRefrence()
    end
    clone.Name = tostring(Library:GetPrint())
    clone.LayoutOrder = Library:GetPrint()
    clone.Parent = DevConsole


    clone:FindFirstChild("msg").TextColor3 = Color3.fromRGB(255,218,67)
    clone:FindFirstChild("image").Image = 'rbxasset://textures/DevConsole/Warning.png'
    clone:FindFirstChild("msg").TextTransparency = ((not transparency and 0) or transparency)

    clone:FindFirstChild("msg").Text = ((not msg and Library:GetTime().." -- This is a cool warn message!") or Library:GetTime().." -- "..msg)
end

function Library:Error(msg, transparency)
    local clone

    if game.Workspace:FindFirstChild("Refrence") then
        clone = game.Workspace:FindFirstChild("Refrence"):Clone()
    else
        clone = Library:GetRefrence()
    end
    clone.Name = tostring(Library:GetPrint())
    clone.LayoutOrder = Library:GetPrint()
    clone.Parent = DevConsole


    clone:FindFirstChild("msg").TextColor3 = Color3.fromRGB(214, 89, 73)
    clone:FindFirstChild("image").Image = 'rbxasset://textures/DevConsole/Error.png'
    clone:FindFirstChild("msg").TextTransparency = ((not transparency and 0) or transparency)
    clone:FindFirstChild("msg").Text = ((not msg and Library:GetTime().." -- This is a cool error message!") or Library:GetTime().." -- "..msg)
end

function Library:Info(msg, transparency)
    local clone

    if game.Workspace:FindFirstChild("Refrence") then
        clone = game.Workspace:FindFirstChild("Refrence"):Clone()
    else
        clone = Library:GetRefrence()
    end
    clone.Name = tostring(Library:GetPrint())
    clone.LayoutOrder = Library:GetPrint()
    clone.Parent = DevConsole


    clone:FindFirstChild("msg").TextColor3 = Color3.fromRGB(0, 165, 255)
    clone:FindFirstChild("image").Image = 'rbxasset://textures/DevConsole/Info.png'
    clone:FindFirstChild("msg").TextTransparency = ((not transparency and 0) or transparency)
    clone:FindFirstChild("msg").Text = ((not msg and Library:GetTime().." -- This is a cool info message!") or Library:GetTime().." -- "..msg)
end

if not getgenv().LOADED then
    Library:Clear()

    -- // plceholders for cloens aka im hella lazy 
    print('placeholder')
    print('placeholder')
    print('placeholder')

    repeat wait() until DevConsole:FindFirstChild("3")
    Library:GetRefrence()

    task.wait(0.25)
    Library:Delete("placeholder")

    Library:Print("STATUS: LOADING", Color3.fromRGB(255, 255, 0))
    getgenv().LOADED = true

    Library:Edit("STATUS: LOADING", "✔️ STATUS: LOADED", 1, Color3.fromRGB(0,255,0))
    task.wait(0.25)
    Library:Delete("STATUS: LOADED")

    getgenv().LOADED = true -- // prevent multiple executions

    task.wait(0.25)
    Library:Clear()
end


if not DevConsole then
    repeat task.wait() until DevConsole
end

function Library:Demo()
    Library:Print("Hello!", Color3.fromRGB(255,0,255), 0.5)
    Library:Error("Hello!", 0.5)
    Library:Warn("Hello!", 0.5)
    Library:Info("Hello!", 0.5)
    task.wait(5)
    
    Library:Clear()
    
    
    Library:Print()
    Library:Error()
    Library:Warn()
    Library:Info()
    
    task.wait(2.5)
    
    Library:Edit("This is a cool error message!", "Ray is NOT a good dev!", 2, Color3.fromRGB(0,16,255), 0)
    Library:Edit("This is a cool warn message!", "Ray is such a good dev!", 1, Color3.fromRGB(0,16,255), 0)
    Library:Edit("This is a cool print message!", "Ray is such a good dev!", 3, Color3.fromRGB(0,16,255), 0)
    Library:Edit("This is a cool info message!", "Ray is such a good dev!", 4, Color3.fromRGB(0,16,255), 0)
    task.wait(2.5)
    
    Library:Delete("Ray is NOT a good dev!")
    
    task.wait(2.5)
    
    Library:Clear()
    Library:Print("demo done! hahah", Color3.fromRGB(0,255,0))
    
    task.wait(2.5)
    
    Library:Clear()
    return
end

return Library;
