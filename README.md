# ColoredPrintsLib

## A Library that allows you output colored Prints (Like luarmor loading api)

# How to REQUIRE() ?
```lua
local PLib = loadstring(game:HttpGet("https://raw.githubusercontent.com/Underssky/ColoredPrintsLib/refs/heads/main/ColorPLibrary.luau"))()
```

### ExampleOfPrints (So ai killed smooth switching colors i will fix it tomorrow)
```lua
local libraryCode = game:HttpGet("https://raw.githubusercontent.com/Underssky/ColoredPrintsLib/refs/heads/main/ColorPLibrary.luau")
local PLib = loadstring(libraryCode)()

PLib.CPrint("Hi! I am a Colored Text!", Color3.fromRGB(55, 255, 0))
PLib.RPrint("Hey!! I am a Rainbow Text!", 0.5)
PLib.SPrint("Look at this Smooth Switching Colors!", 1, Color3.fromRGB(255, 0, 0), Color3.fromRGB(0, 255, 0), Color3.fromRGB(0, 0, 255))
PLib.SIPrint("And Instant Switching Colors!", 0.5, Color3.fromRGB(255, 255, 0), Color3.fromRGB(0, 255, 255), Color3.fromRGB(255, 0, 255))
PLib.GPrint("Moving Gradient Text!!!", 0.5, Color3.fromRGB(255, 0, 0), Color3.fromRGB(0, 255, 0), Color3.fromRGB(0, 0, 255))
PLib.GSPrint("Static Gradient Text!!!!!!!!!", 0, Color3.fromRGB(0, 255, 255), Color3.fromRGB(255, 0, 255))
```


# How to USE?

- Colored print
```lua
PLib.CPrint(string, color)
```

- Rainbow print (rainbow speed)
```lua
PLib.RPrint(string, speed)
```

- Tween Color Switch 
```lua
PLib.SPrint(string, speed, color1 - ∞)
```

- Instant Color Switch 
```lua
PLib.SIPrint(string, speed, color1 - ∞)
```

-  Tween Gradient
```lua
PLib.GPrint(string, speed, col1 - ∞)
```

- Static Gradient
```lua
PLib.GSPrint(string, 0, col1 - ∞)
```
