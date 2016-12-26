



_G._savedEnv = getfenv()
module( "mode_war_generic", package.seeall )

function OnStart()
    --print( "mode_war_generic.OnStart" );
end

function OnEnd()
    --print( "mode_war_generic.OnEnd" );
end

--function Think()
--    --print( "mode_war_generic.Think" );
--end









for k,v in pairs( mode_war_generic) do _G._savedEnv[k] = v end



