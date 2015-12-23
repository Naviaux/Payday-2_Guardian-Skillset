local data = SkillTreeTweakData.init
function SkillTreeTweakData:init(tweark_data)
	data(self, tweark_data)
	
	self.skills.guardian = {}
	self.skills.guardian.name_id = "m_guardian"
	self.skills.unlock_guardian = {
		["name_id"] = "unlock_guardian",
		["desc_id"] = "unlock_guardian_desc",
		["texture"] = "guis/textures/lgl_logo",
		["icon_xy"] = {0, 0},
		[1] = {
			upgrades = {
				"player_consumption_chance1"
			},
			cost = self.costs.unlock_tree,
			desc_id = "guardian_tier1"
		},
		[2] = { upgrades = { "player_consumption_chance2" }, desc_id = "guardian_tier2"},
		[3] = { upgrades = { "player_consumption_chance3" }, desc_id = "guardian_tier3"},
		[4] = { upgrades = { "player_consumption_chance4" }, desc_id = "guardian_tier4"},
		[5] = { upgrades = { "player_consumption_chance5" }, desc_id = "guardian_tier5"},
		[6] = { upgrades = { "player_consumption_chance6" }, desc_id = "guardian_tier6"}
	}
	
	-- TIER 1	[ -- ]	LEFT --
	self.skills.g_left1 = {
		["name_id"] = "g_left1",
		["desc_id"] = "g_left1_desc",
		["texture"] = "guis/textures/lgl_logo",
		["icon_xy"] = {0, 0},
		[1] = {
			upgrades = {
				"lmg_reload_speed"
			},
			cost = self.costs.default
		},
		[2] = {
			upgrades = {
				"lmg_firerate"
			},
			cost = self.costs.pro
		}
	}
	
	-- TIER 2	[ -- ]	LEFT --
	self.skills.g_left2 = {
		["name_id"] = "g_left2",
		["desc_id"] = "g_left2_desc",
		["texture"] = "guis/textures/lgl_logo",
		["icon_xy"] = {0, 0},
		[1] = {
			upgrades = {
				"tmp_standing_armor_bonus1"
			},
			cost = self.costs.default
		},
		[2] = {
			upgrades = {
				"tmp_standing_armor_bonus2"
			},
			cost = self.costs.pro
		}
	}
	
	-- TIER 3	[ -- ]	LEFT --
	self.skills.g_left3 = {
		["name_id"] = "g_left3",
		["desc_id"] = "g_left3_desc",
		["texture"] = "guis/textures/lgl_logo",
		["icon_xy"] = {0, 0},
		[1] = {
			upgrades = {
				"player_silent_kill"
			},
			cost = self.costs.default
		},
		[2] = {
			upgrades = {
				"player_silent_kill"
			},
			cost = self.costs.pro
		}
	}
	
	-- TIER 4	[ -- ]	LEFT --
	self.skills.g_left4 = {
		["name_id"] = "g_left4",
		["desc_id"] = "g_left4_desc",
		["texture"] = "guis/textures/lgl_logo",
		["icon_xy"] = {0, 0},
		[1] = {
			upgrades = {
				"player_silent_kill"
			},
			cost = self.costs.hightier
		},
		[2] = {
			upgrades = {
				"player_silent_kill"
			},
			cost = self.costs.hightierpro
		}
	}
	
	-- TIER 5	[ -- ]	LEFT --
	self.skills.g_left5 = {
		["name_id"] = "g_left5",
		["desc_id"] = "g_left5_desc",
		["texture"] = "guis/textures/lgl_logo",
		["icon_xy"] = {0, 0},
		[1] = {
			upgrades = {
				"player_silent_kill"
			},
			cost = self.costs.hightier
		},
		[2] = {
			upgrades = {
				"player_silent_kill"
			},
			cost = self.costs.hightierpro
		}
	}
	
	-- TIER 6	[ -- ]	LEFT --
	self.skills.g_left6 = {
		["name_id"] = "g_left6",
		["desc_id"] = "g_left6_desc",
		["texture"] = "guis/textures/lgl_logo",
		["icon_xy"] = {0, 0},
		[1] = {
			upgrades = {
				"player_silent_kill"
			},
			cost = self.costs.hightier
		},
		[2] = {
			upgrades = {
				"player_silent_kill"
			},
			cost = self.costs.hightierpro
		}
	}

	-- TIER 1	[ -- ]	MIDDLE --
	self.skills.g_middle1 = {
		["name_id"] = "g_middle1",
		["desc_id"] = "g_middle1_desc",
		["texture"] = "guis/textures/lgl_logo",
		["icon_xy"] = {0, 0},
		[1] = {
			upgrades = {
				"player_crit_chance_1"
			},
			cost = self.costs.default
		},
		[2] = {
			upgrades = {
				"player_crit_chance_2"
			},
			cost = self.costs.pro
		}
	}
	
	-- TIER 2	[ -- ]	MIDDLE --
	self.skills.g_middle2 = {
		["name_id"] = "g_middle2",
		["desc_id"] = "g_middle2_desc",
		["texture"] = "guis/textures/lgl_logo",
		["icon_xy"] = {0, 0},
		[1] = {
			upgrades = {
				"hostage_armor_increase_1"
			},
			cost = self.costs.default
		},
		[2] = {
			upgrades = {
				"hostage_armor_increase_2"
			},
			cost = self.costs.pro
		}
	}
	
	-- TIER 3	[ -- ]	MIDDLE --
	self.skills.g_middle3 = {
		["name_id"] = "g_middle3",
		["desc_id"] = "g_middle3_desc",
		["texture"] = "guis/textures/lgl_logo",
		["icon_xy"] = {0, 0},
		[1] = {
			upgrades = {
				"tmp_standing_damage_bonus1"
			},
			cost = self.costs.default
		},
		[2] = {
			upgrades = {
				"tmp_standing_damage_bonus2"
			},
			cost = self.costs.pro
		}
	}
	
	-- TIER 4	[ -- ]	MIDDLE --
	self.skills.g_middle4 = {
		["name_id"] = "g_middle4",
		["desc_id"] = "g_middle4_desc",
		["texture"] = "guis/textures/lgl_logo",
		["icon_xy"] = {0, 0},
		[1] = {
			upgrades = {
				"player_silent_kill"
			},
			cost = self.costs.hightier
		},
		[2] = {
			upgrades = {
				"player_silent_kill"
			},
			cost = self.costs.hightierpro
		}
	}
	
	-- TIER 5	[ -- ]	MIDDLE --
	self.skills.g_middle5 = {
		["name_id"] = "g_middle5",
		["desc_id"] = "g_middle5_desc",
		["texture"] = "guis/textures/lgl_logo",
		["icon_xy"] = {0, 0},
		[1] = {
			upgrades = {
				"player_silent_kill"
			},
			cost = self.costs.hightier
		},
		[2] = {
			upgrades = {
				"player_silent_kill"
			},
			cost = self.costs.hightierpro
		}
	}
	
	-- TIER 6	[ -- ]	MIDDLE --
	self.skills.g_middle6 = {
		["name_id"] = "g_middle6",
		["desc_id"] = "g_middle6_desc",
		["texture"] = "guis/textures/lgl_logo",
		["icon_xy"] = {0, 0},
		[1] = {
			upgrades = {
				"player_silent_kill"
			},
			cost = self.costs.hightier
		},
		[2] = {
			upgrades = {
				"player_silent_kill"
			},
			cost = self.costs.hightierpro
		}
	}
	
	-- TIER 1	[ -- ]	RIGHT --
	self.skills.g_right1 = {
		["name_id"] = "g_right1",
		["desc_id"] = "g_right1_desc",
		["texture"] = "guis/textures/lgl_logo",
		["icon_xy"] = {0, 0},
		[1] = {
			upgrades = {
				"lmg_damage_addend"
			},
			cost = self.costs.default
		},
		[2] = {
			upgrades = {
				"lmg_damage_multi"
			},
			cost = self.costs.pro
		}
	}
	
	-- TIER 2	[ -- ]	RIGHT --
	self.skills.g_right2 = {
		["name_id"] = "g_right2",
		["desc_id"] = "g_right2_desc",
		["texture"] = "guis/textures/lgl_logo",
		["icon_xy"] = {0, 0},
		[1] = {
			upgrades = {
				"tmp_armor_delay_multiplier"
			},
			cost = self.costs.default
		},
		[2] = {
			upgrades = {
				"tmp_standing_suppression_resist"
			},
			cost = self.costs.pro
		}
	}
	
	-- TIER 3	[ -- ]	RIGHT --
	self.skills.g_right3 = {
		["name_id"] = "g_right3",
		["desc_id"] = "g_right3_desc",
		["texture"] = "guis/textures/lgl_logo",
		["icon_xy"] = {0, 0},
		[1] = {
			upgrades = {
				"player_ammo_pickup_multiplier1",
				"tmp_all_pickups_have_multiplier2"
			},
			cost = self.costs.default
		},
		[2] = {
			upgrades = {
				"player_ammo_pickup_multiplier2"
			},
			cost = self.costs.pro
		}
	}
	
	-- TIER 4	[ -- ]	RIGHT --
	self.skills.g_right4 = {
		["name_id"] = "g_right4",
		["desc_id"] = "g_right4_desc",
		["texture"] = "guis/textures/lgl_logo",
		["icon_xy"] = {0, 0},
		[1] = {
			upgrades = {
				"player_silent_kill"
			},
			cost = self.costs.hightier
		},
		[2] = {
			upgrades = {
				"player_silent_kill"
			},
			cost = self.costs.hightierpro
		}
	}
	
	-- TIER 5	[ -- ]	RIGHT --
	self.skills.g_right5 = {
		["name_id"] = "g_right5",
		["desc_id"] = "g_right5_desc",
		["texture"] = "guis/textures/lgl_logo",
		["icon_xy"] = {0, 0},
		[1] = {
			upgrades = {
				"player_silent_kill"
			},
			cost = self.costs.hightier
		},
		[2] = {
			upgrades = {
				"player_silent_kill"
			},
			cost = self.costs.hightierpro
		}
	}
	
	-- TIER 6	[ -- ]	RIGHT --
	self.skills.g_right6 = {
		["name_id"] = "g_right6",
		["desc_id"] = "g_right6_desc",
		["texture"] = "guis/textures/lgl_logo",
		["icon_xy"] = {0, 0},
		[1] = {
			upgrades = {
				"player_silent_kill"
			},
			cost = self.costs.hightier
		},
		[2] = {
			upgrades = {
				"player_silent_kill"
			},
			cost = self.costs.hightierpro
		}
	}
	local n = #self.trees + 1
	self.trees[n] = {
		name_id = "guardian_st",
		skill = "unlock_guardian",
		background_texture = "guis/textures/505games_df",
		tiers = {}
	}
	self.trees[n].tiers[1] = {
		"g_left1",
		"g_middle1",
		"g_right1"
	}
	self.trees[n].tiers[2] = {
		"g_left2",
		"g_middle2",
		"g_right2"
	}
	self.trees[n].tiers[3] = {
		"g_left3",
		"g_middle3",
		"g_right3"
	}
	self.trees[n].tiers[4] = {
		"g_left4",
		"g_middle4",
		"g_right4"
	}
	self.trees[n].tiers[5] = {
		"g_left5",
		"g_middle5",
		"g_right5"
	}
	self.trees[n].tiers[6] = {
		"g_left6",
		"g_middle6",
		"g_right6"
	}
	
end