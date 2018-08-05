net.Receive("SendKill", NotifyKill)
net.Receive("SendCount", NotifyCount)


function NotifyKill()
	local role = net.ReadString()
	local killer = net.ReadString()
	
	if role == "traitor" then
		chat.AddText(Color(0,255,255), "[SammyServers] ", Color(255,255,255), "You were killed by ", Color(0,0,0), killer, Color(255,255,255), " who is a ", Color(255,0,0), "Traitor!")
	elseif role == "innocent" then
		chat.AddText(Color(0,255,255), "[SammyServers] ", Color(255,255,255), "You were killed by ", Color(0,0,0), killer, Color(255,255,255), " who is ", Color(0,255,0), "Innocent!")
	else
		chat.AddText(Color(0,255,255), "[SammyServers] ", Color(255,255,255), "You were killed by ", Color(0,0,0), killer, Color(255,255,255), " who is a", Color(0,0,255), "Detective!")
	end
end

function NotifyCount()
	local i = net.ReadInt(32)
	local t = net.ReadInt(32)
	local d = net.ReadInt(32)
	chat.AddText(Color(0,255,255), "[SammyServers] ", Color(255,255,255), "There are ", Color(0,255,0), i .. " Innocent", Color(255,255,255), ", ", Color(255,0,0), t .. " Traitors")
end