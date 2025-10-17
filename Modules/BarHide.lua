-- Hides XP and honor bars at max level for cleaner interface

local function hideBar()
  local level = UnitLevel("player")
  local maxLevel = GetMaxPlayerLevel()
  
  if MainStatusTrackingBarContainer then
    if level < maxLevel then
      MainStatusTrackingBarContainer:Show()
      MainStatusTrackingBarContainer:SetScript("OnShow", nil)
    else
      MainStatusTrackingBarContainer:Hide()
      MainStatusTrackingBarContainer:SetScript("OnShow", MainStatusTrackingBarContainer.Hide)
    end
  end
end

-- Update bar visibility on level changes

local eventFrame = CreateFrame("Frame")
eventFrame:RegisterEvent("PLAYER_ENTERING_WORLD")
eventFrame:RegisterEvent("PLAYER_LEVEL_UP")
eventFrame:SetScript("OnEvent", function()
  C_Timer.After(0, hideBar)
end)
