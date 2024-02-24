local config = {}

function loadConfig()
    LoadConvarFile("config.cfg")

    config.textureDict = GetConvar("textureDict", "helicopterhud")
    config.textureName = GetConvar("textureName", "targetlost")
    config.flash = GetConvar("flash", "false") == "true"
    config.iconType = tonumber(GetConvar("iconType", "2"))
end

loadConfig()

RegisterCommand("announce", function(source, args)
    local message = table.concat(args, " ")
    TriggerServerEvent('announce', message, source, config)
end)

TriggerEvent('chat:addSuggestion', '/announce', 'Announce everyone on the server with a message', {
  { name="message", help="This message will be visible to everyone on the server" }
})

RegisterNetEvent('notify')
AddEventHandler('notify', function(sender, subject)
  SetNotificationTextEntry("STRING")
  SetNotificationMessage(config.textureDict, config.textureName, config.flash, config.iconType, sender, subject)

  if (not HasStreamedTextureDictLoaded(config.textureDict)) then
    RequestStreamedTextureDict(config.textureDict, true)
    while (not HasStreamedTextureDictLoaded(config.textureDict)) do
      Wait(10)
    end
  end

  DrawNotification(true, false)
end)
