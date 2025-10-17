-- Simplifies nameplate display by hiding buffs

local function hideNameplateBuffs(unitToken)
  local nameplate = C_NamePlate.GetNamePlateForUnit(unitToken)
  if not nameplate then return end
  
  local unitFrame = nameplate.UnitFrame
  if not unitFrame or unitFrame:IsForbidden() then return end

  local buffsFrame = unitFrame.BuffFrame
  if not buffsFrame then return end

  -- Hook once to persist hidden state
  if not buffsFrame._bentoHook then
    buffsFrame._bentoHook = true
    buffsFrame:HookScript("OnShow", function(frame)
      frame:Hide()
    end)
  end
  
  buffsFrame:Hide()
end

local eventFrame = CreateFrame("Frame")
eventFrame:RegisterEvent("NAME_PLATE_UNIT_ADDED")
eventFrame:SetScript("OnEvent", function(_, eventName, unitToken)
  if eventName == "NAME_PLATE_UNIT_ADDED" then
    hideNameplateBuffs(unitToken)
  end
end)
