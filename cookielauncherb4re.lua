local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()
local Window = Rayfield:CreateWindow({
   Name = "Cookie Clicker | Choose your directory",
   Icon = "cookie", -- Icon in Topbar. Can use Lucide Icons (string) or Roblox Image (number). 0 to use no icon (default).
   LoadingTitle = "Cookie Clicker!",
   LoadingSubtitle = "by Crystal Dev Team",
   ShowText = "choose the version damnit", -- for mobile users to unhide rayfield, change if you'd like
   Theme = "AmberGlow", -- Check https://docs.sirius.menu/rayfield/configuration/themes

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

local info = Window:CreateTab("Crystal | Info", "pencil") -- Title, Image
local versions = Window:CreateTab("Crystal | Versions", "layers") -- Title, Image-- Title, Image
local credit = info:CreateLabel("Credits to the Crystal Dev team!", "rewind")
local updlog = info:CreateParagraph({Title = "Update 1", Content = "-Functionalities added, UI rework?"})
local upcoming = info:CreateParagraph({Title = "Next Update", Content = "-More functionalities, Add misc and custom theme"})
local instruction = versions:CreateLabel("Select your premium/normal versions in the dropdown below!", "info")

local Dropdown = versions:CreateDropdown({
   Name = "Versions :",
   Options = {"Free","Paid"},
   CurrentOption = {""},
   MultipleOptions = false,
   Flag = "Dropdown1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
   Callback = function(Options)
   if Options[1] == "Free" then
       Rayfield:Notify({
   Title = "Version Not Finished (err: 738)",
   Content = "Seems like this version isnt finished yet...",
   Duration = 10,
   Image = "message-circle-warning",
})
    else
        Rayfield:Notify({
   Title = "Version Not Finished (err: 738)",
   Content = "Seems like this version isnt finished yet...",
   Duration = 10,
   Image = "message-circle-warning",
})
    end
   end,
})