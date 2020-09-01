local addon, tbl = ...

local blacklist = {
	[1] = "Rensette",
}

local randomGratsMessages = {
	[1] = "GRATS!",
	[2] = "Thrall's balls! You did it!",
	[3] = "Illidan would be proud. YOU ARE NOW PREPARED!",
	[4] = "Mrglglglgrlglglll!",
	[5] = "MADNESS WILL CONSUME YOU!",
	[6] = "This must not even be your final form.",
	[7] = "Congratulations! Allow me to grant you a title befitting the amazing achievement you just performed! Henceforth, you shall be known as the Slayer of Incompetent, Stupid and Disappointing Minions!",
	[8] = "GOOD NEWS, everyone, another achievement was obtained!",
	[9] = "You no take candle!",
	[10] = "+50 DKP, friend.",
	[11] = "'Dis pear, so delicious...",
	[12] = "I am the beginning of the end. The shadow which blots out the sun. The bell which tolls your doom...",
	[13] = "An illusion! What are you hiding?",
	[14] = "Your discipline must be iron. Oh! Manacrystal...",
	[15] = "NOOOO! You killed Stinky, you pay!",
	[16] = "Here's my body, fit and pure! Now, your blackened souls I'll cure!",
	[17] = "Bad news, daddy...",
	[18] = "BREAK YOURSELVES UPON MY BAHDEEE! FEEEEEEL THE STRENGTH OF THE URRRRTH",
	[19] = "Run away, little girl, run away....",
	[20] = "Working as intended.",
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