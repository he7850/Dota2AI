--[[
--  hero selection:
--  Think() - Called every frame. Responsible for selecting heroes for bots.
--  UpdateLaneAssignments() - Called every frame prior to the game starting. Returns ten PlayerID-Lane pairs.
 ]]
----------------------------------------------------------------------------------------------------
function Think()
    if (GetGameMode() == GAMEMODE_AP or GetGameMode() == GAMEMODE_MO and GetHeroPickState() == HEROPICK_STATE_AP_SELECT) then
        --print("GameTime():" .. GameTime())
        --print("GetGameState():" .. GetGameState())
        --print("GetGameStateTimeRemaining():" .. GetGameStateTimeRemaining())
        --print("GetGameMode():" .. GetGameMode())
        --print("GetHeroPickState():" .. GetHeroPickState())

        --        print("IsPlayerInHeroSelectionControl(0):" .. tostring(IsPlayerInHeroSelectionControl(0)))
        --        print("IsPlayerInHeroSelectionControl(1):" .. tostring(IsPlayerInHeroSelectionControl(1)))
        --        print("IsPlayerInHeroSelectionControl(2):" .. tostring(IsPlayerInHeroSelectionControl(2)))
        --        print("IsPlayerInHeroSelectionControl(3):" .. tostring(IsPlayerInHeroSelectionControl(3)))
        --        print("IsPlayerInHeroSelectionControl(4):" .. tostring(IsPlayerInHeroSelectionControl(4)))
        --        print("IsPlayerInHeroSelectionControl(5):" .. tostring(IsPlayerInHeroSelectionControl(5)))
        --        print("IsPlayerInHeroSelectionControl(6):" .. tostring(IsPlayerInHeroSelectionControl(6)))
        --        print("IsPlayerInHeroSelectionControl(7):" .. tostring(IsPlayerInHeroSelectionControl(7)))
        --        print("IsPlayerInHeroSelectionControl(8):" .. tostring(IsPlayerInHeroSelectionControl(8)))
        --        print("IsPlayerInHeroSelectionControl(9):" .. tostring(IsPlayerInHeroSelectionControl(9)))
        -- if (GetTeam() == TEAM_RADIANT) then
        SelectHero(0, "npc_dota_hero_lina") -- human position
        SelectHero(1, "npc_dota_hero_lina") -- choose lina for test
        SelectHero(2, "npc_dota_hero_lina")
        SelectHero(3, "npc_dota_hero_lina")
        SelectHero(4, "npc_dota_hero_lina")
        --elseif (GetTeam() == TEAM_DIRE) then
        SelectHero(5, "npc_dota_hero_lina")
        SelectHero(6, "npc_dota_hero_lina")
        SelectHero(7, "npc_dota_hero_lina")
        SelectHero(8, "npc_dota_hero_lina")
        SelectHero(9, "npc_dota_hero_lina")
        --end
        --        print("GetSelectedHeroName(0):" .. tostring(GetSelectedHeroName(0)))
        --        print("GetSelectedHeroName(1):" .. tostring(GetSelectedHeroName(1)))
        --        print("GetSelectedHeroName(2):" .. tostring(GetSelectedHeroName(2)))
        --        print("GetSelectedHeroName(3):" .. tostring(GetSelectedHeroName(3)))
        --        print("GetSelectedHeroName(4):" .. tostring(GetSelectedHeroName(4)))
        --        print("GetSelectedHeroName(5):" .. tostring(GetSelectedHeroName(5)))
        --        print("GetSelectedHeroName(6):" .. tostring(GetSelectedHeroName(6)))
        --        print("GetSelectedHeroName(7):" .. tostring(GetSelectedHeroName(7)))
        --        print("GetSelectedHeroName(8):" .. tostring(GetSelectedHeroName(8)))
        --        print("GetSelectedHeroName(9):" .. tostring(GetSelectedHeroName(9)))
    end
end

----------------------------------------------------------------------------------------------------
function UpdateLaneAssignments()
    laneAssignment = {}
    if (GetGameMode() == GAMEMODE_MO) then
        laneAssignment[0] = LANE_MID
        laneAssignment[1] = LANE_MID
        laneAssignment[2] = LANE_MID
        laneAssignment[3] = LANE_MID
        laneAssignment[4] = LANE_MID
        laneAssignment[5] = LANE_MID
        laneAssignment[6] = LANE_MID
        laneAssignment[7] = LANE_MID
        laneAssignment[8] = LANE_MID
        laneAssignment[9] = LANE_MID
    elseif (GetGameMode() == GAMEMODE_AP) then
        laneAssignment[0] = LANE_MID
        laneAssignment[1] = LANE_MID
        laneAssignment[2] = LANE_MID
        laneAssignment[3] = LANE_MID
        laneAssignment[4] = LANE_MID
        laneAssignment[5] = LANE_MID
        laneAssignment[6] = LANE_MID
        laneAssignment[7] = LANE_MID
        laneAssignment[8] = LANE_MID
        laneAssignment[9] = LANE_MID
    end
    return laneAssignment
end