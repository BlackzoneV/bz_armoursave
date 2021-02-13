local kontrolsuresi = 10000


RegisterNetEvent('bz:girisarmoru')
AddEventHandler('bz:girisarmoru', function(armorun)
local ped = PlayerPedId()
SetPedArmour(ped, armorun)
end)

Citizen.CreateThread(function()
while true do
Citizen.Wait(kontrolsuresi)
local ped = PlayerPedId()
local armor = GetPedArmour(ped)
TriggerServerEvent('bz:armorsave', armor)
end
end)