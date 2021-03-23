
ESX = nil
legalmenuOpen = false
illegalmenuOpen = false
local hasCinematic = false


function alert(msg)
    SetTextComponentFormat("STRING")
    AddTextComponentString(msg)
    DisplayHelpTextFromStringLabel(0,0,1,-1)
end

Citizen.CreateThread(function()
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
        Citizen.Wait(10)
    end
end)


Citizen.CreateThread(function()
	while true do
		Citizen.Wait(1)
		if IsPauseMenuActive() then
			ESX.UI.HUD.SetDisplay(0.0)
		elseif hasCinematic == true then
			ESX.UI.HUD.SetDisplay(0.0)
		end
	end
end)




-- Ca fait spawn le ped, vous pouvez changer le model du ped si vous le souhaitez.
Citizen.CreateThread(function()
    for k,v in pairs(Config.Zones) do
        -- Un ped pour chaque shop légal
        for i = 1, #v.LegalPos, 1 do

            local hash = GetHashKey("mp_m_shopkeep_01")
            while not HasModelLoaded(hash) do
                RequestModel(hash)
                Wait(60)
            end

            ped = CreatePed("PED_TYPE_CIVMALE", "mp_m_shopkeep_01", v.LegalPos[i].x, v.LegalPos[i].y, v.LegalPos[i].z, v.LegalPos[i].angle, false, true)
            SetBlockingOfNonTemporaryEvents(ped, true)
            SetEntityInvincible(ped, true)
            FreezeEntityPosition(ped, true)
        end

        for i = 1, #v.IllegalMedic, 1 do

            local hash = GetHashKey("s_m_m_paramedic_01")
            while not HasModelLoaded(hash) do
                RequestModel(hash)
                Wait(60)
            end

            ped = CreatePed("PED_TYPE_CIVMALE", "s_m_m_paramedic_01", v.IllegalMedic[i].x, v.IllegalMedic[i].y, v.IllegalMedic[i].z, v.IllegalMedic[i].angle, false, true)
            SetBlockingOfNonTemporaryEvents(ped, true)
            SetEntityInvincible(ped, true)
            FreezeEntityPosition(ped, true)
        end

        -- un ped pour chaque shop illégal
        for i = 1, #v.IllegalPos, 1 do

            local hash = GetHashKey("csb_mweather")
            while not HasModelLoaded(hash) do
                RequestModel(hash)
                Wait(60)
            end

            ped = CreatePed("PED_TYPE_CIVMALE", "csb_mweather", v.IllegalPos[i].x, v.IllegalPos[i].y, v.IllegalPos[i].z, v.IllegalPos[i].angle, false, true)
            SetBlockingOfNonTemporaryEvents(ped, true)
            SetEntityInvincible(ped, true)
            FreezeEntityPosition(ped, true)
            GiveWeaponToPed(ped, GetHashKey("WEAPON_ADVANCEDRIFLE"), 2800, true, true)
        end

        for i = 1, #v.Armurerie, 1 do

            local hash = GetHashKey("cs_terry")
            while not HasModelLoaded(hash) do
                RequestModel(hash)
                Wait(60)
            end

            ped = CreatePed("PED_TYPE_CIVMALE", "cs_terry", v.Armurerie[i].x, v.Armurerie[i].y, v.Armurerie[i].z, v.Armurerie[i].angle, false, true)
            SetBlockingOfNonTemporaryEvents(ped, true)
            SetEntityInvincible(ped, true)
            FreezeEntityPosition(ped, true)
        end

    end
end)

-- on crée le blips pour chaque shop légaux
Citizen.CreateThread(function()
    for k,v in pairs(Config.Zones) do
        for i = 1, #v.LegalPos, 1 do
            local blip = AddBlipForCoord(v.LegalPos[i].x, v.LegalPos[i].y, v.LegalPos[i].z)

            SetBlipSprite (blip, 52)
            SetBlipScale  (blip, 0.6)
            SetBlipColour (blip, 2)
            SetBlipAsShortRange(blip, true)

            BeginTextCommandSetBlipName('STRING')
            AddTextComponentSubstringPlayerName('Superette')
            EndTextCommandSetBlipName(blip)
         end
     end
end)


local superet = {
    Base = { Header = {"commonmenu", "interaction_bgd"}, Color = {color_black}, HeaderColor = {255,255,255}, Title = "", Blocked = false },
	Data = { currentMenu = "Acheter un produit chez Apu", "Superette" },
    Events = {

        onSelected = function(self, _, btn, CMenu, menuData, currentButton, currentSlt, result)
        -- si vous voulez rajouter un boutton pour close le menu:    self:CloseMenu(true)
              if btn.name == "Pain" then
                    TriggerServerEvent('bts_menu:buy', 5, "bread", "Pain")
              elseif btn.name == "Bouteille d'Eau" then
                    TriggerServerEvent('bts_menu:buy', 7, "water", "Eau")
					elseif btn.name == "Téléphone" then
                    TriggerServerEvent('bts_menu:buy', 120, "phone", "Téléphone")
					elseif btn.name == "Carte Bancaire" then
                    TriggerServerEvent('bts_menu:buy', 50, "cartebanque", "Carte Bancaire")
              end
        end,
    },

    Menu = {
        ["Acheter un produit chez Apu"] = {
            b = {
                {name = "Pain", ask = "~p~5$", askX = true},
                {name = "Bouteille d'Eau", ask = "~p~7$", askX = true},
				{name = "Téléphone", ask = "~p~120$", askX = true},
				{name = "Carte Bancaire", ask = "~p~50$", askX = true},
            }
        },

    }
}



Citizen.CreateThread(function()
    for k,v in pairs(Config.Zones) do
        for i = 1, #v.Armurerie, 1 do
            local blip = AddBlipForCoord(v.Armurerie[i].x, v.Armurerie[i].y, v.Armurerie[i].z)

            SetBlipSprite (blip, 110)
            SetBlipScale  (blip, 1.0)
            SetBlipColour (blip, 39)
            SetBlipAsShortRange(blip, true)

            BeginTextCommandSetBlipName('STRING')
            AddTextComponentSubstringPlayerName('Armurerie')
            EndTextCommandSetBlipName(blip)
         end
     end
end)



Citizen.CreateThread(function()
    for k,v in pairs(Config.Zones) do
        for i = 1, #v.Barber, 1 do
            local blip = AddBlipForCoord(v.Barber[i].x, v.Barber[i].y, v.Barber[i].z)

            SetBlipSprite (blip, 71)
            SetBlipScale  (blip, 0.6)
            SetBlipColour (blip, 9)
            SetBlipAsShortRange(blip, true)

            BeginTextCommandSetBlipName('STRING')
            AddTextComponentSubstringPlayerName('BarberShop')
            EndTextCommandSetBlipName(blip)
         end
     end
end)



local armurerie = {
    Base = { Header = {"shopui_title_gr_gunmod", "shopui_title_gr_gunmod"}, Color = {color_black}, HeaderColor = {255, 255, 255}, Title = "Armurerie", Blocked = false },
	Data = { currentMenu = "~b~Acheter une arme.", "Armurerie" },
    Events = {

        onSelected = function(self, _, btn, CMenu, menuData, currentButton, currentSlt, result)
        -- si vous voulez rajouter un boutton pour close le menu:    self:CloseMenu(true)
              if btn.name == "Dague de cavalerie antique" then
                TriggerServerEvent('bts_menu:buyweapon', 1500, "WEAPON_DAGGER", "Dague de cavalerie antique")
              elseif btn.name == "Batte de baseball" then
                TriggerServerEvent('bts_menu:buyweapon', 1500, "WEAPON_BAT", "Batte de baseball")
            elseif btn.name == "Couteau" then
                TriggerServerEvent('bts_menu:buyweapon', 1500, "WEAPON_KNIFE", "Couteau")
            elseif btn.name == "Couteau à cran d'arrêt" then
                TriggerServerEvent('bts_menu:buyweapon', 1500, "WEAPON_switchblade", "Couteau à cran d'arrêt")
            elseif btn.name == "Pistolet" then
                TriggerServerEvent('bts_menu:buyweapon', 15000, "WEAPON_PISTOL", "Pistolet")
            elseif btn.name == "Pétoire" then
                TriggerServerEvent('bts_menu:buyweapon', 15000, "WEAPON_snspistol", "Pétoire")
              end
        end,
    },

    Menu = {
        ["~b~Acheter une arme."] = {
            b = {
                {name = "Armes Blanches.", ask = ">", askX = true},
                {name = "Armes Létales", ask = ">", askX = true},
             --   {name = "Accessoires", ask = ">", askX = true},
            }
        },

        ["armes blanches."] = {
            b = {
                {name = "Dague de cavalerie antique", ask = "~p~1500$", askX = true},
                {name = "Batte de baseball", ask = "~p~1500$", askX = true},
                {name = "Couteau", ask = "~p~1500$", askX = true},
                {name = "Couteau à cran d'arrêt", ask = "~p~1500$", askX = true},
            }
        },

        ["armes létales"] = {
            b = {
                {name = "Pétoire", ask = "~p~15000$", askX = true},
            }
        },

    }
}






local illegal = {
    Base = { Title = "" },
    Data = { currentMenu = "Menu Achat Illégal" },
    Events = {

        onSelected = function(self, _, btn, CMenu, menuData, currentButton, currentSlt, result)
        -- si vous voulez rajouter un boutton pour close le menu:    self:CloseMenu(true)
              if btn.name == "Ordinateur" then
                    TriggerServerEvent('bts_menu:buy', 50000, "ordinateur", "Ordinateur")
              end
        end,
    },

    Menu = {
        ["Menu Achat Illégal"] = {
            b = {
                {name = "Ordinateur", ask = "50000~g~$", askX = true},
            }
        },

    }
}



local IllegalMedic = {
    Base = { Header = {"commonmenu", "interaction_bgd"}, Color = {color_black}, HeaderColor = {255, 0, 22}, Title = "Ambulancier" },
	Data = { currentMenu = "~e~Acheter des médicaments", "Ambulancier" },
    Events = {

        onSelected = function(self, _, btn, CMenu, menuData, currentButton, currentSlt, result)
        -- si vous voulez rajouter un boutton pour close le menu:    self:CloseMenu(true)
              if btn.name == "Bandage" then
                TriggerServerEvent('bts_menu:buy', 75, "bandage", "Bandage")
              elseif btn.name == "Medikit" then
                    TriggerServerEvent('bts_menu:buy', 150, "medikit", "Medikit")
              end
        end,
    },

    Menu = {
        ["~e~Acheter des médicaments"] = {
            b = {
                {name = "Bandage", ask = "~p~75$", askX = true},
                {name = "Medikit", ask = "~p~150$", askX = true},
            }
        },

    }
}

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
	ESX.PlayerData = xPlayer
end)

function AstralSaveSkin()
	TriggerEvent('skinchanger:getSkin', function(skin)
		LastSkin = skin
	end)
	TriggerEvent('skinchanger:getSkin', function(skin)
	TriggerServerEvent('esx_skin:save', skin)
	end)
end



function DrawSub(msg, time)
	ClearPrints()
	BeginTextCommandPrint('STRING')
	AddTextComponentSubstringPlayerName(msg)
	EndTextCommandPrint(time, 1)
end



local Barber = {
	Base = { Header = {"shopui_title_barber3", "shopui_title_barber3"}, Color = {color_black}, HeaderColor = {255, 255, 255}, Title = "BarberShop", Blocked = false },
	Data = { currentMenu = "~r~Changer de style.", "BarberShop" },
	Events = {
		onOpened = function(self, _, btn, CMenu, menuData, currentButton, currentBtn, currentSlt, result, slide, onSlide) 
			SetEntityInvincible(GetPlayerPed(-1), true) -- Set entity vinvcible
			FreezeEntityPosition(GetPlayerPed(-1), true)
			DrawSub("~g~Invincible", 12000)	
        end,
        onExited = function(self, _, btn, CMenu, menuData, currentButton, currentBtn, currentSlt, result, slide, onSlide) 
			SetEntityInvincible(GetPlayerPed(-1), false) -- Set entity vinvcible
			FreezeEntityPosition(GetPlayerPed(-1), false)
			DrawSub("~r~Vous n'êtes plus invincible", 12000)
		end,	
        onSelected = function(self, _, btn, CMenu, menuData, currentButton, currentSlt, result)
			PlaySoundFrontend(-1, "SELECT", "HUD_FRONTEND_DEFAULT_SOUNDSET", 1)
			local slide = btn.slidenum
			local btn = btn.name
			local check = btn.unkCheckbox
            if btn.name == "EZ" then
				OpenMenu('EZ:')
			elseif btn == "Style de barbe" then
                OpenMenu('Barbe:')
            elseif btn == "Taille de la barbe" then
                OpenMenu('Taille:')
            elseif btn == "Couleurs de la barbe" then
                OpenMenu('Couleur:')
            elseif btn == "Style de Cheveux" then
                OpenMenu('Cheveux:')
            elseif btn == "Première couleur des cheveux" then
                OpenMenu('Première Couleur:')
            elseif btn == "Deuxième couleur des cheveux" then
                OpenMenu('Deuxième Couleur:')
            elseif btn == "~g~Payer sa facture" then
                TriggerServerEvent('astral:uhotenue')
				AstralSaveSkin()
				TriggerServerEvent('astral:uhotenue')
                ESX.ShowNotification("Vous avez payer ~r~$200")
            end
        end,
        onSlide = function(menuData, currentButton, currentSlt, CMenu)
			local currentMenu, ped = menuData.currentMenu, GetPlayerPed(-1)
			if currentMenu == "Barbe:" then
				if currentSlt ~= 1 then return end
				local currentButton = currentButton.slidenum - 1
                beard1 = currentButton
				TriggerEvent('skinchanger:change', 'beard_1', beard1)
			end
			if currentMenu == "Taille:" then
				if currentSlt ~= 1 then return end
				local currentButton = currentButton.slidenum - 1
                beard2 = currentButton
				TriggerEvent('skinchanger:change', 'beard_2', beard2)
            end
            if currentMenu == "Couleur:" then
				if currentSlt ~= 1 then return end
				local currentButton = currentButton.slidenum - 1
                beard3 = currentButton
				TriggerEvent('skinchanger:change', 'beard_3', beard3)
            end
            if currentMenu == "Cheveux:" then
				if currentSlt ~= 1 then return end
				local currentButton = currentButton.slidenum - 1
                hair1 = currentButton
				TriggerEvent('skinchanger:change', 'hair_1', hair1)
            end
            if currentMenu == "Première Couleur:" then
				if currentSlt ~= 1 then return end
				local currentButton = currentButton.slidenum - 1
                hair_color1 = currentButton
				TriggerEvent('skinchanger:change', 'hair_color_1', hair_color1)
            end
            if currentMenu == "Deuxième Couleur:" then
				if currentSlt ~= 1 then return end
				local currentButton = currentButton.slidenum - 1
                hair_color2 = currentButton
				TriggerEvent('skinchanger:change', 'hair_color_2', hair_color2)
			end
		end,
    },

    Menu = {
        ["~r~Changer de style."] = {
            b = {
                {name = "Changer sa coiffure.", ask = "→", askX = true},
                {name = "Changer sa barbe.", ask = "→", askX = true},
                {name = "~g~Payer sa facture", ask = "~r~200$", askX = true},
            }
        },


        ["changer sa barbe."] = {
            b = {
                {name = "Style de barbe", ask = "→", askX = true},
                {name = "Taille de la barbe", ask = "→", askX = true},
                {name = "Couleurs de la barbe", ask = "→", askX = true},
            }
        },

        ["changer sa coiffure."] = {
            b = {
                {name = "Style de Cheveux", ask = "→", askX = true},
                {name = "Première couleur des cheveux", ask = "→", askX = true},
                {name = "Deuxième couleur des cheveux", ask = "→", askX = true},
            }
        },

		["Barbe:"] = {
			b = {
				{name = "Style de barbe:", slidemax =  28}
			}
        },
        
        ["Taille:"] = {
			b = {
				{name = "Taille de la barbe:", slidemax =  10}
			}
        },

        ["Couleur:"] = {
			b = {
                {name = "Première couleur:", slidemax =  63},
			}
        },

        ["Cheveux:"] = {
			b = {
                {name = "coupe de cheveux:", slidemax =  73},
			}
        },

        ["Première Couleur:"] = {
			b = {
                {name = "Première couleur des cheveux:", slidemax =  63},
			}
        },

        ["Deuxième Couleur:"] = {
			b = {
                {name = "Deuxième couleur des cheveux:", slidemax =  63},
			}
        },

    }
}






Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        -- on check si le joueur est assez proche du ped
        for k,v in pairs(Config.Zones) do
            
            -- Pour tous les shop legaux
            for i = 1, #v.LegalPos, 1 do
                local distance = GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()), v.LegalPos[i].x, v.LegalPos[i].y, v.LegalPos[i].z, true)
                if distance < 2.2 then
                    alert('Appuyez sur ~INPUT_CONTEXT~ pour parler à Apu.')
                    if IsControlJustPressed(1,51) then  -- 51 = E
                        CreateMenu(superet)
                    end
                end
            end

            -- Pour tous les shop illégaux
            for i = 1, #v.IllegalPos, 1 do
            
                local distance = GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()), v.IllegalPos[i].x, v.IllegalPos[i].y, v.IllegalPos[i].z, true)
                if distance < 2.2 then
                    alert('Appuyez sur ~INPUT_CONTEXT~ pour parler a ~r~Mehdi.')
                    if IsControlJustPressed(1,51) then  -- 51 = E
                        CreateMenu(illegal)
                    end
                end
            end

            for i = 1, #v.IllegalMedic, 1 do
            
                local distance = GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()), v.IllegalMedic[i].x, v.IllegalMedic[i].y, v.IllegalMedic[i].z, true)
                if distance < 2.2 then
                    alert('Appuyez sur ~INPUT_CONTEXT~ pour parler à l\'ambulancier.')
                    if IsControlJustPressed(1,51) then  -- 51 = E
                        CreateMenu(IllegalMedic)
                    end
                end
            end

            for i = 1, #v.Barber, 1 do
            
                local distance = GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()), v.Barber[i].x, v.Barber[i].y, v.Barber[i].z, true)
                if distance < 2.2 then
                    alert('Appuyez sur ~INPUT_CONTEXT~ pour ouvrir le catalogue..')
                    if IsControlJustPressed(1,51) then
                        CreateMenu(Barber)
                    end
                end
            end


            for i = 1, #v.Armurerie, 1 do
            
                local distance = GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()), v.Armurerie[i].x, v.Armurerie[i].y, v.Armurerie[i].z, true)
                if distance < 2.2 then
                    alert('Appuyez sur ~INPUT_CONTEXT~ pour parler à L\'armurier.')
                    if IsControlJustPressed(1,51) then  -- 51 = E
                        CreateMenu(armurerie)
                    end
                end
            end


        end
    end
end)





Citizen.CreateThread(function()
	while true do
		Citizen.Wait(1)
		if IsPauseMenuActive() then
			ESX.UI.HUD.SetDisplay(0.0)
		elseif hasCinematic == true then
			ESX.UI.HUD.SetDisplay(0.0)
		end
	end
end)



local PRM = {
	Base = { Header = {"commonmenu", "interaction_bgd"}, Color = {color_black}, HeaderColor = {255,255,255}, Title = "" },
    Data = { currentMenu = "Paramètres" },
    Events = {

        onSelected = function(self, _, btn, CMenu, menuData, currentButton, currentSlt, result)
            if btn.name == "~p~Filtre~s~ : Normal" then
                SetTimecycleModifier('')
                ESX.ShowNotification('Vous avez mit la vue ~b~"Normal"~w~')
                PlaySoundFrontend( -1, "BASE_JUMP_PASSED", "HUD_AWARDS", 1)
                Citizen.Wait(1)
            end

            if btn.name == '~p~Filtre~s~ : Améliorée' then
                SetTimecycleModifier('tunnel')
                ESX.ShowNotification('Vous avez mit la vue en ~b~"améliorée"~w~')
                PlaySoundFrontend( -1, "BASE_JUMP_PASSED", "HUD_AWARDS", 1)
                Citizen.Wait(1)
            end


            if btn.name == '~p~Filtre~s~ : Amplifiées' then
                SetTimecycleModifier('rply_saturation')
                ESX.ShowNotification('Vous avez mit la vue en ~b~"amplifiées"~w~')
                PlaySoundFrontend( -1, "BASE_JUMP_PASSED", "HUD_AWARDS", 1)
                Citizen.Wait(1)
            end

            if btn.name == "~p~Filtre~s~ : Noir et Blanc" then
                SetTimecycleModifier('rply_saturation_neg')
                ESX.ShowNotification('Vous avez mit la vue en ~b~"Noir et blanc"~w~')
                PlaySoundFrontend( -1, "BASE_JUMP_PASSED", "HUD_AWARDS", 1)
                Citizen.Wait(1)
            end


            if btn.name == "~p~Filtre~s~ : Cinéma" then

                SetTimecycleModifier('cinema')

                Citizen.Wait(1)

            end

            if btn.name == "~p~Cacher~s~ la Carte" then
                ESX.ShowNotification('MiniMap | ~p~Désactiver')
                DisplayRadar(false)
                PlaySoundFrontend(-1, "Hack_Success", "DLC_HEIST_BIOLAB_PREP_HACKING_SOUNDS", true)
                Citizen.Wait(1)

            end

            if btn.name == "~p~Afficher~s~ la Carte" then
                ESX.ShowNotification('MiniMap | ~p~Activé')
                DisplayRadar(true)
                PlaySoundFrontend(-1, "Hack_Success", "DLC_HEIST_BIOLAB_PREP_HACKING_SOUNDS", true)
                Citizen.Wait(1)
            end


            if btn.name == "Tomber | Se relever" then

                TriggerEvent("Ragdoll", plyPed)

                Citizen.Wait(1)

            end

            if btn.name == "Mode cinéma" then
                hasCinematic = not hasCinematic
                if hasCinematic == true then
                    SendNUIMessage({openCinema = true})
                    ESX.UI.HUD.SetDisplay(0.0)
                    TriggerEvent('es:setMoneyDisplay', 0.0)
                    TriggerEvent('esx_status:setDisplay', 0.0)
                    DisplayRadar(false)
                    ExecuteCommand('togglehud off')
                else
                    SendNUIMessage({openCinema = false})
                    ESX.UI.HUD.SetDisplay(1.0)
                    TriggerEvent('es:setMoneyDisplay', 1.0)
                    TriggerEvent('esx_status:setDisplay', 1.0)
                    DisplayRadar(true)
                    ExecuteCommand('togglehud on')
                end
            end


            if btn.name == "~p~Syncronisation" then
                Citizen.Wait(100) -- Wait 0 seconds to prevent crashing.
                ClearWeatherTypePersist()
                SetWeatherTypeNowPersist(CurrentWeather)
                SetWeatherTypeNow(CurrentWeather)
                SetWeatherTypePersist(CurrentWeather)
                ESX.ShowNotification('~p~Syncronisation effectuée !')
                PlaySoundFrontend(-1, "Hack_Success", "DLC_HEIST_BIOLAB_PREP_HACKING_SOUNDS", true)
                Citizen.Wait(1)
            end


            if btn.name == "~b~Optimisation" then
                ESX.ShowNotification('Optimisation en cours...')
                ClearAllBrokenGlass()
                ClearAllHelpMessages()
                LeaderboardsReadClearAll()
                ClearBrief()
                ClearGpsFlags()
                ClearPrints()
                ClearSmallPrints()
                ClearReplayStats()
                LeaderboardsClearCacheData()
                ClearFocus()
                ClearHdArea()
                ClearHelp()
                ClearNotificationsPos()
                ClearPedInPauseMenu()
                ClearFloatingHelp()
                ClearGpsPlayerWaypoint()
                ClearGpsRaceTrack()
                ClearReminderMessage()
                ClearThisPrint()
            
                Citizen.Wait(2090)
                RemoveLoadingPrompt()
                Citizen.Wait(100)
                ESX.ShowNotification('~p~Optimisation effectuée !')
                PlaySoundFrontend(-1, "Hack_Success", "DLC_HEIST_BIOLAB_PREP_HACKING_SOUNDS", true)
                Citizen.Wait(1)
            end




            if btn.name == "~p~Fermer le menu" then
                self:CloseMenu(true)   
                Citizen.Wait(1)
            end
        end,
    },

    Menu = {

        ["Paramètres"] = {
            b = {
                {name = "Vues", ask = "→", askX = true},
            --    {name = "Minimap", ask = "→", askX = true},
                {name = "Options", ask = "→", askX = true}, 
                {name = "Optimisation", ask = "→", askX = true},
                {name = "~p~Fermer le menu", ask = "", askX = true},
            }
        },

        ["vues"] = {
            b = {
                {name = "   ~h~😎 | Vues"},
                {name = "~p~Filtre~s~ : Normal"},
                {name = "~p~Filtre~s~ : Améliorée"},
                {name = "~p~Filtre~s~ : Amplifiées"},
                {name = "~p~Filtre~s~ : Noir et Blanc"},
                {name = "~p~Filtre~s~ : Cinéma"},
               
            }
        },

        ["minimap"] = {
            b = {
                {name = "~p~-----------------------------~p~Minimap~p~--------------------------------"},
                {name = "~p~Cacher~s~ la Carte"},
                {name = "~p~Afficher~s~ la Carte"},
               
            }
        },


        ["optimisation"] = {
            b = {
                {name = "   ~h~🧬 | Optimisation"},
                {name = "~b~Optimisation"},
                {name = "~p~Syncronisation"}
            }
        },

        ["options"] = {
            b = {
                {name = "   ~p~⚙️ | Options"},
                {name = "Tomber | Se relever"},
                {name = "Mode cinéma"},
            }
        },
    }
}



Citizen.CreateThread(function()
    for k,v in pairs(Config.Zones) do
        for i = 1, #v.Burger, 1 do
            local hash = GetHashKey("csb_burgerdrug")
            while not HasModelLoaded(hash) do
                RequestModel(hash)
                Wait(60)
            end
            ped = CreatePed("PED_TYPE_CIVMALE", "csb_burgerdrug", v.Burger[i].x, v.Burger[i].y, v.Burger[i].z, v.Burger[i].angle, false, true)
            SetBlockingOfNonTemporaryEvents(ped, true)
            SetEntityInvincible(ped, true)
            FreezeEntityPosition(ped, true)
        end
    end
end)

Citizen.CreateThread(function()
    for k,v in pairs(Config.Zones) do
        for i = 1, #v.Burger, 1 do
            local blip = AddBlipForCoord(v.Burger[i].x, v.Burger[i].y, v.Burger[i].z)

            SetBlipSprite (blip, 106)
            SetBlipScale  (blip, 0.6)
            SetBlipColour (blip, 51)
            SetBlipAsShortRange(blip, false)

            BeginTextCommandSetBlipName('STRING')
            AddTextComponentSubstringPlayerName('Burgershot')
            EndTextCommandSetBlipName(blip)
         end
     end
end)


local burger = {
	Base = { Header = {"commonmenu", "interaction_bgd"}, Color = {color_black}, HeaderColor = {33, 196, 68}, Title = "Burgershot" },
    Data = { currentMenu = "~p~Acheter un produit au Burgergshot !" },
    Events = {
        onSelected = function(self, _, btn, CMenu, menuData, currentButton, currentSlt, result)
              if btn.name == "Hamburger" then
                    TriggerServerEvent('bts_menu:buy', 5, "hamburger", "Hamburger")
              elseif btn.name == "Coca Cola" then
                    TriggerServerEvent('bts_menu:buy', 7, "cocacola", "Coca-cola")
              elseif btn.name == "Sandwich" then
                    TriggerServerEvent('bts_menu:buy', 5, "sandwich", "Sandwich")
              elseif btn.name == "Ice-Tea" then
                    TriggerServerEvent('bts_menu:buy', 7, "icetea", "Ice-tea")
              end
        end,
    },
    Menu = {
        ["~p~Acheter un produit au Burgergshot !"] = {
            b = {
                {name = "Hamburger", ask = "~p~5$", askX = true},
                {name = "Coca Cola", ask = "~p~7$", askX = true},
                {name = "Sandwich", ask = "~p~5$", askX = true},
                {name = "Ice-Tea", ask = "~p~7$", askX = true},
            }
        },

    }
}



Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        -- on check si le joueur est assez proche du ped
        for k,v in pairs(Config.Zones) do
            
            -- Pour tous les shop legaux
            for i = 1, #v.Burger, 1 do
                local distance = GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()), v.Burger[i].x, v.Burger[i].y, v.Burger[i].z, true)
                if distance < 2.2 then
                    alert('Appuyez sur ~INPUT_CONTEXT~ pour parler au vendeur.')
                    if IsControlJustPressed(1,51) then  -- 51 = E
                        CreateMenu(burger)
                    end
                end
            end
        end
    end
end)






-------- Radgol --------

function setRagdoll(flag)
    ragdoll = flag
end
  
Citizen.CreateThread(function()
while true do
  Citizen.Wait(0)
  if ragdoll then
    SetPedToRagdoll(GetPlayerPed(-1), 1000, 1000, 0, 0, 0, 0)
  end
end
end)

ragdol = true

RegisterNetEvent("Ragdoll")
AddEventHandler("Ragdoll", function()
  if (ragdol) then
      setRagdoll(true)
      ragdol = false
  else
      setRagdoll(false)
      ragdol = true
  end
end)


Citizen.CreateThread(function()
	while true do
		Citizen.Wait(1)
		if IsPauseMenuActive() then
			ESX.UI.HUD.SetDisplay(0.0)
		elseif hasCinematic == true then
			ESX.UI.HUD.SetDisplay(0.0)
		end
	end
end)



Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
            if IsControlJustPressed(1,82) then 
                CreateMenu(PRM)
        end
    end
end)



