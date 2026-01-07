# ColoredPrintsLib

## A Library that allows you output colored Prints (Like luarmor loading api)

# How to REQUIRE() ?
```lua
local PLib = loadstring(game:HttpGet("https://raw.githubusercontent.com/Underssky/und7MicroLibz/refs/heads/main/ColorPLibrary.luau"))()
```

### ExampleOfPrints (So ai killed smooth switching colors i will probaly fix ittttt)
```lua
local libraryCode = game:HttpGet("https://raw.githubusercontent.com/Underssky/und7MicroLibz/refs/heads/main/ColorPLibrary.luau")
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


# ⅢⅢⅢⅢⅢⅢⅢⅢⅢⅢⅢⅢⅢⅢⅢⅢ


# Base64Tables

## so, its can obf\deobf string to base64 & obf\deobf STRINGET table to base64

# How to REQUIRE() ?
```lua
local Base64lib = loadstring(game:HttpGet("https://raw.githubusercontent.com/Underssky/und7MicroLibz/refs/heads/main/Base64Tables.luau"))()
```

### Examplez
```lua
local Base64lib = loadstring(game:HttpGet("https://raw.githubusercontent.com/Underssky/und7MicroLibz/refs/heads/main/Base64Tables.luau"))()

Base64lib.encode(data) --string

Base64lib.decode(data) --string

Base64.StringTable(t, indent) -table, nil

Base64.ObfTable(n, t) --How many times you ofbuscating, Your Obfuscated String, table
Base64.DeObfTable(n, t) --How many times you ofbuscating, Your Obfuscated String, table
```
