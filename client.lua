
local vehicle = nil
local waiting = false


RegisterNetEvent('carpricer:client:start', function()
    for i,v in pairs(Config.VehiclesToPrice) do
        waiting = true
        print(v)
        local hash = GetHashKey(v)
        RequestModel(hash)
        while not HasModelLoaded(hash) do
            Wait(33)
        end
        vehicle = CreateVehicle(hash, Config.SpawnLocation.x, Config.SpawnLocation.y, Config.SpawnLocation.z, Config.SpawnLocation.w, true, true)
        while waiting do
            Wait(50)
        end
    end
end)

RegisterNetEvent('carpricer:client:price', function(price, shopname)
    -- print(price)

    local carmodel = GetEntityModel(vehicle)
    local display = GetDisplayNameFromVehicleModel(carmodel)
    
    -- local hash = GetHashKey(model)
    local displayname = GetLabelText(display)
    local class = GetVehicleClass(vehicle)

    local model = string.lower(display)
    local name = string.match(displayname, " (.+)")
    local brand = string.match(displayname, "([^%s]+)")
    -- price
    local categoryLabel = Config.Classes[class]
    local shop = 'none'
    if shopname ~= nil then
        shop = shopname
    end
    if name == nil then
        name = 'Unknown'
    end
    if brandname == nil then
        brandname = 'Unknown'
    end

    local text = "{['model'] = '" .. model .. "', ['name'] = '" .. name .. "', ['brand'] = '" .. brand .. "', ['price'] = " .. price .. ", ['categoryLabel'] = '" .. categoryLabel .. "', ['shop'] = '" .. shop .. "'},\n"
    DeleteEntity(vehicle)
    waiting = false

    TriggerServerEvent('carpricer:server:write', text)
end)