ESX = nil

Citizen.CreateThread(function()
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
        Citizen.Wait(100)
    end
end)



function KeyboardInput(entryTitle, textEntry, inputText, maxLength)
    AddTextEntry(entryTitle, textEntry)
    DisplayOnscreenKeyboard(1, entryTitle, '', inputText, '', '', '', maxLength)
    blockinput = true 

    while UpdateOnscreenKeyboard() ~= 1 and UpdateOnscreenKeyboard() ~= 2 do
        Citizen.Wait(0)
    end

    if UpdateOnscreenKeyboard() ~= 2 then
        local result = GetOnscreenKeyboardResult()
        Citizen.Wait(500)
        blockinput = false
        return result
    else
        Citizen.Wait(500)
        blockinput = false
        return nil
    end
end

function retire_argent()
    local amount = KeyboardInput('Neo_modif_DEPOT2', ('Retiré de l\'argent'), '', 6)

    if amount ~= nil then
        amount = tonumber(amount)

        if type(amount) == 'number' then
            TriggerServerEvent('RetiréArgent', amount)
        end
    end
end

function depot_argent()
    local amount = KeyboardInput('Neo_modif_DEPOT', ('Poser de l\'argent'), '', 6)

    if amount ~= nil then
        amount = tonumber(amount)

        if type(amount) == 'number' then
            TriggerServerEvent('PoserArgent', amount)
        end
    end
end

local Atm = {
    	Base = { Header = {"commonmenu", "interaction_bgd"}, Color = {color_black}, HeaderColor = {255, 255, 255}, Title = "FLEECA"},
    Data = { currentMenu = "Bienvenue FLEECA" },
    Events = {

        onSelected = function(self, _, btn, CMenu, menuData, currentButton, currentSlt, result)
            if btn.name == "1 | Déposer" then

                startScenario('PROP_HUMAN_ATM')

                Citizen.Wait(7000) 
                ClearPedTasksImmediately(PlayerPedId())
                TriggerServerEvent('deposer')
                
                end

            if btn.name == "2 | Déposer" then
            
                startScenario('PROP_HUMAN_ATM')

                Citizen.Wait(7000)
                ClearPedTasksImmediately(PlayerPedId())
                TriggerServerEvent('deposer2')

                end

            if btn.name == "3 | Déposer" then
            
                startScenario('PROP_HUMAN_ATM')

                Citizen.Wait(7000)
                ClearPedTasksImmediately(PlayerPedId())
                TriggerServerEvent('deposer3')

                end

            if btn.name == "1 | Retiré" then
            
                startScenario('PROP_HUMAN_ATM')

                Citizen.Wait(7000)
                ClearPedTasksImmediately(PlayerPedId())
                TriggerServerEvent('retire')

                end


            if btn.name == "2 | Retiré" then
            
                startScenario('PROP_HUMAN_ATM')

                Citizen.Wait(7000)
                ClearPedTasksImmediately(PlayerPedId())
                TriggerServerEvent('retire2')

                end

            if btn.name == "3 | Retiré" then
            
                startScenario('PROP_HUMAN_ATM')

                Citizen.Wait(7000)
                ClearPedTasksImmediately(PlayerPedId())
                TriggerServerEvent('retire3')

                end

                if btn.name == "Regarder votre" then
            
                    TriggerServerEvent('solde')
    
                    end
                    if btn.name == "Déposer une somme personnaliser" then
                        startScenario('PROP_HUMAN_ATM')
        
                        Citizen.Wait(7000)
                        ClearPedTasksImmediately(PlayerPedId())
                        depot_argent()
            
                        end
        
                    if btn.name == "Retiré une somme personnaliser" then
                        
                        startScenario('PROP_HUMAN_ATM')
        
                        Citizen.Wait(7000)
                        ClearPedTasksImmediately(PlayerPedId()) 
                        retire_argent()
            
                        end

        end,
    },

    Menu = {

        ["Bienvenue FLEECA"] = {
            b = {
                {name = "Regarder votre", ask = "~g~Solde", askX = true},
                {name = "Déposer votre argent", ask = "~w~>", askX = true},
                {name = "Retiré votre argent", ask = "~w~>", askX = true},
            } 
        },

        ["déposer votre argent"] = {
            b = {
            	{name = "1 | Déposer", ask = "~w~500$", askX = true},
                {name = "2 | Déposer", ask = "~w~1 000$", askX = true},
                {name = "3 | Déposer", ask = "~w~2 000$", askX = true},
                {name = "Déposer une somme personnaliser", ask = "~w~>", askX = true},
            }
        },

        ["retiré votre argent"] = {
            b = {
            	{name = "1 | Retiré", ask = "500$", askX = true},
                {name = "2 | Retiré", ask = "1 000$", askX = true},
                {name = "3 | Retiré", ask = "2 000$", askX = true},
                {name = "Retiré une somme personnaliser", ask = "~w~>", askX = true},
            }
        },
    }
}

--- Parler au ped

local positionATM = {
    {x=-386.733, y=6045.953, z=31.501},
    {x=-284.037, y=6224.385, z=31.187},
    {x=-284.037, y=6224.385, z=31.187},
    {x=-135.165, y=6365.738, z=31.101},
    {x=-110.753, y=6467.703, z=31.784},
    {x=-94.9690, y=6455.301, z=31.784},
    {x=155.4300, y=6641.991, z=31.784},
    {x=174.6720, y=6637.218, z=31.784},
    {x=1703.138, y=6426.783, z=32.730},
    {x=1735.114, y=6411.035, z=35.164},
    {x=1702.842, y=4933.593, z=42.051},
    {x=1967.333, y=3744.293, z=32.272},
    {x=1821.917, y=3683.483, z=34.244},
    {x=1174.532, y=2705.278, z=38.027},
    {x=540.0420, y=2671.007, z=42.177},
    {x=2564.399, y=2585.100, z=38.016},
    {x=2558.683, y=349.6010, z=108.050},
    {x=2558.051, y=389.4817, z=108.660},
    {x=1077.692, y=-775.796, z=58.218},
    {x=1139.018, y=-469.886, z=66.789},
    {x=1168.975, y=-457.241, z=66.641},
    {x=1153.884, y=-326.540, z=69.245},
    {x=381.2827, y=323.2518, z=103.270},
    {x=236.4638, y=217.4718, z=106.840},
    {x=265.0043, y=212.1717, z=106.780},
    {x=285.2029, y=143.5690, z=104.970},
    {x=157.7698, y=233.5450, z=106.450},
    {x=-164.568, y=233.5066, z=94.919},
    {x=-1827.04, y=785.5159, z=138.020},
    {x=-1409.39, y=-99.2603, z=52.473},
    {x=-1205.35, y=-325.579, z=37.870},
    {x=-1215.64, y=-332.231, z=37.881},
    {x=-2072.41, y=-316.959, z=13.345},
    {x=-2975.72, y=379.7737, z=14.992},
    {x=-2962.60, y=482.1914, z=15.762},
    {x=-2955.70, y=488.7218, z=15.486},
    {x=-3044.22, y=595.2429, z=7.595},
    {x=-3144.13, y=1127.415, z=20.868},
    {x=-3241.10, y=996.6881, z=12.500},
    {x=-3241.11, y=1009.152, z=12.877},
    {x=-1305.40, y=-706.240, z=25.352},
    {x=-538.225, y=-854.423, z=29.234},
    {x=-711.156, y=-818.958, z=23.768},
    {x=-717.614, y=-915.880, z=19.268},
    {x=-526.566, y=-1222.90, z=18.434},
    {x=-256.831, y=-719.646, z=33.444},
    {x=-203.548, y=-861.588, z=30.205},
    {x=112.4102, y=-776.162, z=31.427},
    {x=112.9290, y=-818.710, z=31.386},
    {x=119.9000, y=-883.826, z=31.191},
    {x=149.4551, y=-1038.95, z=29.366},
    {x=-846.304, y=-340.402, z=38.687},
    {x=-1204.35, y=-324.391, z=37.877},
    {x=-1216.27, y=-331.461, z=37.773},
    {x=-56.1935, y=-1752.53, z=29.452},
    {x=-261.692, y=-2012.64, z=30.121},
    {x=-273.001, y=-2025.60, z=30.197},
    {x=314.187, y=-278.621, z=54.170},
    {x=-351.534, y=-49.529, z=49.042},
    {x=24.589, y=-946.056, z=29.357},
    {x=-254.112, y=-692.483, z=33.616},
    {x=-1570.197, y=-546.651, z=34.955},
    {x=-1415.909, y=-211.825, z=46.500},
    {x=-1430.112, y=-211.014, z=46.500},
    {x=33.232, y=-1347.849, z=29.497},
    {x=129.216, y=-1292.347, z=29.269},
    {x=287.645, y=-1282.646, z=29.659},
    {x=289.012, y=-1256.545, z=29.440},
    {x=295.839, y=-895.640, z=29.217},
    {x=1686.753, y=4815.809, z=42.008},
    {x=-302.408, y=-829.945, z=32.417},
    {x=5.134, y=-919.949, z=29.557},
	{x=150.266, y=-1040.795, z=29.374},
    {x=-1212.980, y=-330.841, z=37.787},
    {x=-2962.582, y=482.627, z=15.703},
    {x=-112.202, y=6469.295, z=31.626},
    {x=314.187, y=-278.621, z=54.170},
    {x=-351.534, y=-49.529, z=49.042},
    {x=237.05, y=217.57, z=106.286},
    {x=1175.0643310547, y=2706.6435546875, z=38.094036102295}
}





RegisterNetEvent('atm:utiliser')
AddEventHandler('atm:utiliser', function(id)
    while true do
        Citizen.Wait(0) 

        for k in pairs(positionATM) do 

            local plyCoords = GetEntityCoords(GetPlayerPed(-1), false)
            local dist = Vdist(plyCoords.x, plyCoords.y, plyCoords.z, positionATM[k].x, positionATM[k].y, positionATM[k].z)

            if dist <= 0.6 then
                  
            
            CreateMenu(Atm)
            Citizen.Wait(500000) 
                
                   
				end
            end
        end 
      

     
end) 


RegisterCommand("solde", function(source)
    TriggerServerEvent('monsolde')
end)


-- Function Animations

function startScenario(anim)
    TaskStartScenarioInPlace(PlayerPedId(), anim, 0, false)
end