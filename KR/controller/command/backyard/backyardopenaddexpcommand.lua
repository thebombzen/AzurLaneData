class("BackYardOpenAddExpCommand", pm.SimpleCommand).execute = function (slot0, slot1)
	pg.ConnectionMgr.GetInstance():Send(19015, {
		is_open = slot1:getBody()
	})
	slot0:sendNotification(GAME.OPEN_ADD_EXP_DONE)
end

return class("BackYardOpenAddExpCommand", pm.SimpleCommand)
