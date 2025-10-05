local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()
local Window = Rayfield:CreateWindow({
   Name = "Crystal Launcher",
   Icon = "archive-restore", -- Icon in Topbar. Can use Lucide Icons (string) or Roblox Image (number). 0 to use no icon (default).
   LoadingTitle = "Crystal - Storage",
   LoadingSubtitle = "by Sun and First",
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

local info = Window:CreateTab("Info and Credits", "info") -- Title, Image
local universal = Window:CreateTab("Crystal | Universal", "radar") -- Title, Image
local RC = Window:CreateTab("Crystal | Tornado games!", "moon-star") -- Title, Image

local thanks = info:CreateLabel("Thank you for using this script!", "check")
local credit = info:CreateParagraph({Title = "Credits", Content = "First - UI and functionality | Sun - Backend scripter"})

local Dropdown = RC:CreateDropdown({
   Name = "Crystal | Radar chasers",
   Options = {"V1","V1.12","V1.3","V2"},
   CurrentOption = {""},
   MultipleOptions = false,
   Flag = "RCdrop", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
   Callback = function(Options)
     if Options[1] == "V1" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/catbelowakeyboard/Crystalrblx/refs/heads/main/CrystalV.1.lua"))()
     elseif Options[1] == "V1.12" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/catbelowakeyboard/Crystalrblx/refs/heads/main/CrystalV1.12%20-%20MINOR%20FIX%20AGAIN.lua"))()
     elseif Options[1] == "V1.3" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/catbelowakeyboard/Crystalrblx/refs/heads/main/CrystalV1.3.lua"))()
      else
        loadstring(game:HttpGet("https://raw.githubusercontent.com/catbelowakeyboard/Crystalrblx/refs/heads/main/CrystalV2%20-%20Customization.lua"))()
         end
   end,
})

local Button = universal:CreateButton({
   Name = "Load infinite yeild",
   Callback = function()
   loadstring(game:HttpGet('https://raw.githubusercontent.com/DarkNetworks/Infinite-Yield/main/latest.lua'))()
   end,
})
