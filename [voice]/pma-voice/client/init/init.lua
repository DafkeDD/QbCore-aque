
AddEventHandler('onClientResourceStart', function(resource)
	if resource ~= GetCurrentResourceName() then
		return
	end
	print('Startar skriptinitiering')

	-- Some people modify pma-voice and mess up the resource Kvp, which means that if someone
	-- joins another server that has pma-voice, it will error out, this will catch and fix the kvp.
	local success = pcall(function()
		local micClicksKvp = GetResourceKvpString('pma-voice_enableMicClicks')
		if not micClicksKvp then
			SetResourceKvp('pma-voice_enableMicClicks', tostring(true))
		else
			if micClicksKvp ~= 'true' and micClicksKvp ~= 'false' then
				error('Ogiltig Kvp, kastfel för automatisk rengöring')
			end
			micClicks = micClicksKvp
		end
	end)

	if not success then
		logger.warn('Det gick inte att ladda resurs Kvp, har troligen ändrats på ett olämpligt sätt av en annan server, vilket återställer Kvp.')
		SetResourceKvp('pma-voice_enableMicClicks', tostring(true))
		micClicks = 'true'
	end
	sendUIMessage({
		uiEnabled = GetConvarInt("voice_enableUi", 1) == 1,
		voiceModes = json.encode(Cfg.voiceModes),
		voiceMode = mode - 1
	})

	-- Reinitialize channels if they're set.
	if LocalPlayer.state.radioChannel ~= 0 then
		setRadioChannel(LocalPlayer.state.radioChannel)
	end

	if LocalPlayer.state.callChannel ~= 0 then
		setCallChannel(LocalPlayer.state.callChannel)
	end
	print('Skriptinitieringen avslutad.')
end)
