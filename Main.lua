local addon, tbl = ...
local achievementPlayers = {}
local currentCharacterName
local doNotSend
local frame = CreateFrame("Frame")

frame:RegisterEvent("CHAT_MSG_GUILD")
frame:RegisterEvent("CHAT_MSG_GUILD_ACHIEVEMENT")
frame:RegisterEvent("PLAYER_LOGIN")

local function GetRandomMessage()
	local randomNum = tonumber(math.random(1, #tbl.messages))
	return tbl.randomMessages[randomNum]
end

frame:SetScript("OnEvent", function(self, event, ...)
	if event == "CHAT_MSG_GUILD" then
		local text, playerName = ...
		playerName = string.match(playerName, "(.-)-")
		if achievementPlayers[playerName] then
			for i = 1, #tbl.responses do
				if string.find(text, tbl.responses[i]) do
					SendChatMessage("yw!", "GUILD", nil, nil)
				end
			end
		end
	end
	if event == "CHAT_MSG_GUILD_ACHIEVEMENT" then
		local text, playerName = ...
		playerName = string.match(playerName, "(.-)-")
		if playerName == currentCharacterName then
			-- Do nothing if it's your own character. :(
		else
			if doNotSend ~= true then
				local randomMessage = GetRandomMessage()
				doNotSend = true
				C_Timer.After(0, function()
					C_Timer.After(5, function()
						SendChatMessage(randomMessage, "GUILD", nil, nil)
					end)
				end)
			end
			achievementPlayers[playerName] = time()
		end
		C_Timer.After(0, function()
			C_Timer.After(5, function()
				doNotSend = false
			end)
		end)
		C_Timer.After(0, function()
			C_Timer.After(120, function()
				for i = 1, #achievementPlayers do
					if (time() - achievementPlayers[i]) > 120 then
						achievementPlayers[i] = nil
					end
				end
			end)
		end)
	end
	if event == "PLAYER_LOGIN" then
		currentCharacterName = UnitName("player")
	end
end)