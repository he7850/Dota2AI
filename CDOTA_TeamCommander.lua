--
-- User: HUBIN
-- Date: 2016/12/27
--

-- GLOBAL

function CMBanHero( cstring ) end 
--return void
--Ban a hero in Captain’s mode by name.

function CMPickHero( cstring ) end 
--return void
--Pick a hero in Captain’s mode by name.

function Clamp( float, float, float ) end 
--return float
--Clamps the value between the two supplied values.

function DebugDrawCircle( vector, float, int, int, int ) end 
--return void
--Draws a circle for one frame

function DebugDrawLine( vector, vector, int, int, int ) end 
--return void
--Draws a line for one frame

function DebugDrawText( float, float, cstring, int, int, int ) end 
--return void
--Draws text for one frame

function DotaTime( ) end 
--return float
--Gets the game time – matches the in-game clock. Pauses with game pause.

function GameTime( ) end 
--return float
--Gets the time since the hero picking phase started. Pauses with game pause.

function GetBot( ) end 
--return handle
--Get the bot on which script is currently being run.

function GetCMCaptain( ) end 
--return int
--Gets player ID of the Captain’s Mode captain.

function GetCMPhaseTimeRemaining( ) end 
--return float
--Get the amount of time remaining in the current Captain’s Mode phase.

function GetDefendLaneDesire( int ) end 
--return float
--Gets the team-wide desire to defend a lane.

function GetFarmLaneDesire( int ) end 
--return float
--Gets the team-wide desire to farm a lane.

function GetGameMode( ) end 
--return int
--Gets the game mode type.

function GetGameState( ) end 
--return int
--Gets the current state of the game.

function GetGameStateTimeRemaining( ) end 
--return float
--Gets how much time is remaining in the current game state.

function GetHeightLevel( vector ) end 
--return int
--Get the height level (1 through 5) of the specified location.

function GetHeroPickState( ) end 
--return int
--Gets the current phase of hero picking.

function GetItemCost( cstring ) end 
--return int
--Get the cost of an item by name.

function GetItemStockCount( cstring ) end 
--return int
--Get the current stock count for the named item.

function GetLocationAlongLane( int, float ) end 
--return vector
--Get the location along the specified lane path.

function GetNeutralSpawners( ) end 
--return variant
--Get the location of all neutral spawners, and what side of the river they’re on.

function GetPushLaneDesire( int ) end 
--return float
--Gets the team-wide desire to push a lane.

function GetRoamDesire( ) end 
--return float
--Gets the team-wide desire to roam to a target.

function GetRoamTarget( ) end 
--return handle
--Gets the target of the team-wide roam desire.

function GetRoshanDesire( ) end 
--return float
--Get s the team-wide desire to kill Roshan.

function GetRuneStatus( int ) end
--return enum
--Get s the status of the specified rune.

function GetRuneTimeSinceSeen( int ) end 
--return float
--Gets the time since we’ve seen the specified rune.

function GetRuneType( int ) end
--return int
--Gets the type of the specified rune, if known.

function GetScriptDirectory( ) end 
--return cstring
--Get the directory from which bot scripts are being run.

function GetSelectedHeroName( int ) end 
--return cstring
--Gets the name of the hero selected by a player.

function GetTeam( ) end 
--return int
--Get the team on which script is currently being run.

function GetTeamForPlayer( int ) end 
--return int
--Gets the team of the specified player.

function GetTeamMember( int, int ) end 
--return handle
--Get a member of a team.

function GetTeamPlayers( int ) end 
--return variant
--Gets a list of Player IDs for the specified team.

function GetTreeLocation( int ) end 
--return vector
--Gets the location of the specified tree.

function GetUnitPotentialValue( handle, vector, float ) end 
--return int
--Gets the 0-255 potential-value location of a hero at the specified location and radius.

function GetUnitToLocationDistance( handle, vector ) end 
--return float
--Get the distance between a unit and a location.

function GetUnitToUnitDistance( handle, handle ) end 
--return float
--Get the distance between two units.

function GetWorldBounds( ) end 
--return variant
--Gets the minimum and maximum bounds of the world.

function IsCMBannedHero( cstring ) end 
--return bool
--Has the named hero been banned in Captain’s Mode?

function IsCMPickedHero( int, cstring ) end 
--return bool
--Has the named hero been picked in Captain’s Mode?

function IsCourierAvailable( ) end 
--return bool
--Asks if a courier is available to use.

function IsInCMBanPhase( ) end 
--return bool
--Is Captain’s Mode in Ban phase?

function IsInCMPickPhase( ) end 
--return bool
--Is Captain’s Mode in Pick phase?

function IsItemPurchasedFromSecretShop( cstring ) end 
--return bool
--Can the named item can be purchased from the secret shop?

function IsItemPurchasedFromSideShop( cstring ) end 
--return bool
--Can the named item can be purchased from the side shop?

function IsLocationPassable( vector ) end 
--return bool
--Can the specified location currently be pathed through.

function IsPlayerBot( int ) end 
--return bool
--Asks if a specific Player ID is a bot.

function IsPlayerInHeroSelectionControl( int ) end 
--return bool
--Is this player allowed to currently allowed to select a hero?

function IsTeamPlayer( int ) end 
--return bool
--Asks if a specific Player ID is a member of Radiant or Dire.

function Max( float, float ) end 
--return float
--Returns the smaller of the two supplied values.

function Min( float, float ) end 
--return float
--Returns the smaller of the two supplied values.

function RandomFloat( float, float ) end 
--return float
--Get a random float within a range

function RandomInt( int, int ) end 
--return int
--Get a random int within a range

function RandomVector( float ) end 
--return vector
--Get a random 2D vector of the specified length.

function RealTime( ) end 
--return float
--Gets the real-world time since the app has started. Does not pause with game pause.

function RemapVal( float, float, float, float, float ) end 
--return float
--Linearly  remaps X from A,B to C,D

function RemapValClamped( float, float, float, float, float ) end 
--return float
--Linearly  remaps X from A,B to C,D, clamping to C,D

function RollPercentage( int ) end 
--return bool
--Rolls a number from 1 to 100 and returns true if the roll is less than or equal to the number specified

function SelectHero( int, cstring ) end 
--return void
--Selects a hero for a player.

function SetCMCaptain( int ) end 
--return void
--Sets a player to be Captain’s Mode captain.

