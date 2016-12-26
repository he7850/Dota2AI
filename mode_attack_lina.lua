--
-- Created by IntelliJ IDEA.
-- User: HUBIN
-- Date: 2016/12/25
-- Time: 23:00
-- To change this template use File | Settings | File Templates.
--


require(GetScriptDirectory() .. "/mode_attack_generic")

----------------------------------------------------------------------------------------------------
function OnStart()
    -- Do the standard OnStart
    mode_attack_generic.OnStart();
end

----------------------------------------------------------------------------------------------------
function OnEnd()
    -- Do the standard OnEnd
    mode_attack_generic.OnEnd();
end

----------------------------------------------------------------------------------------------------
function Think()

    local npcBot = GetBot();

    -- Do the standard Think
    mode_attack_generic.Think()

    -- Check if we're already using an ability
    if (npcBot:IsUsingAbility()) then
        return
    end

    -- decide a attack goal
    local fBestAttackScore = 0
    local npcBestAttackGoal = nil
    local tableNearbyEnemyHeroes = npcBot:GetNearbyHeroes(1000, true, BOT_MODE_NONE);
    for _, npcEnemy in pairs(tableNearbyEnemyHeroes) do
        local nEstimatedDamage = npcBot:GetEstimatedDamageToTarget(false, npcEnemy, 3.0, DAMAGE_TYPE_ALL)
        if nEstimatedDamage / npcEnemy:GetHealth() >fBestAttackScore then
            npcBestAttackGoal = npcEnemy
            fBestAttackScore = nEstimatedDamage / npcEnemy:GetHealth()
        end
    end

    if abilityLSA:IsFullyCastable() then
        npcBot:Action_UseAbilityOnLocation(abilityLSA, npcBestAttackGoal:GetLocation())
    end
    if abilityDS:IsFullyCastable() then
        npcBot:Action_UseAbilityOnEntity(abilityDS, npcBestAttackGoal:GetLocation())
    end
    if abilityLB:IsFullyCastable() and npcBot:GetEstimatedDamageToTarget(false, npcBestAttackGoal, 3.0, DAMAGE_TYPE_ALL) > npcBestAttackGoal:GetHealth() then
        npcBot:Action_UseAbilityOnEntity(abilityLB, npcBestAttackGoal)
    end
end

----------------------------------------------------------------------------------------------------
function GetDesire()

    local npcBot = GetBot();
    abilityDS = npcBot:GetAbilityByName("lina_dragon_slave");
    abilityLSA = npcBot:GetAbilityByName("lina_light_strike_array");
    abilityLB = npcBot:GetAbilityByName("lina_laguna_blade");
    local fBonus = 0.0;

    -- estimate killing possibility
    local tableNearbyEnemyHeroes = npcBot:GetNearbyHeroes(1000, true, BOT_MODE_NONE);
    for _, npcEnemy in pairs(tableNearbyEnemyHeroes) do
        local nEstimatedDamage = npcBot:GetEstimatedDamageToTarget(false, npcEnemy, 3.0, DAMAGE_TYPE_ALL)
        if nEstimatedDamage / npcEnemy:GetHealth() > 1 then
            fBonus = fBonus + 0.7  -- KS bonus
        elseif nEstimatedDamage / npcEnemy:GetHealth() > 0.5 then
            fBonus = fBonus + 0.2
        end
    end

    return Clamp(mode_attack_generic.GetDesire() + fBonus, BOT_MODE_DESIRE_NONE, BOT_MODE_DESIRE_ABSOLUTE);
end

----------------------------------------------------------------------------------------------------

