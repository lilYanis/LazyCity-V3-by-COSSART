local dbname = 's451_fxserver'

ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

TriggerEvent('es:addAdminCommand', 'reset', 4, function(source, args, user)
	local player = args[1]
	local xPlayers = ESX.GetPlayers()

	if ESX.GetPlayerFromId(player) then 
		wipe(player, getId(player))
	else
		TriggerClientEvent('chat:addMessage', source, { args = { '^1SYSTEM', 'L\'ID du joueur n\'est pas valide' } })
	end
end, function(source, args, user)
	TriggerClientEvent('chat:addMessage', source, { args = { '^1SYSTEM', 'Permissions insufisantes !' } })
end, {help = 'Wipe un joueur'})

function getId(player)
	local id
	for k,v in ipairs(GetPlayerIdentifiers(player))do
		if string.sub(v, 1, string.len("steam:")) == "steam:" then
			id = v
			break
		end
	end

	return id
end

function wipe(player, id)
	DropPlayer(player, 'Vous avez été reset, recommencez une nouvelle histoire !.')

    MySQL.Async.fetchAll("SELECT table_name FROM information_schema.tables WHERE table_schema = @table_schema", { ['@table_schema'] = dbname }, function(result)
        for k, v in pairs(result) do
            MySQL.Async.execute(string.format('DELETE FROM %s WHERE identifier = @identifier', v.table_name), {
                ['@identifier'] = id
            })
        end
    end)
end