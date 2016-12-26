



_G._savedEnv = getfenv()
module( "mode_roshan_generic", package.seeall )

function OnStart()
    --print( "mode_roshan_generic.OnStart" );
end

function OnEnd()
    --print( "mode_roshan_generic.OnEnd" );
end

function Think()
    --print( "mode_roshan_generic.Think" );
end









for k,v in pairs( mode_roshan_generic) do _G._savedEnv[k] = v end



