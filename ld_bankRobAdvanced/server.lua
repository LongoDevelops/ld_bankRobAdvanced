-- Longo Development -- 

RegisterNetEvent('ld:fleeca')
AddEventHandler('ld:fleeca', function()
    TriggerClientEvent('chatMessage', -1, "~y~[BANK] ~w~| ~r~Fleeca bank is being robbed! ~w~| ~y~Postal: 4024")
end)

RegisterNetEvent('ld:paleto')
AddEventHandler('ld:paleto', function()
    TriggerClientEvent('chatMessage', -1, "~y~[BANK] ~w~| ~r~Paleto Bank is being robbed! ~w~| ~y~Postal: 1055")
end)

RegisterNetEvent('ld:insidevault')
AddEventHandler('ld:insidevault', function()
    TriggerClientEvent('chatMessage', -1, "~y~[BANK] ~w~| ~r~City bank is being robbed! ~w~| ~y~Postal: 7090")
end)