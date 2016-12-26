



_G._savedEnv = getfenv()
module( "mode_roam_generic", package.seeall )

function OnStart()
    --print( "mode_roam_generic.OnStart" );
end

function OnEnd()
    --print( "mode_roam_generic.OnEnd" );
end

--function Think()
--    --print( "mode_roam_generic.Think" );
--end









for k,v in pairs( mode_roam_generic) do _G._savedEnv[k] = v end



