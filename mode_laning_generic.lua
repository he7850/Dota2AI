



_G._savedEnv = getfenv()
module( "mode_laning_generic", package.seeall )

function OnStart()
    --print( "mode_laning_generic.OnStart" );
end

function OnEnd()
    --print( "mode_laning_generic.OnEnd" );
end

function Think()
    --print( "mode_laning_generic.Think" );
    local npcBot = GetBot()
    npcBot:Action_MoveToUnit(TOWER_MID_1)

end

function GetDesire()
    return BOT_MODE_DESIRE_ABSOLUTE
end







for k,v in pairs( mode_laning_generic) do _G._savedEnv[k] = v end



