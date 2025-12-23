# ColoredPrintsLib

## A Library that allows you output colored Prints (Like luarmor loading api)

# How to REQUIRE() ?
```lua
local PrintLibCode = game:HttpGet("https://raw.githubusercontent.com/Underssky/ColoredPrintsLib/refs/heads/main/ColorPrintLibrary.luau")
local PrintLib = loadstring(PrintLibCode)()
```

### ExampleOfPrints
```lua
local libraryCode = game:HttpGet("https://raw.githubusercontent.com/Underssky/ColoredPrintsLib/refs/heads/main/ColorPrintLibrary.luau")
local PrintLib = loadstring(libraryCode)()

PrintLib.CPrint("Hi! I am a Colored Text!", Color3.fromRGB(55, 255, 0))
PrintLib.RPrint("Hey!! I am a Rainbow Text!", 0.5)
PrintLib.SPrint("Look at this Smooth Switching Colors!", 1, Color3.fromRGB(255, 0, 0), Color3.fromRGB(0, 255, 0), Color3.fromRGB(0, 0, 255))
PrintLib.SIPrint("And Instant Switching Colors!", 0.5, Color3.fromRGB(255, 255, 0), Color3.fromRGB(0, 255, 255), Color3.fromRGB(255, 0, 255))
PrintLib.GPrint("Moving Gradient Text!!!", 0.5, Color3.fromRGB(255, 0, 0), Color3.fromRGB(0, 255, 0), Color3.fromRGB(0, 0, 255))
PrintLib.GSPrint("Static Gradient Text!!!!!!!!!", 0, Color3.fromRGB(0, 255, 255), Color3.fromRGB(255, 0, 255))
```


# How to USE?

- Colored print
```lua
PrintLib.CPrint(string, color)
```

- Rainbow print (rainbow speed)
```lua
PrintLib.RPrint(string, speed)
```

- Tween Color Switch 
```lua
PrintLib.SPrint(string, speed, color1 - ∞)
```

- Instant Color Switch 
```lua
PrintLib.SIPrint(string, speed, color1 - ∞)
```

-  Tween Gradient
```lua
PrintLib.GPrint(string, speed, col1 - ∞)
```

- Static Gradient
```lua
PrintLib.GSPrint(string, 0, col1 - ∞)
```
