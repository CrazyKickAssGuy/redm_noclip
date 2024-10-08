local noclip = false
local noclipSpeed = 1.0

-- Function to get player's current position
local function getPosition()
    local playerPed = PlayerPedId()
    return GetEntityCoords(playerPed, false)
end

-- Function to set player's new position
local function setPosition(x, y, z)
    local playerPed = PlayerPedId()
    SetEntityCoordsNoOffset(playerPed, x, y, z, true, true, true)
end

-- Toggles noclip on/off
local function toggleNoclip()
    noclip = not noclip
    local playerPed = PlayerPedId()

    if noclip then
        SetEntityCollision(playerPed, false, false) -- Disable collision
        FreezeEntityPosition(playerPed, true) -- Freeze position initially
    else
        SetEntityCollision(playerPed, true, true) -- Enable collision
        FreezeEntityPosition(playerPed, false) -- Unfreeze player
    end
end

-- Main noclip movement handler
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)

        if noclip then
            local playerPed = PlayerPedId()
            local x, y, z = getPosition()

            -- Noclip movement control (WSAD and space/ctrl for up/down)
            if IsControlPressed(1, 32) then -- Move forward (W key)
                x = x + noclipSpeed
            elseif IsControlPressed(1, 33) then -- Move backward (S key)
                x = x - noclipSpeed
            end

            if IsControlPressed(1, 34) then -- Move left (A key)
                y = y - noclipSpeed
            elseif IsControlPressed(1, 35) then -- Move right (D key)
                y = y + noclipSpeed
            end

            if IsControlPressed(1, 44) then -- Move up (Space key)
                z = z + noclipSpeed
            elseif IsControlPressed(1, 36) then -- Move down (Ctrl key)
                z = z - noclipSpeed
            end

            -- Update player position
            setPosition(x, y, z)
        end
    end
end)

-- Command to toggle noclip mode
RegisterCommand("noclip", function()
    toggleNoclip()
end, false)
