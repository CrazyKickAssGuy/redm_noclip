local noclip = false
local noclipSpeed = 1.0

-- List of authorized admin identifiers (Steam IDs, license, etc.)
local adminList = {
    "steam:110000112345678",  -- Replace with actual Steam ID
    "license:1234567890abcdef"  -- Replace with actual license identifier
}

-- Function to check if a player is an admin
local function isAdmin(playerId)
    local identifiers = GetPlayerIdentifiers(playerId)
    
    for _, identifier in ipairs(identifiers) do
        for _, adminId in ipairs(adminList) do
            if identifier == adminId then
                return true
            end
        end
    end
    
    return false
end

-- Toggles noclip on/off
local function toggleNoclip()
    local playerPed = PlayerPedId()

    noclip = not noclip
    if noclip then
        SetEntityCollision(playerPed, false, false) -- Disable collision
        FreezeEntityPosition(playerPed, false) -- Unfreeze player for free movement
        SetEntityVisible(playerPed, false, false) -- Make player invisible
    else
        SetEntityCollision(playerPed, true, true) -- Enable collision
        SetEntityVisible(playerPed, true, false) -- Make player visible again
    end
end

-- Function to move the player in noclip mode
local function handleNoclipMovement()
    local playerPed = PlayerPedId()
    local x, y, z = table.unpack(GetEntityCoords(playerPed, true))
    local forwardVector = GetEntityForwardVector(playerPed)

    -- Move forward/backward
    if IsControlPressed(0, 32) then -- W
        x = x + forwardVector.x * noclipSpeed
        y = y + forwardVector.y * noclipSpeed
        z = z + forwardVector.z * noclipSpeed
    elseif IsControlPressed(0, 33) then -- S
        x = x - forwardVector.x * noclipSpeed
        y = y - forwardVector.y * noclipSpeed
        z = z - forwardVector.z * noclipSpeed
    end

    -- Move left/right
    if IsControlPressed(0, 34) then -- A
        x = x - forwardVector.y * noclipSpeed
        y = y + forwardVector.x * noclipSpeed
    elseif IsControlPressed(0, 35) then -- D
        x = x + forwardVector.y * noclipSpeed
        y = y - forwardVector.x * noclipSpeed
    end

    -- Move up/down
    if IsControlPressed(0, 44) then -- Space
        z = z + noclipSpeed
    elseif IsControlPressed(0, 36) then -- Ctrl
        z = z - noclipSpeed
    end

    -- Set player position
    SetEntityCoordsNoOffset(playerPed, x, y, z, true, true, true)
end

-- Main thread to handle key press and noclip mode
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)

        -- Check if F10 is pressed to toggle noclip
        if IsControlJustPressed(0, 57) then -- F10 key
            local playerId = PlayerId()

            -- Check if the player is an admin
            if isAdmin(GetPlayerServerId(playerId)) then
                toggleNoclip()
            else
                -- Notify player if they are not an admin
                TriggerEvent('chat:addMessage', {
                    color = {255, 0, 0},
                    multiline = true,
                    args = {"System", "You do not have permission to use noclip!"}
                })
            end
        end

        -- Handle noclip movement if active
        if noclip then
            handleNoclipMovement()
        end
    end
end)

-- Register noclip command
RegisterCommand("noclip", function(source, args, rawCommand)
    local playerId = PlayerId()

    -- Check if the player is an admin
    if isAdmin(GetPlayerServerId(playerId)) then
        toggleNoclip()
    else
        -- Notify player if they are not an admin
        TriggerEvent('chat:addMessage', {
            color = {255, 0, 0},
            multiline = true,
            args = {"System", "You do not have permission to use noclip!"}
        })
    end
end, false)  -- 'false' means it doesn't restrict to server console only
