local addon, tbl = ...

local randomMessages = {
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

local blacklist = {
	[1] = "Rensette",
}

tbl.randomMessages = randomMessages
tbl.responses = responses
tbl.blacklist = blacklist