-- QBCore Customs/Mechanic Server Script

local QBCore = exports['qb-core']:GetCoreObject()

-- Apply Modifications
RegisterNetEvent('qb-customs:applyMod')
AddEventHandler('qb-customs:applyMod', function(modType, modName)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)

    if not Player then return end

    -- Apply the modification based on the type and name
    if modType == 'wheels' then
        if modName == 'sport' then
            -- Apply sport wheels
            TriggerClientEvent('qb-customs:applyWheels', src, 'sport')
        elseif modName == 'offroad' then
            -- Apply offroad wheels
            TriggerClientEvent('qb-customs:applyWheels', src, 'offroad')
        elseif modName == 'highend' then
            -- Apply high end wheels
            TriggerClientEvent('qb-customs:applyWheels', src, 'highend')
        end
    elseif modType == 'paint' then
        if modName == 'classic_red' then
            -- Apply classic red paint
            TriggerClientEvent('qb-customs:applyPaint', src, 'classic_red')
        elseif modName == 'hot_pink' then
            -- Apply hot pink paint
            TriggerClientEvent('qb-customs:applyPaint', src, 'hot_pink')
        elseif modName == 'bright_blue' then
            -- Apply bright blue paint
            TriggerClientEvent('qb-customs:applyPaint', src, 'bright_blue')
        end
    elseif modType == 'performance' then
        if modName == 'engine' then
            -- Apply engine upgrade
            TriggerClientEvent('qb-customs:applyPerformance', src, 'engine')
        elseif modName == 'turbo' then
            -- Apply turbo upgrade
            TriggerClientEvent('qb-customs:applyPerformance', src, 'turbo')
        elseif modName == 'brakes' then
            -- Apply brakes upgrade
            TriggerClientEvent('qb-customs:applyPerformance', src, 'brakes')
        end
    end
end)