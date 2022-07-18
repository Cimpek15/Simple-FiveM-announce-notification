RegisterNetEvent('announce')

AddEventHandler('announce', function(param, player)
  
  local playerID = source
  print('^7[^1Announcement^7] ^5:'.. param .. '^6            | by: ^3' .. GetPlayerName(playerID))
  TriggerClientEvent('notify', -1, 'helicopterhud', 'targetlost', false, 2, '~h~Announcement', '~r~' .. param)

end)



