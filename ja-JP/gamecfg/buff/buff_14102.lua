return {
	name = "",
	init_effect = "jinengchufablue",
	time = 3,
	picture = "",
	desc = "回复血量",
	stack = 1,
	id = 14102,
	icon = 14102,
	last_effect = "Health",
	blink = {
		0,
		0.7,
		1,
		0.3,
		0.3
	},
	effect_list = {
		{
			type = "BattleBuffHP",
			trigger = {
				"onAttach"
			},
			arg_list = {
				casterMaxHPRatio = 500
			}
		}
	}
}
