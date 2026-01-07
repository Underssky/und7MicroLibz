local Base64 = {}

function Base64.decode(data)
	local b = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/'
	local data = string.gsub(data, '[^'..b..'=]', '')
	return (data:gsub('.', function(x)
		if (x == '=') then return '' end
		local r, f = '', (b:find(x) - 1)
		for i = 6, 1, -1 do
			r = r .. (f % 2^i - f % 2^(i-1) > 0 and '1' or '0')
		end
		return r
	end):gsub('%d%d%d?%d?%d?%d?%d?%d?', function(x)
		if (#x ~= 8) then return '' end
		local c = 0
		for i = 1, 8 do
			c = c + (x:sub(i, i) == '1' and 2^(8 - i) or 0)
		end
		return string.char(c)
	end))
end

function Base64.encode(data)
	local b = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/'
	return ((data:gsub('.', function(x)
		local r, b = '', x:byte()
		for i = 8, 1, -1 do
			r = r .. (b % 2^i - b % 2^(i-1) > 0 and '1' or '0')
		end
		return r
	end) .. '0000'):gsub('%d%d%d?%d?%d?%d?', function(x)
		if (#x < 6) then return '' end
		local c = 0
		for i = 1, 6 do
			c = c + (x:sub(i, i) == '1' and 2^(6 - i) or 0)
		end
		return b:sub(c + 1, c + 1)
	end) .. ({ '', '==', '=' })[#data % 3 + 1])
end

function Base64.StringTable(t, indent)
	indent = indent or ""
	local result = "{\n"
	for key, value in pairs(t) do
		local keyStr = tostring(key)
		local valstring
		if type(value) == "table" then
			valstring = Base64.StringTable(value, indent .. "    ")
		elseif type(value) == "string" then
			valstring = '"' .. value .. '"'
		else
			valstring = tostring(value)
		end
		result = result .. indent .. "    " .. keyStr .. " = " .. valstring .. ";\n"
	end
	result = result .. indent .. "}"
	return result
end


function Base64.DeObfTable(n, t) -- How many times you ofbuscating, Your Obfuscated String
	local vN = math.round(n)
	local decoded = t
	for i = 1, vN do
		decoded = Base64.decode(decoded)
	end
	return decoded
end

function Base64.ObfTable(n, t) -- How many times you ofbuscating, Your table
	local vN = math.round(n)
	local encoded = Base64.StringTable(t)
	for i = 1, vN do
		encoded = Base64.encode(encoded)
	end
	return encoded
end


return Base64
