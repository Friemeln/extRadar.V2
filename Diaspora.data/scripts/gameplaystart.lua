function set_ship_pos(name,x,y,z)
	mn.runSEXP("(set-object-position !" .. name .. "! !" .. x .. "! !" .. y .. "! !" .. z .. "! )")
end

if mn.Ships ~= nil then
	set_ship_pos("Alpha 1","0","0","100")
	set_ship_pos("Alpha 2","0","0","-100")
	set_ship_pos("Alpha 3","100","0","0")
	set_ship_pos("Alpha 4","-100","0","0")
end

if debug then
	udp:send("## OnGameplayStart: Anfang  ------------------- ## "..timestamp)
	-- alle hv.Globals werden ausgegeben:
	local i
	local i_max
	
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

	udp:send("## OnGameplayStart: Ende  ------------------- ## "..timestamp)
end