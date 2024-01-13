


RegisterCommand('startpricer', function(source, args, rawCommand)
    TriggerClientEvent('carpricer:client:start', source)
end, true)

RegisterCommand('price', function(source, args, rawCommand)
    TriggerClientEvent('carpricer:client:price', source, args[1], args[2])
end, true)

RegisterServerEvent('carpricer:server:write', function(text)
    local file, err = io.open(Config.Path, "a")
    if file then
        local stuff = text
        file:write(stuff)
        file:close()
    else
        print(err)
    end
end)