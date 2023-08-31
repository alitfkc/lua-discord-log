function createDiscordLog(title,message)
    TriggerServerEvent("meta-discord-log:sent-log", title,message)
end
-------------
--exports
-----------
exports("createDiscordLog",createDiscordLog)