
ESX = nil 

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end

	while ESX.GetPlayerData().job == nil do
		Citizen.Wait(10)
	end

	PlayerData = ESX.GetPlayerData()
	done = true
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
    ESX.PlayerData.job = job
    Citizen.Wait(0)
end)

Citizen.CreateThread(function ()
  while true do
      Citizen.Wait(0)
      local sleep = true
      for i=1, #Config.Zone['t1']['zona'], 1 do
        local zona = Config.Zone["t1"]['zona'][i]
    local distance = #(GetEntityCoords(PlayerPedId()) -  zona)
      local rednibrojzone = 1
    if distance < 10 and ESX.PlayerData.job.grade_name == "boss" or ESX.PlayerData.job.grade_name == "zamenik" then
       
        sleep = false
        DrawMarker(Config.ModelMarkera, zona, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.5, 0.5, 0.5, 0,0,120, 100, false, true,2,true,false,false,false)
        if distance < 2 then
          pokazi3dtinky(zona, "Stisni ~g~ ~INPUT_CONTEXT~ ~s~da zapocnes zauzimanje zone",  11)
        end
    
        if IsControlJustReleased(0, 38)    then
          ESX.TriggerServerCallback("esx:getowner", function(owner)
          ESX.TriggerServerCallback("esx:getZauzimase", function(dalisezauzima)
            if owner ~= ESX.PlayerData.job.label then
              if dalisezauzima == false and distance < 5  then 
             
                TriggerEvent('chat:addMessage', {
                  color = { 255, 0, 0},
                  multiline = true,
                  args = {"Zapoceo si zauzimanje zone i to ce trajati  " .. Config.VremeZauzimanje .. " sekundi"}
                })
                TriggerEvent("esx:timer")
          
                
                ESX.TriggerServerCallback("esx:poruka", function(zauzimase)
                  if poruka then
                  end
                end, rednibrojzone) -- za novu zona samo  zamenite ovo 1 u 3,4,5 itd
    
    
    
              ESX.TriggerServerCallback("esx:zauzimase", function(zauzimase)
                if zauzimase then
                end
              end, rednibrojzone, 1)  -- za novu zona samo  zamenite ovo 1 u 3,4,5 itd
              Citizen.Wait(Config.VremeZauzimanje * 1000) -- Vreme zauzimanja zone
              if distance <  10 and GetEntityHealth(PlayerPedId()) > 0 then
                ESX.TriggerServerCallback("esx:zauzeta", function(zauzeto)
                if zauzeto then
                  TriggerEvent('chat:addMessage', {
                    multiline = true,
                    args = {"Uspesno si zauzeo zonu i osvojio - $" .. Config.Nagrada  }
                  })
                else
                  TriggerEvent('chat:addMessage', {
                    multiline = true,
                    args = {"Nisi uspeo da zauzmes zonu"   }
                  })
                end
                end, rednibrojzone, ESX.PlayerData.job.label, zona) -- za novu zona samo  zamenite ovo 1 u 3,4,5 i Config.Zona isto tako itd
              else
                TriggerEvent('chat:addMessage', {
                  multiline = true,
                  args = {"Nisi uspeo da zauzmes zonu"   }
                })
                end
              else
                TriggerEvent('chat:addMessage', {
                  multiline = true,
                  args = {"Neko vec zauzima ovu zonu"  }
                })
              end
            else
              TriggerEvent('chat:addMessage', {
                multiline = true,
                args = {"Ova zona je vec tvoja"  }
              })
      
            end
          end, rednibrojzone) -- za novu zona samo  zamenite ovo 1 u 3,4,5 itd
      end, rednibrojzone) -- za novu zona samo  zamenite ovo 1 u 3,4,5 itd
    end
    end
    end
  
    for i=1, #Config.Zone['t2']['zona'], 1 do
      local zona = Config.Zone["t2"]['zona'][i]
  local distance = #(GetEntityCoords(PlayerPedId()) -  zona)
    local rednibrojzone = 2
  if distance < 10 and ESX.PlayerData.job.grade_name == "boss" or ESX.PlayerData.job.grade_name == "zamenik" then
     
      sleep = false
      DrawMarker(Config.ModelMarkera, zona, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.5, 0.5, 0.5, 0,0,120, 100, false, true,2,true,false,false,false)
      if distance < 2 then
        pokazi3dtinky(zona, "Stisni ~g~ ~INPUT_CONTEXT~ ~s~da zapocnes zauzimanje zone",  11)
      end
  
      if IsControlJustReleased(0, 38)    then
        ESX.TriggerServerCallback("esx:getowner", function(owner)
        ESX.TriggerServerCallback("esx:getZauzimase", function(dalisezauzima)
          if owner ~= ESX.PlayerData.job.label then
            if dalisezauzima == false and distance < 5  then 
           
              TriggerEvent('chat:addMessage', {
                color = { 255, 0, 0},
                multiline = true,
                args = {"Zapoceo si zauzimanje zone i to ce trajati  " .. Config.VremeZauzimanje .. " sekundi"}
              })
              TriggerEvent("esx:timer")
        
              
              ESX.TriggerServerCallback("esx:poruka", function(zauzimase)
                if poruka then
                end
              end, rednibrojzone) -- za novu zona samo  zamenite ovo 1 u 3,4,5 itd
  
  
  
            ESX.TriggerServerCallback("esx:zauzimase", function(zauzimase)
              if zauzimase then
              end
            end, rednibrojzone, 1)  -- za novu zona samo  zamenite ovo 1 u 3,4,5 itd
            Citizen.Wait(Config.VremeZauzimanje * 1000) -- Vreme zauzimanja zone
            if distance <  10 and GetEntityHealth(PlayerPedId()) > 0 then
              ESX.TriggerServerCallback("esx:zauzeta", function(zauzeto)
              if zauzeto then
                TriggerEvent('chat:addMessage', {
                  multiline = true,
                  args = {"Uspesno si zauzeo zonu i osvojio - $" .. Config.Nagrada  }
                })
              else
                TriggerEvent('chat:addMessage', {
                  multiline = true,
                  args = {"Nisi uspeo da zauzmes zonu"   }
                })
              end
              end, rednibrojzone, ESX.PlayerData.job.label, zona) -- za novu zona samo  zamenite ovo 1 u 3,4,5 i Config.Zona isto tako itd
            else
              TriggerEvent('chat:addMessage', {
                multiline = true,
                args = {"Nisi uspeo da zauzmes zonu"   }
              })
              end
            else
              TriggerEvent('chat:addMessage', {
                multiline = true,
                args = {"Neko vec zauzima ovu zonu"  }
              })
            end
          else
            TriggerEvent('chat:addMessage', {
              multiline = true,
              args = {"Ova zona je vec tvoja"  }
            })
    
          end
        end, rednibrojzone) -- za novu zona samo  zamenite ovo 1 u 3,4,5 itd
    end, rednibrojzone) -- za novu zona samo  zamenite ovo 1 u 3,4,5 itd
  end
  end
  end
  for i=1, #Config.Zone['t3']['zona'], 1 do
    local zona = Config.Zone["t3"]['zona'][i]
local distance = #(GetEntityCoords(PlayerPedId()) -  zona)
  local rednibrojzone = 3
if distance < 10 and ESX.PlayerData.job.grade_name == "boss" or ESX.PlayerData.job.grade_name == "zamenik" then
   
    sleep = false
    DrawMarker(Config.ModelMarkera, zona, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.5, 0.5, 0.5, 0,0,120, 100, false, true,2,true,false,false,false)
    if distance < 2 then
      pokazi3dtinky(zona, "Stisni ~g~ ~INPUT_CONTEXT~ ~s~da zapocnes zauzimanje zone",  11)
    end

    if IsControlJustReleased(0, 38)    then
      ESX.TriggerServerCallback("esx:getowner", function(owner)
      ESX.TriggerServerCallback("esx:getZauzimase", function(dalisezauzima)
        if owner ~= ESX.PlayerData.job.label then
          if dalisezauzima == false and distance < 5  then 
         
            TriggerEvent('chat:addMessage', {
              color = { 255, 0, 0},
              multiline = true,
              args = {"Zapoceo si zauzimanje zone i to ce trajati  " .. Config.VremeZauzimanje .. " sekundi"}
            })
            TriggerEvent("esx:timer")
      
            
            ESX.TriggerServerCallback("esx:poruka", function(zauzimase)
              if poruka then
              end
            end, rednibrojzone) -- za novu zona samo  zamenite ovo 1 u 3,4,5 itd



          ESX.TriggerServerCallback("esx:zauzimase", function(zauzimase)
            if zauzimase then
            end
          end, rednibrojzone, 1)  -- za novu zona samo  zamenite ovo 1 u 3,4,5 itd
          Citizen.Wait(Config.VremeZauzimanje * 1000) -- Vreme zauzimanja zone
          if distance <  10 and GetEntityHealth(PlayerPedId()) > 0 then
            ESX.TriggerServerCallback("esx:zauzeta", function(zauzeto)
            if zauzeto then
              TriggerEvent('chat:addMessage', {
                multiline = true,
                args = {"Uspesno si zauzeo zonu i osvojio - $" .. Config.Nagrada  }
              })
            else
              TriggerEvent('chat:addMessage', {
                multiline = true,
                args = {"Nisi uspeo da zauzmes zonu"   }
              })
            end
            end, rednibrojzone, ESX.PlayerData.job.label, zona) -- za novu zona samo  zamenite ovo 1 u 3,4,5 i Config.Zona isto tako itd
          else
            TriggerEvent('chat:addMessage', {
              multiline = true,
              args = {"Nisi uspeo da zauzmes zonu"   }
            })
            end
          else
            TriggerEvent('chat:addMessage', {
              multiline = true,
              args = {"Neko vec zauzima ovu zonu"  }
            })
          end
        else
          TriggerEvent('chat:addMessage', {
            multiline = true,
            args = {"Ova zona je vec tvoja"  }
          })
  
        end
      end, rednibrojzone) -- za novu zona samo  zamenite ovo 1 u 3,4,5 itd
  end, rednibrojzone) -- za novu zona samo  zamenite ovo 1 u 3,4,5 itd
end
end
end
--[[ PRIMER KAKO SE PRAVI NOVA TERITORIJA I DODATE DOLE U KOMADI NOVU ZONU I TJT
  for i=1, #Config.Zone['t3']['zona'], 1 do ------- KADA PRAVITE NOVU SAMO OVO T3 MENJATE DODATE U CFG NPR T4 I U SQL DODATI NOVU I TJT
    local zona = Config.Zone["t3"]['zona'][i] I OVO MENJATE U T4 NPR
local distance = #(GetEntityCoords(PlayerPedId()) -  zona)
  local rednibrojzone = 3 I OVO MENJATE NA 4 NPR I TJT 
if distance < 10 and ESX.PlayerData.job.grade_name == "boss" or ESX.PlayerData.job.grade_name == "zamenik" then
   
    sleep = false
    DrawMarker(Config.ModelMarkera, zona, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.5, 0.5, 0.5, 0,0,120, 100, false, true,2,true,false,false,false)
    if distance < 2 then
      pokazi3dtinky(zona, "Stisni ~g~ ~INPUT_CONTEXT~ ~s~da zapocnes zauzimanje zone",  11)
    end

    if IsControlJustReleased(0, 38)    then
      ESX.TriggerServerCallback("esx:getowner", function(owner)
      ESX.TriggerServerCallback("esx:getZauzimase", function(dalisezauzima)
        if owner ~= ESX.PlayerData.job.label then
          if dalisezauzima == false and distance < 5  then 
         
            TriggerEvent('chat:addMessage', {
              color = { 255, 0, 0},
              multiline = true,
              args = {"Zapoceo si zauzimanje zone i to ce trajati  " .. Config.VremeZauzimanje .. " sekundi"}
            })
            TriggerEvent("esx:timer")
      
            
            ESX.TriggerServerCallback("esx:poruka", function(zauzimase)
              if poruka then
              end
            end, rednibrojzone) -- za novu zona samo  zamenite ovo 1 u 3,4,5 itd



          ESX.TriggerServerCallback("esx:zauzimase", function(zauzimase)
            if zauzimase then
            end
          end, rednibrojzone, 1)  -- za novu zona samo  zamenite ovo 1 u 3,4,5 itd
          Citizen.Wait(Config.VremeZauzimanje * 1000) -- Vreme zauzimanja zone
          if distance <  10 and GetEntityHealth(PlayerPedId()) > 0 then
            ESX.TriggerServerCallback("esx:zauzeta", function(zauzeto)
            if zauzeto then
              TriggerEvent('chat:addMessage', {
                multiline = true,
                args = {"Uspesno si zauzeo zonu i osvojio - $" .. Config.Nagrada  }
              })
            else
              TriggerEvent('chat:addMessage', {
                multiline = true,
                args = {"Nisi uspeo da zauzmes zonu"   }
              })
            end
            end, rednibrojzone, ESX.PlayerData.job.label, zona) -- za novu zona samo  zamenite ovo 1 u 3,4,5 i Config.Zona isto tako itd
          else
            TriggerEvent('chat:addMessage', {
              multiline = true,
              args = {"Nisi uspeo da zauzmes zonu"   }
            })
            end
          else
            TriggerEvent('chat:addMessage', {
              multiline = true,
              args = {"Neko vec zauzima ovu zonu"  }
            })
          end
        else
          TriggerEvent('chat:addMessage', {
            multiline = true,
            args = {"Ova zona je vec tvoja"  }
          })
  
        end
      end, rednibrojzone) 
  end, rednibrojzone) 
end
end
end





--]]
  if sleep == true then
      Wait(1000)
  end
end 

  end)

  RegisterNetEvent('esx:timer')
  AddEventHandler('esx:timer', function()
  
    local timer = Config.VremeZauzimanje
    Citizen.CreateThread(function()
      while timer > 0  do
        Citizen.Wait(1000)
        if(timer > 0)then
          timer = timer - 1
        end
      end
    end)
    Citizen.CreateThread(function()
      while timer > 0 do
        Citizen.Wait(6)
        drawTxt(0.85, 1.4, 1.0,1.0,0.4, 'Zauzimas teritoriju sacekaj jos    :' .. timer, 5, 15, 225, 225, 255)
      end
    end)
  
  end)
  function drawTxt(x,y ,width,height,scale, text, r,g,b,a)
    SetTextFont(0)
    SetTextProportional(0)
    SetTextScale(scale, scale)
    SetTextColour(r, g, b, a)
    SetTextDropShadow(0, 0, 0, 0,255)
    SetTextEdge(1, 0, 0, 0, 255)
    SetTextDropShadow()
    SetTextOutline()
    SetTextEntry("STRING")
    AddTextComponentString(text)
    DrawText(x - width/2, y - height/2 + 0.005)
  end

 
   function pokazi3dtinky(pos, text, boja)
      local pocni = text
        local pocetak, kraj = string.find(text, '~([^~y~]+)~')
        if pocetak then
            pocetak = pocetak - 2
            kraj = kraj + 2
            pocni = ''
            pocni = pocni .. string.sub(text, 0, pocetak) .. '   '.. string.sub(text, pocetak+2, kraj-2) .. string.sub(text, kraj, #text)
        end
        AddTextEntry(GetCurrentResourceName(), pocni)
        BeginTextCommandDisplayHelp(GetCurrentResourceName())
        EndTextCommandDisplayHelp(2, false, false, -1)
        SetFloatingHelpTextWorldPosition(1, pos + vector3(0.0, 0.0, 1.0))
        SetFloatingHelpTextStyle(1, 1, boja, -1, 3, 0)
    end
    RegisterNetEvent("esx:blipzauzimanje")
AddEventHandler("esx:blipzauzimanje", function()
  RemoveBlip(radius3)
  local radius3 = AddBlipForRadius(GetEntityCoords(PlayerPedId()), 700.0)
    SetBlipSprite (radius3, 1)
    SetBlipColour (radius3, Config.OrgBoje[ESX.PlayerData.job.name])
    SetBlipAlpha (radius3, 200)
end)



RegisterCommand("vlasniciteritorija", function()
  ESX.TriggerServerCallback("esx:getowner", function(owner)
      TriggerEvent('chat:addMessage', {
        color = { 255, 0, 0},
        multiline = true,
        args = {"Vlasnik zone T:1 je " .. owner}
      })

  end, 1)
  ESX.TriggerServerCallback("esx:getowner", function(owner)
    
    TriggerEvent('chat:addMessage', {
      color = { 255, 0, 0},
      multiline = true,
      args = {"Vlasnik zone T:2 je " .. owner}
    })

end, 2) -- za dalje samo menjate ovo end, 2) u end, 3,4,5) koja je zona po redu i
ESX.TriggerServerCallback("esx:getowner", function(owner)
    
  TriggerEvent('chat:addMessage', {
    color = { 255, 0, 0},
    multiline = true,
    args = {"Vlasnik zone T:3 je " .. owner}
  })

end, 3) -- za dalje samo menjate ovo end, 2) u end, 3,4,5) koja je zona po redu i
end)
