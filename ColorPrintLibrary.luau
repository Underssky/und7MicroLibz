<think>
Сначала пользователь говорит: "во первых, тепреь игра крашится если использовать слишком много принтов различных, во вторых, раскраска принтов пропадает при закрытии консоли, а этого не должно быть"


## Addressing User Concerns  
- The user mentioned the game crashes when using too many print statements.  
- They also noted that print color formatting is lost when closing the console, which shouldn't happen.

## Addressing User Concerns  
- The game crashes due to excessive use of various print statements, creating too many tasks.  
- Print color formatting is lost upon closing the console, despite logs being saved, because the Label is destroyed.  
- Previous code changes added infinite while loops in print functions to maintain effects, but this likely causes crashes with many prints.  
- When the console closes, DevConsoleMaster is recreated, losing applied effects since the Label no longer exists.  
- To fix, consider preserving effects across console sessions without overloading with infinite loops.  

## Exploring Potential Fixes  
- Reducing print frequency or optimizing print tasks could prevent crashes from excessive spawns.  
- Saving and reapplying color effects when recreating DevConsoleMaster might maintain formatting consistency.

## Exploring Potential Fixes  
- Consider using CoreGui.ChildAdded event to detect DevConsoleMaster recreation and reapply effects, requiring storage of effect data.  
- For animated effects like rainbow, using Tween with infinite loops could work, but implementing for HSV colors is challenging.  
- To prevent crashes, explore replacing multiple infinite loops with a single global cycle or RunService.Heartbeat for updates, though this adds complexity.  
- Simplify by applying effects only when the console is open, but this contradicts the user's desire for persistent effects.  
- For non-animated prints, avoid infinite loops to reduce task overhead, focusing optimization on RPrint and SPrint with cycles.

## Exploring Potential Fixes
- For SPrint, already using Tween with -1 repeats to manage effects efficiently.
- For RPrint, consider using Tween on Hue, though TextColor3 manipulation adds complexity.

## Optimizing Performance
- To prevent crashes, limit active effects or check for existing effects by UniqueId before starting new ones, keeping code simple.
- Crashes likely occur with many prints due to numerous task.spawn calls, each with while true loops and frequent task.wait(0.1), creating significant overhead.

## Exploring Performance Fixes  
- To prevent crashes, consider removing task.spawn for each effect, using a single manager instead, though this would significantly alter the code.  
- For non-cyclic prints like CPrint and GSPrint, no changes needed since they lack loops, but for others, cycles are necessary.  

## Simplifying Effect Management  
- For animated effects, replacing while loops with Tween on TextColor3 could work, but handling HSV colors for rainbow effects adds complexity.  
- Instead of direct HSV support, create a sequence of colors and use Tween between them, though this increases implementation difficulty.  

## Optimizing Update Frequency  
- To reduce overhead, adjust task.wait(0.1) in loops to task.wait(1) when Label isn’t found, minimizing frequent checks.  
- Consider adding a counter for active effects and setting a limit to prevent crashes, while keeping code as simple functions.

## Integrating Global Updates  
- Consider using RunService.Heartbeat to manage all active effects in a single cycle, reducing thread overhead.  
- Create a local ActiveEffects table to store effect details, like UniqueId and Type, updating each in the Heartbeat loop.  

## Managing Active Effects  
- For static prints like CPrint and GSPrint, no changes needed as they lack cycles; focus optimization on dynamic effects.
</think>```lua
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
				local Dt = task.wait()
				Hue = (Hue + Speed * Dt) % 1
				local Color = Color3.fromHSV(Hue, 1, 1)
				local R = math.floor(Color.R * 255)
				local G = math.floor(Color.G * 255)
				local B = math.floor(Color.B * 255)
				Label.Text = string.format("<font color='rgb(%d,%d,%d)'>%s</font>", R, G, B, OriginalTextWithoutKey)
			else
				Label = nil
				task.wait(1)
			end
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
				task.wait(1)
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
				task.wait(1)
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
				local Dt = task.wait()
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
				task.wait(1)
			end
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
```
