RegisterCommand("announce", function(source, args)
    TriggerServerEvent('announce', table.concat(args, " ") --[[ <- "args" output writes separate words to the table. If we display such, the output will appear without spaces (eg if we wrote "Hello world" on the chat, the output will be "Helloworld"). "table.concat" causes that separate table components will be separated with any string (in this case a space, the second argument of the function)  --]] , source)
end)

TriggerEvent('chat:addSuggestion', '/announce', 'Announce everyone on the server with a message', {
  { name="message", help="This message will be visible to everyone on the server" }
})

RegisterNetEvent('notify')
AddEventHandler('notify', function(textureDict, textureName, flash, iconType, sender, subject)
  SetNotificationTextEntry("STRING")
  SetNotificationMessage(textureDict, textureName, flash, iconType, sender, subject)

  if (not HasStreamedTextureDictLoaded(textureDict)) --[[ Loading the texture of the icon that will be displayed during the notification --]]
  then
    RequestStreamedTextureDict(textureDict, true)
    while (HasStreamedTextureDictLoaded(textureDict)) 
    do
    Wait(10);
    end
  end

  DrawNotification(true, false)
end)
