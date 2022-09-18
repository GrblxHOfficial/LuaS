if"LuaS😎"then
	setreadonly(math, false)
	setreadonly(table, false)
	setreadonly(string, false)

	function table.randomitem(Table)
		local rng = math.random(1, #Table)
		local ci = 0
		for i, v in pairs(Table) do
			ci += 1
			if ci == rng then
				return i--[[Index]], v--[[Value]]
			end
		end
	end
	
	function table.unfreeze(Table)
		setreadonly(Table, false)	
	end

	function table.randomize(Table)
		for i, v in pairs(Table) do
			local index, val = table.randomitem(Table)
			Table[i] = val
			Table[index] = v
		end
	end

	function table.JSONEncode(Table)
		return game:GetService("HttpService"):JSONEncode(Table)
	end

	function table.JSONDecode(Table)
		return game:GetService("HttpService"):JSONDecode(Table)
	end

	function string.randomize(str)
		local Table = {}
		for i=1, #str do
			Table[i] = str:sub(i, i)
		end
		table.randomize(Table)
		return table.concat(Table)
	end

	function string.GUID(bool)
		return game:GetService("HttpService"):GenerateGUID(bool or false)
	end

	function string.ToBytes(str)
		return str:gsub(".", function(str2)return"\\"..str2:byte()end)
	end

	function math.ToHex(num)
		return "0x"..string.format("%x", tonumber(num))
	end

	function math.ToDec(num)
		return string.format("%d", tonumber(num))
	end
end
