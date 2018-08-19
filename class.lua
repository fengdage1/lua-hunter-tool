shot = {
	["Others"] = function()
		PetFuck()
		if range == 10 and targetDebuffs["Hunter's Mark"] == false and pveMask then
			CastSpellByName("Hunter's Mark")
		elseif pveSting and GetTime()>dotEndTime["Serpent Sting"] and targetDebuffs["Serpent Sting"] == false then
			CastSpellByName("Serpent Sting")
		elseif not IsAutoRepeatAction(spellSlots["Auto Shot"]) then
			CastSpellByName("Auto Shot")
		elseif moving==true and spellCooldown["Concussive Shot"] and not targetDebuffs["Wing Clip"] then
			CastSpellByName("Concussive Shot")
		elseif spellCooldown["Arcane Shot"] then
			if moving then
				CastSpellByName("Arcane Shot")
			elseif GetTime()- autoShotTime<1 then
				CastSpellByName("Aimed Shot")
			end
		elseif moving == false and spellCooldown["Multi-Shot"] then
			CastSpellByName("Multi-Shot")
		elseif targetDebuffs["Hunter's Mark"] == false and pveMask then
			CastSpellByName("Hunter's Mark")	
		end
	end,
	
	["Warrior"] = function()
		if moving==true and spellCooldown["Concussive Shot"] and not targetDebuffs["Wing Clip"] then
			CastSpellByName("Concussive Shot")
		elseif not moving and spellCooldown["Multi-Shot"] then
			CastSpellByName("Multi-Shot")
		elseif range < 4 and targetDebuffs["Scorpid Sting"] == false then
			CastSpellByName("Scorpid Sting")
		elseif range==5 and GetTime()>dotEndTime["Serpent Sting"] and targetDebuffs["Serpent Sting"] == false then
			CastSpellByName("Serpent Sting")
		elseif spellCooldown["Arcane Shot"] then
			CastSpellByName("Arcane Shot")
		elseif not IsAutoRepeatAction(spellSlots["Auto Shot"]) then
			CastSpellByName("Auto Shot")
		elseif targetDebuffs["Hunter's Mark"] == false and pveMask then
			CastSpellByName("Hunter's Mark")	
		end
	end,
	["Rogue"] = function()
		PetFuck()
		if not moving and spellCooldown["Multi-Shot"] then
			CastSpellByName("Multi-Shot")
		elseif range>2 and GetTime()+5>dotEndTime["Serpent Sting"]then
			CastSpellByName("Serpent Sting")
		elseif moving==true and spellCooldown["Concussive Shot"] and not targetDebuffs["Wing Clip"] then
			CastSpellByName("Concussive Shot")
		elseif spellCooldown["Arcane Shot"] then
			CastSpellByName("Arcane Shot")
		elseif not IsAutoRepeatAction(spellSlots["Auto Shot"]) then
			CastSpellByName("Auto Shot")
		elseif targetDebuffs["Hunter's Mark"] == false and pveMask then
			CastSpellByName("Hunter's Mark")	
		end
	end,
	["Hunter"] = function()
		PetFuck()
		if moving==true and spellCooldown["Concussive Shot"] and not targetDebuffs["Wing Clip"] then
			CastSpellByName("Concussive Shot")
		elseif not moving and spellCooldown["Multi-Shot"] then
			CastSpellByName("Multi-Shot")
		elseif GetTime()>dotEndTime["Serpent Sting"] and targetDebuffs["Serpent Sting"] == false then
			CastSpellByName("Serpent Sting")
		elseif spellCooldown["Arcane Shot"] then
			CastSpellByName("Arcane Shot")
		elseif not IsAutoRepeatAction(spellSlots["Auto Shot"]) then
			CastSpellByName("Auto Shot")
		elseif targetDebuffs["Hunter's Mark"] == false and pveMask then
			CastSpellByName("Hunter's Mark")	
		end
	end,
	["Mage"] = function()
		PetFuck()
		if moving==true and spellCooldown["Concussive Shot"] and not targetDebuffs["Wing Clip"] then
			CastSpellByName("Concussive Shot")
		elseif not moving and spellCooldown["Multi-Shot"] then
			CastSpellByName("Multi-Shot")
		elseif GetTime()>dotEndTime["Viper Sting"] and targetDebuffs["Viper Sting"] == false then
			CastSpellByName("Viper Sting")
		elseif spellCooldown["Arcane Shot"] then
			CastSpellByName("Arcane Shot")
		elseif not IsAutoRepeatAction(spellSlots["Auto Shot"]) then
			CastSpellByName("Auto Shot")
		elseif targetDebuffs["Hunter's Mark"] == false and pveMask then
			CastSpellByName("Hunter's Mark")	
		end
	end,
	["Priest"] = function()
		PetFuck()
		if moving==true and spellCooldown["Concussive Shot"] and not targetDebuffs["Wing Clip"] then
			CastSpellByName("Concussive Shot")
		elseif not moving and spellCooldown["Multi-Shot"] then
			CastSpellByName("Multi-Shot")
		elseif GetTime()>dotEndTime["Viper Sting"] and targetDebuffs["Viper Sting"] == false then
			CastSpellByName("Viper Sting")
		elseif spellCooldown["Arcane Shot"] then
			CastSpellByName("Arcane Shot")
		elseif not IsAutoRepeatAction(spellSlots["Auto Shot"]) then
			CastSpellByName("Auto Shot")
		elseif targetDebuffs["Hunter's Mark"] == false and pveMask then
			CastSpellByName("Hunter's Mark")	
		end
	end,
	["Shaman"]=function()
		PetFuck()
		TargetByName("Grounding Totem",1)
		if moving==true and spellCooldown["Concussive Shot"] and not targetDebuffs["Wing Clip"] then
			CastSpellByName("Concussive Shot")
		elseif not moving and spellCooldown["Multi-Shot"] then
			CastSpellByName("Multi-Shot")
		elseif GetTime()>dotEndTime["Viper Sting"] and targetDebuffs["Viper Sting"] == false then
			CastSpellByName("Viper Sting")
		elseif spellCooldown["Arcane Shot"] then
			CastSpellByName("Arcane Shot")
		elseif not IsAutoRepeatAction(spellSlots["Auto Shot"]) then
			CastSpellByName("Auto Shot")
		elseif targetDebuffs["Hunter's Mark"] == false and pveMask then
			CastSpellByName("Hunter's Mark")	
		end
	end,
	["Warlock"]=function()
		PetFuck()
		if moving==true and spellCooldown["Concussive Shot"] and not targetDebuffs["Wing Clip"] then
			CastSpellByName("Concussive Shot")
		elseif not moving and spellCooldown["Multi-Shot"] then
			CastSpellByName("Multi-Shot")
		elseif GetTime()>dotEndTime["Viper Sting"] and targetDebuffs["Viper Sting"] == false then
			CastSpellByName("Viper Sting")
		elseif spellCooldown["Arcane Shot"] then
			CastSpellByName("Arcane Shot")
		elseif not IsAutoRepeatAction(spellSlots["Auto Shot"]) then
			CastSpellByName("Auto Shot")
		elseif targetDebuffs["Hunter's Mark"] == false and pveMask then
			CastSpellByName("Hunter's Mark")	
		end
	end,
	["Druid"]=function()
		PetFuck()
		if moving==true and spellCooldown["Concussive Shot"] and not targetDebuffs["Wing Clip"] then
			CastSpellByName("Concussive Shot")
		elseif not moving and spellCooldown["Multi-Shot"] then
			CastSpellByName("Multi-Shot")
		elseif GetTime()>dotEndTime["Viper Sting"] and targetDebuffs["Viper Sting"] == false and UnitManaMax("target") > 2000 then
			CastSpellByName("Viper Sting")
		elseif spellCooldown["Arcane Shot"] then
			CastSpellByName("Arcane Shot")
		elseif not IsAutoRepeatAction(spellSlots["Auto Shot"]) then
			CastSpellByName("Auto Shot")
		elseif targetDebuffs["Hunter's Mark"] == false and pveMask then
			CastSpellByName("Hunter's Mark")	
		end
	end,
}

function PetFuck()
	for i=1,6,1 do
		local icon=UnitBuff("pet",i)
		if icon == "Interface\\Icons\\Ability_Druid_SupriseAttack" then
			CastSpellByName("Prowl")
			break
		end
	end
	PetAttack()
end
