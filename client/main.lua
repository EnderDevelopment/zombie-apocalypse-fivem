local function spawnZombie()
    local playerPed = PlayerPedId()
    local playerCoords = GetEntityCoords(playerPed)
    
    local zombieModel = GetHashKey('a_m_m_hillbilly_01')
    RequestModel(zombieModel)
    while not HasModelLoaded(zombieModel) do
        Wait(1)
    end
    
    local zombie = CreatePed(4, zombieModel, playerCoords.x + math.random(-10, 10), playerCoords.y + math.random(-10, 10), playerCoords.z, 0.0, true, true)
    SetPedCombatAttributes(zombie, 46, true)
    SetPedFleeAttributes(zombie, 0, false)
    SetPedAsEnemy(zombie, true)
    SetPedRelationshipGroupHash(zombie, GetHashKey('HATES_PLAYER'))
    TaskCombatPed(zombie, playerPed, 0, 16)
end

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(10000)
        spawnZombie()
    end
end)