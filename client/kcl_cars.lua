Esx = nil

Citizen.CreateThread(function()
  while ESX == nil do
    TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
    Citizen.Wait(0)
  end
end)

-- [Location voiture] --
local open = false 
local locationMenu6 = RageUI.CreateMenu('Location voiture', 'Klocation')
local locationMain2 = RageUI.CreateMenu('voiture de tourisme', 'Klocation')
local locationMain3 = RageUI.CreateMenu('voiture de voyage', 'Klocation')
locationMenu6.Display.Header = true 
locationMenu6.Closed = function()
  open = false
end

function Klocationcars()
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
   
                RageUI.Button("Voiture", nil, {RightLabel = "→→"}, true , {
                    onSelected = function()
                     end
                    }, locationMain2)

                RageUI.Button("Moto", nil, {RightLabel = "→→"}, true , {
                    onSelected = function()
                     end
                    }, locationMain3)
                end)

RageUI.IsVisible(locationMain2,function() 

               RageUI.Button("Blista", nil, {RightLabel = "~b~500$"}, true , {
                onSelected = function()
                     local model = GetHashKey("blista")
                     RequestModel(model) do Citizen.Wait(10) end
                     local pos = GetEntityCoords(PlayerPedId())
                     local vehicle = CreateVehicle(model, -817.60,  -125.71, 37.28, 244.56, true, false)
                     TriggerServerEvent('Klocation:blista', 300)
                     TaskWarpPedIntoVehicle(PlayerPedId(), vehicle, -1)
                RageUI.CloseAll()
               end
            })
        
            RageUI.Button("Panto", nil, {RightLabel = "~b~700$"}, true , {
              onSelected = function()
                     local model = GetHashKey("panto")
                     RequestModel(model) do Citizen.Wait(10) end
                     local pos = GetEntityCoords(PlayerPedId())
                     local vehicle = CreateVehicle(model, -817.60,  -125.71, 37.28, 244.56, true, false)
                     TriggerServerEvent('Klocation:panto', 300)
                     TaskWarpPedIntoVehicle(PlayerPedId(), vehicle, -1)
                RageUI.CloseAll()
               end
            })
    end)  

RageUI.IsVisible(locationMain3,function() 

            RageUI.Button("Scooter", nil, {RightLabel = "~b~200$"}, true , {
              onSelected = function()
                     local model = GetHashKey("faggio")
                     RequestModel(model) do Citizen.Wait(10) end
                     local pos = GetEntityCoords(PlayerPedId())
                     local vehicle = CreateVehicle(model, -817.60,  -125.71, 37.28, 244.56, true, false)
                     TriggerServerEvent('Klocation:faggio', 300)
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
  {x = -825.29, y = -114.59, z = 37.59},
} 

Citizen.CreateThread(function()
  while true do
      local sleep = 500
          for k in pairs(position) do
              local plyCoords = GetEntityCoords(GetPlayerPed(-1), false)
              local dist = Vdist(plyCoords.x, plyCoords.y, plyCoords.z, position[k].x, position[k].y, position[k].z)
                  if dist <= 1.0 then
                  sleep = 0
                  Visual.Subtitle("Appuyez sur ~b~[E]~s~ pour louer un voiture", 1) 
                  if IsControlJustPressed(1,51) then
                      Klocationcars()
                  end
              end
          end
      Citizen.Wait(sleep)
  end
end)

-- [Ped & Blips]

Citizen.CreateThread(function()
    local hash = GetHashKey("cs_josh")
    while not HasModelLoaded(hash) do
    RequestModel(hash)
    Wait(20)
    end
    ped = CreatePed("PED_TYPE_CIVFEMALE", "cs_josh", -825.63, -114.72, 36.58, 206.19, false, true)
    SetBlockingOfNonTemporaryEvents(ped, true)
    FreezeEntityPosition(ped, true)
end)

local blips = {
    {title="Location de Bateau", colour=5, id=256, x = -825.29, y = -114.59, z = 37.59},
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