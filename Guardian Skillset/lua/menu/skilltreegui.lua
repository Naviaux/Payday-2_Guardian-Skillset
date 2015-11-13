SkillTreeSkillItem = SkillTreeSkillItem or class(SkillTreeItem)
function SkillTreeSkillItem:init(skill_id, tier_panel, num_skills, i, tree, tier, w, h, skill_refresh_skills)
	SkillTreeSkillItem.super.init(self)
	self._skill_id = skill_id
	self._tree = tree
	self._tier = tier
	local skill_panel = tier_panel:panel({
		name = skill_id,
		w = w,
		h = h
	})
	self._skill_panel = skill_panel
	self._skill_refresh_skills = skill_refresh_skills
	local skill = tweak_data.skilltree.skills[skill_id]
	self._skill_name = managers.localization:text(skill.name_id)
	local texture = skill.texture or "guis/textures/pd2/skilltree/icons_atlas"
	local texture_rect_x = skill.icon_xy and skill.icon_xy[1] or 0
	local texture_rect_y = skill.icon_xy and skill.icon_xy[2] or 0
	self._base_size = h - 10
	local state_image = skill_panel:bitmap({
		name = "state_image",
		texture = texture,
		texture_rect = {
			texture_rect_x * 64,
			texture_rect_y * 64,
			64,
			64
		},
		color = tweak_data.screen_colors.item_stage_3,
		layer = 1
	})
	state_image:set_size(self._base_size, self._base_size)
	state_image:set_blend_mode("add")
	local skill_text = skill_panel:text({
		name = "skill_text",
		text = "",
		layer = 3,
		wrap = true,
		word_wrap = true,
		font = tweak_data.menu.pd2_small_font,
		font_size = tweak_data.menu.pd2_small_font_size,
		align = "left",
		vertical = "center",
		color = tweak_data.screen_colors.text,
		blend_mode = "add",
		x = self._base_size + 10,
		w = skill_panel:w() - self._base_size - 10
	})
	state_image:set_x(5)
	state_image:set_center_y(skill_panel:h() / 2)
	self._inside_panel = skill_panel:panel({
		w = w - 10,
		h = h - 10
	})
	self._inside_panel:set_center(skill_panel:w() / 2, skill_panel:h() / 2)
	local cx = tier_panel:w() / num_skills
	skill_panel:set_x((i - 1) * w)
	self._box = BoxGuiObject:new(skill_panel, {
		sides = {
			2,
			2,
			2,
			2
		}
	})
	self._box:hide()
	local state_indicator = skill_panel:bitmap({
		name = "state_indicator",
		texture = "guis/textures/pd2/skilltree/ace",
		alpha = 0,
		color = Color.white:with_alpha(1),
		layer = 0
	})
	state_indicator:set_size(state_image:w() * 2, state_image:h() * 2)
	state_indicator:set_blend_mode("add")
	state_indicator:set_rotation(360)
	state_indicator:set_center(state_image:center())
end