function createDiscordLog(title,message)
    triggerServerEvent("meta-discord-log:sent-log",localPlayer, title,message)
end
