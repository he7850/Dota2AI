_G._savedEnv = getfenv()
module("mode_laning_generic", package.seeall)

local LocationUtil = require(GetScriptDirectory() .. "/Util/LocationUtil")

function TryStickCreeps(npcBot,tableNearbyAlliedCreep,team,lane)
    if #tableNearbyAlliedCreep ~= 0 then
        if #tableNearbyAlliedCreep == 1 then
            local hHeadCreep = LocationUtil.getHeadCreep(tableNearbyAlliedCreep, team, lane)
            DebugDrawCircle(hHeadCreep:GetLocation(), 50, 255, 0, 0)
            if not LocationUtil.isBeforeInLane(npcBot, hHeadCreep, team, lane) then
                LocationUtil.stickSingleCreep(npcBot, hHeadCreep, team, lane)
            else
                npcBot:Action_MoveToLocation(hHeadCreep:GetLocation())
            end
        elseif #tableNearbyAlliedCreep > 1 then
            local hHeadCreep, hSecondHeadCreep = LocationUtil.getHeadTwoCreep(tableNearbyAlliedCreep, team, lane)
            DebugDrawCircle(hHeadCreep:GetLocation(), 50, 255, 0, 0)
            DebugDrawCircle(hSecondHeadCreep:GetLocation(), 50, 255, 0, 0)
            if not LocationUtil.isBeforeInLane(npcBot, hHeadCreep, team, lane) then
                LocationUtil.stickDoubleCreep(npcBot, hHeadCreep, hSecondHeadCreep, team, lane)
            else
                npcBot:Action_MoveToLocation(hHeadCreep:GetLocation())
            end
        end
    end
end


function OnStart()
    --print( "mode_laning_generic.OnStart" );
end

function OnEnd()
    --print( "mode_laning_generic.OnEnd" );
end

function Think()
    local npcBot = GetBot()
    local team = GetTeam()
    local lane = LocationUtil.CurrentLane(npcBot:GetLocation())
    --print(npcBot:GetPlayer() .. ":" .. enemyNumber)

    -- initial location
    if (DotaTime() < 0) then
        if (GetTeam() == TEAM_RADIANT and npcBot:GetPlayer() == 2) then
            npcBot:Action_MoveToLocation(LocationUtil.TowerLocation(team, TOWER_BOT_3) + Vector(800,0) + RandomVector(100))
        elseif (GetTeam() == TEAM_DIRE) then
            npcBot:Action_MoveToLocation(LocationUtil.TowerLocation(team, TOWER_MID_3) - Vector(800, 800) + RandomVector(100))
        end
        return
    end

    -- stick creepls position in start 5 min
    if (DotaTime() > 0 and DotaTime() < 30 and npcBot:GetPlayer() == 2) then
        --stick creep
        local tableNearbyAlliedCreep = npcBot:GetNearbyCreeps(800, false)
        local tableNearbyEnemyCreep = npcBot:GetNearbyCreeps(500, true)
        if #tableNearbyEnemyCreep ==0 then
            TryStickCreeps(npcBot,tableNearbyAlliedCreep,team,lane)
        end


    end
end

function GetDesire()
    local npcBot = GetBot()
    local fDesireScore = 0

    local tableNearbyEnemyBot = npcBot:GetNearbyHeroes(1000, true, BOT_MODE_NONE)
    local tableNearbyAlliedBot = npcBot:GetNearbyHeroes(1000, false, BOT_MODE_NONE)
    local tableNearbyTowers = npcBot:GetNearbyTowers(800, false)

    -- estimate enemy's damage
    local fDamageToMe = 0
    for _, npcEnemy in pairs(tableNearbyEnemyBot) do
        fDamageToMe = fDamageToMe + npcEnemy:GetEstimatedDamageToTarget(false, npcBot, 3.0, DAMAGE_TYPE_ALL) / npcBot:GetHealth()
        -- ignore treat method
    end

    -- estimate teammate's protection
    local fDamageToEnemy = 0
    for _, npcEnemy in pairs(tableNearbyEnemyBot) do
        for _, npcAlly in pairs(tableNearbyAlliedBot) do
            fDamageToEnemy = fDamageToEnemy + npcAlly:GetEstimatedDamageToTarget(false, npcEnemy, 3.0, DAMAGE_TYPE_ALL) / npcEnemy:GetHealth()
        end
    end
    if fDamageToEnemy ~= 0 then
        fDamageToEnemy = fDamageToEnemy / #tableNearbyAlliedBot / #tableNearbyEnemyBot
    end

    -- estimate tower's protection
    local fTowerPower = 0
    if #tableNearbyTowers > 0 then
        for _, npcEnemy in pairs(tableNearbyEnemyBot) do
            fDamageToEnemy = tableNearbyTowers[1]:GetEstimatedDamageToTarget(false, npcEnemy, 3.0, DAMAGE_TYPE_ALL) / npcEnemy:GetHealth()
        end
    end


    --estimate profit
    local tableNearbyEnemyCreep = npcBot:GetNearbyCreeps(800, false)
    local fEnemyCreepProfit = #tableNearbyEnemyCreep * 0.02

    fDesireScore = fEnemyCreepProfit - fDamageToMe + fDamageToEnemy + fTowerPower * 0.8
    return 0.99 --Clamp(fDesireScore, 0, 1)
end

for k, v in pairs(mode_laning_generic) do _G._savedEnv[k] = v end



