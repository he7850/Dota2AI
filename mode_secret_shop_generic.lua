



_G._savedEnv = getfenv()
module( "mode_secret_shop_generic", package.seeall )

function OnStart()
    --print( "mode_secret_shop_generic.OnStart" );
end

function OnEnd()
    --print( "mode_secret_shop_generic.OnEnd" );
end

function Think()
    --print( "mode_secret_shop_generic.Think" );
end

function GetDesire()
    local npcBot = GetBot()
    if (IsItemPurchasedFromSecretShop(nextItemToBuy) and npcBot:GetGold()>nextItemToBuy) then
        return BOT_ACTION_DESIRE_HIGH
    end

end







for k,v in pairs( mode_secret_shop_generic) do _G._savedEnv[k] = v end



