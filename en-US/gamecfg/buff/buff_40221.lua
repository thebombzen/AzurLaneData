slot2.trigger = {
	"onAttach"
}
slot2.arg_list = {
	ability = "command",
	convertRate = 0.00012,
	convertAttr = "damageRatioBullet"
}
slot1[1] = {
	type = "BattleBuffAddAttrCommander"
}
slot0.effect_list = {}

return {
	time = 0,
	name = "若旗舰为战列舰，旗舰造成的伤害提高，依据指挥属性",
	init_effect = "",
	id = 40221,
	picture = "",
	desc = "该入口提供战外挂载到战内",
	stack = 1,
	color = "yellow",
	icon = 40220,
	last_effect = ""
}
