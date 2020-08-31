local addon, tbl = ...
local achievementPlayers = {}
local currentCharacterName
local doNotSend
local frame = CreateFrame("Frame")

frame:RegisterEvent("CHAT_MSG_GUILD")
frame:RegisterEvent("CHAT_MSG_GUILD_ACHIEVEMENT")
frame:RegisterEvent("PLAYER_LOGIN")

local function GetRandomMessage(passedTbl)
	local randomNum = tonumber(math.random(1, #passedTbl))
	return passedTbl[randomNum]
end

frame:SetScript("OnEvent", function(self, event, ...)
	if event == "CHAT_MSG_GUILD" then
		local sendYourWelcomeMessage = false
		local text, playerName = ...
		playerName = string.match(playerName, "(.-)-")
		if achievementPlayers[playerName] then
			for i = 1, #tbl.blacklist do
				if playerName == tbl.blacklist[i] then
					SendChatMessage(playerName .. ", no messages for you... TWO WEEKS! (" .. addon .. ")", "GUILD", nil, nil)
				end
			end
			for i = 1, #tbl.responses do
				if string.find(string.lower(text), tbl.responses[i]) then
					sendYourWelcomeMessage = true
					break
				end
			end
			if sendYourWelcomeMessage then
				local randomMessage = GetRandomMessage(tbl.thankYouResponses)
				C_Timer.After(0, function()
					C_Timer.After(3, function()
						SendChatMessage(string.format(randomMessage, playerName), "GUILD", nil, nil)
						achievementPlayers[playerName] = nil
					end)
				end)
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
				local randomMessage = GetRandomMessage(tbl.randomGratsMessages)
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
				for k, v in pairs(achievementPlayers) do
					if (time() - v) > 120 then
						achievementPlayers[k] = nil
					end
				end
			end)
		end)
	end
	if event == "PLAYER_LOGIN" then
		currentCharacterName = UnitName("player")
	end
end)