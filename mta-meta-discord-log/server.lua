
function createDiscordLog(title,message)
	if Config.discord_logs[title] then
		local discordData = {
			formFields = {
				["content"] = "# "..title.."\n```"..message.."```"..(Config.discord_logs[title].image or ""),
			},
		}
        fetchRemote(Config.discord_logs[title].webhook, discordData, function(responseData, errorCode)
            if errorCode == 0 and responseData then
                outputConsole("Discord log gönderildi: " .. message)
            else
                iprint(errorCode)
                outputConsole("Discord log gönderme hatası: " .. tostring(errorCode))
            end
        end)

	else

		local discordData = {
			formFields = {
				["content"] = "```diff\n-Hatalı Kullanım```\n# "..title.."\n```"..message.."```"..(Config.standart_log.image or ""),
			},
		}
        fetchRemote(Config.standart_log.webhook, discordData, function(responseData, errorCode)
            if errorCode == 0 and responseData then
                outputConsole("Discord log gönderildi: " .. message)
            else
                iprint(errorCode)
                outputConsole("Discord log gönderme hatası: " .. tostring(errorCode))
            end
        end)
	end

end

createDiscordLog("lua-tr","Lua Türkiye Üyeleri")
createDiscordLog("Test","Bu bir test mesajıdır.")
------------------------
-- get client event
------------------------
addEvent("meta-discord-log:sent-log",true)
addEventHandler("meta-discord-log:sent-log", root,createDiscordLog)
