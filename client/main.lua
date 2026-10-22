-- QBCore Customs/Mechanic Client Script

local QBCore = exports['qb-core']:GetCoreObject()

-- Customs Menu
local function OpenCustomsMenu()
    local elements = {
        {label = 'Wheels', value = 'wheels'},
        {label = 'Paint', value = 'paint'},
        {label = 'Performance', value = 'performance'},
        {label = 'Exit', value = 'exit'}
    }

    QBCore.UI.Menu.Open('default', GetCurrentResourceName(), 'customs_menu', {
        title = 'Vehicle Customs',
        align = 'top-left',
        elements = elements
    }, function(data, menu)
        if data.current.value == 'wheels' then
            OpenWheelsMenu()
        elseif data.current.value == 'paint' then
            OpenPaintMenu()
        elseif data.current.value == 'performance' then
            OpenPerformanceMenu()
        elseif data.current.value == 'exit' then
            menu.close()
        end
    end, function(data, menu)
        menu.close()
    end)
end

-- Wheels Menu
local function OpenWheelsMenu()
    local elements = {
        {label = 'Sport Wheels', value = 'sport'},
        {label = 'Offroad Wheels', value = 'offroad'},
        {label = 'High End Wheels', value = 'highend'},
        {label = 'Back', value = 'back'}
    }

    QBCore.UI.Menu.Open('default', GetCurrentResourceName(), 'wheels_menu', {
        title = 'Wheels',
        align = 'top-left',
        elements = elements
    }, function(data, menu)
        if data.current.value == 'sport' then
            TriggerServerEvent('qb-customs:applyMod', 'wheels', 'sport')
        elseif data.current.value == 'offroad' then
            TriggerServerEvent('qb-customs:applyMod', 'wheels', 'offroad')
        elseif data.current.value == 'highend' then
            TriggerServerEvent('qb-customs:applyMod', 'wheels', 'highend')
        elseif data.current.value == 'back' then
            OpenCustomsMenu()
        end
    end, function(data, menu)
        menu.close()
        OpenCustomsMenu()
    end)
end

-- Paint Menu
local function OpenPaintMenu()
    local elements = {
        {label = 'Classic Red', value = 'classic_red'},
        {label = 'Hot Pink', value = 'hot_pink'},
        {label = 'Bright Blue', value = 'bright_blue'},
        {label = 'Back', value = 'back'}
    }

    QBCore.UI.Menu.Open('default', GetCurrentResourceName(), 'paint_menu', {
        title = 'Paint',
        align = 'top-left',
        elements = elements
    }, function(data, menu)
        if data.current.value == 'classic_red' then
            TriggerServerEvent('qb-customs:applyMod', 'paint', 'classic_red')
        elseif data.current.value == 'hot_pink' then
            TriggerServerEvent('qb-customs:applyMod', 'paint', 'hot_pink')
        elseif data.current.value == 'bright_blue' then
            TriggerServerEvent('qb-customs:applyMod', 'paint', 'bright_blue')
        elseif data.current.value == 'back' then
            OpenCustomsMenu()
        end
    end, function(data, menu)
        menu.close()
        OpenCustomsMenu()
    end)
end

-- Performance Menu
local function OpenPerformanceMenu()
    local elements = {
        {label = 'Engine Upgrade', value = 'engine'},
        {label = 'Turbo Upgrade', value = 'turbo'},
        {label = 'Brakes Upgrade', value = 'brakes'},
        {label = 'Back', value = 'back'}
    }

    QBCore.UI.Menu.Open('default', GetCurrentResourceName(), 'performance_menu', {
        title = 'Performance',
        align = 'top-left',
        elements = elements
    }, function(data, menu)
        if data.current.value == 'engine' then
            TriggerServerEvent('qb-customs:applyMod', 'performance', 'engine')
        elseif data.current.value == 'turbo' then
            TriggerServerEvent('qb-customs:applyMod', 'performance', 'turbo')
        elseif data.current.value == 'brakes' then
            TriggerServerEvent('qb-customs:applyMod', 'performance', 'brakes')
        elseif data.current.value == 'back' then
            OpenCustomsMenu()
        end
    end, function(data, menu)
        menu.close()
        OpenCustomsMenu()
    end)
end

-- Event Handlers
RegisterNetEvent('qb-customs:openMenu')
AddEventHandler('qb-customs:openMenu', function()
    OpenCustomsMenu()
end)

-- Command to open the customs menu
RegisterCommand('customs', function()
    OpenCustomsMenu()
end, false)