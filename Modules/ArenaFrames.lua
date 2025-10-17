-- Hides arena frame elements for minimal interface

local function hide(element)
    if element then
        element:Hide()
        element:SetScript("OnShow", element.Hide)
    end
end

local function updateFrames()
    for i = 1, 5 do
        local arenaFrame = _G["CompactArenaFrameMember" .. i]
        if arenaFrame then
            hide(arenaFrame.name)
            hide(arenaFrame.DebuffFrame)
            hide(arenaFrame.castBar)
        end
    end
end

local eventFrame = CreateFrame("Frame")
eventFrame:RegisterEvent("ARENA_OPPONENT_UPDATE")
eventFrame:SetScript("OnEvent", updateFrames)
