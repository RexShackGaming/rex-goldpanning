local RSGCore = exports['rsg-core']:GetCoreObject()
local panningCooldown = {}
lib.locale()

----------------------------
-- useable item: goldpan
----------------------------
RSGCore.Functions.CreateUseableItem('goldpan', function(source, item)
    local src = source
    local Player = RSGCore.Functions.GetPlayer(src)
    if not Player then return end

    local cooldownTime = Config.Cooldown

    -- cooldown check
    if panningCooldown[src] and (GetGameTimer() - panningCooldown[src]) < (cooldownTime * 1000) then
        TriggerClientEvent('ox_lib:notify', src, {
            title = locale('sv_lang_11'),
            description = locale('sv_lang_12'),
            type = 'error'
        })
        return
    end

    -- start panning (client handles animation + progress bar)
    TriggerClientEvent('rex-goldpanning:client:startgoldpanning', src)
end)

----------------------------
-- reward handler
----------------------------
RegisterServerEvent('rex-goldpanning:server:givereward', function()
    local src = source
    local Player = RSGCore.Functions.GetPlayer(src)
    if not Player then return end

    local firstname = Player.PlayerData.charinfo.firstname
    local lastname  = Player.PlayerData.charinfo.lastname

    -- only allow one reward per panning session
    if panningCooldown[src] and (GetGameTimer() - panningCooldown[src]) < 5000 then
        -- possible exploit attempt
        print(string.format("^1[rex-goldpanning] Possible exploit attempt from %s (%s)^0", GetPlayerName(src), src))
        return
    end

    -- set cooldown immediately to prevent double rewards
    panningCooldown[src] = GetGameTimer()

    local foundSomething = math.random(1, 100) <= Config.GoldChance

    if not foundSomething then
        TriggerClientEvent('ox_lib:notify', src, {
            title = locale('sv_lang_10'),
            description = locale('sv_lang_13'),
            type = 'error'
        })
        return
    end

    -- tiered reward system
    local roll = math.random(1, 100)

    if roll <= 50 then -- small reward
        local item = Config.RewardItems[math.random(#Config.RewardItems)]
        Player.Functions.AddItem(item, Config.SmallRewardAmount)
        TriggerClientEvent('rsg-inventory:client:ItemBox', src, RSGCore.Shared.Items[item], 'add', Config.SmallRewardAmount)
        TriggerClientEvent('ox_lib:notify', src, { title = locale('sv_lang_1'), type = 'success' })
        TriggerEvent('rsg-log:server:CreateLog', 'goldpanning', locale('sv_lang_2'), 'yellow', firstname..' '..lastname..locale('sv_lang_3'))

    elseif roll <= 80 then -- medium reward
        local item1 = Config.RewardItems[math.random(#Config.RewardItems)]
        local item2 = Config.RewardItems[math.random(#Config.RewardItems)]
        local qty = Config.MediumRewardAmount

        Player.Functions.AddItem(item1, qty)
        Player.Functions.AddItem(item2, qty)
        TriggerClientEvent('rsg-inventory:client:ItemBox', src, RSGCore.Shared.Items[item1], 'add', qty)
        TriggerClientEvent('rsg-inventory:client:ItemBox', src, RSGCore.Shared.Items[item2], 'add', qty)
        TriggerClientEvent('ox_lib:notify', src, { title = locale('sv_lang_4'), type = 'success' })
        TriggerEvent('rsg-log:server:CreateLog', 'goldpanning', locale('sv_lang_5'), 'yellow', firstname..' '..lastname..locale('sv_lang_6'))

    else -- large reward
        local qty = Config.LargeRewardAmount
        for i = 1, 3 do
            local item = Config.RewardItems[math.random(#Config.RewardItems)]
            Player.Functions.AddItem(item, qty)
            TriggerClientEvent('rsg-inventory:client:ItemBox', src, RSGCore.Shared.Items[item], 'add', qty)
        end
        TriggerClientEvent('ox_lib:notify', src, { title = locale('sv_lang_7'), type = 'success' })
        TriggerEvent('rsg-log:server:CreateLog', 'goldpanning', locale('sv_lang_8'), 'yellow', firstname..' '..lastname..locale('sv_lang_9'))
    end
end)

----------------------------
-- clean up cooldown when player leaves
----------------------------
AddEventHandler('playerDropped', function()
    local src = source
    if panningCooldown[src] then
        panningCooldown[src] = nil
    end
end)
