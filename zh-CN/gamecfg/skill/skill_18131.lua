return {
	uiEffect = "",
	name = "飞行NG! +",
	cd = 0,
	picture = "0",
	desc = "飞行NG! +",
	painting = 1,
	id = 18131,
	castCV = "skill",
	aniEffect = {
		effect = "jineng",
		offset = {
			0,
			-2,
			0
		}
	},
	effect_list = {
		{
			targetAniEffect = "",
			casterAniEffect = "",
			type = "BattleSkillAddBuff",
			target_choise = "TargetSelf",
			arg_list = {
				buff_id = 18133
			}
		}
	}
}
