



_G._savedEnv = getfenv()
module( "mode_defend_tower_mid_generic", package.seeall )

function OnStart()
    --print( "mode_defend_tower_mid_generic.OnStart" );
end

function OnEnd()
    --print( "mode_defend_tower_mid_generic.OnEnd" );
end

function Think()
    --print( "mode_defend_tower_mid_generic.Think" );
end









for k,v in pairs( mode_defend_tower_mid_generic) do _G._savedEnv[k] = v end



