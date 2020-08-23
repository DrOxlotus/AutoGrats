local addon, tbl = ...
local currentCharacterName
local doNotSend
local frame = CreateFrame("Frame")

frame:RegisterEvent("CHAT_MSG_GUILD_ACHIEVEMENT")
frame:RegisterEvent("CLUB_STREAM_SUBSCRIBED")
frame:RegisterEvent("PLAYER_LOGIN")

frame:SetScript("OnEvent", function(self, event, ...)
	if event == "CHAT_MSG_GUILD_ACHIEVEMENT" then
		local text, playerName = ...
		playerName = string.match(playerName, "(.-)-")
		if playerName == currentCharacterName then
			-- Do nothing if it's your own character. :(
		else
			if doNotSend ~= true then
				doNotSend = true
				C_Timer.After(0, function()
					C_Timer.After(5, function()
						SendChatMessage("GRATS!", "GUILD", nil, nil)
					end)
				end)
			end
		end
		C_Timer.After(0, function()
			C_Timer.After(5, function()
				doNotSend = false
			end)
		end)
	end
	if event == "PLAYER_LOGIN" then
		currentCharacterName = UnitName("player")
	end
end)