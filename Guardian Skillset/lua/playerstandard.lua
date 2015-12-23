Hooks:PostHook(PlayerStandard, "update", "Guardian_PlayerStandardUpdate", function(self, t, dt)
	self:_update_standing_armor_bonus(self, t, dt)
	self:_update_standing_suppression_resist(self, t, dt)
	self:_update_armor_delay(self, t, dt)
	self:_update_critical_chance(self, t, dt)
	self:_update_standing_damage(self, t, dt)
	self:_update_ammo_buff(self, t, dt)
	self:_update_movespeed_bonus(self, t, dt)
end)

function PlayerStandard:_update_movespeed_bonus(self, t, dt)
	local action_forbidden = not managers.player:has_category_upgrade("temporary", "player_movespeed_bonus") or self:_on_zipline() or self._moving or self:running() or self:in_air() or not tweak_data.player.player_movespeed_buff
	if action_forbidden then
		if self._state_data.standing_ms_t then
			self._state_data.standing_ms_t = nil
		end
		return
	end
	self._state_data.standing_ms_t = self._state_data.standing_ms_t or t + tweak_data.player.player_movespeed_buff.start_t
	if t >= self._state_data.standing_ms_t then
		managers.player:activate_temporary_upgrade("temporary", "player_movespeed_bonus")
	end
end

function PlayerStandard:_update_standing_damage(self, t, dt)
	local action_forbidden = not managers.player:has_category_upgrade("temporary", "standing_damage_bonus") or managers.player:current_state() == "civilian" or self:_interacting() or self:is_deploying() or self:_on_zipline() or self._moving or self:running() or self:in_air() or not tweak_data.player.standing_damage
	if action_forbidden then
		if self._state_data.standing_damage_t then
			self._state_data.standing_damage_t = nil
		end
		return
	end
	self._state_data.standing_damage_t = self._state_data.standing_damage_t or t + tweak_data.player.standing_damage.start_t
	if t >= self._state_data.standing_damage_t then
		managers.player:activate_temporary_upgrade("temporary", "standing_damage_bonus")
	end
end

function PlayerStandard:_update_standing_armor_bonus(self, t, dt)
	local action_forbidden = not managers.player:has_category_upgrade("temporary", "standing_armor_bonus") or managers.player:current_state() == "civilian" or self:_interacting() or self:is_deploying() or self:_on_zipline() or self._moving or self:running() or self:in_air() or not tweak_data.player.standing_armor
	
	if action_forbidden then
		if self._state_data.standing_armor_t then
			self._state_data.standing_armor_t = nil
		end
		return
	end
	self._state_data.standing_armor_t = self._state_data.standing_armor_t or t + tweak_data.player.standing_armor.start_t
	if t >= self._state_data.standing_armor_t then
		managers.player:activate_temporary_upgrade("temporary", "standing_armor_bonus")
	end
end

function PlayerStandard:_update_standing_suppression_resist(self, t, dt)
	local action_forbidden = not managers.player:has_category_upgrade("temporary", "standing_suppression_resist") or managers.player:current_state() == "civilian" or self:_interacting() or self:is_deploying() or self:_on_zipline() or self._moving or self:running() or self:in_air() or not tweak_data.player.standing_suppress_resist
	if action_forbidden then
		if self._state_data.standing_suppress_t then
			self._state_data.standing_suppress_t = nil
		end
		return
	end
	self._state_data.standing_suppress_t = self._state_data.standing_suppress_t or t + tweak_data.player.standing_suppress_resist.start_t
	if t >= self._state_data.standing_suppress_t then
		managers.player:activate_temporary_upgrade("temporary", "standing_suppression_resist")
	end
end

function PlayerStandard:_update_armor_delay(self, t, dt)
	local action_forbidden = not managers.player:has_category_upgrade("temporary", "standing_armor_delay_multiplier") or managers.player:current_state() == "civilian" or self:_on_zipline() or self._moving or self:running() or self:in_air() or not tweak_data.player.standing_armor_delay
	if action_forbidden then
		if self._state_data.standing_armor_delay_t then
			self._state_data.standing_armor_delay_t = nil
		end
		return
	end
	self._state_data.standing_armor_delay_t = self._state_data.standing_armor_delay_t or t + tweak_data.player.standing_armor_delay.start_t
	if t >= self._state_data.standing_armor_delay_t then
		managers.player:activate_temporary_upgrade("temporary", "standing_armor_delay_multiplier")
	end
end

function PlayerStandard:_update_critical_chance(self, t, dt)
	local action_forbidden = not managers.player:has_category_upgrade("player", "critical_chance") or managers.player:current_state() == "civilian" or self:_interacting() or self:is_deploying() or self:_on_zipline() or self._moving or self:running() or self:in_air() or not tweak_data.player.standing_critical_chance
	if action_forbidden then
		if self._state_data.standing_crit_t then
			self._state_data.standing_crit_t = nil
			self._state_data.crit_number = nil
			self._state_data.crit_inc = nil
			managers.player:crit_increase(0)
		end
		return
	end
	if self._state_data.crit_number then
		if self._state_data.crit_number < #managers.player:upgrade_value("player", "critical_chance") and self._state_data.crit_inc == true then
			self._state_data.crit_number = self._state_data.crit_number + 1
			self._state_data.standing_crit_t = self._state_data.standing_crit_t + tweak_data.player.standing_critical_chance.interval_t
			self._state_data.crit_inc = false
		else
			self._state_data.standing_crit_t = self._state_data.standing_crit_t
		end
	else
		self._state_data.crit_number = 1
		self._state_data.crit_inc = false
		self._state_data.standing_crit_t = self._state_data.standing_crit_t or t + tweak_data.player.standing_critical_chance.start_t
	end
	if t >= self._state_data.standing_crit_t then
		managers.player:crit_increase(managers.player:upgrade_value("player", "critical_chance")[self._state_data.crit_number])
		self._state_data.crit_inc = true
	end
end

function PlayerStandard:_update_ammo_buff(self, t, dt)
	local action_forbidden = not managers.player:has_category_upgrade("player", "ammo_pickup_multiplier") or managers.player:current_state() == "civilian" or self:_interacting() or self:is_deploying() or self:_on_zipline() or self._moving or self:running() or self:in_air() or not tweak_data.player.ammo_buff
	if action_forbidden then
		if self._state_data.ammo_buff_t then
			self._state_data.ammo_buff_t = nil
			self._state_data.ammo_buff_interval = nil
			self._state_data.ammo_buff_maxed = nil
		end
		return
	end
	if self._state_data.ammo_buff_interval then
		if self._state_data.ammo_buff_interval == true then
			if managers.player:get_ammo_multiplier() < managers.player:upgrade_value("player", "ammo_pickup_multiplier")[2] then
				self._state_data.ammo_buff_t = self._state_data.ammo_buff_t + tweak_data.player.ammo_buff.interval_t
				self._state_data.ammo_buff_interval = false
			else
				self._state_data.ammo_buff_t = self._state_data.ammo_buff_t
				self._state_data.ammo_buff_maxed = true
			end
		else
			self._state_data.ammo_buff_t = self._state_data.ammo_buff_t
		end
	else
		self._state_data.ammo_buff_t = self._state_data.ammo_buff_t or t + tweak_data.player.ammo_buff.start_t
		self._state_data.ammo_buff_interval = false
		self._state_data.ammo_buff_maxed = not (managers.player:get_ammo_multiplier() < managers.player:upgrade_value("player", "ammo_pickup_multiplier")[2])
	end
	if t >= self._state_data.ammo_buff_t and self._state_data.ammo_buff_maxed ~= true then
		self._state_data.ammo_buff_interval = true
		managers.player:set_ammo_multiplier(managers.player:get_ammo_multiplier() + managers.player:upgrade_value("player", "ammo_pickup_multiplier")[1])
	end
end

function PlayerStandard:_check_action_primary_attack(t, input)
	local new_action
	local action_wanted = input.btn_primary_attack_state or input.btn_primary_attack_release
	if action_wanted then
		local action_forbidden = self:_is_reloading() or self:_changing_weapon() or self:_is_meleeing() or self._use_item_expire_t or self:_interacting() or self:_is_throwing_projectile() or self:_is_deploying_bipod()
		if not action_forbidden then
			self._queue_reload_interupt = nil
			self._ext_inventory:equip_selected_primary(false)
			if self._equipped_unit then
				local weap_base = self._equipped_unit:base()
				local fire_mode = weap_base:fire_mode()
				local fire_on_release = weap_base:fire_on_release()
				if weap_base:out_of_ammo() then
					if input.btn_primary_attack_press then
						weap_base:dryfire()
					end
				elseif weap_base.clip_empty and weap_base:clip_empty() then
					if self:_is_using_bipod() then
						if input.btn_primary_attack_press then
							weap_base:dryfire()
						end
						self._equipped_unit:base():tweak_data_anim_stop("fire")
					elseif fire_mode == "single" then
						if input.btn_primary_attack_press then
							self:_start_action_reload_enter(t)
						end
					else
						new_action = true
						self:_start_action_reload_enter(t)
					end
				elseif self._running and not self.RUN_AND_SHOOT then
					self:_interupt_action_running(t)
				else
					if not self._shooting then
						if weap_base:start_shooting_allowed() then
							local start = fire_mode == "single" and input.btn_primary_attack_press
							start = start or fire_mode ~= "single" and input.btn_primary_attack_state
							start = start and not fire_on_release
							start = start or fire_on_release and input.btn_primary_attack_release
							if start then
								weap_base:start_shooting()
								self._camera_unit:base():start_shooting()
								self._shooting = true
								self._shooting_t = t
								if fire_mode == "auto" then
									self._unit:camera():play_redirect(self.IDS_RECOIL_ENTER)
								end
							end
						else
							return false
						end
					end
					local suppression_ratio = self._unit:character_damage():effective_suppression_ratio()
					local spread_mul = math.lerp(1, tweak_data.player.suppression.spread_mul, suppression_ratio)
					local autohit_mul = math.lerp(1, tweak_data.player.suppression.autohit_chance_mul, suppression_ratio)
					local suppression_mul = managers.blackmarket:threat_multiplier()
					local dmg_mul = managers.player:temporary_upgrade_value("temporary", "dmg_multiplier_outnumbered", 1)
					local weapon_category = weap_base:weapon_tweak_data().category
					if managers.player:has_category_upgrade("player", "overkill_all_weapons") or weapon_category == "shotgun" or weapon_category == "saw" then
						dmg_mul = dmg_mul * managers.player:temporary_upgrade_value("temporary", "overkill_damage_multiplier", 1)
					end
					dmg_mul = dmg_mul * managers.player:temporary_upgrade_value("temporary", "standing_damage_bonus", 1)
					local health_ratio = self._ext_damage:health_ratio()
					local damage_health_ratio = managers.player:get_damage_health_ratio(health_ratio, weapon_category)
					if damage_health_ratio > 0 then
						local upgrade_name = weapon_category == "saw" and "melee_damage_health_ratio_multiplier" or "damage_health_ratio_multiplier"
						local damage_ratio = damage_health_ratio
						dmg_mul = dmg_mul * (1 + managers.player:upgrade_value("player", upgrade_name, 0) * damage_ratio)
					end
					dmg_mul = dmg_mul * managers.player:temporary_upgrade_value("temporary", "berserker_damage_multiplier", 1)
					if managers.player:has_category_upgrade(weapon_category, "stacking_hit_damage_multiplier") then
						self._state_data.stacking_dmg_mul = self._state_data.stacking_dmg_mul or {}
						self._state_data.stacking_dmg_mul[weapon_category] = self._state_data.stacking_dmg_mul[weapon_category] or {nil, 0}
						local stack = self._state_data.stacking_dmg_mul[weapon_category]
						if stack[1] and t < stack[1] then
							dmg_mul = dmg_mul * (1 + managers.player:upgrade_value(weapon_category, "stacking_hit_damage_multiplier", 0) * stack[2])
						else
							stack[2] = 0
						end
					end
					local fired
					if fire_mode == "single" then
						if input.btn_primary_attack_press then
							fired = weap_base:trigger_pressed(self:get_fire_weapon_position(), self:get_fire_weapon_direction(), dmg_mul, nil, spread_mul, autohit_mul, suppression_mul)
						elseif fire_on_release then
							if input.btn_primary_attack_release then
								fired = weap_base:trigger_released(self:get_fire_weapon_position(), self:get_fire_weapon_direction(), dmg_mul, nil, spread_mul, autohit_mul, suppression_mul)
							elseif input.btn_primary_attack_state then
								weap_base:trigger_held(self:get_fire_weapon_position(), self:get_fire_weapon_direction(), dmg_mul, nil, spread_mul, autohit_mul, suppression_mul)
							end
						end
					elseif input.btn_primary_attack_state then
						fired = weap_base:trigger_held(self:get_fire_weapon_position(), self:get_fire_weapon_direction(), dmg_mul, nil, spread_mul, autohit_mul, suppression_mul)
					end
					if weap_base.manages_steelsight and weap_base:manages_steelsight() then
						if weap_base:wants_steelsight() and not self._state_data.in_steelsight then
							self:_start_action_steelsight(t)
						elseif not weap_base:wants_steelsight() and self._state_data.in_steelsight then
							self:_end_action_steelsight(t)
						end
					end
					local charging_weapon = fire_on_release and weap_base:charging()
					if not self._state_data.charging_weapon and charging_weapon then
						self:_start_action_charging_weapon(t)
					elseif self._state_data.charging_weapon and not charging_weapon then
						self:_end_action_charging_weapon(t)
					end
					new_action = true
					if fired then
						managers.rumble:play("weapon_fire")
						local weap_tweak_data = tweak_data.weapon[weap_base:get_name_id()]
						local shake_multiplier = weap_tweak_data.shake[self._state_data.in_steelsight and "fire_steelsight_multiplier" or "fire_multiplier"]
						self._ext_camera:play_shaker("fire_weapon_rot", 1 * shake_multiplier)
						self._ext_camera:play_shaker("fire_weapon_kick", 1 * shake_multiplier, 1, 0.15)
						self._equipped_unit:base():tweak_data_anim_stop("unequip")
						self._equipped_unit:base():tweak_data_anim_stop("equip")
						if not self._state_data.in_steelsight or not weap_base:tweak_data_anim_play("fire_steelsight", weap_base:fire_rate_multiplier()) then
							weap_base:tweak_data_anim_play("fire", weap_base:fire_rate_multiplier())
						end
						if fire_mode == "single" and weap_base:get_name_id() ~= "saw" then
							if not self._state_data.in_steelsight then
								self._ext_camera:play_redirect(self.IDS_RECOIL, 1)
							elseif weap_tweak_data.animations.recoil_steelsight then
								self._ext_camera:play_redirect(weap_base:is_second_sight_on() and self.IDS_RECOIL or self.IDS_RECOIL_STEELSIGHT, 1)
							end
						end
						local recoil_multiplier = (weap_base:recoil() + weap_base:recoil_addend()) * weap_base:recoil_multiplier()
						cat_print("jansve", "[PlayerStandard] Weapon Recoil Multiplier: " .. tostring(recoil_multiplier))
						local up, down, left, right = unpack(weap_tweak_data.kick[self._state_data.in_steelsight and "steelsight" or self._state_data.ducking and "crouching" or "standing"])
						self._camera_unit:base():recoil_kick(up * recoil_multiplier, down * recoil_multiplier, left * recoil_multiplier, right * recoil_multiplier)
						if self._shooting_t then
							local time_shooting = t - self._shooting_t
							local achievement_data = tweak_data.achievement.never_let_you_go
							if achievement_data and weap_base:get_name_id() == achievement_data.weapon_id and time_shooting >= achievement_data.timer then
								managers.achievment:award(achievement_data.award)
								self._shooting_t = nil
							end
						end
						if managers.player:has_category_upgrade(weapon_category, "stacking_hit_damage_multiplier") then
							self._state_data.stacking_dmg_mul = self._state_data.stacking_dmg_mul or {}
							self._state_data.stacking_dmg_mul[weapon_category] = self._state_data.stacking_dmg_mul[weapon_category] or {nil, 0}
							local stack = self._state_data.stacking_dmg_mul[weapon_category]
							if fired.hit_enemy then
								stack[1] = t + managers.player:upgrade_value(weapon_category, "stacking_hit_expire_t", 1)
								stack[2] = math.min(stack[2] + 1, tweak_data.upgrades.max_weapon_dmg_mul_stacks or 5)
							else
								stack[1] = nil
								stack[2] = 0
							end
						end
						if weap_base.set_recharge_clbk then
							weap_base:set_recharge_clbk(callback(self, self, "weapon_recharge_clbk_listener"))
						end
						managers.hud:set_ammo_amount(weap_base:selection_index(), weap_base:ammo_info())
						local impact = not fired.hit_enemy
						if weap_base.third_person_important and weap_base:third_person_important() then
							self._ext_network:send("shot_blank_reliable", impact)
						else
							self._ext_network:send("shot_blank", impact)
						end
					elseif fire_mode == "single" then
						new_action = false
					end
				end
			end
		elseif self:_is_reloading() and self._equipped_unit:base():reload_interuptable() and input.btn_primary_attack_press then
			self._queue_reload_interupt = true
		end
	else
	end
	if not new_action then
		self:_check_stop_shooting()
	end
	return new_action
end