if debug then
	udp:send("## OnMissionStart: Anfang  ------------------------- ## "..timestamp)
	-- alle hv.Globals werden ausgegeben:
	local i
	local i_max
	local ship_pos
	i=1
	i_max=#hv.Globals
	for i = 1, i_max, 1 do
		udp:send("## hv.Globals["..i.."] = "..hv.Globals[i])
	end
	
	local ship, ship_pos_x, ship_pos_y, ship_pos_z
	if mn.Ships ~= nil then
		i=1
		i_max=#mn.Ships
		for i = 5, i_max, 1 do
			if mn.Ships[i]:isValid() then
				udp:send("## mn.Ships["..i.."] = "..mn.Ships[i].Name)
				
				ship = mn.Ships[i]
				ship_pos_x = ship.Position["x"]
				ship_pos_y = ship.Position["y"]
				ship_pos_z = ship.Position["z"]
				udp:send("##               ("..ship_pos_x..","..ship_pos_y..","..ship_pos_z..")")
				
			else
				udp:send("## mn.Ships["..i.."] = ".."not valid")
			end
		end
	end

	udp:send("## OnMissionStart: Ende  ------------------------- ## "..timestamp)
end
