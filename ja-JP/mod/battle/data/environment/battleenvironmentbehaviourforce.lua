ys = ys or {}
slot1 = ys.Battle.BattleConst
slot2 = ys.Battle.BattleConfig
slot3 = class("BattleEnvironmentBehaviourForce", ys.Battle.BattleEnvironmentBehaviour)
ys.Battle.BattleEnvironmentBehaviourForce = slot3
slot3.__name = "BattleEnvironmentBehaviourForce"

function slot3.Ctor(slot0)
	slot0._moveEndTime = nil
	slot0._lastSpeed = nil
	slot0._speed = Vector3.zero
	slot0._targetIndex = 0

	slot0.super.Ctor(slot0)
end

function slot3.SetTemplate(slot0, slot1)
	slot0.super.SetTemplate(slot0, slot1)

	slot0._route = slot1.route or {}
	slot0._moveEndTime = pg.TimeMgr.GetInstance():GetCombatTime()
	slot3, slot4 = nil

	if #slot0._unit:GetTemplate().cld_data == 1 then
		slot4 = slot2.cld_data[1]
	elseif #slot2.cld_data == 2 then
		slot3, slot4 = unpack(slot2.cld_data)
	end

	slot0._bounds = {
		()[1] - slot4,
		[3] = ()[3] + slot3,
		[4] = ()[4] - slot3,
		[2] = ()[2] + slot4,
		slot1.Battle.BattleDataProxy.GetInstance():GetTotalBounds()
	}
end

function slot3.doBehaviour(slot0)
	slot1 = pg.TimeMgr.GetInstance():GetCombatTime()

	if slot0._moveEndTime and slot0._moveEndTime <= slot1 then
		slot0._targetIndex = slot0._targetIndex + 1
		slot0._moveEndTime = nil

		if slot0._lastSpeed then
			slot0._speed:Add(slot0._lastSpeed)

			slot0._lastSpeed = nil
		end

		if slot0._route[slot0._targetIndex] then
			slot0._lastSpeed = Vector3(unpack(slot2)):Normalize() * slot2[4]
			slot0._moveEndTime = slot1 + slot2[5]
		end
	end

	slot0._unit._aoeData:SetPosition(slot0:UpdateAndRestrictPosition(slot2))
	slot0.super.doBehaviour(slot0)
end

function slot3.UpdateAndRestrictPosition(slot0, slot1)
	if slot0._speed:SqrMagnitude() < 0.01 then
		return slot1
	end

	if slot1 + slot0._speed.x < slot0._bounds[3] then
		slot0._speed.x = math.abs(slot0._speed.x)
		slot3.x = slot2[3] + math.abs(slot3.x - slot2[3])
	elseif slot2[4] < slot3.x then
		slot0._speed.x = -math.abs(slot0._speed.x)
		slot3.x = slot2[4] - math.abs(slot3.x - slot2[4])
	end

	if slot3.z < slot2[2] then
		slot0._speed.z = math.abs(slot0._speed.z)
		slot3.z = slot2[2] + math.abs(slot3.z - slot2[2])
	elseif slot2[1] < slot3.z then
		slot0._speed.z = -math.abs(slot0._speed.z)
		slot3.z = slot2[1] - math.abs(slot3.z - slot2[1])
	end

	return slot3
end

function slot3.Dispose(slot0)
	slot0.super.Dispose(slot0)
	table.clear(slot0)
end

return
