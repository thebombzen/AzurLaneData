slot1.offset = {
	0,
	-2,
	0
}
slot0.aniEffect = {
	effect = "jineng"
}
slot2.arg_list = {
	buff_id = 1050
}
slot1[1] = {
	targetAniEffect = "",
	casterAniEffect = "",
	type = "BattleSkillAddBuff",
	target_choise = "TargetPlayerMainFleet"
}
slot0.effect_list = {}

return {
	uiEffect = "",
	name = "战术指挥·主力",
	cd = 0,
	picture = "0",
	desc = "提高舰队中所有主力的炮击、雷击、装填属性",
	painting = 1,
	id = 1055,
	castCV = "skill"
}
