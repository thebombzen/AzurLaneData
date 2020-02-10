slot0 = class("TaskMediator", import("..base.ContextMediator"))
slot0.ON_TASK_SUBMIT = "TaskMediator:ON_TASK_SUBMIT"
slot0.ON_TASK_GO = "TaskMediator:ON_TASK_GO"
slot0.TASK_FILTER = "TaskMediator:TASK_FILTER"
slot0.CLICK_GET_ALL = "TaskMediator:CLICK_GET_ALL"

function slot0.register(slot0)
	slot0:bind(uv0.ON_TASK_SUBMIT, function (slot0, slot1)
		if getProxy(ActivityProxy):getActivityById(ActivityConst.JYHZ_ACTIVITY_ID) then
			slot5 = _.flatten(slot3:getConfig("config_data"))

			if slot1.id == slot5[#slot5] then
				pg.StoryMgr.GetInstance():Play("YIXIAN8", function ()
					uv0:sendNotification(GAME.SUBMIT_TASK, uv1.id)
				end)

				return
			end
		end

		if slot1.index then
			slot7.taskId = slot1.id
			slot7.index = slot1.index

			uv0:sendNotification(GAME.SUBMIT_TASK, {})
		else
			uv0:sendNotification(GAME.SUBMIT_TASK, slot1.id)
		end
	end)
	slot0:bind(uv0.ON_TASK_GO, function (slot0, slot1)
		slot5.taskVO = slot1

		uv0:sendNotification(GAME.TASK_GO, {})
	end)
	slot0:bind(uv0.CLICK_GET_ALL, function (slot0, slot1, slot2)
		slot3 = {}

		function slot4(slot0, slot1)
			slot2 = uv0[slot0]
			slot3 = nil

			if slot2:isSelectable() then
				slot4 = slot2:getConfig("award_choice")[slot2.index]
				slot5.type = slot4[1]
				slot5.id = slot4[2]
				slot5.number = slot4[3]
				slot3 = {}
			end

			slot6.id = slot2.id
			slot6.award_choice = slot3
			uv1[#uv1 + 1] = {}

			if slot0 <= #uv0 then
				slot1()
			end
		end

		function slot5(slot0, slot1, slot2)
			function slot1.overFlow.onYes()
				uv0(uv1, uv2)
			end

			function slot1.overFlow.onNo()
				uv0()
			end

			pg.MsgboxMgr.GetInstance():ShowMsgBox(slot1.overFlow)
		end

		function slot6(slot0, slot1, slot2)
			function slot1.choice.onYes()
				if not taskVO.index then
					pg.TipsMgr.GetInstance():ShowTips(i18n("no_item_selected_tip"))
					uv0()

					return
				end

				if uv1.overFlow then
					uv2()
				else
					uv3(uv4, uv0)
				end
			end

			function slot1.choice.onNo()
				uv0()
			end

			pg.MsgboxMgr.GetInstance():ShowMsgBox(slot1.choice)
		end

		function slot7(slot0, slot1, slot2)
			function slot1.sub.onYes()
				if uv0.choice then
					uv1()
				elseif uv0.overFlow then
					uv2()
				else
					uv3(uv4, uv5)
				end
			end

			function slot1.sub.onNo()
				uv0()
			end

			pg.MsgboxMgr.GetInstance():ShowMsgBox(slot1.sub)
		end

		slot8 = {}

		for slot12, slot13 in ipairs(slot1) do
			slot8[slot12] = function ()
				if uv0.sub then
					uv1(uv2, uv0, uv3[uv2 + 1])
				elseif uv0.choice then
					uv4(uv2, uv0, uv3[uv2 + 1])
				elseif uv0.overFlow then
					uv5(uv2, uv0, uv3[uv2 + 1])
				else
					uv6(uv2, uv3[uv2 + 1])
				end
			end
		end

		slot8[#slot8 + 1] = function ()
			if #uv0 > 0 then
				uv1:sendNotification(GAME.SUBMIT_TASK_ONESTEP, uv0)
			end
		end

		slot8[1]()
	end)

	for slot7, slot8 in pairs(getProxy(TaskProxy):getData()) do
		if slot8:getConfig("sub_type") == TASK_SUB_TYPE_GIVE_ITEM then
			slot8.progress = getProxy(BagProxy):getItemCountById(tonumber(slot8:getConfig("target_id_for_client")))
		elseif slot8:getConfig("sub_type") == TASK_SUB_TYPE_GIVE_VIRTUAL_ITEM then
			slot8.progress = getProxy(ActivityProxy):getVirtualItemNumber(slot8:getConfig("target_id_for_client"))
		end
	end

	slot0.viewComponent:setTaskVOs(slot2)
end

function slot0.enterLevel(slot0, slot1)
	if getProxy(ChapterProxy):getChapterById(slot1) then
		slot4 = {
			mapIdx = slot3:getConfig("map")
		}

		if slot3.active then
			slot4.chapterId = slot3.id
		else
			slot4.openChapterId = slot1
		end

		slot0:sendNotification(GAME.GO_SCENE, SCENE.LEVEL, slot4)
	end
end

function slot0.remove(slot0)
end

function slot0.listNotificationInterests(slot0)
	slot1[1] = TaskProxy.TASK_ADDED
	slot1[2] = TaskProxy.TASK_UPDATED
	slot1[3] = TaskProxy.TASK_REMOVED
	slot1[4] = GAME.SUBMIT_TASK_DONE
	slot1[5] = uv0.TASK_FILTER
	slot1[6] = GAME.BEGIN_STAGE_DONE
	slot1[7] = GAME.CHAPTER_OP_DONE

	return {}
end

function slot0.handleNotification(slot0, slot1)
	slot3 = slot1:getBody()

	if slot1:getName() == TaskProxy.TASK_ADDED then
		if slot3:getConfig("sub_type") == TASK_SUB_TYPE_GIVE_ITEM then
			slot3.progress = getProxy(BagProxy):getItemCountById(tonumber(slot3:getConfig("target_id_for_client")))
		elseif slot3:getConfig("sub_type") == TASK_SUB_TYPE_GIVE_VIRTUAL_ITEM then
			slot3.progress = getProxy(ActivityProxy):getVirtualItemNumber(slot3:getConfig("target_id_for_client"))
		end

		slot0.viewComponent:addTask(slot3)
	elseif slot2 == GAME.CHAPTER_OP_DONE then
		if slot0.chapterId then
			slot0:enterLevel(slot0.chapterId)

			slot0.chapterId = nil
		end
	elseif slot2 == TaskProxy.TASK_UPDATED then
		if slot3:getConfig("sub_type") == TASK_SUB_TYPE_GIVE_ITEM then
			slot3.progress = getProxy(BagProxy):getItemCountById(tonumber(slot3:getConfig("target_id_for_client")))
		elseif slot3:getConfig("sub_type") == TASK_SUB_TYPE_GIVE_VIRTUAL_ITEM then
			slot3.progress = getProxy(ActivityProxy):getVirtualItemNumber(slot3:getConfig("target_id_for_client"))
		end

		slot0.viewComponent:updateTask(slot3)
	elseif slot2 == TaskProxy.TASK_REMOVED then
		slot0.viewComponent:removeTask(slot3)
	elseif slot2 == uv0.TASK_FILTER then
		slot0.viewComponent:GoToFilter(slot3)
	elseif slot2 == GAME.SUBMIT_TASK_DONE then
		slot4 = getProxy(TaskProxy)
		slot0.viewComponent.onShowAwards = true

		slot0.viewComponent:emit(BaseUI.ON_ACHIEVE, slot3, function ()
			uv0.viewComponent.onShowAwards = nil

			uv0:accepetActivityTask()
			uv0.viewComponent:updateOneStepBtn()
		end)
	elseif slot2 == GAME.BEGIN_STAGE_DONE then
		slot0:sendNotification(GAME.GO_SCENE, SCENE.COMBATLOAD, slot3)
	end
end

function slot0.accepetActivityTask(slot0)
	slot0:sendNotification(GAME.ACCEPT_ACTIVITY_TASK)
end

return slot0
