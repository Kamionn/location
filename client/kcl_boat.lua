Esx = nil

Citizen.CreateThread(function()
  while ESX == nil do
    TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
    Citizen.Wait(0)
  end
end)

-- [Location Bateau] --
local open = false 
local locationMenu6 = RageUI.CreateMenu('Location Bateau', 'Klocation')
local locationMain2 = RageUI.CreateMenu('Bateau de tourisme', 'Klocation')
local locationMain3 = RageUI.CreateMenu('Bateau de voyage', 'Klocation')
locationMenu6.Display.Header = true 
locationMenu6.Closed = function()
  open = false
end

function Klocationboat()
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
   
                RageUI.Button("Bateau de tourisme", nil, {RightLabel = "→→"}, true , {
                    onSelected = function()
                     end
                    }, locationMain2)

                RageUI.Button("Sous marin", nil, {RightLabel = "→→"}, true , {
                    onSelected = function()
                     end
                    }, locationMain3)
                end)

RageUI.IsVisible(locationMain2,function() 

               RageUI.Button("Suntrap", nil, {RightLabel = "~b~5000$"}, true , {
                onSelected = function()
                     local model = GetHashKey("suntrap")
                     RequestModel(model) do Citizen.Wait(10) end
                     local pos = GetEntityCoords(PlayerPedId())
                     local vehicle = CreateVehicle(model, -101.69, -2770.50, 0.50, 175.60, true, false)
                     TriggerServerEvent('Klocation:suntrap', 300)
                     TaskWarpPedIntoVehicle(PlayerPedId(), vehicle, -1)
                RageUI.CloseAll()
               end
            })
        
            RageUI.Button("Squalo", nil, {RightLabel = "~b~7000$"}, true , {
              onSelected = function()
                 local model = GetHashKey("squalo")
                 RequestModel(model) do Citizen.Wait(10) end
                 local pos = GetEntityCoords(PlayerPedId())
                 TriggerServerEvent('Klocation:squalo', 300)
                  local vehicle = CreateVehicle(model, -101.69, -2770.50, 0.50, 175.60, true, false)
                 TaskWarpPedIntoVehicle(PlayerPedId(), vehicle, -1)
            RageUI.CloseAll()
             end
          })

          end)  

RageUI.IsVisible(locationMain3,function() 

            RageUI.Button("Submersible", nil, {RightLabel = "~b~12000$"}, true , {
                onSelected = function()
                   local model = GetHashKey("submersible")
                   RequestModel(model) do Citizen.Wait(10) end
                   local pos = GetEntityCoords(PlayerPedId())
                   TriggerServerEvent('Klocation:Submersible', 200)
                 local vehicle = CreateVehicle(model, -101.69, -2770.50, 0.50, 175.60, true, false)
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
  {x = -95.15, y = -2767.83, z = 6.08},
} 

Citizen.CreateThread(function()
  while true do
      local sleep = 500
          for k in pairs(position) do
              local plyCoords = GetEntityCoords(GetPlayerPed(-1), false)
              local dist = Vdist(plyCoords.x, plyCoords.y, plyCoords.z, position[k].x, position[k].y, position[k].z)
                  if dist <= 1.0 then
                  sleep = 0
                  Visual.Subtitle("Appuyez sur ~b~[E]~s~ pour louer un bateau", 1) 
                  if IsControlJustPressed(1,51) then
                      Klocationboat()
                  end
              end
          end
      Citizen.Wait(sleep)
  end
end)

-- [Ped & Blips]

Citizen.CreateThread(function()
    local hash = GetHashKey("a_f_y_beach_01")
    while not HasModelLoaded(hash) do
    RequestModel(hash)
    Wait(20)
    end
    ped = CreatePed("PED_TYPE_CIVFEMALE", "a_f_y_beach_01", -95.15, -2767.83, 5.08, 94.41, false, true)
    SetBlockingOfNonTemporaryEvents(ped, true)
    FreezeEntityPosition(ped, true)
end)

local blips = {
    {title="Location de Bateau", colour=3, id=427, x = -95.15, y = -2767.83, z = 94.41},
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