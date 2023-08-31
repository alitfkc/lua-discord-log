
function createDiscordLog(title,message)
	if Config.discord_logs[title] then
		local discordData = {
			["thumbnail"] ={
				["url"] = Config.discord_logs[title].image or "https://cdn.discordapp.com/attachments/941753982169251901/1058085996907991050/png_logo.png",
			},
			["color"] = Config.discord_logs[title].color or 1957995,
			["type"] = "rich",
			["title"] = title,
			["description"] = message,
			["footer"] = {
				["text"] = "Beyonder",
			},
		}
		PerformHttpRequest(Config.discord_logs[title].webhook, function(err, text, headers) end, 'POST', json.encode({username = 'Meta Scripts Log System', embeds = {discordData}, avatar_url = Config.standart_log.image}), { ['Content-Type'] = 'application/json' })
	else
		local discordData = {
			["thumbnail"] ={
				["url"] = Config.standart_log.image,
			},
			["color"] = Config.standart_log.color,
			["type"] = "rich",
			["title"] = "Hatalı Kullanım",
			["description"] = "Başlık :"..title.."\n Mesaj :"..message,
			["footer"] = {
				["text"] = "Beyonder",
			},
		}
		PerformHttpRequest(Config.standart_log.webhook, function(err, text, headers) print(err,text,headers) end, 'POST', json.encode({username ='Meta Scripts Log System', embeds = {discordData}, avatar_url = Config.standart_log.image}), { ['Content-Type'] = 'application/json' })
	end

end


------------------------
-- get client event
------------------------
RegisterNetEvent("meta-discord-log:sent-log")
AddEventHandler("meta-discord-log:sent-log", function(title,message)
	createDiscordLog(title,message)
end)

-------------
--exports
-----------
exports("createDiscordLog",createDiscordLog)