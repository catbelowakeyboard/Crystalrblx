local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()
local Window = Rayfield:CreateWindow({
   Name = "Crystal | radar chasers",
   Icon = 0, -- Icon in Topbar. Can use Lucide Icons (string) or Roblox Image (number). 0 to use no icon (default).
   LoadingTitle = "Crystal Developer C",
   LoadingSubtitle = "By Sun and First",
   ShowText = "CDC", -- for mobile users to unhide rayfield, change if you'd like
   Theme = "Ocean", -- Check https://docs.sirius.menu/rayfield/configuration/themes

   ToggleUIKeybind = "K", -- The keybind to toggle the UI visibility (string like "K" or Enum.KeyCode)

   DisableRayfieldPrompts = false,
   DisableBuildWarnings = false, -- Prevents Rayfield from warning when the script has a version mismatch with the interface

   ConfigurationSaving = {
      Enabled = false,
      FolderName = nil, -- Create a custom folder for your hub/game
      FileName = "Big Hub"
   },

   Discord = {
      Enabled = false, -- Prompt the user to join your Discord server if their executor supports it
      Invite = "noinvitelink", -- The Discord invite code, do not include discord.gg/. E.g. discord.gg/ ABCD would be ABCD
      RememberJoins = true -- Set this to false to make them join the discord every time they load it up
   },

   KeySystem = false, -- Set this to true to use our key system
   KeySettings = {
      Title = "Untitled",
      Subtitle = "Key System",
      Note = "No method of obtaining the key is provided", -- Use this to tell the user how to get a key
      FileName = "Key", -- It is recommended to use something unique as other scripts using Rayfield may overwrite your key file
      SaveKey = true, -- The user's key will be saved, but if you change the key, they will be unable to use your script
      GrabKeyFromSite = false, -- If this is true, set Key below to the RAW site you would like Rayfield to get the key from
      Key = {"Hello"} -- List of keys that will be accepted by the system, can be RAW file links (pastebin, github etc) or simple strings ("hello","key22")
   }
})

local maptime = Window:CreateTab("Time", "clock") -- Title, Image
local map = Window:CreateTab("Map", "globe") -- Title, Image
local thermo = Window:CreateTab("Thermo", "thermometer-sun") -- Title, Image
local storm = Window:CreateTab("Storm", "cloud") -- Title, Image
local theme = Window:CreateTab("Themes", "paintbrush") -- Title, Image

local Button = storm:CreateButton({
   Name = "Spawn a storm",
   Callback = function()
   game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("SpawnStorm"):FireServer()
   end,
})
local Button = storm:CreateButton({
   Name = "Clear all storms",
   Callback = function()
   game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("ClearStorms"):FireServer()
   end,
})

local Button = thermo:CreateButton({
   Name = "Reroll thermostats",
   Callback = function()
   game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("Reroll"):FireServer()
   end,
})
local Input = thermo:CreateInput({
   Name = "Change Cape",
   CurrentValue = "",
   PlaceholderText = "Cape...",
   RemoveTextAfterFocusLost = true,
   Flag = "changecape",
   Callback = function(Text)
   local args = {
	Text
}
game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("CapeChange"):FireServer(unpack(args))

   end,
})
local Input = thermo:CreateInput({
   Name = "Change Shear",
   CurrentValue = "",
   PlaceholderText = "Shear...",
   RemoveTextAfterFocusLost = true,
   Flag = "changeshear",
   Callback = function(Text)
   local args = {
	Text
}
game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("ShearChange"):FireServer(unpack(args))

   end,
})
local Input = thermo:CreateInput({
   Name = "Change LapseRate",
   CurrentValue = "",
   PlaceholderText = "Lapse...",
   RemoveTextAfterFocusLost = true,
   Flag = "changelapse",
   Callback = function(Text)
   local args = {
	Text
}
game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("LapseChange"):FireServer(unpack(args))

   end,
})
local Input = thermo:CreateInput({
   Name = "Change Dew",
   CurrentValue = "",
   PlaceholderText = "Dew...",
   RemoveTextAfterFocusLost = true,
   Flag = "changedew",
   Callback = function(Text)
   local args = {
	Text
}
game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("LapseChange"):FireServer(unpack(args))

   end,
})
local Input = thermo:CreateInput({
   Name = "Humidity",
   CurrentValue = "",
   PlaceholderText = "Humidity...",
   RemoveTextAfterFocusLost = true,
   Flag = "changehumidity",
   Callback = function(Text)
   local args = {
	Text
}
game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("HumidityChange"):FireServer(unpack(args))

   end,
})

local Slider = maptime:CreateSlider({
   Name = "Time",
   Range = {1, 24},
   Increment = 1,
   Suffix = "PM/AM",
   CurrentValue = 12,
   Flag = "changetime", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
   Callback = function(Value)
   local args = {
	Value
}
game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("ChangeTime"):FireServer(unpack(args))

   end,
})
local Button = maptime:CreateButton({
   Name = "Disable/Enable DNC",
   Callback = function()
   game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("DisableDNC"):FireServer()
   end,
})

local Button = map:CreateButton({
   Name = "Reset Map",
   Callback = function()
   game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("ResetMap"):FireServer()
   end,
})
local Dropdown = theme:CreateDropdown({
   Name = "Themes",
   Options = {"Amber Glow","Amethyst","Ocean","More themes SOON!"},
   CurrentOption = {""},
   MultipleOptions = false,
   Flag = "themedrop", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
   Callback = function(Options)
    if Options[1] == "Amber Glow" then
        Window.ModifyTheme('AmberGlow')
    elseif Options[1] == "Amethyst" then
        Window.ModifyTheme('Amethyst')
    else
        Window.ModifyTheme('Ocean')
    end
   end,
})