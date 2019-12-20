return {
	uiEffect = "",
	name = "敌方维修船维修技能",
	cd = 0,
	picture = "0",
	aniEffect = "",
	desc = "6秒后回复13%HP，跳转至下一强度",
	painting = 0,
	id = 50013,
	effect_list = {
		{
			targetAniEffect = "",
			casterAniEffect = "",
			type = "BattleSkillHeal",
			target_choise = "TargetAllHelp",
			arg_list = {
				exceptCaster = true,
				maxHPRatio = 0.13
			}
		},
		{
			targetAniEffect = "",
			casterAniEffect = "",
			type = "BattleSkillAddBuff",
			target_choise = "TargetAllHelp",
			arg_list = {
				buff_id = 50015,
				exceptCaster = true
			}
		},
		{
			target_choise = "TargetSelf",
			type = "BattleSkillAddBuff",
			arg_list = {
				buff_id = 50014
			}
		}
	}
}