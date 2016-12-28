_G._savedEnv = getfenv()
module("mode_attack_generic", package.seeall)

function OnStart()
    --print( "mode_attack_generic.OnStart" );
end

function OnEnd()
    --print( "mode_attack_generic.OnEnd" );
end

function Think()
    --print( "mode_attack_generic.Think" );
end

------------------------------------------------------------------------------------------------------------------------
function GetDesire()
    local npcBot = GetBot()
    local tableNearbyEnemyHeroes = npcBot:GetNearbyHeroes(1000, true, BOT_MODE_NONE);

    -- calculate the most damage percentage
    local fBestAttackScore = 0
    for _, npcEnemy in pairs(tableNearbyEnemyHeroes) do
        local fEstimatedDamage = npcBot:GetEstimatedDamageToTarget(false, npcEnemy, 3.0, DAMAGE_TYPE_ALL)
        local tableAlliedHeroesNearEnemy = npcEnemy:GetNearbyHeroes(1000, false, BOT_MODE_NONE);
        for _, npcAlly in pairs(tableAlliedHeroesNearEnemy) do
            fEstimatedDamage = fEstimatedDamage + npcAlly:GetEstimatedDamageToTarget(false, npcEnemy, 3.0, DAMAGE_TYPE_ALL)
        end
        local fAttackScore = RemapValClamped(fEstimatedDamage / npcEnemy:GetHealth(), 0.5, 1.5, BOT_MODE_DESIRE_NONE, BOT_MODE_DESIRE_HIGH)
        if fAttackScore > fBestAttackScore then
            fBestAttackScore = fAttackScore
        end
    end

    -- estimate risk
    local fBestRiskScore = 0
    for _, npcEnemy in pairs(tableNearbyEnemyHeroes) do
        local fEstimatedDamage = npcEnemy:GetEstimatedDamageToTarget(false, npcBot, 3.0, DAMAGE_TYPE_ALL)
        local tableEnemyHeroesNearEnemy = npcEnemy:GetNearbyHeroes(1000, true, BOT_MODE_NONE);
        for _, npcOtherEnemy in pairs(tableEnemyHeroesNearEnemy) do
            fEstimatedDamage = fEstimatedDamage + npcOtherEnemy:GetEstimatedDamageToTarget(false, npcBot, 3.0, DAMAGE_TYPE_ALL)
        end
        local fRiskScore = RemapValClamped(fEstimatedDamage / npcBot:GetHealth(), 0.2, 1.2, BOT_MODE_DESIRE_HIGH, BOT_MODE_DESIRE_NONE)
        if fRiskScore > fBestRiskScore then
            fBestRiskScore = fRiskScore
        end
    end

    return fBestAttackScore * fBestRiskScore
end

------------------------------------------------------------------------------------------------------------------------



for k, v in pairs(mode_attack_generic) do
    _G._savedEnv[k] = v
end