
ESX = nil 
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end) 
ESX.RegisterServerCallback('esx:zauzeta', function (source, cb, brojzone, owner, koordezone)

  local xPlayer = ESX.GetPlayerFromId(source)
  local xPlayer = ESX.GetPlayerFromId(source)
  local kurac = #(GetEntityCoords(GetPlayerPed(source)) - koordezone)
if kurac < 10.0 then
  saljilog("Srdjan_teritorije", GetPlayerName(source) .. " je zauzeo teritoriju T:" .. brojzone .. " njegova organizacija je " .. xPlayer.job.label)
            MySQL.Sync.execute(
                'UPDATE zone SET  owner = @owner  WHERE brojzone = @brojzone',
                {
                    ["@brojzone"] = brojzone,
                    ["@owner"] = owner
                   
                }
            )	
            MySQL.Sync.execute(
              'UPDATE zone SET  zauzimase = 0 WHERE brojzone = @brojzone',
              {
                ["@brojzone"] = brojzone,
                 
              }
          )	
        
     xPlayer.addMoney(Config.Nagrada)
     TriggerClientEvent("esx:blipzauzimanje", -1)
     local xPlayer= ESX.GetPlayerFromId(source)
     local xPlayer = ESX.GetPlayerFromId(source)
     TriggerClientEvent('chat:addMessage', -1, {
       template = '<div style="padding: 1vw; margin: 0.5vw; background-color: rgba(0,0,0 , 0.5); border-radius: 10px;"><i class="far fa-bell"></i> {0}<br>  </div>',
        args = { 'Teritorije ' .. xPlayer.job.label .. ' je zauzela zonu  T:'  .. brojzone  }
       })
      else
        TriggerClientEvent('chat:addMessage', -1, {
          template = '<div style="padding: 1vw; margin: 0.5vw; background-color: rgba(0,0,0 , 0.5); border-radius: 10px;"><i class="far fa-bell"></i> {0}<br>  </div>',
           args = { 'Teritorije : ' .. xPlayer.job.label .. ' nije uspela da zauzime zonu  T:' .. brojzone  }
          })
          saljilog("Srdjan_teritorije", GetPlayerName(source) .. " nije uspeo da zauzme zonu T:" .. brojzone .. " njegova organizacija je " .. xPlayer.job.label)
      end
      MySQL.Sync.execute(
        'UPDATE zone SET  zauzimase = 0 WHERE brojzone = @brojzone',
        {
          ["@brojzone"] = brojzone,
           
        }
    )	
end)
ESX.RegisterServerCallback('esx:prekinizauzimanje', function (source, cb, brojzone)

  local xPlayer = ESX.GetPlayerFromId(source)
  local xPlayer = ESX.GetPlayerFromId(source)

            MySQL.Sync.execute(
                'UPDATE zone SET  owner = @owner  WHERE brojzone = @brojzone',
                {
                    ["@brojzone"] = brojzone,
                    ["@owner"] = "niko"
                   
                }
            )	
            MySQL.Sync.execute(
              'UPDATE zone SET  zauzimase = @broj WHERE brojzone = @brojzone',
              {
                ["@broj"] = 0,
                ["@brojzone"] = brojzone,
                 
              }
          )	
        

     local xPlayer= ESX.GetPlayerFromId(source)
     local xPlayer = ESX.GetPlayerFromId(source)
        TriggerClientEvent('chat:addMessage', -1, {
          template = '<div style="padding: 1vw; margin: 0.5vw; background-color: rgba(0,0,0 , 0.5); border-radius: 10px;"><i class="far fa-bell"></i> {0}<br>  </div>',
           args = { 'Teritorije : ' .. xPlayer.job.label .. ' nije uspela da zauzme zonu T:'  .. brojzone  }
          })
          saljilog("Srdjan_teritorije", GetPlayerName(source) .. " je nije uspeo da zauzme teritoriju T:" .. brojzone .. " njegova organizacija je " .. xPlayer.job.label)
end)
ESX.RegisterServerCallback('esx:getZauzimase', function(source, cb, brojzone)
    local xPlayer= ESX.GetPlayerFromId(source)
  MySQL.Async.fetchScalar('SELECT zauzimase FROM zone WHERE brojzone = @brojzone', {
      ["@brojzone"] = brojzone
  }, function(posao)
    if posao then

    end
  
    cb(posao)
  end)
  end)
  ESX.RegisterServerCallback('esx:zauzimase', function (source, cb, brojzone, broj)

    local xPlayer = ESX.GetPlayerFromId(source)
  
  
              MySQL.Sync.execute(
                  'UPDATE zone SET  zauzimase = @broj  WHERE brojzone = @brojzone',
                  {
                      ["@brojzone"] = brojzone,
                      ["@broj"] = broj
                     
                  }
              )	
    
          
       
  
  
  end)
  

  AddEventHandler('onResourceStart', function(resourceName)
  if (GetCurrentResourceName() == resourceName) then

  
    MySQL.Sync.execute(
      'UPDATE zone SET  owner = @niko ',
        {
 ["@niko"] = "niko"
           
        }
    )	
    MySQL.Sync.execute(
        'UPDATE zone SET  zauzimase = 0 ',
        {

           
        }
    )	
  end
end)
  
  
ESX.RegisterServerCallback('esx:getowner', function(source, cb, brojzone)
  local xPlayer= ESX.GetPlayerFromId(source)
MySQL.Async.fetchScalar('SELECT owner FROM zone WHERE brojzone = @brojzone', {
    ["@brojzone"] = brojzone
}, function(posao)
  if posao then

  end

  cb(posao)
end)
end)



  ESX.RegisterServerCallback('esx:poruka', function(source, cb, brojzone)
    local xPlayer= ESX.GetPlayerFromId(source)
    local xPlayer = ESX.GetPlayerFromId(source)
    TriggerClientEvent('chat:addMessage', -1, {
      template = '<div style="padding: 1vw; margin: 0.5vw; background-color: rgba(0,0,0 , 0.5); border-radius: 10px;"><i class="far fa-bell"></i> {0}<br>  </div>',
       args = { 'Teritorije ' .. xPlayer.job.label .. ' mafija je startovala zauzimanje zone  T:'  .. brojzone  }
      })
    end)


  
    function saljilog(name, message)
      local poruka = {
          {
              ["color"] = 16711680,
              ["title"] = "**".. name .."**",
              ["description"] = message,
              ["footer"] = {
              ["text"] = "Srdjan teritorije ",
              },
          }
        }
      PerformHttpRequest(Config.DiscordLogWebHook, function(err, text, headers) end, 'POST', json.encode({username = "Srdjan teritorije log📜", embeds = poruka, avatar_url = ""}), { ['Content-Type'] = 'application/json' })
  end
