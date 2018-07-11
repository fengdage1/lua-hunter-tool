pveSting = true
arcaneShot = true
mana = UnitMana("player")
markSlot=66
checkPlayerBuffNum = 8
checkTargetDebuffNum = 8
posX = 0
posY = 0
moving = false
startAutoShot = false
gcdStartTime = 0
autoShotTime = 0


spellMana={
	["Serpent Sting"]= 50
}
dotEndTime={
	["Serpent Sting"]= 0
}

dotDuration={
	["Serpent Sting"]= 15
}
	
spellSlots={
	["Raptor Strike"]=63,
	["Auto Shot"]=62,
	["Wing Clip"]=64,
	["Mongoose Bite"]=65,
	["Multi-Shot"]=67,
	["Arcane Shot"]=68
}

spellCooldown={
	["Raptor Strike"]=false,
	["Auto Shot"]=false,
	["Wing Clip"]=false,
	["Mongoose Bite"]=false,
	["Multi-Shot"]=false,
	["Arcane Shot"]=false,
}

spellIcons={
	["Hunter's Mark"]="Interface\\Icons\\Ability_Hunter_SniperShot",
	["Serpent Sting"]="Interface\\Icons\\Ability_Hunter_Quickshot",
	["Wing Clip"] = "Interface\\Icons\\Ability_Rogue_Trip",
	["Aspect of the Cheetah"] = "Interface\\Icons\\Ability_Mount_JungleTiger",
	["Aspect of the Hawk"] = "Interface\\Icons\\Spell_Nature_RavenForm",
	["Aspect of the Monkey"] = "Interface\\Icons\\Ability_Hunter_AspectOfTheMonkey",
}

iconSpells={
	["Interface\\Icons\\Ability_Hunter_SniperShot"] = "Hunter's Mark",
	["Interface\\Icons\\Ability_Hunter_Quickshot"] = "Serpent Sting",
	["Interface\\Icons\\Ability_Rogue_Trip"] = "Wing Clip",
	["Interface\\Icons\\Ability_Hunter_AspectOfTheMonkey"] = "Aspect of the Monkey",
	["Interface\\Icons\\Spell_Nature_RavenForm"] = "Aspect of the Hawk",
	["Interface\\Icons\\Ability_Mount_JungleTiger"] = "Aspect of the Cheetah",
}

targetDebuffs={
	["Hunter's Mark"] = false,
	["Wing Clip"] = false,
	["Serpent Sting"] = false,
}

playerBuffs={
	["Aspect of the Cheetah"] = false,
	["Aspect of the Hawk"] = false,
	["Aspect of the Monkey"] = false
}

spells={
	["othersIndex"]={
		"Serpent Sting",
		"Auto Shot",
		"Multi-Shot",
		"Arcane Shot",
		"miaozhun",
	},
	["others"]={
		["Serpent Sting"] = false,
		["Auto Shot"] = false,
		["Multi-Shot"] = false,
		["Arcane Shot"] = false,
		["miaozhun"] = false,
	},
}

function testCommand(cmd)
	DEFAULT_CHAT_FRAME:AddMessage(UnitRangedDamage("player"))
end

function toggleCommand(cmd)
	if attackMode == 0 then
		attack = pvp
		attackMode = 1
		DEFAULT_CHAT_FRAME:AddMessage("toggle pvp")
	elseif attackMode == 1 then
		attack = pve
		attackMode = 0
		DEFAULT_CHAT_FRAME:AddMessage("toggle pve")
	end
end

function aspectCommand(cmd)
	updatePlayerBuff(checkPlayerBuffNum)
	if UnitIsPlayer("target") and UnitIsEnemy("player","target") then
		local class = UnitClass("target")
		if class == "Mage" or class == "Priest" or class == "Warlock" or class == "Warrior" then
			if playerBuffs["Aspect of the Cheetah"] == true then
				CastSpellByName("Aspect of the Hawk")
			else
				CastSpellByName("Aspect of the Cheetah")
			end
		else
			if range <2 then
				if playerBuffs["Aspect of the Monkey"] == true then
					CastSpellByName("Aspect of the Cheetah")
				else
					CastSpellByName("Aspect of the Monkey")
				end
			else
				if playerBuffs["Aspect of the Cheetah"] == true then
					CastSpellByName("Aspect of the Hawk")
				else
					CastSpellByName("Aspect of the Cheetah")
				end
			end
		end
	else
		if playerBuffs["Aspect of the Cheetah"] == true then
			CastSpellByName("Aspect of the Hawk")
		else
			CastSpellByName("Aspect of the Cheetah")
		end
	end
end

function attackCommand(cmd)
	attack()
end

function onLoad()
	lrSightWidth = 2
	lrSightHeight = 20
	tbSightWidth = 16
	tbSightHeight = 2
	sightSubX = 16
	sightSubY = 20
	sightX = 0
	sightY = 150
	spellframeX = 0
	spellframeY = 150
	spellFrameWidth = 9
	spellFrameHeight = 12
	attackMode = 0
	range=0
	--
	spellFrame=getglobal("spellFrame"); 
	spellFrame:SetWidth(spellFrameWidth)
	spellFrame:SetHeight(spellFrameHeight)
	spellFrame:SetBackdropColor(1,1,1)
	spellFrame.texture = spellFrame:CreateTexture()
	spellFrame.texture:SetAllPoints(spellFrame)
	spellFrame.texture:SetTexture(1,1,1)
	spellFrame:SetPoint("CENTER", UIParent, "CENTER",spellframeX, spellframeY)
	--
	SLASH_TEST1 = "/test"
	SlashCmdList["TEST"] = testCommand
	SLASH_TOGGLE1 = "/toggle"
	SlashCmdList["TOGGLE"] = toggleCommand
	SLASH_ASPECT1 = "/aspect"
	SlashCmdList["ASPECT"] = aspectCommand
	SLASH_ATTACK1 = "/attack"
	SlashCmdList["ATTACK"] = attackCommand
	--
	--[[this:RegisterEvent("VARIABLES_LOADED");
	this:RegisterEvent("SPELLS_CHANGED");
	this:RegisterEvent("CHARACTER_POINTS_CHANGED");
	this:RegisterEvent("PLAYER_ALIVE");
	this:RegisterEvent("UNIT_AURA");
	this:RegisterEvent("PLAYER_TARGET_CHANGED");
	this:RegisterEvent("CHAT_MSG_SPELL_AURA_GONE_OTHER");
	this:RegisterEvent("CHAT_MSG_SPELL_AURA_GONE_SELF");
	this:RegisterEvent("CHAT_MSG_COMBAT_HOSTILE_DEATH");
	this:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_SELF_BUFFS");
	this:RegisterEvent("CHAT_MSG_SPELL_PET_DAMAGE");
	this:RegisterEvent("CHAT_MSG_MONSTER_EMOTE");
	this:RegisterEvent("START_AUTOREPEAT_SPELL");
	this:RegisterEvent("STOP_AUTOREPEAT_SPELL");
	this:RegisterEvent("SPELLCAST_START");
	this:RegisterEvent("SPELLCAST_STOP");
	this:RegisterEvent("SPELLCAST_FAILED");
	--]]
	--this:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_CREATURE_DAMAGE");
	--this:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_HOSTILEPLAYER_DAMAGE");
	--this:RegisterEvent("CHAT_MSG_SPELL_SELF_DAMAGE");
	--this:RegisterEvent("ZONE_CHANGED_NEW_AREA")
	--this:RegisterEvent("ZONE_CHANGED_INDOORS")
	--this:RegisterEvent("START_AUTOREPEAT_SPELL")
	--
	createRangeSight()
	--
	createZoonEventFrame()
	--
	createAutoShotEventFrame()
	--
	UIErrorsFrame:Hide() 
	DEFAULT_CHAT_FRAME:AddMessage("hunter tool is Loaded,default mode is pve")
	DEFAULT_CHAT_FRAME:AddMessage("author voodoodog")
end 

function onZoonEvent()
	DEFAULT_CHAT_FRAME:AddMessage("zoon")
	SetMapToCurrentZone()
	--_,index=string.find( arg1,"afflicted by ")
	--if index ~=nil then
	--	dot = string.sub(arg1, index+1,-2)
	--	if dotEndTime[dot] ~= nil then
	--		dotEndTime[dot]=GetTime()+dotDuration[dot]
	--	end
	--end
end

function onAutoShotEvent()
	if event == "START_AUTOREPEAT_SPELL" then
		startAutoShot = true
	elseif event == "STOP_AUTOREPEAT_SPELL" then
		startAutoShot = false
	elseif event == "ITEM_LOCK_CHANGED" then
		if startAutoShot == true then
			local s,d=GetActionCooldown(markSlot)
			if d ~= 1.5 then
				autoShotTime = GetTime()
			elseif gcdStartTime == s then
				autoShotTime = GetTime()
			else
				gcdStartTime = s
			end
		end
	elseif event == "SPELLCAST_STOP" then
		local s,d=GetActionCooldown(markSlot)
		if d == 1.5 then
			gcdStartTime = s
		end
	end
end

function createZoonEventFrame()
	zoonEventFrame=CreateFrame("frame","zoonEventFrame", UIParent)
	zoonEventFrame:SetScript("OnEvent",onZoonEvent)
	zoonEventFrame:RegisterEvent("ZONE_CHANGED_NEW_AREA")
	zoonEventFrame:RegisterEvent("ZONE_CHANGED_INDOORS")
end

function createAutoShotEventFrame()
	autoShotEventFrame=CreateFrame("frame","autoShotEventFrame", UIParent)
	autoShotEventFrame:SetScript("OnEvent",onAutoShotEvent)
	autoShotEventFrame:RegisterEvent("START_AUTOREPEAT_SPELL")
	autoShotEventFrame:RegisterEvent("STOP_AUTOREPEAT_SPELL")
	autoShotEventFrame:RegisterEvent("SPELLCAST_STOP")
	autoShotEventFrame:RegisterEvent("ITEM_LOCK_CHANGED")
end

function createRangeSight()
	--
	leftSight = CreateFrame("frame","leftSight", UIParent);
	leftSight:SetFrameStrata("BACKGROUND")
	leftSight:SetWidth(lrSightWidth) 
	leftSight:SetHeight(lrSightHeight)
	leftSight.texture = leftSight:CreateTexture()
	leftSight.texture:SetAllPoints(leftSight)
	leftSight.texture:SetTexture(0,1,0)
	leftSight:SetPoint("CENTER", UIParent, "CENTER",sightX-sightSubX, sightY)
	--
	rightSight = CreateFrame("frame","rightSight", UIParent);
	rightSight:SetFrameStrata("BACKGROUND")
	rightSight:SetWidth(lrSightWidth)
	rightSight:SetHeight(lrSightHeight)
	rightSight.texture = rightSight:CreateTexture()
	rightSight.texture:SetAllPoints(rightSight)
	rightSight.texture:SetTexture(0,1,0)
	rightSight:SetPoint("CENTER", UIParent, "CENTER",sightX+sightSubX, sightY)
	--
	topSight = CreateFrame("frame","topSight", UIParent);
	topSight:SetFrameStrata("BACKGROUND")
	topSight:SetWidth(tbSightWidth)
	topSight:SetHeight(tbSightHeight)
	topSight.texture = topSight:CreateTexture()
	topSight.texture:SetAllPoints(topSight)
	topSight.texture:SetTexture(0,1,0)
	topSight:SetPoint("CENTER", UIParent, "CENTER",sightX, sightY+sightSubY)
	--
	bottomSight = CreateFrame("frame","bottomSight", UIParent);
	bottomSight:SetFrameStrata("BACKGROUND")
	bottomSight:SetWidth(tbSightWidth)
	bottomSight:SetHeight(tbSightHeight)
	bottomSight.texture = bottomSight:CreateTexture()
	bottomSight.texture:SetAllPoints(bottomSight)
	bottomSight.texture:SetTexture(0,1,0)
	bottomSight:SetPoint("CENTER", UIParent, "CENTER",sightX, sightY-sightSubY)
	
end

function hideSpellFrame()
	spellFrame:SetAlpha(0)
end

function showSpellFrame()
	spellFrame:SetAlpha(1)
end

function hideSight()
	leftSight:SetAlpha(0)
	rightSight:SetAlpha(0)
	topSight:SetAlpha(0)
	bottomSight:SetAlpha(0)
end

function showSight()
	leftSight:SetAlpha(1)
	rightSight:SetAlpha(1)
	topSight:SetAlpha(1)
	bottomSight:SetAlpha(1)
end

function setSightGreen()
	leftSight.texture:SetTexture(0,1,0)
	rightSight.texture:SetTexture(0,1,0)
	topSight.texture:SetTexture(0,1,0)
	bottomSight.texture:SetTexture(0,1,0)
end

function setSightYellow()
	leftSight.texture:SetTexture(1,1,0)
	rightSight.texture:SetTexture(1,1,0)
	topSight.texture:SetTexture(1,1,0)
	bottomSight.texture:SetTexture(1,1,0)
end

function setSightRed()
	leftSight.texture:SetTexture(1,0,0)
	rightSight.texture:SetTexture(1,0,0)
	topSight.texture:SetTexture(1,0,0)
	bottomSight.texture:SetTexture(1,0,0)
end

function setSpellFrameColor(flag)
	if flag == 1 then
		spellFrame.texture:SetTexture(0,1,0)
	elseif flag == 2 then
		spellFrame.texture:SetTexture(1,1,0)
	elseif flag == 3 then
		spellFrame.texture:SetTexture(1,0,0)
	else
		hideSpellFrame()
		return
	end
	showSpellFrame()
end

function setSightByRange()
	if range == 5 then
		setSightGreen()
	else
		setSightRed()
	end
end

function updateRange()
	if IsActionInRange(spellSlots["Wing Clip"]) == 1 then
		range=0
	elseif CheckInteractDistance("target", 1) == 1 then 
		range=1
	elseif IsActionInRange(spellSlots["Auto Shot"]) == 1 then
		range=5
	else
		range=10
	end
end

function updateCooldown()
	for k, v in pairs(spellSlots) do  
		local _, d = GetActionCooldown(spellSlots[k]);
		if d == 0 then
			spellCooldown[k]=true
		elseif d == 1.5 then
			spellCooldown[k]=true
		else
			spellCooldown[k]=false
		end
	end 
end

function updateTargetDebuff(unit,debuffCnt)
	for k, v in pairs(targetDebuffs) do  
		targetDebuffs[k] = false
	end 
	for i=1,debuffCnt,1 do
		local icon=UnitDebuff(unit,i)
		if targetDebuffs[iconSpells[icon]] ~= nil then
			targetDebuffs[iconSpells[icon]] = true
		end
	end
end

function updatePlayerBuff(debuffCnt)
	for k, v in pairs(playerBuffs) do  
		playerBuffs[k] = false
	end 
	for i=1,debuffCnt,1 do
		local icon=UnitBuff("player",i)
		if playerBuffs[iconSpells[icon]] ~= nil then
			playerBuffs[iconSpells[icon]] = true
		end
	end
end

function checkDebuffExisting(unit,debuff,debuffCnt)
	for i=1,debuffCnt,1 do
		if spellIcons[debuff] == UnitDebuff(unit,i) then
			return true
		end
	end
	return false
end

function isInGcd()
	local _,d = GetActionCooldown(markSlot)
	if d==1.5 then
		return true
	else
		return false
	end
end


function melee()
	if spellCooldown["Raptor Strike"] == true then
		CastSpellByName("Raptor Strike")
	end
	if targetDebuffs["Wing Clip"] == false then
		CastSpellByName("Wing Clip")
	end
	if IsUsableAction(spellSlots["Mongoose Bite"]) == 1 then
		CastSpellByName("Mongoose Bite")
	end
end

function shoot(class)
	local index = class.."Index"
	for i = 1, table.getn(spells[index]) do
		local spellName = spells[index][i]
        if spells[class][spellName] == true then
			CastSpellByName(spellName)
		end
    end  
end

function attack()
	if UnitIsDead("target") or UnitIsFriend("player", "target")then
		return
	end 
	if UnitIsPlayer("target") then
		pve()
	else
		pve()
	end
end

function pvp()
	DEFAULT_CHAT_FRAME:AddMessage(CheckInteractDistance("unit", distIndex))
end

function pve()
	PetAttack()
	if range > 0 and targetDebuffs["Hunter's Mark"] == false then
			CastSpellByName("Hunter's Mark")
	end	
	if range >1 then
		shoot("others")
	elseif range == 0 then
		melee()
	end
end

function updateSpells()
	if UnitIsPlayer("target") then
		local class = UnitClass("target")
		updateSpellsToPlayers(class)
	else 
		updateSpellsToOthers()
	end
end

function updateSpellsToPlayers(class)
end

function updateSpellsToOthers()
	for k,v in pairs(spells["others"]) do
		spells["others"][k]=false
	end
	if pveSting and GetTime()>dotEndTime["Serpent Sting"] and targetDebuffs["Serpent Sting"] == false then
		spells["others"]["Serpent Sting"] = true
	elseif not IsAutoRepeatAction(spellSlots["Auto Shot"]) then
		spells["others"]["Auto Shot"] = true
	elseif moving == false and spellCooldown["Multi-Shot"] then
		spells["others"]["Multi-Shot"] = true
	elseif spellCooldown["Arcane Shot"] then
		if arcaneShot then
			spells["others"]["Arcane Shot"] = true
		else 
			spells["others"]["miaozhun"] = true
		end
	end
	local movingSpell,standingSpell = 0,0
	if spells["others"]["Serpent Sting"] or spellCooldown["Arcane Shot"] then
		movingSpell = 1
	end
	if spellCooldown["Multi-Shot"] or GetTime()- autoShotTime > UnitRangedDamage("player") then
		standingSpell = 2
	end
	setSpellFrameColor(movingSpell + standingSpell)
end 

function spellFrameUpdate()
	if(not UnitExists("target")) or UnitIsFriend("player", "target")then
		hideSight()
		hideSpellFrame()
	else
		local curPosX, curPosY = GetPlayerMapPosition("player");
		if curPosX ~= posX or curPosY ~= posY then
			moving = true
		else
			moving = false
		end
		posX,posY = curPosX,curPosY
		--
		updateRange()
		setSightByRange()
		updateTargetDebuff("target",checkTargetDebuffNum)
		updateCooldown()
		updateSpells()
		--
		--showSpellFrame()
		showSight()
		--
		local curMana = UnitMana("player")
		if mana - curMana == spellMana["Serpent Sting"] then
			dotEndTime["Serpent Sting"] = GetTime()+dotDuration["Serpent Sting"]
		end
		mana = curMana
	end
end