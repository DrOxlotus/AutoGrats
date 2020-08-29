local addon, tbl = ...

local blacklist = {
	[1] = "Rensette",
}

local randomGratsMessages = {
	[1] = "GRATS!",
	[2] = "Congrats!",
	[3] = "Congratulations!",
	[4] = "Congo Rats!",
	[5] = "Bravo!",
}

local responses = {
	[1] = "thanks",
	[2] = "ty",
	[3] = "thank you",
	[4] = "thx",
	[5] = "thanc", -- Someone in my guild likes to be a troll
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