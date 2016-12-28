--
-- User: HUBIN
-- Date: 2016/12/28
--

_G._savedEnv = getfenv()
module( "TeamStatus", package.seeall )

----------------------------------------------------------------------------------------------------

local teamHope = 0.5;

function SetTeamHope (value)
    teamHope = value;
end

function GetTeamHope ()
    return teamHope;
end

----------------------------------------------------------------------------------------------------

for k,v in pairs( TeamStatus ) do	_G._savedEnv[k] = v end
