local addon, tbl = ...
local currentCharacterName
local doNotSend
local frame = CreateFrame("Frame")

frame:RegisterEvent("CHAT_MSG_GUILD_ACHIEVEMENT")
frame:RegisterEvent("PLAYER_LOGIN")

local function GetMessage()
	local randomNum = tonumber(math.random(1, #tbl.messages))
	return tbl.messages[randomNum]
end

frame:SetScript("OnEvent", function(self, event, ...)
	if event == "CHAT_MSG_GUILD_ACHIEVEMENT" then
		local text, playerName = ...
		playerName = string.match(playerName, "(.-)-")
		if playerName == currentCharacterName then
			-- Do nothing if it's your own character. :(
		else
			if doNotSend ~= true then
				local message = GetMessage()
				doNotSend = true
				C_Timer.After(0, function()
					C_Timer.After(5, function()
						SendChatMessage(message, "GUILD", nil, nil)
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