Esx = nil

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
end)

-- [Location Avion Aéroport] --
local open = false 
local locationMenu6 = RageUI.CreateMenu('Location Avion', 'Klocation')
local locationMain2 = RageUI.CreateMenu('Avion de tourisme', 'Klocation')
local locationMain3 = RageUI.CreateMenu('Avion de voyage', 'Klocation')
locationMenu6.Display.Header = true 
locationMenu6.Closed = function()
  open = false
end

function Klocationplane()
     if open then 
         open = false
         RageUI.Visible(locationMenu6, false)
         return
     else
         open = true 
             RageUI.Visible(locationMenu6, true)
             CreateThread(function()
             while open do 
            
RageUI.IsVisible(locationMenu6,function() 
   
                RageUI.Button("Avion de tourisme", nil, {RightLabel = "→→"}, true , {
                    onSelected = function()
                     end
                    }, locationMain2)

                RageUI.Button("Avion de voyage ", nil, {RightLabel = "→→"}, true , {
                    onSelected = function()
                     end
                    }, locationMain3)
                end)

RageUI.IsVisible(locationMain2,function() 

               RageUI.Button("cuban800", nil, {RightLabel = "~b~2500$"}, true , {
                onSelected = function()
                     local model = GetHashKey("cuban800")
                     RequestModel(model) do Citizen.Wait(10) end
                     local pos = GetEntityCoords(PlayerPedId())
                     local vehicle = CreateVehicle(model, -1280.93, -3397.12, 14.98, 330.29, true, false)
                     TriggerServerEvent('Klocation:Cuban800', 300)
                     TaskWarpPedIntoVehicle(PlayerPedId(), vehicle, -1)
                RageUI.CloseAll()
               end
            })
        
            RageUI.Button("dodo", nil, {RightLabel = "~b~3500$"}, true , {
              onSelected = function()
                 local model = GetHashKey("dodo")
                 RequestModel(model) do Citizen.Wait(10) end
                 local pos = GetEntityCoords(PlayerPedId())
                 TriggerServerEvent('Klocation:dodo', 300)
                  local vehicle = CreateVehicle(model, -1280.93, -3397.12, 14.98, 330.29, true, false)
                 TaskWarpPedIntoVehicle(PlayerPedId(), vehicle, -1)
            RageUI.CloseAll()
             end
          })

          end)  

RageUI.IsVisible(locationMain3,function() 

            RageUI.Button("Luxor", nil, {RightLabel = "~b~15000$"}, true , {
                onSelected = function()
                   local model = GetHashKey("luxor")
                   RequestModel(model) do Citizen.Wait(10) end
                   local pos = GetEntityCoords(PlayerPedId())
                   TriggerServerEvent('Klocation:luxor', 200)
                   local vehicle = CreateVehicle(model, -1280.93, -3397.12, 14.98, 330.29, true, false)
                   TaskWarpPedIntoVehicle(PlayerPedId(), vehicle, -1)
            RageUI.CloseAll()
                 end
                })

            RageUI.Button("Nimbus", nil, {RightLabel = "~b~20000$"}, true , {
                onSelected = function()
                   local model = GetHashKey("nimbus")
                   RequestModel(model) do Citizen.Wait(10) end
                   local pos = GetEntityCoords(PlayerPedId())
                   TriggerServerEvent('Klocation:nimbus', 200)
                   local vehicle = CreateVehicle(model, -1280.93, -3397.12, 14.98, 330.29, true, false)
                   TaskWarpPedIntoVehicle(PlayerPedId(), vehicle, -1)
            RageUI.CloseAll()
                 end
                })
            end)
          Wait(0)
         end
      end)
   end
end

-- [Menu] --

local position = {
  {x = -1306.12, y = -3390.26, z = 13.94},
} 

Citizen.CreateThread(function()
  while true do
      local sleep = 500
          for k in pairs(position) do
              local plyCoords = GetEntityCoords(GetPlayerPed(-1), false)
              local dist = Vdist(plyCoords.x, plyCoords.y, plyCoords.z, position[k].x, position[k].y, position[k].z)
                  if dist <= 1.0 then
                  sleep = 0
                  Visual.Subtitle("Appuyez sur ~b~[E]~s~ pour louer un avion", 1) 
                  if IsControlJustPressed(1,51) then
                      Klocationplane()
                  end
              end
          end
      Citizen.Wait(sleep)
  end
end)

-- [Ped & Blips]

Citizen.CreateThread(function()
    local hash = GetHashKey("cs_tom")
    while not HasModelLoaded(hash) do
    RequestModel(hash)
    Wait(20)
    end
    ped = CreatePed("PED_TYPE_CIVFEMALE", "cs_tom", -1307.47, -3389.45, 12.95, 232.01, false, true)
    SetBlockingOfNonTemporaryEvents(ped, true)
    FreezeEntityPosition(ped, true)
end)

local blips = {
    {title="Location d'avion", colour=38, id=423, x = -1276.72, y = -3391.81, z = 13.94},
}
    Citizen.CreateThread(function()
        for _, info in pairs(blips) do
        info.blip = AddBlipForCoord(info.x, info.y, info.z)
        SetBlipSprite(info.blip, info.id)
        SetBlipDisplay(info.blip, 4)
        SetBlipScale(info.blip, 0.8)
        SetBlipColour(info.blip, info.colour)
        SetBlipAsShortRange(info.blip, true)
        BeginTextCommandSetBlipName("STRING")
        AddTextComponentString(info.title)
        EndTextCommandSetBlipName(info.blip)
    end
end)  

function LoadModel(model)
    while not HasModelLoaded(model) do
        RequestModel(model)
        Wait(1)
    end
end

-- By kamion #1323
