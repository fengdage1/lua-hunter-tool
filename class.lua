shot = {
	["Others"] = function()
		PetFuck()
		if (UnitIsUnit("targettarget","player")) and spellCooldown["Feign Death"] and autoDeath then
			if IsCurrentAction(12)then
				SpellStopCasting()
			end
			CastSpellByName("Feign Death")
		elseif isTargetDebuffExist("Hunter's Mark") == false and pveMask and range>1 then
			CastSpellByName("Hunter's Mark")
		elseif pveSting and GetTime()>dotEndTime["Serpent Sting"] and isTargetDebuffExist("Serpent Sting") == false  and UnitCreatureType("target") ~= "Elemental" then
			CastSpellByName("Serpent Sting")
		elseif not IsAutoRepeatAction(spellSlots["Auto Shot"]) then
			CastSpellByName("Auto Shot")
		elseif moving==true and spellCooldown["Concussive Shot"] and isTargetDebuffExist("Wing Clip")==false then
			CastSpellByName("Concussive Shot")
		elseif pveMulti and moving==false and spellCooldown["Multi-Shot"] then
			CastSpellByName("Multi-Shot")
		elseif spellCooldown["Arcane Shot"] then
			if moving then
				CastSpellByName("Arcane Shot")
			elseif GetTime()- autoShotTime<1 then
				CastSpellByName("Aimed Shot")
			end
		elseif isTargetDebuffExist("Hunter's Mark") == false and pveMask and range>1 then
			CastSpellByName("Hunter's Mark")	
		end
	end,
	
	["Warrior"] = function()
		if range<2 then
			PetWait()
		end
		if moving==true and spellCooldown["Concussive Shot"] and isTargetDebuffExist("Wing Clip")==false then
			CastSpellByName("Concussive Shot")
		elseif not moving and spellCooldown["Multi-Shot"] then
			CastSpellByName("Multi-Shot")
		elseif range < 4 and range>1 and isTargetDebuffExist("Scorpid Sting") == false then
			CastSpellByName("Scorpid Sting")
		elseif range>3 and GetTime()>dotEndTime["Serpent Sting"] and isTargetDebuffExist("Serpent Sting") == false then
			CastSpellByName("Serpent Sting")
		elseif spellCooldown["Arcane Shot"] then
			CastSpellByName("Arcane Shot")
		elseif not IsAutoRepeatAction(spellSlots["Auto Shot"]) then
			CastSpellByName("Auto Shot")
		elseif isTargetDebuffExist("Hunter's Mark") == false and range>1 then
			CastSpellByName("Hunter's Mark")	
		end
	end,
	["Rogue"] = function()
		PetFuck()
		if range>1 and GetTime()+5>dotEndTime["Serpent Sting"]then
			CastSpellByName("Serpent Sting")
		elseif not moving and spellCooldown["Multi-Shot"] then
			CastSpellByName("Multi-Shot")
		elseif moving==true and spellCooldown["Concussive Shot"] and isTargetDebuffExist("Wing Clip")==false then
			CastSpellByName("Concussive Shot")
		elseif spellCooldown["Arcane Shot"] then
			CastSpellByName("Arcane Shot")
		elseif not IsAutoRepeatAction(spellSlots["Auto Shot"]) then
			CastSpellByName("Auto Shot")
		elseif isTargetDebuffExist("Hunter's Mark") == false and range>1 then
			CastSpellByName("Hunter's Mark")	
		end
	end,
	["Hunter"] = function()
		PetFuck()
		if moving==true and spellCooldown["Concussive Shot"] and isTargetDebuffExist("Wing Clip")==false then
			CastSpellByName("Concussive Shot")
		elseif not moving and spellCooldown["Multi-Shot"] then
			CastSpellByName("Multi-Shot")
		elseif GetTime()>dotEndTime["Serpent Sting"] and isTargetDebuffExist("Serpent Sting") == false then
			CastSpellByName("Serpent Sting")
		elseif spellCooldown["Arcane Shot"] then
			CastSpellByName("Arcane Shot")
		elseif not IsAutoRepeatAction(spellSlots["Auto Shot"]) then
			CastSpellByName("Auto Shot")
		elseif isTargetDebuffExist("Hunter's Mark") == false and range>1 then
			CastSpellByName("Hunter's Mark")	
		end
	end,
	["Mage"] = function()
		PetFuck()
		if moving==true and spellCooldown["Concussive Shot"] and isTargetDebuffExist("Wing Clip")==false then
			CastSpellByName("Concussive Shot")
		elseif not moving and spellCooldown["Multi-Shot"] then
			CastSpellByName("Multi-Shot")
		elseif GetTime()>dotEndTime["Viper Sting"] and isTargetDebuffExist("Viper Sting") == false then
			CastSpellByName("Viper Sting")
		elseif spellCooldown["Arcane Shot"] then
			CastSpellByName("Arcane Shot")
		elseif not IsAutoRepeatAction(spellSlots["Auto Shot"]) then
			CastSpellByName("Auto Shot")
		elseif isTargetDebuffExist("Hunter's Mark") == false and range>1 then
			CastSpellByName("Hunter's Mark")	
		end
	end,
	["Priest"] = function()
		PetFuck()
		if moving==true and spellCooldown["Concussive Shot"] and isTargetDebuffExist("Wing Clip")==false then
			CastSpellByName("Concussive Shot")
		elseif not moving and spellCooldown["Multi-Shot"] then
			CastSpellByName("Multi-Shot")
		elseif GetTime()>dotEndTime["Viper Sting"] and isTargetDebuffExist("Viper Sting") == false then
			CastSpellByName("Viper Sting")
		elseif spellCooldown["Arcane Shot"] then
			CastSpellByName("Arcane Shot")
		elseif not IsAutoRepeatAction(spellSlots["Auto Shot"]) then
			CastSpellByName("Auto Shot")
		elseif isTargetDebuffExist("Hunter's Mark") == false and range>1 then
			CastSpellByName("Hunter's Mark")	
		end
	end,
	["Shaman"]=function()
		PetFuck()
		TargetByName("Grounding Totem",1)
		if moving==true and spellCooldown["Concussive Shot"] and isTargetDebuffExist("Wing Clip")==false then
			CastSpellByName("Concussive Shot")
		elseif not moving and spellCooldown["Multi-Shot"] then
			CastSpellByName("Multi-Shot")
		elseif GetTime()>dotEndTime["Viper Sting"] and isTargetDebuffExist("Viper Sting") == false then
			CastSpellByName("Viper Sting")
		elseif spellCooldown["Arcane Shot"] then
			CastSpellByName("Arcane Shot")
		elseif not IsAutoRepeatAction(spellSlots["Auto Shot"]) then
			CastSpellByName("Auto Shot")
		elseif isTargetDebuffExist("Hunter's Mark") == false and range>1 then
			CastSpellByName("Hunter's Mark")	
		end
	end,
	["Warlock"]=function()
		PetFuck()
		if moving==true and spellCooldown["Concussive Shot"] and isTargetDebuffExist("Wing Clip")==false then
			CastSpellByName("Concussive Shot")
		elseif not moving and spellCooldown["Multi-Shot"] then
			CastSpellByName("Multi-Shot")
		elseif GetTime()>dotEndTime["Viper Sting"] and isTargetDebuffExist("Viper Sting") == false then
			CastSpellByName("Viper Sting")
		elseif spellCooldown["Arcane Shot"] then
			CastSpellByName("Arcane Shot")
		elseif not IsAutoRepeatAction(spellSlots["Auto Shot"]) then
			CastSpellByName("Auto Shot")
		elseif isTargetDebuffExist("Hunter's Mark") == false and range>1 then
			CastSpellByName("Hunter's Mark")	
		end
	end,
	["Druid"]=function()
		PetFuck()
		if moving==true and spellCooldown["Concussive Shot"] and isTargetDebuffExist("Wing Clip")==false then
			CastSpellByName("Concussive Shot")
		elseif not moving and spellCooldown["Multi-Shot"] then
			CastSpellByName("Multi-Shot")
		elseif GetTime()>dotEndTime["Viper Sting"] and isTargetDebuffExist("Viper Sting") == false and UnitManaMax("target") > 2000 then
			CastSpellByName("Viper Sting")
		elseif spellCooldown["Arcane Shot"] then
			CastSpellByName("Arcane Shot")
		elseif not IsAutoRepeatAction(spellSlots["Auto Shot"]) then
			CastSpellByName("Auto Shot")
		elseif isTargetDebuffExist("Hunter's Mark") == false and range>1 then
			CastSpellByName("Hunter's Mark")	
		end
	end,
	["Paladin"]=function()
		if not moving and spellCooldown["Multi-Shot"] then
			CastSpellByName("Multi-Shot")
		elseif GetTime()>dotEndTime["Viper Sting"] and isTargetDebuffExist("Viper Sting") == false then
			CastSpellByName("Viper Sting")
		elseif spellCooldown["Arcane Shot"] then
			CastSpellByName("Arcane Shot")
		elseif not IsAutoRepeatAction(spellSlots["Auto Shot"]) then
			CastSpellByName("Auto Shot")
		elseif isTargetDebuffExist("Hunter's Mark") == false and range>1 then
			CastSpellByName("Hunter's Mark")	
		end
	end,
}