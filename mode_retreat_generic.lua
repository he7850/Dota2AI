



_G._savedEnv = getfenv()
module( "mode_retreat_generic", package.seeall )

function OnStart()
    --print( "mode_retreat_generic.OnStart" );
end

function OnEnd()
    --print( "mode_retreat_generic.OnEnd" );
end

function Think()
    --print( "mode_retreat_generic.Think" );
end









for k,v in pairs( mode_retreat_generic) do _G._savedEnv[k] = v end



