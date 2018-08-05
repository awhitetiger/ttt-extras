util.AddNetworkString("SendKill")
util.AddNetworkString("SendCount")

function CheckKillerRole(ply, atk, obj)
	if atk != ply and atk:IsValid() and atk:IsPlayer() then
		net.Start("SendKill")
		net.WriteString(atk:GetRoleString())
		net.WriteString(atk:Name())
		net.Send(ply)
	end
end

function CheckRoleCount()
	local i = 0
	local t = 0
	local d = 0
	for k,v in pairs(player.GetAll()) do
		if v:GetRoleString() == "innocent" then
			i = i+1
		elseif v:GetRoleString() == "traitor" then
			t = t+1
		else
			d = d+1
		end
	end
	net.Start("SendCount")
	net.WriteInt(i, 32)
	net.WriteInt(t, 32)
	net.WriteInt(d, 32)
	net.Broadcast()
end
hook.Add("DoPlayerDeath", "CheckKillerRole", CheckKillerRole)
hook.Add("TTTBeginRound", "CheckRoleCount", CheckRoleCount)