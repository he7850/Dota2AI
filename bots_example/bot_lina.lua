local LocationUtil = require(GetScriptDirectory() .. "/Util/LocationUtil")
function Think()
    local npcBot = GetBot()
    if (GetTeam() == TEAM_RADIANT) then
        --npcBot:Action_ClearActions(true)
        if npcBot:GetPlayer() == 2 then
            npcBot:Action_MoveToLocation(Vector(-6900, 4660))

            print(npcBot:GetVelocity())
            --print(npcBot:GetBaseMovementSpeed())
        end

        --print(npcBot:GetLocation())
    elseif (GetTeam() == TEAM_DIRE) then
        npcBot:Action_MoveToLocation(Vector(1370, -4110))
        --print(npcBot:GetLocation())
    end
end






