class("GetSeasonInfoCommand", pm.SimpleCommand).execute = function (slot0, slot1)
	pg.ConnectionMgr.GetInstance():Send(18001, {
		type = 0
	}, 18002, function (slot0)
		slot1 = SeasonInfo.New(slot0)

		if getProxy(MilitaryExerciseProxy):getData() then
			slot2:updateSeasonInfo(slot1)
		else
			slot2:addSeasonInfo(slot1)
		end

		slot3 = getProxy(PlayerProxy)
		slot4 = slot3:getData()

		slot4:updateScoreAndRank(slot1.score, slot1.rank)
		slot3:updatePlayer(slot4)
		slot0:sendNotification(GAME.GET_SEASON_INFO_DONE, slot1)
	end)
end

return class("GetSeasonInfoCommand", pm.SimpleCommand)