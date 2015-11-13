function RaycastWeaponBase:fire(from_pos, direction, dmg_mul, shoot_player, spread_mul, autohit_mul, suppr_mul, target_unit)
	if managers.player:has_activate_temporary_upgrade("temporary", "no_ammo_cost_buff") then
		managers.player:deactivate_temporary_upgrade("temporary", "no_ammo_cost_buff")
		if managers.player:has_category_upgrade("temporary", "no_ammo_cost") then
			managers.player:activate_temporary_upgrade("temporary", "no_ammo_cost")
		end
	end
	local consume_ammo = self:weapon_tweak_data().category == "grenade_launcher"
	consume_ammo = consume_ammo or not managers.player:has_activate_temporary_upgrade("temporary", "no_ammo_cost") and (not managers.player:has_activate_temporary_upgrade("temporary", "berserker_damage_multiplier") or not managers.player:has_category_upgrade("player", "berserker_no_ammo_cost"))
	if consume_ammo then
		local base = self.parent_weapon and self.parent_weapon:base() or self
		if base:get_ammo_remaining_in_clip() == 0 then
			return
		end
		local ammo_usage = 1
		if managers.player:has_category_upgrade(self:weapon_tweak_data().category, "consume_no_ammo_chance") then
			local roll = math.rand(1)
			local chance = managers.player:upgrade_value(self:weapon_tweak_data().category, "consume_no_ammo_chance", 0)
			if roll < chance then
				ammo_usage = 0
				print("NO AMMO COST")
			end
		elseif managers.player:has_category_upgrade("player", "consumption_chance") then
			local roll = math.rand(1)
			local chance = managers.player:upgrade_value("player", "consumption_chance", 0)
			if roll < chance then
				ammo_usage = 0
			end
		end
		base:set_ammo_remaining_in_clip(base:get_ammo_remaining_in_clip() - ammo_usage)
		base:set_ammo_total(base:get_ammo_total() - ammo_usage)
	end
	local user_unit = self._setup.user_unit
	self:_check_ammo_total(user_unit)
	if alive(self._obj_fire) then
		self:_spawn_muzzle_effect(from_pos, direction)
	end
	if self._use_shell_ejection_effect then
		World:effect_manager():spawn(self._shell_ejection_effect_table)
	end
	local ray_res = self:_fire_raycast(user_unit, from_pos, direction, dmg_mul, shoot_player, spread_mul, autohit_mul, suppr_mul, target_unit)
	if self._alert_events and ray_res.rays then
		self:_check_alert(ray_res.rays, from_pos, direction, user_unit)
	end
	if ray_res.enemies_in_cone then
		for enemy_data, dis_error in pairs(ray_res.enemies_in_cone) do
			if not enemy_data.unit:movement():cool() then
				enemy_data.unit:character_damage():build_suppression(suppr_mul * dis_error * self._suppression, self._panic_suppression_chance)
			end
		end
	end
	return ray_res
end