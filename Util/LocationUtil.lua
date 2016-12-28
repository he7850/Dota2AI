--
-- Created by IntelliJ IDEA.
-- User: HUBIN
-- Date: 2016/12/26
-- Time: 16:17
-- To change this template use File | Settings | File Templates.
--

LocationUtil = {}

locations = {}
locations[TEAM_RADIANT] = {}
locations[TEAM_DIRE] = {}

locations[TEAM_RADIANT][TOWER_TOP_1] = Vector(-6208, 1816)
locations[TEAM_RADIANT][TOWER_TOP_2] = Vector(-6160, -872)
locations[TEAM_RADIANT][TOWER_TOP_3] = Vector(-6592, -3048)
locations[TEAM_RADIANT][TOWER_MID_1] = Vector(-1656, -1512)
locations[TEAM_RADIANT][TOWER_MID_2] = Vector(-3552, -2792)
locations[TEAM_RADIANT][TOWER_MID_3] = Vector(-4640, -4144)
locations[TEAM_RADIANT][TOWER_BOT_1] = Vector(4924, -6128)
locations[TEAM_RADIANT][TOWER_BOT_2] = Vector(-104, -6240)
locations[TEAM_RADIANT][TOWER_BOT_3] = Vector(-3952, -6112)
locations[TEAM_RADIANT][TOWER_BASE_1] = Vector(-5712, -4864)
locations[TEAM_RADIANT][TOWER_BASE_2] = Vector(-5392, -5192)
locations[TEAM_RADIANT]["FOUNTAIN"] = Vector(-7100, -6600)
locations[TEAM_RADIANT]["SECRET_SHOP"] = Vector(-4500, 1400)
locations[TEAM_RADIANT]["RUNE_LEFT"] = Vector(-4310, 250)
locations[TEAM_RADIANT]["RUNE_RIGHT"] = Vector(1370, -4110)

locations[TEAM_DIRE][TOWER_TOP_1] = Vector(-4736, 6016)
locations[TEAM_DIRE][TOWER_TOP_2] = Vector(0, 6106)
locations[TEAM_DIRE][TOWER_TOP_3] = Vector(3552, 5776)
locations[TEAM_DIRE][TOWER_MID_1] = Vector(1023, 319)
locations[TEAM_DIRE][TOWER_MID_2] = Vector(2496, 2112)
locations[TEAM_DIRE][TOWER_MID_3] = Vector(4272, 3759)
locations[TEAM_DIRE][TOWER_BOT_1] = Vector(6253, -1648)
locations[TEAM_DIRE][TOWER_BOT_2] = Vector(6272, 384)
locations[TEAM_DIRE][TOWER_BOT_3] = Vector(6336, 3032)
locations[TEAM_DIRE][TOWER_BASE_1] = Vector(4944, 4776)
locations[TEAM_DIRE][TOWER_BASE_2] = Vector(5280, 4432)
locations[TEAM_DIRE]["FOUNTAIN"] = Vector(7100, 6600)
locations[TEAM_DIRE]["SECRET_SHOP"] = Vector(4500, -1450)
locations[TEAM_DIRE]["RUNE_LEFT"] = Vector(-2840, 4290)
locations[TEAM_DIRE]["RUNE_RIGHT"] = Vector(3563, 340)

locations["ROSHAN"] = Vector(-2350, 1800)
locations["RIVER_RUNE_LEFT"] = Vector(-1700, 1250)
locations["RIVER_RUNE_RIGHT"] = Vector(2570, -1890)
locations["SIDE_SHOP_LEFT"] = Vector(-1700, 1250) --TBD
locations["SIDE_SHOP_RIGHT"] = Vector(-1700, 1250) --TBD
LocationUtil.locations = locations

local LANE_WIDTH = 500
local CREEP_BODY_SIZE = 100
local HERO_BODY_SIZE = 100

-- return fountain location
function LocationUtil.FountainLocation(eTeam)
    return locations[eTeam]["FOUNTAIN"]
end

-- return certain tower's location
function LocationUtil.TowerLocation(eTeam, eTower)
    return locations[eTeam][eTower]
end

function LocationUtil.getPlaneVelocity(vVelocity)
    return math.sqrt(math.pow(vVelocity[1],2)+math.pow(vVelocity[2],2))
end
-- return lane according to location
function LocationUtil.CurrentLane(vLocation)
    if vLocation[1] < locations[TEAM_RADIANT][TOWER_TOP_3][1] + LANE_WIDTH and
        vLocation[1] > locations[TEAM_RADIANT][TOWER_TOP_3][1] - LANE_WIDTH and
        vLocation[2] > locations[TEAM_RADIANT][TOWER_TOP_3][2] - LANE_WIDTH or
        vLocation[1] < locations[TEAM_DIRE][TOWER_TOP_3][1] + LANE_WIDTH and
        vLocation[2] < locations[TEAM_DIRE][TOWER_TOP_3][2] + LANE_WIDTH and
        vLocation[2] > locations[TEAM_DIRE][TOWER_TOP_3][2] - LANE_WIDTH then
        return LANE_TOP
    elseif vLocation[1] > locations[TEAM_RADIANT][TOWER_BOT_3][1] - LANE_WIDTH and
        vLocation[2] < locations[TEAM_RADIANT][TOWER_BOT_3][2] - LANE_WIDTH and
        vLocation[2] > locations[TEAM_RADIANT][TOWER_BOT_3][2] + LANE_WIDTH or
        vLocation[1] < locations[TEAM_DIRE][TOWER_BOT_3][1] + LANE_WIDTH and
        vLocation[1] > locations[TEAM_DIRE][TOWER_BOT_3][1] - LANE_WIDTH and
        vLocation[2] < locations[TEAM_DIRE][TOWER_BOT_3][2] + LANE_WIDTH then
        return LANE_BOTTOM
    elseif vLocation[1] > locations[TEAM_RADIANT][TOWER_MID_3][1] - LANE_WIDTH and
        vLocation[2] > locations[TEAM_RADIANT][TOWER_MID_3][2] - LANE_WIDTH and
        vLocation[1] < locations[TEAM_DIRE][TOWER_MID_3][1] + LANE_WIDTH and
        vLocation[2] < locations[TEAM_DIRE][TOWER_MID_3][2] + LANE_WIDTH and
        (vLocation[2] - vLocation[1] - 500 < LANE_WIDTH and vLocation[2] - vLocation[1] - 500 > -LANE_WIDTH) then
        return LANE_MID
    else
        return LANE_NONE
    end
end


-- return bool - is unit1 before unit2 in lane march?
function LocationUtil.isBeforeInLane(hUnit1, hUnit2, eTeam, eLane)
    local location1 = hUnit1:GetLocation()
    local location2 = hUnit2:GetLocation()
    local score = 0
    if (eTeam == TEAM_RADIANT) then
        if (eLane == LANE_MID) then -- MID
            score = (location1[1] + location1[2]) - (location2[1] + location2[2])
        elseif (eLane == LANE_BOTTOM) then --BOTTOM
            score = location1[1] - location2[1]
        elseif (eLane == LANE_TOP) then --TOP
            score = location1[2] - location2[2]
        end
    elseif (eTeam == TEAM_DIRE) then
        if (eLane == LANE_MID) then -- MID
            score = (location1[1] + location1[2]) - (location2[1] + location2[2])
        elseif (eLane == LANE_BOTTOM) then --BOTTOM
            score = location1[2] - location2[2]
        elseif (eLane == LANE_TOP) then --TOP
            score = location1[1] - location2[1]
        end
        score = -score
    end
    return score > 0
end

-- get head creep of creeps in a lane
function LocationUtil.getHeadCreep(tTableNearbyCreep, eTeam, eLane)
    local hHeadCreep = nil
    for _, creep in pairs(tTableNearbyCreep) do
        if hHeadCreep == nil then
            hHeadCreep = creep
        else
            if not LocationUtil.isBeforeInLane(hHeadCreep, creep, eTeam, eLane) then
                hHeadCreep = creep
            end
        end
    end
    return hHeadCreep
end

-- get head two creep of creeps in a lane
function LocationUtil.getHeadTwoCreep(tTableNearbyCreep, eTeam, eLane)
    local hHeadOneCreep = nil
    local hHeadTwoCreep = nil
    for _, creep in pairs(tTableNearbyCreep) do
        if hHeadOneCreep == nil then
            hHeadOneCreep = creep
        else
            if not LocationUtil.isBeforeInLane(hHeadOneCreep, creep, eTeam, eLane) then
                hHeadTwoCreep = hHeadOneCreep
                hHeadOneCreep = creep
            else
                if hHeadTwoCreep == nil then
                    hHeadTwoCreep = creep
                else
                    if not LocationUtil.isBeforeInLane(hHeadTwoCreep, creep, eTeam, eLane) then
                        hHeadTwoCreep = creep
                    end
                end
            end
        end
    end
    return hHeadOneCreep, hHeadTwoCreep
end

--return a nearest location for bot to get in lane
function LocationUtil.getNearestLocationInLane(npcBot, hHeadCreep, eTeam, eLane)
    local botLocation = npcBot:GetLocation()
    local creepLocation = hHeadCreep:GetLocation()
    if eLane == LANE_MID then
        if eTeam == TEAM_RADIANT then
            return Vector((botLocation[1] + creepLocation[1] - creepLocation[2] + botLocation[2]) / 2 + 0.25 * CREEP_BODY_SIZE, (botLocation[2] + creepLocation[2] - creepLocation[1] + botLocation[1]) / 2 + 0.25 * CREEP_BODY_SIZE)
        else
            return Vector((botLocation[1] + creepLocation[1] - creepLocation[2] + botLocation[2]) / 2 - 0.25 * CREEP_BODY_SIZE, (botLocation[2] + creepLocation[2] - creepLocation[1] + botLocation[1]) / 2 - 0.25 * CREEP_BODY_SIZE)
        end
    elseif eLane == LANE_TOP then
        if eTeam == TEAM_RADIANT then
            return Vector(creepLocation[1], botLocation[2] + 0.4 * CREEP_BODY_SIZE)
        else
            return Vector(botLocation[1] + 0.4 * CREEP_BODY_SIZE, creepLocation[2])
        end
    elseif eLane == LANE_BOTTOM then
        if eTeam == TEAM_RADIANT then
            return Vector(botLocation[1] + 0.4 * CREEP_BODY_SIZE, creepLocation[2])
        else
            return Vector(creepLocation[1], botLocation[2] + 0.4 * CREEP_BODY_SIZE)
        end
    else
        return hHeadCreep:GetLocation()
    end
end

--return location, which is just factor*CREEP_BODY_SIZE away before hHeadCreep
function LocationUtil.getLocationJustBefore(hHeadCreep, eTeam, eLane, factor)
    local creepLocation = hHeadCreep:GetLocation()
    if eLane == LANE_MID then
        if eTeam == TEAM_RADIANT then
            return Vector(creepLocation[1] + factor / 1.414 * CREEP_BODY_SIZE, creepLocation[2] + factor / 1.414 * CREEP_BODY_SIZE)
        else
            return Vector(creepLocation[1] - factor / 1.414 * CREEP_BODY_SIZE, creepLocation[2] - factor / 1.414 * CREEP_BODY_SIZE)
        end
    elseif eLane == LANE_TOP then
        if eTeam == TEAM_RADIANT then
            return Vector(creepLocation[1], creepLocation[2] + factor * CREEP_BODY_SIZE)
        else
            return Vector(creepLocation[1] + factor * CREEP_BODY_SIZE, creepLocation[2])
        end
    elseif eLane == LANE_BOTTOM then
        if eTeam == TEAM_RADIANT then
            return Vector(creepLocation[1] + factor * CREEP_BODY_SIZE, creepLocation[2])
        else
            return Vector(creepLocation[1], creepLocation[2] + factor * CREEP_BODY_SIZE)
        end
    else
        return creepLocation
    end
end

--return two unit's distance in lane direction
function LocationUtil.distanceInLaneDir(hUnit1, hUnit2, eTeam, eLane)
    local location1 = hUnit1:GetLocation()
    local location2 = hUnit2:GetLocation()
    local distance = 0
    if (eTeam == TEAM_RADIANT) then
        if (eLane == LANE_MID) then -- MID
            distance = ((location1[1] - location2[1]) + (location1[2] - location2[2])) / 1.414
        elseif (eLane == LANE_BOTTOM) then --BOTTOM
            distance = location1[1] - location2[1]
        elseif (eLane == LANE_TOP) then --TOP
            distance = location1[2] - location2[2]
        end
    elseif (eTeam == TEAM_DIRE) then
        if (eLane == LANE_MID) then -- MID
            distance = ((location1[1] - location2[1]) + (location1[2] - location2[2])) / 1.414
        elseif (eLane == LANE_BOTTOM) then --BOTTOM
            distance = location1[2] - location2[2]
        elseif (eLane == LANE_TOP) then --TOP
            distance = location1[1] - location2[1]
        end
        distance = -distance
    end
    return distance
end

--return two unit's distance in lane vertical direction
function LocationUtil.distanceInLaneVerticalDir(hUnit1, hUnit2, eTeam, eLane)
    local location1 = hUnit1:GetLocation()
    local location2 = hUnit2:GetLocation()
    local distance = 0
    if (eTeam == TEAM_RADIANT) then
        if (eLane == LANE_MID) then -- MID
            distance = ((location1[1] - location2[1]) - (location1[2] - location2[2])) / 1.414
        elseif (eLane == LANE_BOTTOM) then --BOTTOM
            distance = location1[2] - location2[2]
        elseif (eLane == LANE_TOP) then --TOP
            distance = location1[1] - location2[1]
        end
    elseif (eTeam == TEAM_DIRE) then
        if (eLane == LANE_MID) then -- MID
            distance = ((location1[1] - location2[1]) - (location1[2] - location2[2])) / 1.414
        elseif (eLane == LANE_BOTTOM) then --BOTTOM
            distance = location1[1] - location2[1]
        elseif (eLane == LANE_TOP) then --TOP
            distance = location1[2] - location2[2]
        end
    end
    if distance < 0 then
        return -distance
    else
        return distance
    end
end

function LocationUtil.distanceToLane(npcBot,eTeam,eLane)
    local location = npcBot:GetLocation()
    local distance = 0
    if (eTeam == TEAM_RADIANT) then
        if (eLane == LANE_MID) then -- MID
            distance = ((location[1] - LocationUtil.TowerLocation(eTeam,TOWER_MID_3)[1]) - (location[2] - LocationUtil.TowerLocation(eTeam,TOWER_MID_3)[2])) / 1.414
        elseif (eLane == LANE_BOTTOM) then --BOTTOM
            distance = location[1] - LocationUtil.TowerLocation(eTeam,TOWER_BOT_3)[1]
        elseif (eLane == LANE_TOP) then --TOP
            distance = location[2] - LocationUtil.TowerLocation(eTeam,TOWER_TOP_3)[2]
        end
    elseif (eTeam == TEAM_DIRE) then
        if (eLane == LANE_MID) then -- MID
            distance = ((location[1] - LocationUtil.TowerLocation(eTeam,TOWER_MID_3)[1]) - (location[2] - LocationUtil.TowerLocation(eTeam,TOWER_MID_3)[2])) / 1.414
        elseif (eLane == LANE_BOTTOM) then --BOTTOM
            distance = location[2] - LocationUtil.TowerLocation(eTeam,TOWER_BOT_3)[2]
        elseif (eLane == LANE_TOP) then --TOP
            distance = location[1] - LocationUtil.TowerLocation(eTeam,TOWER_TOP_3)[1]
        end
    end
    if distance < 0 then
        return -distance
    else
        return distance
    end
end

--stick creep when it's single(easy)
function LocationUtil.stickSingleCreep(npcBot, hHeadCreep, eTeam, eLane)
    if LocationUtil.distanceInLaneVerticalDir(npcBot, hHeadCreep, eTeam, eLane) > CREEP_BODY_SIZE / 2 then
        npcBot:Action_MoveToLocation(LocationUtil.getNearestLocationInLane(npcBot, hHeadCreep, eTeam, eLane))
        return
    end
    local distance = GetUnitToLocationDistance(npcBot, hHeadCreep:GetLocation())
    if distance > 200 then --get close with creep
        npcBot:Action_MoveToLocation(LocationUtil.getLocationJustBefore(hHeadCreep, eTeam, eLane, 4.0))
        return
    end
    if distance < 200 then --very close
        if RandomFloat(0, 1) > 0.67 then
            npcBot:Action_MoveToLocation(LocationUtil.getLocationJustBefore(hHeadCreep, eTeam, eLane, 3.5))
        else
            npcBot:Action_MoveToLocation(LocationUtil.getLocationJustBefore(hHeadCreep, eTeam, eLane, 4.0))
        end
        return
    end
    npcBot:Action_MoveToLocation(LocationUtil.getLocationJustBefore(hHeadCreep, eTeam, eLane, 4.0))
end


function LocationUtil.stickDoubleCreep(npcBot, hHeadCreep, hSecondHeadCreep, eTeam, eLane)
    if LocationUtil.distanceInLaneVerticalDir(hHeadCreep, hSecondHeadCreep, eTeam, eLane) > CREEP_BODY_SIZE then
        print("distanceInLaneVerticalDir > 1")
        if LocationUtil.distanceInLaneDir(hHeadCreep, hSecondHeadCreep, eTeam, eLane) > 3 * CREEP_BODY_SIZE then
            print("stickSingleCreep")
            LocationUtil.stickSingleCreep(npcBot, hHeadCreep, eTeam, eLane)
        else
            print("Action_MoveToLocation")
            npcBot:Action_MoveToLocation(LocationUtil.getLocationJustBefore(npcBot, eTeam, eLane, 4))
        end
    else
        print("distanceInLaneVerticalDir < 1")
        if LocationUtil.distanceInLaneDir(hHeadCreep, hSecondHeadCreep, eTeam, eLane) > CREEP_BODY_SIZE then
            print("distanceInLaneDir > 1")
            LocationUtil.stickSingleCreep(npcBot, hHeadCreep, eTeam, eLane)
        else
            print("distanceInLaneDir < 1")
            if (LocationUtil.getPlaneVelocity(hHeadCreep:GetVelocity())  > LocationUtil.getPlaneVelocity(hSecondHeadCreep:GetVelocity())) then
                LocationUtil.stickSingleCreep(npcBot, hHeadCreep, eTeam, eLane)
            else
                LocationUtil.stickSingleCreep(npcBot, hSecondHeadCreep, eTeam, eLane)
            end
        end
    end
end


-- get tail ally creep
--function getTailCreep(npcBot, fScope)
--    local tableNearbyCreep = npcBot:GetNearbyCreeps(fScope, false)
--    local hHeadCreep = nil
--    for _, creep in pairs(tableNearbyCreep) do
--        if hHeadCreep == nil then
--            hHeadCreep = creep
--        else
--            if not LocationUtil.isBeforeInLane(hHeadCreep, creep) then
--                hHeadCreep = creep
--            end
--        end
--    end
--    return hHeadCreep
--end
--
--LocationUtil.getTailCreep = getTailCreep


-- return vector of nearest secret shop location
function LocationUtil.getNearestSecretShopPosition(npcBot)
    local distanceToRadiantShop = GetUnitToLocationDistance(npcBot, locations[TEAM_RADIANT]["SECRET_SHOP"])
    local distanceToDireShop = GetUnitToLocationDistance(npcBot, locations[TEAM_DIRE]["SECRET_SHOP"])
    if distanceToRadiantShop < distanceToDireShop then
        return locations[TEAM_RADIANT]["SECRET_SHOP"]
    else
        return locations[TEAM_DIRE]["SECRET_SHOP"]
    end
end





return LocationUtil
