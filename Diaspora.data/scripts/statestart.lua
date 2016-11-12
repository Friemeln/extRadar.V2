timestamp = 0

debug=false
-- debug=true

socket=require("socket")

-- alle so viele Sekunden werden Spielinfos verschickt
-- sendinginterval=0.02 
sendinginterval=2.0

udp=socket.udp()
udp:settimeout(0)
-- connect to UDP server

--ip auflösen evtl host = socket.dns.toip("Computername, zB Cerberos")
--udp:setpeername ("192.168.0.8",14285)

-- mein eigener Rechner 
-- udp:setpeername ("192.168.188.29",14151)
udp:setpeername ("127.0.0.1",14151)

-- mein nodejs UDP Server
-- udp:setpeername ("192.168.188.50",14151)

-- Daten für TC-Con Netzwerk
-- udp:setpeername ("192.168.100.55",14151)

local ip, _ = udp:getsockname()
udp:send("## my IP: "..ip)
_, _, clientkennung = split(ip, ".")
udp:send("## clientkennung: "..clientkennung)

-- Spielerkennung... 
kennung = Base.getCurrentPlayer():getName()
	
if debug then

	udp:send("## StateStart: Anfang  vvvvvvvvvvvvvvvvvvvvvvvvv ##")

	local i
	local i_max
	i=1
	i_max=#HookVariables.Globals
	if i_max > 0 then
		for i = 1, i_max, 1 do
			udp:send("## HookVariables.Globals["..i.."] = "..HookVariables.Globals[i])
		end
	else
		udp:send("## i_max: "..i_max)
	end

	udp:send("## getCurrentPlayer: "..kennung)

end


-- dir=require("io")
-- for dir in io.popen([[dir "." /b /ad]]):lines() do 
--   print(dir) 
--   udp:send(dir)
-- end



if debug then
	udp:send("## StateStart: Ende    ^^^^^^^^^^^^^^^^^^^^^^^^^ ##")
end



function string:split(delimiter) 
	local result = { } 
	local from  = 1 
	local delim_from, delim_to = string.find( self, delimiter, from  ) 
	while delim_from do 
		table.insert( result, string.sub( self, from , delim_from-1 ) ) 
		from  = delim_to + 1 
		delim_from, delim_to = string.find( self, delimiter, from  ) 
	end 
	table.insert( result, string.sub( self, from  ) ) 
	return result 
end