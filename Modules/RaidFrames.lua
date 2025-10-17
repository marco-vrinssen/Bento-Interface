-- Hides buffs and debuffs on raid frames to reduce visual clutter

local function hideAuras(frame)
    if not frame or frame:IsForbidden() then 
        return 
    end

    if CompactUnitFrame_HideAllBuffs then
        CompactUnitFrame_HideAllBuffs(frame)
    end

    if CompactUnitFrame_HideAllDebuffs then
        CompactUnitFrame_HideAllDebuffs(frame)
    end
end

hooksecurefunc("CompactUnitFrame_UpdateAuras", hideAuras)
