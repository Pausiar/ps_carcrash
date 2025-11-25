-- client.lua

local canDrive = true
local lastCrash = 0 -- Timestamp del último choque
local cooldown = 2500 -- Tiempo mínimo entre choques en ms

-- Configuración
local minSpeed = 30.0  -- Velocidad mínima en km/h para aplicar efectos
local maxSpeed = 180.0 -- Velocidad máxima considerada
local minShake = 0.1   -- Intensidad mínima de la cámara
local maxShake = 1.0   -- Intensidad máxima de la cámara
local minDisable = 1000 -- Tiempo mínimo sin conducir (ms)
local maxDisable = 6000 -- Tiempo máximo sin conducir (ms)

-- Convertir m/s a km/h
local function GetVehicleSpeedKmh(vehicle)
    return GetEntitySpeed(vehicle) * 3.6
end

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        local playerPed = PlayerPedId()
        if IsPedInAnyVehicle(playerPed, false) then
            local veh = GetVehiclePedIsIn(playerPed, false)
            if HasEntityCollidedWithAnything(veh) and canDrive then
                local currentTime = GetGameTimer()
                if currentTime - lastCrash >= cooldown then
                    lastCrash = currentTime

                    local speed = GetVehicleSpeedKmh(veh)

                    -- Solo aplicar si supera la velocidad mínima
                    if speed >= minSpeed then
                        canDrive = false

                        -- Normalizar velocidad entre 0 y 1
                        local factor = math.min((speed - minSpeed) / (maxSpeed - minSpeed), 1.0)

                        -- Calcular intensidad del shake y duración del bloqueo
                        local shakeIntensity = minShake + (maxShake - minShake) * factor
                        local disableTime = math.floor(minDisable + (maxDisable - minDisable) * factor)

                        -- Temblor de cámara escalado
                        ShakeGameplayCam("SMALL_EXPLOSION_SHAKE", shakeIntensity)

                        -- Restaurar control tras el tiempo calculado
                        Citizen.SetTimeout(disableTime, function()
                            canDrive = true
                        end)
                    end
                end
            end
        end
    end
end)

-- Bloquear controles del vehículo mientras no pueda conducir
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        if not canDrive then
            DisableControlAction(0, 71, true) -- Acelerar
            DisableControlAction(0, 72, true) -- Frenar / Reversa
            DisableControlAction(0, 63, true) -- Girar derecha
            DisableControlAction(0, 64, true) -- Girar izquierda
        end
    end
end)
