local PrintLib = {}

function PrintLib.CPrint(Text, Color3)
	local UniqueId = string.rep(string.char(math.random(1, 31)), 5)
	local FullText = tostring(Text) .. UniqueId
	print(FullText)
	task.spawn(function()
		local Label = nil
		local CoreGui = game:GetService("CoreGui")
		local Start = tick()
		while not Label and tick() - Start < 2 do
			local Console = CoreGui:FindFirstChild("DevConsoleMaster")
			if Console then
				for _, V in pairs(Console:GetDescendants()) do
					if V:IsA("TextLabel") and string.find(V.Text, UniqueId, 1, true) then
						Label = V
						break
					end
				end
			end
			if not Label then task.wait() end
		end
		if Label then
			Label.RichText = true
			local OriginalTextWithoutKey = string.gsub(Label.Text, UniqueId, "")
			local R = math.floor(Color3.R * 255)
			local G = math.floor(Color3.G * 255)
			local B = math.floor(Color3.B * 255)
			Label.Text = string.format("<font color='rgb(%d,%d,%d)'>%s</font>", R, G, B, OriginalTextWithoutKey)
		end
	end)
end

function PrintLib.RPrint(Text, Speed)
	Speed = Speed or 1
	local UniqueId = string.rep(string.char(math.random(1, 31)), 5)
	local FullText = tostring(Text) .. UniqueId
	print(FullText)
	task.spawn(function()
		local Label = nil
		local CoreGui = game:GetService("CoreGui")
		local OriginalTextWithoutKey = ""
		local Hue = 0
		while true do
			if not Label then
				local Console = CoreGui:FindFirstChild("DevConsoleMaster")
				if Console then
					for _, V in pairs(Console:GetDescendants()) do
						if V:IsA("TextLabel") and string.find(V.Text, UniqueId, 1, true) then
							Label = V
							Label.RichText = true
							OriginalTextWithoutKey = string.gsub(Label.Text, UniqueId, "")
							break
						end
					end
				end
			end
			if Label and Label.Parent then
				Hue = (Hue + Speed * 0.1) % 1
				local Color = Color3.fromHSV(Hue, 1, 1)
				local R = math.floor(Color.R * 255)
				local G = math.floor(Color.G * 255)
				local B = math.floor(Color.B * 255)
				Label.Text = string.format("<font color='rgb(%d,%d,%d)'>%s</font>", R, G, B, OriginalTextWithoutKey)
			else
				Label = nil
			end
			task.wait(0.1)
		end
	end)
end

function PrintLib.SPrint(Text, Speed, ...)
	Speed = Speed or 1
	local Colors = {...}
	if #Colors == 0 then return end
	local UniqueId = string.rep(string.char(math.random(1, 31)), 5)
	local FullText = tostring(Text) .. UniqueId
	print(FullText)
	task.spawn(function()
		local Label = nil
		local CoreGui = game:GetService("CoreGui")
		local OriginalTextWithoutKey = ""
		local ColorIndex = 1
		local TweenService = game:GetService("TweenService")
		local TweenInfo = TweenInfo.new(Speed, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut, -1, true, 0)
		while true do
			if not Label then
				local Console = CoreGui:FindFirstChild("DevConsoleMaster")
				if Console then
					for _, V in pairs(Console:GetDescendants()) do
						if V:IsA("TextLabel") and string.find(V.Text, UniqueId, 1, true) then
							Label = V
							Label.RichText = true
							OriginalTextWithoutKey = string.gsub(Label.Text, UniqueId, "")
							break
						end
					end
				end
			end
			if Label and Label.Parent then
				local NextColorIndex = (ColorIndex % #Colors) + 1
				local TargetColor = Colors[NextColorIndex]
				local Tween = TweenService:Create(Label, TweenInfo, {TextColor3 = TargetColor})
				Tween:Play()
				task.wait(Speed)
				ColorIndex = NextColorIndex
			else
				Label = nil
			end
		end
	end)
end

function PrintLib.SIPrint(Text, Speed, ...)
	Speed = Speed or 1
	local Colors = {...}
	if #Colors == 0 then return end
	local UniqueId = string.rep(string.char(math.random(1, 31)), 5)
	local FullText = tostring(Text) .. UniqueId
	print(FullText)
	task.spawn(function()
		local Label = nil
		local CoreGui = game:GetService("CoreGui")
		local OriginalTextWithoutKey = ""
		local ColorIndex = 1
		while true do
			if not Label then
				local Console = CoreGui:FindFirstChild("DevConsoleMaster")
				if Console then
					for _, V in pairs(Console:GetDescendants()) do
						if V:IsA("TextLabel") and string.find(V.Text, UniqueId, 1, true) then
							Label = V
							Label.RichText = true
							OriginalTextWithoutKey = string.gsub(Label.Text, UniqueId, "")
							break
						end
					end
				end
			end
			if Label and Label.Parent then
				task.wait(Speed)
				local Color3 = Colors[ColorIndex]
				local R = math.floor(Color3.R * 255)
				local G = math.floor(Color3.G * 255)
				local B = math.floor(Color3.B * 255)
				Label.Text = string.format("<font color='rgb(%d,%d,%d)'>%s</font>", R, G, B, OriginalTextWithoutKey)
				ColorIndex = (ColorIndex % #Colors) + 1
			else
				Label = nil
			end
		end
	end)
end

function PrintLib.GPrint(Text, RotationSpeed, ...)
	RotationSpeed = RotationSpeed or 1
	local Colors = {...}
	if #Colors == 0 then return end
	local UniqueId = string.rep(string.char(math.random(1, 31)), 5)
	local FullText = tostring(Text) .. UniqueId
	print(FullText)
	task.spawn(function()
		local Label = nil
		local CoreGui = game:GetService("CoreGui")
		local OriginalTextWithoutKey = ""
		while true do
			if not Label then
				local Console = CoreGui:FindFirstChild("DevConsoleMaster")
				if Console then
					for _, V in pairs(Console:GetDescendants()) do
						if V:IsA("TextLabel") and string.find(V.Text, UniqueId, 1, true) then
							Label = V
							Label.RichText = true
							OriginalTextWithoutKey = string.gsub(Label.Text, UniqueId, "")
							break
						end
					end
				end
			end
			if Label and Label.Parent then
				local GradientText = ""
				local TimeOffset = tick() * RotationSpeed
				for I = 1, utf8.len(OriginalTextWithoutKey) do
					local Progress = (I - 1) / (utf8.len(OriginalTextWithoutKey) - 1)
					local AnimatedProgress = (Progress + TimeOffset) % 1
					local ColorIndex = math.floor(AnimatedProgress * (#Colors - 1)) + 1
					local NextColorIndex = math.min(ColorIndex + 1, #Colors)
					local Blend = (AnimatedProgress * (#Colors - 1)) - (ColorIndex - 1)
					local BlendedColor = Colors[ColorIndex]:Lerp(Colors[NextColorIndex], Blend)
					local R = math.floor(BlendedColor.R * 255)
					local G = math.floor(BlendedColor.G * 255)
					local B = math.floor(BlendedColor.B * 255)
					GradientText = GradientText .. string.format("<font color='rgb(%d,%d,%d)'>%s</font>", R, G, B, utf8.sub(OriginalTextWithoutKey, I, I))
				end
				Label.Text = GradientText
			else
				Label = nil
			end
			task.wait(0.1)
		end
	end)
end

function PrintLib.GSPrint(Text, Rotation, ...)
	local Colors = {...}
	if #Colors == 0 then return end
	local UniqueId = string.rep(string.char(math.random(1, 31)), 5)
	local FullText = tostring(Text) .. UniqueId
	print(FullText)
	task.spawn(function()
		local Label = nil
		local CoreGui = game:GetService("CoreGui")
		local Start = tick()
		while not Label and tick() - Start < 2 do
			local Console = CoreGui:FindFirstChild("DevConsoleMaster")
			if Console then
				for _, V in pairs(Console:GetDescendants()) do
					if V:IsA("TextLabel") and string.find(V.Text, UniqueId, 1, true) then
						Label = V
						break
					end
				end
			end
			if not Label then task.wait() end
		end
		if Label then
			Label.RichText = true
			local OriginalTextWithoutKey = string.gsub(Label.Text, UniqueId, "")
			local GradientText = ""
			for I = 1, utf8.len(OriginalTextWithoutKey) do
				local Progress = (utf8.len(OriginalTextWithoutKey) > 1) and (I - 1) / (utf8.len(OriginalTextWithoutKey) - 1) or 0
				local ColorIndex = math.floor(Progress * (#Colors - 1)) + 1
				local NextColorIndex = math.min(ColorIndex + 1, #Colors)
				local Blend = (Progress * (#Colors - 1)) - (ColorIndex - 1)
				local BlendedColor = Colors[ColorIndex]:Lerp(Colors[NextColorIndex], Blend)
				local R = math.floor(BlendedColor.R * 255)
				local G = math.floor(BlendedColor.G * 255)
				local B = math.floor(BlendedColor.B * 255)
				GradientText = GradientText .. string.format("<font color='rgb(%d,%d,%d)'>%s</font>", R, G, B, utf8.sub(OriginalTextWithoutKey, I, I))
			end
			Label.Text = GradientText
		end
	end)
end

return PrintLib
