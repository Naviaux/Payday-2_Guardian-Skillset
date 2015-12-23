function PlayerDamage:set_regenerate_timer_to_max()
	local mul = managers.player:body_armor_regen_multiplier(alive(self._unit) and self._unit:movement():current_state()._moving, self:health_ratio())
	mul = mul * managers.player:temporary_upgrade_value("temporary", "standing_armor_delay_multiplier", 1)
	self._regenerate_timer = tweak_data.player.damage.REGENERATE_TIME * mul
end

function PlayerDamage:build_suppression(amount)
	if self:_chk_suppression_too_soon(amount) then
		return
	end
	local data = self._supperssion_data
	amount = amount * managers.player:upgrade_value("player", "suppressed_multiplier", 1)
	amount = amount * managers.player:temporary_upgrade_value("temporary", "standing_suppression_resist", 1)
	local morale_boost_bonus = self._unit:movement():morale_boost()
	if morale_boost_bonus then
		amount = amount * morale_boost_bonus.suppression_resistance
	end
	amount = amount * tweak_data.player.suppression.receive_mul
	data.value = math.min(tweak_data.player.suppression.max_value, (data.value or 0) + amount * tweak_data.player.suppression.receive_mul)
	self._last_received_sup = amount
	self._next_allowed_sup_t = managers.player:player_timer():time() + self._dmg_interval
	data.decay_start_t = managers.player:player_timer():time() + tweak_data.player.suppression.decay_start_delay
end