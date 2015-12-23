function PlayerManager:_update_hostage_skills()
	if self._hostage_skills_update then
		if self:get_hostage_bonus_multiplier("health") ~= 1 then
			local player_unit = self:player_unit()
			if alive(player_unit) then
				local damage_ext = player_unit:character_damage()
				if damage_ext then
					damage_ext:change_health(0)
				end
			end
		end
		if self:get_hostage_bonus_multiplier("armor") ~= 1 then
			self.hostage_armor = self:get_hostage_bonus_multiplier("armor")
		else
			self.hostage_armor = nil
		end
		self._hostage_skills_update = nil
	end
end
function PlayerManager:body_armor_skill_multiplier(override_armor)
	local multiplier = 1
	multiplier = multiplier + self:upgrade_value("player", "tier_armor_multiplier", 1) - 1
	multiplier = multiplier + self:upgrade_value("player", "passive_armor_multiplier", 1) - 1
	multiplier = multiplier + self:upgrade_value("player", "armor_multiplier", 1) - 1
	multiplier = multiplier + self:team_upgrade_value("armor", "multiplier", 1) - 1
	multiplier = multiplier + self:get_hostage_bonus_multiplier("armor") - 1
	multiplier = multiplier + self:upgrade_value("player", "perk_armor_loss_multiplier", 1) - 1
	multiplier = multiplier + self:upgrade_value("player", tostring(override_armor or managers.blackmarket:equipped_armor(true, true)) .. "_armor_multiplier", 1) - 1
	multiplier = multiplier + self:temporary_upgrade_value("temporary", "standing_armor_bonus")
	if self.hostage_armor then
		multiplier = multiplier + self.hostage_armor - 1
		log(tostring(self.hostage_armor) .. " " .. tostring(multiplier))
	end
	return multiplier
end

function PlayerManager:critical_hit_chance()
	local multiplier = 0
	multiplier = multiplier + self:upgrade_value("player", "critical_hit_chance", 0)
	multiplier = multiplier + self:upgrade_value("weapon", "critical_hit_chance", 0)
	multiplier = multiplier + self:team_upgrade_value("critical_hit", "chance", 0)
	multiplier = multiplier + self:get_hostage_bonus_multiplier("critical_hit") - 1
	local detection_risk_add_crit_chance = managers.player:upgrade_value("player", "detection_risk_add_crit_chance")
	multiplier = multiplier + self:get_value_from_risk_upgrade(detection_risk_add_crit_chance)
	if self.critical_mult then
		multiplier = multiplier + self.critical_mult
	end
	return multiplier
end

function PlayerManager:set_ammo_multiplier(value)
	log("SAM: " .. tostring(value))
	self.ammo_mulitplier = value
end

function PlayerManager:get_ammo_multiplier()
	return self.ammo_mulitplier or 1
end

function PlayerManager:start_ammo_timer()
	log("CSAT")
	if self:has_category_upgrade("temporary", "all_pickups_have_multiplier") then
		if not self:has_activate_temporary_upgrade("temporary", "all_pickups_have_multiplier") then
			if self.ammo_timer_is_active then
				log("DSAT")
				self:set_ammo_multiplier(1)
				self.ammo_timer_is_active = false
			else
				log("ASAT")
				self:activate_temporary_upgrade("temporary", "all_pickups_have_multiplier")
				self.ammo_timer_is_active = true
			end
		end
	end
end

function PlayerManager:crit_increase(crit)
	if crit > 0 then
		if self.critical_mult then
			self.critical_mult = crit
		end
		self.critical_mult = crit
	else
		self.critical_mult = nil
	end
end