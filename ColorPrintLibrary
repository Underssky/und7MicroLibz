local PrintLib = {}
--[[

		Examples
		Color Method is Color3.fromRGB()
		Speed counting in seconds
		
		
	PrintLib.CPrint(string, color)   ---------------------- Colored print
	
	PrintLib.RPrint(string, speed) ---------------------- Rainbow print (rainbow speed)
	
	PrintLib.SPrint(string, speed, color1 - ∞) -------- Tween Color Switch 
	
	PrintLib.SIPrint(string, speed, color1 - ∞) ------- Instant Color Switch 
	
	PrintLib.GPrint(string, speed, col1 - ∞)  --------- Tween Gradient
	
	PrintLib.GSPrint(string, 0, col1 - ∞) -------------- Static Gradient
	
--]]
function PrintLib.CPrint(text, color3)
	local key = string.char(1) .. tostring(math.random(1000, 9999)) 
	local fullText = tostring(text) .. key
	print(fullText)
	task.spawn(function()
		local label = nil
		local coreGui = game:GetService("CoreGui")
		local start = tick()
		while not label and tick() - start < 2 do
			local console = coreGui:FindFirstChild("DevConsoleMaster")
			if console then
				for _, v in pairs(console:GetDescendants()) do
					if v:IsA("TextLabel") and string.find(v.Text, key, 1, true) then 
						label = v
						break
					end
				end
			end
			if not label then task.wait() end
		end
		if label then
			label.RichText = true
			local r = math.floor(color3.R * 255)
			local g = math.floor(color3.G * 255)
			local b = math.floor(color3.B * 255)
			local originalTextWithoutKey = string.gsub(label.Text, key, "")
			label.Text = string.format("<font color='rgb(%d,%d,%d)'>%s</font>", r, g, b, originalTextWithoutKey)
		end
	end)
end
function PrintLib.RPrint(text, speed)
	speed = speed or 1
	local key = string.char(1) .. tostring(math.random(1000, 9999))
	local fullText = tostring(text) .. key
	print(fullText)
	task.spawn(function()
		local label = nil
		local coreGui = game:GetService("CoreGui")
		local start = tick()
		while not label and tick() - start < 2 do
			local console = coreGui:FindFirstChild("DevConsoleMaster")
			if console then
				for _, v in pairs(console:GetDescendants()) do
					if v:IsA("TextLabel") and string.find(v.Text, key, 1, true) then
						label = v
						break
					end
				end
			end
			if not label then task.wait() end
		end
		if label then
			label.RichText = true
			local originalTextWithoutKey = string.gsub(label.Text, key, "")
			local hue = 0
			while task.wait() do
				hue = (hue + speed * task.wait()) % 1
				local color3 = Color3.fromHSV(hue, 1, 1)
				local r = math.floor(color3.R * 255)
				local g = math.floor(color3.G * 255)
				local b = math.floor(color3.B * 255)
				label.Text = string.format("<font color='rgb(%d,%d,%d)'>%s</font>", r, g, b, originalTextWithoutKey)
			end
		end
	end)
end
function PrintLib.SPrint(text, speed, ...)
	speed = speed or 1
	local colors = {...}
	if #colors == 0 then return end
	local key = string.char(1) .. tostring(math.random(1000, 9999))
	local fullText = tostring(text) .. key
	print(fullText)
	task.spawn(function()
		local label = nil
		local coreGui = game:GetService("CoreGui")
		local start = tick()
		while not label and tick() - start < 2 do
			local console = coreGui:FindFirstChild("DevConsoleMaster")
			if console then
				for _, v in pairs(console:GetDescendants()) do
					if v:IsA("TextLabel") and string.find(v.Text, key, 1, true) then
						label = v
						break
					end
				end
			end
			if not label then task.wait() end
		end
		if label then
			label.RichText = true
			local originalTextWithoutKey = string.gsub(label.Text, key, "")
			local colorIndex = 1
			local tweenService = game:GetService("TweenService")
			local tweenInfo = TweenInfo.new(speed, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut, -1, true, 0)
			local targetColor = colors[colorIndex]
			while task.wait() do
				local nextColorIndex = (colorIndex % #colors) + 1
				targetColor = colors[nextColorIndex]
				local tween = tweenService:Create(label, tweenInfo, {TextColor3 = targetColor})
				tween:Play()
				task.wait(speed)
				colorIndex = nextColorIndex
			end
		end
	end)
end
function PrintLib.SIPrint(text, speed, ...)
	speed = speed or 1
	local colors = {...}
	if #colors == 0 then return end
	local key = string.char(1) .. tostring(math.random(1000, 9999))
	local fullText = tostring(text) .. key
	print(fullText)
	task.spawn(function()
		local label = nil
		local coreGui = game:GetService("CoreGui")
		local start = tick()
		while not label and tick() - start < 2 do
			local console = coreGui:FindFirstChild("DevConsoleMaster")
			if console then
				for _, v in pairs(console:GetDescendants()) do
					if v:IsA("TextLabel") and string.find(v.Text, key, 1, true) then
						label = v
						break
					end
				end
			end
			if not label then task.wait() end
		end
		if label then
			label.RichText = true
			local originalTextWithoutKey = string.gsub(label.Text, key, "")
			local colorIndex = 1
			while task.wait(speed) do
				local color3 = colors[colorIndex]
				local r = math.floor(color3.R * 255)
				local g = math.floor(color3.G * 255)
				local b = math.floor(color3.B * 255)
				label.Text = string.format("<font color='rgb(%d,%d,%d)'>%s</font>", r, g, b, originalTextWithoutKey)
				colorIndex = (colorIndex % #colors) + 1
			end
		end
	end)
end
function PrintLib.GPrint(text, rotationSpeed, ...)
	rotationSpeed = rotationSpeed or 1
	local colors = {...}
	if #colors == 0 then return end
	local key = string.char(1) .. tostring(math.random(1000, 9999))
	local fullText = tostring(text) .. key
	print(fullText)
	task.spawn(function()
		local label = nil
		local coreGui = game:GetService("CoreGui")
		local start = tick()
		while not label and tick() - start < 2 do
			local console = coreGui:FindFirstChild("DevConsoleMaster")
			if console then
				for _, v in pairs(console:GetDescendants()) do
					if v:IsA("TextLabel") and string.find(v.Text, key, 1, true) then
						label = v
						break
					end
				end
			end
			if not label then task.wait() end
		end
		if label then
			label.RichText = true
			local originalTextWithoutKey = string.gsub(label.Text, key, "")
			while task.wait() do
				local gradientText = ""
				local timeOffset = tick() * rotationSpeed
				for i = 1, #originalTextWithoutKey do
					local progress = (i - 1) / (#originalTextWithoutKey - 1)
					local animatedProgress = (progress + timeOffset) % 1
					local colorIndex = math.floor(animatedProgress * (#colors - 1)) + 1
					local nextColorIndex = math.min(colorIndex + 1, #colors)
					local blend = (animatedProgress * (#colors - 1)) - (colorIndex - 1)
					local blendedColor = colors[colorIndex]:Lerp(colors[nextColorIndex], blend)
					local r = math.floor(blendedColor.R * 255)
					local g = math.floor(blendedColor.G * 255)
					local b = math.floor(blendedColor.B * 255)
					gradientText = gradientText .. string.format("<font color='rgb(%d,%d,%d)'>%s</font>", r, g, b, string.sub(originalTextWithoutKey, i, i))
				end
				label.Text = gradientText
			end
		end
	end)
end
function PrintLib.GSPrint(text, rotation, ...)
	local colors = {...}
	if #colors == 0 then return end
	local key = string.char(1) .. tostring(math.random(1000, 9999))
	local fullText = tostring(text) .. key
	print(fullText)
	task.spawn(function()
		local label = nil
		local coreGui = game:GetService("CoreGui")
		local start = tick()
		while not label and tick() - start < 2 do
			local console = coreGui:FindFirstChild("DevConsoleMaster")
			if console then
				for _, v in pairs(console:GetDescendants()) do
					if v:IsA("TextLabel") and string.find(v.Text, key, 1, true) then
						label = v
						break
					end
				end
			end
			if not label then task.wait() end
		end
		if label then
			label.RichText = true
			local originalTextWithoutKey = string.gsub(label.Text, key, "")
			local gradientText = ""
			for i = 1, #originalTextWithoutKey do
				local progress = (#originalTextWithoutKey > 1) and (i - 1) / (#originalTextWithoutKey - 1) or 0
				local colorIndex = math.floor(progress * (#colors - 1)) + 1
				local nextColorIndex = math.min(colorIndex + 1, #colors)
				local blend = (progress * (#colors - 1)) - (colorIndex - 1)
				local blendedColor = colors[colorIndex]:Lerp(colors[nextColorIndex], blend)
				local r = math.floor(blendedColor.R * 255)
				local g = math.floor(blendedColor.G * 255)
				local b = math.floor(blendedColor.B * 255)
				gradientText = gradientText .. string.format("<font color='rgb(%d,%d,%d)'>%s</font>", r, g, b, string.sub(originalTextWithoutKey, i, i))
			end
			label.Text = gradientText
		end
	end)
end

return PrintLib
