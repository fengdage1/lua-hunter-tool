pveSting = false
pveMask = true
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
spellFrameColor = 0
spellFrameColorFlag = 0
autoShotOffsetTime = 0.3
playerName=""
flashSpellFrameMinWidth = 50
flashSpellFrameMinHight = 50
flashSpellFrameMaxWidth = 300
flashSpellFrameMaxHight = 300
--/script TargetByName("鲁伯斯",1);if not UnitAffectingCombat("player") then CastSpellByName("驯服野兽");end;if UnitExists("pet") then Logout();end;
--TargetByName
--SpellStopCasting
spellMana={
	["Serpent Sting"]= 225,
	["Viper Sting"]=210,
	["Concussive Shot"] = 134,
}
dotEndTime={
	["Serpent Sting"]= 0,
	["Viper Sting"]=0,
}

dotDuration={
	["Serpent Sting"]= 15,
	["Viper Sting"] = 8,
}
	
spellSlots={
	["Raptor Strike"]=63,
	["Auto Shot"]=62,
	["Wing Clip"]=64,
	["Mongoose Bite"]=65,
	["Multi-Shot"]=67,
	["Arcane Shot"]=68,
	["Rapid Fire"]=69,
	["Concussive Shot"]=70,
}

spellCooldown={
	["Raptor Strike"]=false,
	["Auto Shot"]=false,
	["Wing Clip"]=false,
	["Mongoose Bite"]=false,
	["Multi-Shot"]=false,
	["Arcane Shot"]=false,
	["Rapid Fire"]=false,
	["Concussive Shot"]=false,
}
spellIcons={
	["Hunter's Mark"]="Interface\\Icons\\Ability_Hunter_SniperShot",
	["Serpent Sting"]="Interface\\Icons\\Ability_Hunter_Quickshot",
	["Scorpid Sting"]="Interface\\Icons\\Ability_Hunter_CriticalShot",
	["Viper Sting"]="Interface\\Icons\\Ability_Hunter_AimedShot",
	["Wing Clip"] = "Interface\\Icons\\Ability_Rogue_Trip",
	["Aspect of the Cheetah"] = "Interface\\Icons\\Ability_Mount_JungleTiger",
	["Aspect of the Hawk"] = "Interface\\Icons\\Spell_Nature_RavenForm",
	["Aspect of the Monkey"] = "Interface\\Icons\\Ability_Hunter_AspectOfTheMonkey",
	["Shadowmeld"] = "Interface\\Icons\\Ability_Ambush"
}

iconSpells={
	["Interface\\Icons\\Ability_Hunter_SniperShot"] = "Hunter's Mark",
	["Interface\\Icons\\Ability_Hunter_Quickshot"] = "Serpent Sting",
	["Interface\\Icons\\Ability_Hunter_CriticalShot"]="Scorpid Sting",
	["Interface\\Icons\\Ability_Hunter_AimedShot"]="Viper Sting",
	["Interface\\Icons\\Ability_Rogue_Trip"] = "Wing Clip",
	["Interface\\Icons\\Ability_Hunter_AspectOfTheMonkey"] = "Aspect of the Monkey",
	["Interface\\Icons\\Spell_Nature_RavenForm"] = "Aspect of the Hawk",
	["Interface\\Icons\\Ability_Mount_JungleTiger"] = "Aspect of the Cheetah",
	["Interface\\Icons\\Ability_Ambush"] = "Shadowmeld",
}

targetDebuffs={
	["Hunter's Mark"] = false,
	["Wing Clip"] = false,
	["Serpent Sting"] = false,
	["Scorpid Sting"] = false,
	["Viper Sting"] = false,
}

playerBuffs={
	["Aspect of the Cheetah"] = false,
	["Aspect of the Hawk"] = false,
	["Aspect of the Monkey"] = false,
}

function testCommand(cmd)
	SpellStopCasting()
end
function showplayerCommand(cmd)
	DEFAULT_CHAT_FRAME:AddMessage(playerName)
end
function setplayerCommand(cmd)
	playerName = cmd
	DEFAULT_CHAT_FRAME:AddMessage("set player name:"..cmd)
end
function targetplayerCommand(cmd)
	TargetByName(playerName,1)
end

function huizhangCommand(cmd)
	--local a,b = GetInventoryItemCooldown("player",13)
	--if GetInventoryItemTexture("player",13) == "Interface\\Icons\\INV_Jewelry_TrinketPVP_01" then
	--DEFAULT_CHAT_FRAME:AddMessage("huizhang")
	--end
	--UseInventoryItem(13)
end
function trapCommand(cmd)
	PetFollow()
	ClearTarget()
	if(UnitAffectingCombat("player")==1) then 
		CastSpellByName("Feign Death") 
	else 
		CastSpellByName(cmd)
		if checkbuffExisting("player","Shadowmeld",checkPlayerBuffNum) == false then
			CastSpellByName("Shadowmeld")
		end
	end
	--PetFollow()
	TargetLastTarget()
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
	spellFrameWidth = 12
	spellFrameHeight = 16
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
	SLASH_SHOWPLAYER1 = "/showplayer"
	SlashCmdList["SHOWPLAYER"] = showplayerCommand
	SLASH_SETPLAYER1 = "/setplayer"
	SlashCmdList["SETPLAYER"] = setplayerCommand
	SLASH_TARGETPLAYER1 = "/targetplayer"
	SlashCmdList["TARGETPLAYER"] = targetplayerCommand
	SLASH_TEST1 = "/test"
	SlashCmdList["TEST"] = testCommand
	SLASH_HUIZHANG1 = "/huizhang"
	SlashCmdList["HUIZHANG"] = huizhangCommand
	SLASH_ASPECT1 = "/aspect"
	SlashCmdList["ASPECT"] = aspectCommand
	SLASH_TRAP1 = "/trap"
	SlashCmdList["TRAP"] = trapCommand
	SLASH_ATTACK1 = "/attack"
	SlashCmdList["ATTACK"] = attackCommand
	---
	createRangeSight()
	--
	createZoonEventFrame()
	--
	createAutoShotEventFrame()
	--
	--createFlashConcussiveFrame()
	--
	UIErrorsFrame:Hide()
	--
	DEFAULT_CHAT_FRAME:AddMessage("hunter tool is Loaded")
	DEFAULT_CHAT_FRAME:AddMessage("author voodoodog")
end 

function createFlashConcussiveFrame()
--Concussive Shot
	concussiveFrame=CreateFrame("frame","concussiveFrame", UIParent)
	concussiveFrame:SetWidth(flashSpellFrameMinWidth) 
	concussiveFrame:SetHeight(flashSpellFrameMinHight)
	concussiveFrame:SetPoint("CENTER", UIParent, "CENTER",0, 50)
	concussiveFrame.texture = concussiveFrame:CreateTexture()
	concussiveFrame.texture:SetAllPoints(concussiveFrame)
	concussiveFrame.texture:SetTexture("Interface\\Icons\\Spell_Frost_Stun")
	concussiveFrame:Hide()
	concussiveFrame:SetScript("OnUpdate",concussiveUpdate)
	concussiveFrame:SetAlpha(0.2)
end

function concussiveUpdate()
	width = this:GetWidth()
	height = this:GetHeight()
	if width>flashSpellFrameMaxWidth then
		this:Hide()
	end
	this:SetWidth(width+10) 
	this:SetHeight(height+10)
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
	--[[if flag == 1 then
		spellFrame.texture:SetTexture(0,1,0)
	elseif flag == 2 then
		spellFrame.texture:SetTexture(1,1,0)
	elseif flag == 3 then
		spellFrame.texture:SetTexture(1,0,0)
	elseif flag == 5 then
		spellFrame.texture:SetTexture(1,1,1)]]
	if spellFrameColorFlag > flag then
		if spellFrameColor == 0 then
			spellFrame.texture:SetTexture(0,0,1)
			spellFrameColor = 1
		else
			spellFrame.texture:SetTexture(1,1,1)
			spellFrameColor = 0
		end	
	end
	spellFrameColorFlag = flag
	if flag == 0 then
		hideSpellFrame()
		return
	end
	showSpellFrame()
end

function setSightByRange()
	if range == 5 then
		setSightGreen()
	elseif range == 3 then
		setSightYellow()
	else
		setSightRed()
	end
end

function updateRange()
	if IsActionInRange(spellSlots["Wing Clip"]) == 1 then
		range=0
	elseif CheckInteractDistance("target", 2) == 1 then
		range=1
	elseif IsActionInRange(1) == 1 then 
		range=3
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
	local flag=0
	if spellCooldown["Multi-Shot"] then
		flag = flag+1
	end
	if GetTime()- autoShotTime > UnitRangedDamage("player") then
		flag = flag+1
	end
	setSpellFrameColor(flag)
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

function checkbuffExisting(unit,buff,buffCnt)
	for i=1,buffCnt,1 do
		if spellIcons[buff] == UnitBuff(unit,i) then
			return true
		end
	end
	return false
end

function checkAutoShot()
	if GetTime()- autoShotTime > UnitRangedDamage("player") - autoShotOffsetTime then
		return true
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

function attack()
	if not UnitExists("target") or UnitIsFriend("player", "target")then
		SpellStopCasting()
		TargetLastEnemy()
		return
	end 
	if range == 0 then
		melee()
	else
		if UnitIsPlayer("target") then
			pvp()
		else
			pve()
		end
	end
end

function pvp()
	if range == 10 and not targetDebuffs["Hunter's Mark"] then
		CastSpellByName("Hunter's Mark")
	elseif range ~= 10 and spellCooldown["Rapid Fire"] then
		CastSpellByName("Rapid Fire")
	end
	local class = UnitClass("target")
	shot[class]()
end

function pve()
	shot["Others"]()
end


function spellFrameUpdate()
	if(not UnitExists("target")) or UnitIsFriend("player", "target")then
		hideSight()
		hideSpellFrame()
	else
		if UnitIsPlayer("target") then
			playerName=UnitName("target")
		end
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
		--
		showSight()
		--
		local curMana = UnitMana("player")
		if mana - curMana == spellMana["Serpent Sting"] then
			dotEndTime["Serpent Sting"] = GetTime()+dotDuration["Serpent Sting"]
		elseif mana - curMana == spellMana["Viper Sting"] then
			dotEndTime["Viper Sting"] = GetTime()+dotDuration["Viper Sting"]
		elseif mana - curMana == spellMana["Concussive Shot"] then
			concussiveFrame:SetWidth(flashSpellFrameMinWidth)
			concussiveFrame:SetHeight(flashSpellFrameMinHight)
			concussiveFrame:Show()
		end
		mana = curMana
	end
end