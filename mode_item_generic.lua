



_G._savedEnv = getfenv()
module( "mode_item_generic", package.seeall )

function OnStart()
    --print( "mode_item_generic.OnStart" );
end

function OnEnd()
    --print( "mode_item_generic.OnEnd" );
end

function Think()
    --print( "mode_item_generic.Think" );
end









for k,v in pairs( mode_item_generic) do _G._savedEnv[k] = v end



