local addon, tbl = ...

local blacklist = {
	[1] = "Rensette",
}

local randomGratsMessages = {
	[1] = "Thrall's balls! You did it!",
	[2] = "Illidan would be proud. YOU ARE NOW PREPARED!",
	[3] = "The Light thanks you for your efforts.",
	[4] = "Congratulations!",
	[5] = "GRATS!",
	[6] = "Congo Rats!",
}

local responses = {
	[1] = "thanks",
	[2] = "ty",
	[3] = "thank you",
	[4] = "thx",
	[5] = "thanc", -- Someone in my guild likes to be a troll
	[6] = "thnks",
}

local thankYouResponses = {
	[1] = "You're welcome, %s!",
	[2] = "No problem, friend! @ %s",
	[3] = "yw! @ %s",
}

tbl.blacklist = blacklist
tbl.randomGratsMessages = randomGratsMessages
tbl.responses = responses
tbl.thankYouResponses = thankYouResponses