return {
	uiEffect = "",
	name = "战术指挥·主力",
	cd = 0,
	picture = "0",
	desc = "提高舰队中所有主力的炮击,雷击,装填属性",
	painting = 1,
	id = 1055,
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
			target_choise = "TargetPlayerMainFleet",
			arg_list = {
				buff_id = 1050
			}
		}
	}
}
