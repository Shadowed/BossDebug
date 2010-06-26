local load = CreateFrame("Frame")
load:RegisterEvent("ADDON_LOADED")
load:SetScript("OnEvent", function(self, event, addon)
	if( addon == "BossDebug" ) then
		BossDebugDB = BossDebugDB or {}
		self:UnregisterEvent(event)
	end
end)

local frame = CreateFrame("Frame")
frame:RegisterEvent("INSTANCE_ENCOUNTER_ENGAGE_UNIT")
frame:RegisterEvent("PLAYER_REGEN_DISABLED")
frame:RegisterEvent("UNIT_HEALTH")
frame:RegisterEvent("UNIT_MANA")
frame:RegisterEvent("UNIT_AURA")
frame:SetScript("OnEvent", function(self, event, unit)
	if( event == "INSTANCE_ENCOUNTER_ENGAGE_UNIT" ) then
		table.insert(BossDebugDB, string.format("[%s] %s", GetTime(), event))
	elseif( event == "PLAYER_REGEN_DISABLED" ) then
		table.insert(BossDebugDB, string.format("[%s] %s", GetTime(), event))
	elseif( unit == "boss1" or unit == "boss2" or unit == "boss3" or unit == "boss4" ) then
		table.insert(BossDebugDB, string.format("[%s] %s (%s)", GetTime(), event, unit))
	end
end)