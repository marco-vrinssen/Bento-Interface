-- Blocks achievement alerts and talking head frames to reduce UI clutter

local function blockAlertFrames()

  -- Mute achievement alert sound
  MuteSoundFile(569143)

  -- Hide achievement alert frame
  AlertFrame:UnregisterAllEvents()
  AlertFrame:Hide()
  AlertFrame:SetAlpha(0)

  -- Hide talking head frame
  TalkingHeadFrame:UnregisterAllEvents()
  TalkingHeadFrame:Hide()
  TalkingHeadFrame:SetAlpha(0)
end

local alertBlockerFrame = CreateFrame("Frame")

-- Initialize blocking on world enter
alertBlockerFrame:RegisterEvent("PLAYER_ENTERING_WORLD")
alertBlockerFrame:SetScript("OnEvent", blockAlertFrames)
