local data = UpgradesTweakData.init
function UpgradesTweakData:init(tweak_data)
	data(self, tweak_data)
	
	-- Tier Bonuses --
	self.values.player.consumption_chance = {0.03, 0.06, 0.10, 0.15, 0.21, 0.28}
	self.definitions.player_consumption_chance1 = {
		category = "feature",
		name_id = "consume_1",
		upgrade = {
			category = "player",
			upgrade = "consumption_chance",
			value = 1
		}
	}
	self.definitions.player_consumption_chance2 = {
		category = "feature",
		name_id = "consume_2",
		upgrade = {
			category = "player",
			upgrade = "consumption_chance",
			value = 2
		}
	}
	self.definitions.player_consumption_chance3 = {
		category = "feature",
		name_id = "consume_3",
		upgrade = {
			category = "player",
			upgrade = "consumption_chance",
			value = 3
		}
	}
	self.definitions.player_consumption_chance4 = {
		category = "feature",
		name_id = "consume_4",
		upgrade = {
			category = "player",
			upgrade = "consumption_chance",
			value = 4
		}
	}
	self.definitions.player_consumption_chance5 = {
		category = "feature",
		name_id = "consume_5",
		upgrade = {
			category = "player",
			upgrade = "consumption_chance",
			value = 5
		}
	}
	self.definitions.player_consumption_chance6 = {
		category = "feature",
		name_id = "consume_6",
		upgrade = {
			category = "player",
			upgrade = "consumption_chance",
			value = 6
		}
	}
	
	-- Standing Skills --
	self.values.temporary.standing_armor_bonus = {
		{ 1.2, 1 },
		{ 1.4, 1 }
	}
	self.values.temporary.standing_suppression_resist = {
		{ 0.9, 1 }
	}
	self.values.temporary.standing_armor_delay_multiplier = {
		{ 0.8, 1 }
	}
	self.values.temporary.standing_critical_chance = {
		{ true, 1 },
		{ true, 1 }
	}
	self.values.temporary.standing_damage_bonus = {
		{ 1.15, 1 },
		{ 1.3, 1 }
	}
	self.values.player.ammo_pickup_multiplier = { 
		{0.1, 2},
		{0.2, 4}
	}
	self.values.temporary.all_pickups_have_multiplier = {
		{true, 3},
		{true, 6}
	}
	self.values.temporary.player_movespeed_bonus = {
		{1.75, 2.5},
		{1.75, 5}
	}
	self.definitions.tmp_player_movespeed_bonus1 = {
		category = "temporary",
		name_id = "tmp_player_movespeed_bonus1",
		upgrade = {
			category = "temporary",
			upgrade = "player_movespeed_bonus",
			value = 1
		}
	}
	self.definitions.tmp_player_movespeed_bonus2 = {
		category = "temporary",
		name_id = "tmp_player_movespeed_bonus2",
		upgrade = {
			category = "temporary",
			upgrade = "player_movespeed_bonus",
			value = 2
		}
	}
	self.definitions.tmp_all_pickups_have_multiplier1 = {
		category = "temporary",
		name_id = "tmp_all_pickups_have_multiplier1",
		upgrade = {
			category = "temporary",
			upgrade = "all_pickups_have_multiplier",
			value = 1
		}
	}
	self.definitions.tmp_all_pickups_have_multiplier2 = {
		category = "temporary",
		name_id = "tmp_all_pickups_have_multiplier2",
		upgrade = {
			category = "temporary",
			upgrade = "all_pickups_have_multiplier",
			value = 2
		}
	}
	self.definitions.player_ammo_pickup_multiplier1 = {
		category = "feature",
		name_id = "player_ammo_pickup_multiplier1",
		upgrade = {
			category = "player",
			upgrade = "ammo_pickup_multiplier",
			value = 1
		}
	}
	self.definitions.player_ammo_pickup_multiplier2 = {
		category = "feature",
		name_id = "player_ammo_pickup_multiplier2",
		upgrade = {
			category = "player",
			upgrade = "ammo_pickup_multiplier",
			value = 2
		}
	}
	self.definitions.tmp_standing_damage_bonus1 = {
		category = "feature",
		name_id = "standing_damage1",
		upgrade = {
			category = "temporary",
			upgrade = "standing_damage_bonus",
			value = 1
		}
	}
	self.definitions.tmp_standing_damage_bonus2 = {
		category = "feature",
		name_id = "standing_damage2",
		upgrade = {
			category = "temporary",
			upgrade = "standing_damage_bonus",
			value = 2
		}
	}
	self.definitions.tmp_standing_armor_bonus1 = {
		category = "feature",
		name_id = "standing_armor1",
		upgrade = {
			category = "temporary",
			upgrade = "standing_armor_bonus",
			value = 1
		}
	}
	self.definitions.tmp_standing_armor_bonus2 = {
		category = "feature",
		name_id = "standing_armor2",
		upgrade = {
			category = "temporary",
			upgrade = "standing_armor_bonus",
			value = 2
		}
	}
	self.definitions.tmp_standing_suppression_resist = {
		category = "feature",
		name_id = "standing_suppression_resist",
		upgrade = {
			category = "temporary",
			upgrade = "standing_suppression_resist",
			value = 1
		}
	}
	self.definitions.tmp_armor_delay_multiplier = {
		category = "feature",
		name_id = "standing_armor_delay",
		upgrade = {
			category = "temporary",
			upgrade = "standing_armor_delay_multiplier",
			value = 1
		}
	}
	
	-- Critical Bullshit --
	self.values.player.critical_chance = {
		{0.005, 0.01, 0.015, 0.02, 0.025, 0.03, 0.035, 0.04, 0.045, 0.05, 0.055, 0.06, 0.065, 0.07, 0.075, 0.08, 0.085, 0.09, 0.095, 0.1, 0.105, 0.11, 0.115, 0.12, 0.125, 0.13, 0.135, 0.14, 0.145, 0.15},
		{0.01, 0.02, 0.03, 0.04, 0.05, 0.06, 0.07, 0.08, 0.09, 0.10, 0.11, 0.12, 0.13, 0.14, 0.15--[[, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30]]}
	}
	self.definitions.player_crit_chance_1 = {
		category = "feature",
		name_id = "crit_chance1",
		upgrade = {
			category = "player",
			upgrade = "critical_chance",
			value = 1
		}
	}
	self.definitions.player_crit_chance_2 = {
		category = "feature",
		name_id = "crit_chance2",
		upgrade = {
			category = "player",
			upgrade = "critical_chance",
			value = 2
		}
	}
	
	-- Misc Skills --
	self.values.player.hostage_armor_multiplier = {1.025, 1.05}
	self.definitions.hostage_armor_increase_1 = {
		category = "feature",
		name_id = "hostage_armor_increase",
		upgrade = {
			category = "player",
			upgrade = "hostage_armor_multiplier",
			value = 1
		}
	}
	self.definitions.hostage_armor_increase_2 = {
		category = "feature",
		name_id = "hostage_armor_increase",
		upgrade = {
			category = "player",
			upgrade = "hostage_armor_multiplier",
			value = 2
		}
	}
	
	-- Weapon Skills -
	self.values.lmg.reload_speed_multiplier = {1.2}
	self.values.lmg.fire_rate_multiplier = {1.33}
	self.values.lmg.damage_addend = {1.5}
	self.values.lmg.damage_multiplier = {1.33}
	self.definitions.lmg_reload_speed = {
		category = "feature",
		name_id = "lmg_reload_speed",
		upgrade = {
			category = "lmg",
			upgrade = "reload_speed_multiplier",
			value = 1
		}
	}
	self.definitions.lmg_firerate = {
		category = "feature",
		name_id = "lmg_firerate",
		upgrade = {
			category = "lmg",
			upgrade = "fire_rate_multiplier",
			value = 1
		}
	}
	self.definitions.lmg_damage_addend = {
		category = "feature",
		name_id = "lmg_damage_addend",
		upgrade = {
			category = "lmg",
			upgrade = "damage_addend",
			value = 1
		}
	}
	self.definitions.lmg_damage_multi = {
		category = "feature",
		name_id = "lmg_damage_multi",
		upgrade = {
			category = "lmg",
			upgrade = "damage_multiplier",
			value = 1
		}
	}
end