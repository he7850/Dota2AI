



_G._savedEnv = getfenv()
module( "mode_team_roam_generic", package.seeall )

function OnStart()
    --print( "mode_team_roam_generic.OnStart" );
end

function OnEnd()
    --print( "mode_team_roam_generic.OnEnd" );
end

--function Think()
--    --print( "mode_team_roam_generic.Think" );
--end









for k,v in pairs( mode_team_roam_generic) do _G._savedEnv[k] = v end



