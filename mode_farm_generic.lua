



_G._savedEnv = getfenv()
module( "mode_farm_generic", package.seeall )

function OnStart()
    --print( "mode_farm_generic.OnStart" );
end

function OnEnd()
    --print( "mode_farm_generic.OnEnd" );
end

function Think()
    --print( "mode_farm_generic.Think" );
end









for k,v in pairs( mode_farm_generic) do _G._savedEnv[k] = v end



