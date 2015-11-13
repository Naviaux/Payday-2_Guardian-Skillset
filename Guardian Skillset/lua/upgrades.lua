local data = UpgradesTweakData.init
function UpgradesTweakData:init(tweak_data)
	data(self, tweak_data)
	
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
	
end