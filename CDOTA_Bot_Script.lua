--
-- User: HUBIN
-- Date: 2016/12/27

--UNIT REFERENCED
--param: h-handle, f-float, n-int, v-vector, b-bool, psz-cstring, e-enum

function Action_AttackMove( vLocation ) end
--return void
--Tell a bot to attack-move a location.

function Action_AttackUnit( hTarget, bOnce ) end
--return void
--Tell a bot to attack a target unit.
--If bOnce is specified, it will auto-pop the action after one attack.

function Action_Buyback( ) end
--return void
--Tell a bot to buy back into the game.

function Action_Chat( pszMessage, bAllChat ) end
--return void
--Tell a bot to say something.

function Action_ClearActions( bStop ) end
--return void
--Clear current action stack and return to idle.
--Optionally stop in place.

function Action_CourierDeliver( ) end
--return bool
--Tell a bot to use the courier.

function Action_DropItem( hItem, vLocation ) end
--return void
--Tell a bot to drop an item.

function Action_LevelAbility( pszAbilityName ) end
--return void
--Tell a bot to level up a specific ability.

function Action_MoveToLocation( vLocation ) end
--return void
--Tell a bot to move to a location.

function Action_MoveToUnit( hTarget ) end
--return void
--Tell a bot to move to a unit and start following them.

function Action_PickUpItem( hItem ) end
--return void
--Tell a bot to pick up a dropped item.

function Action_PickUpRune( hTarget ) end
--return void
--Tell a bot to pick up a rune.

function Action_PurchaseItem( pszItemName ) end
--Tell a bot to purchase an item by name.

function Action_SellItem( hItem ) end
--return void
--Tell a bot to sell an item.

function Action_UseAbility( hAbility ) end
--return void
--Tell a bot to use a non-targeted ability.

function Action_UseAbilityOnEntity( hAbility, hTarget ) end
--return void
--Tell a bot to use a unit-targeted ability.

function Action_UseAbilityOnLocation( hAbility, vLocation ) end
--return void
--Tell a bot to use a location-targeted ability.

function Action_UseAbilityOnTree( hAbility, nTree ) end
--return void
--Tell a bot to use a tree-targeted ability.

function CanBeSeen( ) end
--return bool
--Can we currently see this bot? Always true for bots on our team.
--Many function will not return valid data without this being true.

function DistanceFromFountain( ) end
--return int
--Get the unit’s straight-line distance from the team’s fountain (0 is in the fountain).

function DistanceFromSecretShop( ) end
--return int
--Get the unit’s straight-line distance from the closest secret shop (0 is in a secret shop).

function DistanceFromSideShop( ) end
--return int
--Get the unit’s straight-line distance from the closest side shop (0 is in a side shop).

function FindAoELocation( bEnemies, bHeroes, vBaseLocation, nMaxDistanceFromBase, nRadius, fTimeInFuture, nMaxHealth ) end
--return variant
--Finds optimal AoE location that overlaps heroes/creeps.

function GetAbilityByName( pszAbilityName ) end
--return handle
--Get a bot’s ability by name

function GetActiveMode( ) end
--return int
--Get the active mode ID

function GetActiveModeDesire( ) end
--return float
--Get the desire value of the active mode

function GetActualDamage( nDamage, eDamageType ) end
--return int
--Get damage value after reductions.

function GetAssignedLane( ) end
--return int
--Get the lane that a unit is assigned to.

function GetAttackTarget( ) end
--return handle
--Get the unit being attacked.

function GetBaseMovementSpeed( ) end
--return int
--Get a bot’s base movement speed.

function GetCourierValue( ) end
--return int
--Get the value of items on the courier owned by this bot.

function GetCurrentActionType( ) end
--return int
--Get the type of the current action.

function GetCurrentMovementSpeed( ) end
--return int
--Get a bot’s current movement speed.

function GetDifficulty( ) end
--return int
--Get the bot’s difficulty settings.

function GetEstimatedDamageToTarget( bCurrentlyAvailable, hTarget,  fDuration, nDamageTypes ) end
--return int
--Get an estimate of how much damage a bot can do in the specified timeframe.
--Takes into account item and ability usage based on current mana/cooldowns for allies, for enemies it assumes all items/abilities are available.
--Uses no positional/situation info.
--Basically asks ‘How scary is X to Y?’.

function GetExtrapolatedLocation( fDelay ) end
--return vector
--Extrapolates their location in the future, based on past movement.

function GetFacing( ) end
--return int
--Get a bot’s facing (0-255).

function GetGold( ) end
--return int
--Get the bot’s current gold.

function GetGroundHeight( ) end
--return int
--Get a bot’s height value.

function GetHealth( ) end
--return int
--Get a bot’s current health.

function GetItemInSlot( nSlot ) end
--return handle
--Get a bot’s item by slot
function GetLastSeenLocation( ) end
--return vector
--Get the location at which this unit was last seen.

function GetLocation( ) end
--return vector
--Get a bot’s 2D location.

function GetMana( ) end
--return int
--Get a bot’s current mana.

function GetMaxHealth( ) end
--return int
--Get a bot’s maximum health.

function GetMaxMana( ) end
--return int
--Get a bot’s maximum mana.

function GetModifier( nModifier ) end
--return cstring
--Get a specific modifier name

function GetMovementDirectionStability( ) end
--return float
--Indicates how consistent the unit’s movement has been over the last few seconds.
--1 is a straight line, 0 is serpentine.

function GetNearbyCreeps( nRadius, bEnemies ) end
--return variant
--Get nearby creeps that we can see.

function GetNearbyHeroes( nRadius, bEnemies, eBotMode ) end
--return variant
--Get nearby heroes that we can see in a mode.
--Can specify a bot mode when querying allies.
--BOT_MODE_NONE does no mode filtering.

function GetNearbyTowers( nRadius, bEnemies ) end
--return variant
--Get all nearby towers.

function GetNearbyTrees( nRadius ) end
--return variant
--Get nearby trees.

function GetNextItemPurchaseValue( ) end
--return int
--Get the purchase value of the next item the unit wants to purchase.

function GetPlayer( ) end
--return int
--Get the unit’s controlling player number.

function GetRespawnTime( ) end
--return float
--Get the time in seconds until a bot respawns.

function GetSlowDuration( bCurrentlyAvailable ) end
--return float
--Get the duration of available slows.

function GetStashValue( ) end
--return int
--Get the value of the items in the bot’s stash.

function GetStunDuration( bCurrentlyAvailable ) end
--return float
--Get the duration of available stuns.

function GetTarget( ) end
--return handle
--Get the current target of this bot.

function GetTimeSinceLastSeen( ) end
--return float
--Get how long it’s been since the unit was seen.

function GetUnitName( ) end
--return cstring
--Get the unit’s name.

function GetVelocity( ) end
--return vector
--Get the velocity the unit has moved over the last two seconds.

function HasBlink( bCurrentlyAvailable ) end
--return bool
--Does the bot have a blink available?

function HasBuyback( ) end
--return bool
--Can the bot buy back?

function HasInvisibility( bCurrentlyAvailable ) end
--return bool
--Does the bot have invisibility available?

function HasMinistunOnAttack( ) end
--return bool
--Does the bot have ministuns on attack?

function HasModifier( pszModifierName ) end
--return bool
--Does the bot have the specified modifier?

function HasScepter( ) end
--return bool
--Does the unit have Aghanim’s Scepter?

function HasSilence( bCurrentlyAvailable ) end
--return bool
--Does the bot have a silence available?

function IsAlive( ) end
--return bool
--Is a bot alive?

function IsAttackImmune( ) end
--return bool
--Is the unit attack immune?

function IsBlind( ) end
--return bool
--Is the unit blind?

function IsBlockDisabled( ) end
--return bool
--Is the unit block disabled?

function IsBot( ) end
--return bool
--Is this unit owned by a bot?

function IsBuilding( ) end
--return bool
--Is this unit a building?

function IsChanneling( ) end
--return bool
--Is this bot currently channeling an ability?

function IsCreep( ) end
--return bool
--Is this unit a creep?

function IsDisarmed( ) end
--return bool
--Is the unit disarmed?

function IsDominated( ) end
--return bool
--Is the unit dominated?

function IsEvadeDisabled( ) end
--return bool
--Is the unit evade disabled?

function IsFort( ) end
--return bool
--Is this unit a fort (the main ancient building)?

function IsHero( ) end
--return bool
--Is this unit a hero?

function IsHexed( ) end
--return bool
--Is the unit hexed?

function IsIllusion( ) end
--return bool
--Is this unit an illusion?

function IsInvulnerable( ) end
--return bool
--Is the unit invulnerable?

function IsMagicImmune( ) end
--return bool
--Is the unit magic immune?

function IsMuted( ) end
--return bool
--Is the unit muted?

function IsNightmared( ) end
--return bool
--Is the unit nightmared?

function IsRooted( ) end
--return bool
--Is the unit rooted?

function IsSilenced( ) end
--return bool
--Is the unit silenced?

function IsSpeciallyDeniable( ) end
--return bool
--Is the unit specially deniable?

function IsStunned( ) end
--return bool
--Is the unit stunned?

function IsTower( ) end
--return bool
--Is this unit a tower?

function IsUnableToMiss( ) end
--return bool
--Is the unit unable to miss?

function IsUsingAbility( ) end
--return bool
--Is this bot currently casting an ability?

function NumModifiers( ) end
--return int
--Get the number of modifiers on this bot.

function SetNextItemPurchaseValue( nGold ) end
--return void
--Set the value of the next item the unit wants to purchase.

function SetTarget( ) end
--return void
--Set the current target of this bot.
--Causes no actions, but is used for coordinating between modes and ability/item usage.

function TimeSinceDamagedByAnyHero( ) end
--return float
--How long as it been since the unit was damaged by any enemy?

function TimeSinceDamagedByHero( hHero ) end
--return float
--How long as it been since the unit was damaged by an specific enemy?

function UsingItemBreaksInvisibility( ) end
--return bool
--Will using an item break invisibiilty?

function WasRecentlyDamagedByAnyHero(  fTime ) end
--return bool
--Was the unit recently damaged by any enemy?

function WasRecentlyDamagedByHero( hHero,  fTime ) end
--return bool
--Was the unit recently damaged by an specific enemy?

-----------------------------end
