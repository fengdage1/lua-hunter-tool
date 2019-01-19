pveSting = false
pveMulti=true
pveMask = false
arcaneShot = true
autoDeath = false
mana = UnitMana("player")
markSlot=66
flareSlot = 50
checkPlayerBuffNum = 16
checkPlayerDebuffNum = 8
checkTargetDebuffNum = 8
posX = 0
posY = 0
moving = false
startAutoShot = false
gcdStartTime = 0
autoShotTime = 0
spellFrameColor = 0
autoShotOffsetTime = 0.3
playerName=""
playerClass=""
flashSpellFrameMinWidth = 45
flashSpellFrameMinHight = 45
autoFlag = false
PetFuck=PetSlay
--/script TargetByName("Lupos",1);if not UnitAffectingCombat("player") then CastSpellByName("Tame Beast");end;if UnitExists("pet") then Logout();end;
--TargetByName
--SpellStopCasting
--/script if not buffed("Ice Block", 'player') then cast("Ice Block") end
spellMana={
	["Serpent Sting"]= 207,
	["Viper Sting"]=193,
	["Concussive Shot"] = 123,
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
	["Flare"]=50,
	["Feign Death"]=51,
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
	["Flare"]=false,
	["Feign Death"]=false,
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
	["Shadowmeld"] = "Interface\\Icons\\Ability_Ambush",
	["Cheap"] = "Interface\\Icons\\Ability_CheapShot",
	["Kidney"] = "Interface\\Icons\\Spell_Shadow_LifeDrain",
	["Scatter Shot"] = "Interface\\Icons\\Ability_GolemStormBolt",
	["Concussive Shot"] = "Interface\\Icons\\Spell_Frost_Stun",
	["Feign Death"]="Interface\\Icons\\Ability_Rogue_FeignDeath",
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
	["Interface\\Icons\\Ability_CheapShot"] = "Cheap",
	["Interface\\Icons\\Spell_Shadow_LifeDrain"] = "Kidney",
	["Interface\\Icons\\Ability_GolemStormBolt"] = "Scatter Shot",
	["Interface\\Icons\\Spell_Frost_Stun"] = "Concussive Shot",
	["Interface\\Icons\\Ability_Rogue_FeignDeath"]="Feign Death",
}

targetDebuffs={

}

playerBuffs={

}

playerDebuffs={

}

function testCommand(cmd)
	if isPlayerBuffExist("Feign Death") == false then
		DEFAULT_CHAT_FRAME:AddMessage("haha")
	end
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
	PetPassiveMode()
	CastSpellByName("Scatter Shot")
	if isPlayerDebuffExist("Kidney") or isPlayerDebuffExist("Cheap") then
		if GetInventoryItemTexture("player",13) == "Interface\\Icons\\INV_Jewelry_TrinketPVP_01" and GetInventoryItemCooldown("player",13) ==0 then
			UseInventoryItem(13)
		end
	end
end

function zhuazeiCommand(cmd)
	if UnitExists("target") then
		local class = UnitClass("target")
		if class == "Rogue" then
			if isTargetDebuffExist("Scatter Shot") == true then
				PetPassiveMode()
			else
				PetFuck()
			end
			CastSpellByName("Scatter Shot")
		else
			SetCVar("targetNearestDistance",12)
			ClearTarget()
			TargetNearestEnemy()
			SetCVar("targetNearestDistance",50)
		end
	else
		SetCVar("targetNearestDistance",12)
		ClearTarget()
		TargetNearestEnemy()
		SetCVar("targetNearestDistance",50)
	end
end

function yingdunCommand(cmd)
	if isPlayerBuffExist("Shadowmeld") == false then
		CastSpellByName("Shadowmeld")
	end
end

function flareCommand(cmd)
	if not IsCurrentAction(spellSlots["Flare"])then
		CastSpellByName("Flare")
	end
end

function duochongkaiguanCommand(cmd)
	if pveMulti == true then
		pveMulti = false
		DEFAULT_CHAT_FRAME:AddMessage("multi_shot is closed")
	elseif pveMulti == false then
		pveMulti = true
		DEFAULT_CHAT_FRAME:AddMessage("multi_shot is opened")
	end
end

function autodeathCommand(cmd)
	if autoDeath == false then
		autoDeath = true
		DEFAULT_CHAT_FRAME:AddMessage("auto feign_death is opened")
	elseif autoDeath == true then
		autoDeath = false
		DEFAULT_CHAT_FRAME:AddMessage("auto feign_death is closed")
	end
end

function trapCommand(cmd)
	PetPassiveMode()
	--ClearTarget()
	if(UnitAffectingCombat("player")==1) then 
		CastSpellByName("Feign Death") 
	else 
		CastSpellByName(cmd)
		if isPlayerBuffExist("Shadowmeld") == false then
			CastSpellByName("Shadowmeld")
		end
	end
	--PetFollow()
	--TargetLastTarget()
end
function petCommand(cmd)
	if PetFuck == PetSlay then
		PetFuck = function () end
		DEFAULT_CHAT_FRAME:AddMessage("Pet Stop")
	else
		PetFuck = PetSlay
		DEFAULT_CHAT_FRAME:AddMessage("Pet Fuck")
	end
end
function petattackCommand(cmd)
	PetSlay()
end
function aspectCommand(cmd)
	if UnitIsPlayer("target") and UnitIsEnemy("player","target") then
		if playerClass == "Mage" or playerClass == "Priest" or playerClass == "Warlock" or playerClass == "Warrior" then
			if isPlayerBuffExist("Aspect of the Cheetah") == true then
				CastSpellByName("Aspect of the Hawk")
			else
				CastSpellByName("Aspect of the Cheetah")
			end
		else
			if range <2 then
				if isPlayerBuffExist("Aspect of the Monkey") == true then
					CastSpellByName("Aspect of the Cheetah")
				else
					CastSpellByName("Aspect of the Monkey")
				end
			else
				if isPlayerBuffExist("Aspect of the Cheetah") == true then
					CastSpellByName("Aspect of the Hawk")
				else
					CastSpellByName("Aspect of the Cheetah")
				end
			end
		end
	else
		if isPlayerBuffExist("Aspect of the Cheetah") == true then
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
	SLASH_PETATTACK1 = "/petattack"
	SlashCmdList["PETATTACK"] = petattackCommand
	SLASH_TRAP1 = "/trap"
	SlashCmdList["TRAP"] = trapCommand
	SLASH_ATTACK1 = "/attack"
	SlashCmdList["ATTACK"] = attackCommand
	SLASH_ZHUAZEI1 = "/zhuazei"
	SlashCmdList["ZHUAZEI"] = zhuazeiCommand
	SLASH_YINGDUN1 = "/yingdun"
	SlashCmdList["YINGDUN"] = yingdunCommand
	SLASH_PET1 = "/pet"
	SlashCmdList["PET"] = petCommand
	SLASH_FLARE1 = "/flare"
	SlashCmdList["FLARE"] = flareCommand
	SLASH_DUOCHONGKAIGUAN1 = "/duochongkaiguan"
	SlashCmdList["DUOCHONGKAIGUAN"] = duochongkaiguanCommand
	SLASH_AUTODEATH1 = "/autodeath"
	SlashCmdList["AUTODEATH"] = autodeathCommand
	---
	createRangeSight()
	--
	createZoonEventFrame()
	--
	createAutoShotEventFrame()
	--
	createFlashConcussiveFrame()
	--
	createScatterShotFrame()
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
	concussiveFrame:SetPoint("CENTER", UIParent, "CENTER",0, 230)
	concussiveFrame.texture = concussiveFrame:CreateTexture()
	concussiveFrame.texture:SetAllPoints(concussiveFrame)
	concussiveFrame.texture:SetTexture("Interface\\Icons\\Spell_Frost_Stun")
	concussiveFrame:Hide()
	concussiveFrame:SetAlpha(0.5)
end

function createScatterShotFrame()
	scatterShotFrame=CreateFrame("frame","scatterShot", UIParent)
	scatterShotFrame:SetWidth(flashSpellFrameMinWidth) 
	scatterShotFrame:SetHeight(flashSpellFrameMinHight)
	scatterShotFrame:SetPoint("CENTER", UIParent, "CENTER",0, 230)
	scatterShotFrame.texture = scatterShotFrame:CreateTexture()
	scatterShotFrame.texture:SetAllPoints(scatterShotFrame)
	scatterShotFrame.texture:SetTexture("Interface\\Icons\\Ability_GolemStormBolt")
	scatterShotFrame:Hide()
	scatterShotFrame:SetScript("OnUpdate",scatterShotFrameUpdate)
	scatterShotFrame:SetAlpha(0.3)
end

function scatterShotFrameUpdate()
	if GetTime()-GetActionCooldown(markSlot)<0.7 then
		scatterShotFrame:SetAlpha(0.3)
	else
		scatterShotFrame:SetAlpha(1)
	end
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

function setSightOrange()
	leftSight.texture:SetTexture(1,0.6,0)
	rightSight.texture:SetTexture(1,0.6,0)
	topSight.texture:SetTexture(1,0.6,0)
	bottomSight.texture:SetTexture(1,0.6,0)
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
	if flag == 2 then
		spellFrame.texture:SetTexture(1,0,0)
	elseif flag == 1 then
		spellFrame.texture:SetTexture(0,1,0)
	elseif flag == 0 then
		hideSpellFrame()
		return
	end
	showSpellFrame()
end

function setSightByRange()
	if range < 2 or range == 10 then
		setSightRed()
	elseif range == 2 then 
		setSightOrange()
	elseif range == 3 then
		setSightYellow()
	elseif range == 4 then
		setSightGreen()
	end
end

function updateRange()
	if IsActionInRange(spellSlots["Wing Clip"]) == 1 then
		range=0
	elseif IsActionInRange(spellSlots["Auto Shot"]) ~= 1 and IsActionInRange(13) == 1then
		range=1
	elseif IsActionInRange(13) == 1 then 
		range=2
	elseif IsActionInRange(1) == 1 then 
		range=3
	elseif IsActionInRange(spellSlots["Auto Shot"]) == 1 then
		range=4
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
		flag = 2
	elseif GetTime()- autoShotTime > UnitRangedDamage("player") then
		flag = 1
	end
	setSpellFrameColor(flag)
end

function updateTargetDebuff(debuffCnt)
	local debuffs={}
	for i=1,debuffCnt,1 do
		local icon=UnitDebuff("target",i)
		if icon ~= nil then
			debuffs[icon]=true
		end
	end
	targetDebuffs = debuffs
end

function updatePlayerBuff(debuffCnt)
	local buffs={}
	for i=1,debuffCnt,1 do
		local icon=UnitBuff("player",i)
		if icon ~= nil then
			buffs[icon]=true
		end
	end
	playerBuffs = buffs
end

function updatePlayerDebuff(debuffCnt)
	local debuffs={}
	for i=1,debuffCnt,1 do
		local icon=UnitDebuff("player",i)
		if icon ~= nil then
			debuffs[icon]=true
		end
	end
	playerDebuffs=debuffs
end

function isPlayerBuffExist(buff)
	if playerBuffs[spellIcons[buff]] ~= nil then
		return true
	end
	return false
end

function isPlayerDebuffExist(debuff)
	if playerDebuffs[spellIcons[debuff]] ~= nil then
		return true
	end
	return false
end

function isTargetDebuffExist(debuff)
	if targetDebuffs[spellIcons[debuff]] ~= nil then
		return true
	end
	return false
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
	if isTargetDebuffExist("Wing Clip") == false then
		CastSpellByName("Wing Clip")
	elseif IsUsableAction(spellSlots["Mongoose Bite"]) == 1 then
		CastSpellByName("Mongoose Bite")
	end
	PetFuck()
end

function attack()
	if (not UnitExists("target") or UnitIsFriend("player", "target")) then
		autoFlag = true
		if playerClass~="Hunter" then
			TargetByName(playerName,1)
		else
			TargetLastTarget()
		end
		return
	end
	if autoFlag == true then
		SpellStopCasting()
		if IsAutoRepeatAction(spellSlots["Auto Shot"]) then
			return
		end
		autoFlag = false
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
	if range == 10 and isTargetDebuffExist("Hunter's Mark")==false then
		CastSpellByName("Hunter's Mark")
	elseif range > 1 and spellCooldown["Rapid Fire"] then
		CastSpellByName("Rapid Fire")
	end
	shot[playerClass]()
end

function pve()
	if range > 1 and spellCooldown["Rapid Fire"] then
		CastSpellByName("Rapid Fire")
	end
	shot["Others"]()
end

function PetSlay()
	--if not UnitExists("pet") then
	--	CastSpellByName("Call Pet")
	--end
	for i=1,6,1 do
		local icon=UnitBuff("pet",i)
		if icon == "Interface\\Icons\\Ability_Druid_SupriseAttack" then
			CastSpellByName("Prowl")
			break
		end
	end
	PetAttack()
end

function spellFrameUpdate()
---[[
	updatePlayerBuff(checkPlayerBuffNum)
	updatePlayerDebuff(checkPlayerDebuffNum)
	if(not UnitExists("target")) or UnitIsFriend("player", "target")then
		hideSight()
		hideSpellFrame()
		concussiveFrame:Hide()
	else
		if UnitIsPlayer("target") then
			playerName=UnitName("target")
			playerClass = UnitClass("target")
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
		updateCooldown()
		updateTargetDebuff(checkTargetDebuffNum)
		if isTargetDebuffExist("Concussive Shot") == true then
			concussiveFrame:Show()
		else
			concussiveFrame:Hide()
		end
		if isTargetDebuffExist("Scatter Shot") == true then
			scatterShotFrame:Show()
		else
			scatterShotFrame:Hide()
		end
		--
		showSight()
		--
		local curMana = UnitMana("player")
		if mana - curMana == spellMana["Serpent Sting"] then
			dotEndTime["Serpent Sting"] = GetTime()+dotDuration["Serpent Sting"]
		elseif mana - curMana == spellMana["Viper Sting"] then
			dotEndTime["Viper Sting"] = GetTime()+dotDuration["Viper Sting"]
		end
		mana = curMana
	end
	
--]]
end