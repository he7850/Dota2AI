



_G._savedEnv = getfenv()
module( "mode_assemble_generic", package.seeall )

function OnStart()
    --print( "mode_assemble_generic.OnStart" );
end

function OnEnd()
    --print( "mode_assemble_generic.OnEnd" );
end

function Think()
    --print( "mode_assemble_generic.Think" );
end

function GetDesire()
    return 0
end







for k,v in pairs( mode_assemble_generic) do _G._savedEnv[k] = v end



