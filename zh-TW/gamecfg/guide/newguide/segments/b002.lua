return {
	id = "B002",
	events = {
		{
			alpha = 0.34,
			code = {
				"ShowSkill3"
			},
			hideui = {
				{
					ishide = false,
					path = "UICamera/Canvas/UIMain/CombatUI(Clone)/Skill_3"
				}
			},
			style = {
				text = "我方旗艦的<color=#ff7d36>航空支援</color>已準備完畢 ",
				mode = 2,
				dir = 1,
				posY = 0,
				posX = 0
			}
		},
		{
			alpha = 0.34,
			code = {
				"ShowSkill3"
			},
			style = {
				text = "清除戰場準備！點擊<color=#ff7d36>航空支援</color>按鈕試試吧！",
				mode = 2,
				dir = 1,
				posY = 0,
				posX = 0
			},
			ui = {
				path = "UICamera/Canvas/UIMain/CombatUI(Clone)/Skill_3/ActCtl",
				triggerType = {
					3
				}
			}
		},
		{
			alpha = 0.34,
			code = {
				"ReleaseAfter"
			},
			style = {
				text = "看到空中支援的威力了吧！ 緊急情況下釋放，還能<color=#ff7d36>消除敵方彈幕</color>呢！",
				mode = 2,
				dir = 1,
				posY = 0,
				posX = 0
			}
		}
	}
}
