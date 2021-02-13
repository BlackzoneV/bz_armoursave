ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

AddEventHandler('esx:playerLoaded', function(source)
Wait(5000)
local src = source
local player = ESX.GetPlayerFromId(src)

MySQL.Async.fetchScalar('SELECT armour FROM users WHERE identifier=@identifier', {
    ['@identifier'] = player.identifier
}, function(result)
if result ~= nil then
TriggerClientEvent('bz:girisarmoru', source, result)
end
end)

end)

RegisterServerEvent('bz:armorsave')
AddEventHandler('bz:armorsave', function(armorun)
local src = source
local player = ESX.GetPlayerFromId(src)

MySQL.Async.execute('UPDATE users SET armour=@armour WHERE identifier=@identifier', {
    ['@identifier'] = player.identifier,
    ['@armour'] = armorun
})

end)