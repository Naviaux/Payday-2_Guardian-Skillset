local data = PlayerTweakData.init
function PlayerTweakData:init()
	data(self)
	
	self.standing_armor = {}
	self.standing_armor.start_t = 5
	self.standing_suppress_resist = {}
	self.standing_suppress_resist.start_t = 3
	self.standing_armor_delay = {}
	self.standing_armor_delay.start_t = 5
	self.standing_critical_chance = {}
	self.standing_critical_chance.start_t = 1
	self.standing_critical_chance.interval_t = 1
	self.standing_critical_chance.max_crit = 30
	self.standing_damage = {}
	self.standing_damage.start_t = 5
	self.ammo_buff = {}
	self.ammo_buff.start_t = 5
	self.ammo_buff.interval_t = 1
	self.player_movespeed_buff = {}
	self.player_movespeed_buff.start_t = 5
end