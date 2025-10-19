-- Removes button glow effects from action bars

local function hideGlow(button)
    if not button then return end

    -- Hide assisted combat rotation alerts
    local rotation = button.AssistedCombatRotationFrame
    if rotation and rotation.SpellActivationAlert then
        rotation.SpellActivationAlert:Hide()
    end

    -- Hide overlay glow

    if button.overlay then
        button.overlay:Hide()
    end

    -- Hide spell activation alerts
    if button.SpellActivationAlert then
        button.SpellActivationAlert:Hide()
    end
end

-- Hook into alert system to suppress glows
if ActionButtonSpellAlertManager then
    hooksecurefunc(ActionButtonSpellAlertManager, "ShowAlert", function(_, button)
        hideGlow(button)
    end)
else
    hooksecurefunc("ActionButton_ShowOverlayGlow", hideGlow)
end
