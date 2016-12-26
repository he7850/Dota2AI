require(GetScriptDirectory() .. "/mode_defend_ally_generic")

----------------------------------------------------------------------------------------------------
function OnStart()
    -- Do the standard OnStart
    mode_defend_ally_generic.OnStart();
end

----------------------------------------------------------------------------------------------------
function OnEnd()
    -- Do the standard OnEnd
    mode_defend_ally_generic.OnEnd();
end

----------------------------------------------------------------------------------------------------
function Think()

    local npcBot = GetBot();
    abilityDS = npcBot:GetAbilityByName("lina_dragon_slave");
    abilityLSA = npcBot:GetAbilityByName("lina_light_strike_array");
    abilityLB = npcBot:GetAbilityByName("lina_laguna_blade");

    -- Do the standard Think
    mode_defend_ally_generic.Think()

    -- Check if we're casting an ability
    if (npcBot:IsUsingAbility()) then
        return
    end;

    -- If we have a (defend) target
    if (npcBot:GetTarget() ~= nil) then
        local targetBot = npcBot:GetTarget()

        -- If we can kill the targets
        if (targetBot:GetHealth() < abilityDS:GetAbilityDamage() + abilityLB:GetAbilityDamage() and abilityDS:IsFullyCastable() and abilityLB:IsFullyCastable()) then
            npcBot:Action_UseAbilityOnLocation(abilityDS, npcBot:GetTarget():GetLocation())
        end
        if (targetBot:GetHealth() < abilityLB:GetAbilityDamage() and abilityLB:IsFullyCastable()) then
            npcBot:Action_UseAbilityOnEntity(abilityLB, npcBot:GetTarget())
        end

        -- If we can not kill the targets, then stop them
        if (abilityLSA:IsFullyCastable()) -- and can cast lina_light_strike_array on them, do so
        then
            npcBot:Action_UseAbilityOnLocation(abilityLSA, npcBot:GetTarget():GetLocation());
        end
    end
end

----------------------------------------------------------------------------------------------------
function GetDesire()

    local npcBot = GetBot();
    local fBonus = 0.0;
    abilityDS = npcBot:GetAbilityByName("lina_dragon_slave");
    abilityLSA = npcBot:GetAbilityByName("lina_light_strike_array");
    abilityLB = npcBot:GetAbilityByName("lina_laguna_blade");

    -- If we have a target and can cast ability like Light Strike Array, our desire to help defend should be higher than normal
    if (npcBot:GetTarget() ~= nil)
    then
        if (abilityLSA:IsFullyCastable() or
            (targetBot:GetHealth() < abilityDS:GetAbilityDamage() + abilityLB:GetAbilityDamage() and
                abilityDS:IsFullyCastable() and abilityLB:IsFullyCastable()) or
            targetBot:GetHealth() < abilityLB:GetAbilityDamage() and abilityLB:IsFullyCastable())
        then
            fBonus = 0.25;
        end
    end

    return Clamp(mode_defend_ally_generic.GetDesire() + fBonus, BOT_MODE_DESIRE_NONE, BOT_MODE_DESIRE_ABSOLUTE);
end

----------------------------------------------------------------------------------------------------

