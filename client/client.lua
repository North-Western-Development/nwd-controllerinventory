local lastPosition = ''
local leftBumperPressed = false
local keyToUse = -1
local lastKeyUsed = -1

RegisterKeyMapping("+lup", "Radial Up", "PAD_AXIS", "IOM_AXIS_LUP")
RegisterKeyMapping("+lul", "Radial Up and Left", "PAD_AXIS", "IOM_AXIS_LUL")
RegisterKeyMapping("+lur", "Radial Up and Right", "PAD_AXIS", "IOM_AXIS_LUR")
RegisterKeyMapping("+lr", "Radial Right", "PAD_AXIS", "IOM_AXIS_LRIGHT")
RegisterKeyMapping("+ll", "Radial Left", "PAD_AXIS", "IOM_AXIS_LLEFT")
RegisterKeyMapping("+ldo", "Radial Down", "PAD_AXIS", "IOM_AXIS_LDOWN")
RegisterKeyMapping("+ldl", "Radial Down and Left", "PAD_AXIS", "IOM_AXIS_LDL")
RegisterKeyMapping("+ldr", "Radial Down and Right", "PAD_AXIS", "IOM_AXIS_LDR")
RegisterKeyMapping("+lbffb1", "Open Weapon Radial", "PAD_ANALOGBUTTON", "L1_INDEX")

RegisterCommand("+lup", function()
    if leftBumperPressed == true then
        lastPosition = 'lup'
        keyToUse = 1
    end
end, false)

RegisterCommand("-lup", function()
    if leftBumperPressed == true then
        Wait(100)
        if lastPosition == "lup" then
            keyToUse = -1
        end
    end
end, false)

RegisterCommand("+lul", function()
    if leftBumperPressed == true then
        lastPosition = 'lul'
        keyToUse = -1
    end
end, false)

RegisterCommand("-lul", function()
    if leftBumperPressed == true then
        Wait(100)
        if lastPosition == "lul" then
            keyToUse = -1
        end
    end
end, false)

RegisterCommand("+lur", function()
    if leftBumperPressed == true then
        lastPosition = 'lur'
        keyToUse = 2
    end
end, false)

RegisterCommand("-lur", function()
    if leftBumperPressed == true then
        Wait(100)
        if lastPosition == "lur" then
            keyToUse = -1
        end
    end
end, false)

RegisterCommand("+lr", function()
    if leftBumperPressed == true then
        lastPosition = 'lr'
        keyToUse = 3
    end
end, false)

RegisterCommand("-lr", function()
    if leftBumperPressed == true then
        Wait(100)
        if lastPosition == "lr" then
            keyToUse = -1
        end
    end
end, false)

RegisterCommand("+ll", function()
    if leftBumperPressed == true then
        lastPosition = 'll'
        keyToUse = -1
    end
end, false)

RegisterCommand("-ll", function()
    if leftBumperPressed == true then
        Wait(100)
        if lastPosition == "ll" then
            keyToUse = -1
        end
    end
end, false)

RegisterCommand("+ldo", function()
    if leftBumperPressed == true then
        lastPosition = 'ldo'
        keyToUse = 5
    end
end, false)

RegisterCommand("-ldo", function()
    if leftBumperPressed == true then
        Wait(100)
        if lastPosition == "ldo" then
            keyToUse = -1
        end
    end
end, false)

RegisterCommand("+ldl", function()
    if leftBumperPressed == true then
        lastPosition = 'ldl'
        keyToUse = 6
    end
end, false)

RegisterCommand("-ldl", function()
    if leftBumperPressed == true then
        Wait(100)
        if lastPosition == "ldl" then
            keyToUse = -1
        end
    end
end, false)

RegisterCommand("+ldr", function()
    if leftBumperPressed == true then
        lastPosition = 'ldr'
        keyToUse = 4
    end
end, false)

RegisterCommand("-ldr", function()
    if leftBumperPressed == true then
        Wait(100)
        if lastPosition == "ldr" then
            keyToUse = -1
        end
    end
end, false)

RegisterCommand("+lbffb1", function()
    lastPosition = ''
    leftBumperPressed = true;

    Citizen.CreateThread(function()
        while leftBumperPressed == true do
            SetTextFont(0)
            SetTextScale(0.0, 0.7)
            SetTextColour(255, 255, 255, 255)
            SetTextDropshadow(0, 0, 0, 0, 255)
            SetTextEdge(2, 0, 0, 0, 255)
            SetTextDropShadow()
            SetTextOutline()
            SetTextEntry("STRING")
            if keyToUse == -1 and lastKeyUsed ~= -1 then
                AddTextComponentString("Release LB to re-use slot: " .. tostring(lastKeyUsed))
                DrawText(0.375, 0.945)
            elseif keyToUse == -1 then
                AddTextComponentString("No slot selected")
                DrawText(0.45, 0.945)
            else
                AddTextComponentString("Release LB to select slot: " .. tostring(keyToUse))
                DrawText(0.375, 0.945)
            end


            Wait(1)
        end
    end)
end, false)

RegisterCommand("-lbffb1", function()
    if keyToUse ~= -1 then
        ExecuteCommand("slot"..keyToUse)
        lastKeyUsed = keyToUse
    else
        if lastKeyUsed ~= -1 then
            ExecuteCommand("slot"..lastKeyUsed)
            lastKeyUsed = -1
        end
    end
    keyToUse = -1
    lastPosition = ''
    leftBumperPressed = false;
end, false)
