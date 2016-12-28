--
-- User: HUBIN
-- Date: 2016/12/27
--

--ABILITY REFERENCED
--param: h-handle, f-float, n-int, v-vector, b-bool, psz-cstring, e-enum

--: return bool
--Can this Ability be upgraded?
function CanAbilityBeUpgraded() end

--: return int
--Get the basic damage value of this Ability.
function GetAbilityDamage() end

-- return bool
--Get the autocast state of this Ability.
function GetAutoCastState() end

-- return int
--Get the behavior type of this Ability.
function GetBehavior() end

-- return int
--Get the behavior type of this Ability.
function GetCastPoint() end

-- return int
--Get the behavior type of this Ability.
function GetCastRange() end

-- return handle
--Get the unit who owns this Ability.
function GetCaster() end

-- return float
--How long does this Ability channel?
function GetChannelTime() end

-- return int
--Get the mana cost per second of this Ability while channeling it.
function GetChannelledManaCostPerSecond() end

-- return float
--    Get the cooldown time remaning for this Ability.
function GetCooldownTimeRemaining() end

-- return int
--    Get the damage type of this Ability.
function GetDamageType() end

-- return int
--    Get the Hero level required to upgrade this Ability.
function GetHeroLevelRequiredToUpgrade() end

-- return int
--    Get the current level of the Ability.
function GetLevel() end

-- return int
--    Get the mana cost of this Ability.
function GetManaCost() end

-- return int
--    Get the max level of this Ability.
function GetMaxLevel() end

-- return cstring
--    Get the name of this Ability.
function GetName() end

-- return float
--    Get an int internal data parameter of this Abilty.
function GetSpecialValueFloat(--[[cstring]] pszKey ) end

-- return int
--    Get an int internal data parameter of this Abilty.
function GetSpecialValueInt(--[[cstring]] pszKey ) end

-- return int
--    Get an int internal data parameter of this Abilty.
function GetTargetFlags() end

-- return int
--   Get the target team of this Ability.
function GetTargetTeam() end

-- return int
--    Get the target type of this Ability.
function GetTargetType() end

-- return bool
--    Get the toggle state of this Ability.
function GetToggleState() end

-- return bool
--    Is this Ability currently activated?
function IsActivated() end

-- return bool
--    Is this Ability the attribute bonus?
function IsAttributeBonus() end

-- return bool
--    Is this Ability being channelled?
function IsChanneling() end

-- return bool
--    Is this Ability off cooldown?
function IsCooldownReady() end

-- return bool
--    Does the caster have the mana to use this Ability, and is it off cooldown?
function IsFullyCastable() end

-- return bool
--    Is this Ability currently hidden?
function IsHidden() end

-- return bool
--    Is this Ability being cast?
function IsInAbilityPhase() end

-- return bool
--    Is this an Item?
function IsItem() end

-- return bool
--    Does the caster have the mana to use this Ability?
function IsOwnersManaEnough() end

-- return bool
--    Is this a passive Ability?
function IsPassive() end

-- return bool
--    Can this Ability be stolen?
function IsStealable() end

-- return bool
--    Can this Ability be stolen?
function IsStolen() end

-- return bool
--    Can this Ability be stolen?
function IsToggle() end

-- return bool
--    Can this Ability be stolen?
function IsTrained() end

-- return bool
--    Can this Ability be stolen?
function ProcsMagicStick() end

-- void
--    Toggle the autocast state of this Ability.
function ToggleAutoCast() end

-- void
--    Upgrade this Ability by 1 level.
function UpgradeAbility() end
