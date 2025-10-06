userautobuy = ""

local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()
local Window = Rayfield:CreateWindow({
   Name = "Crystal | Cookie Clicker: Premium",
   Icon = 0, -- Icon in Topbar. Can use Lucide Icons (string) or Roblox Image (number). 0 to use no icon (default).
   LoadingTitle = "CCS",
   LoadingSubtitle = "By Crystal Development Team",
   ShowText = "ilovecrystal", -- for mobile users to unhide rayfield, change if you'd like
   Theme = "AmberGlow", -- Check https://docs.sirius.menu/rayfield/configuration/themes

   ToggleUIKeybind = "K", -- The keybind to toggle the UI visibility (string like "K" or Enum.KeyCode)

   DisableRayfieldPrompts = false,
   DisableBuildWarnings = false, -- Prevents Rayfield from warning when the script has a version mismatch with the interface

   ConfigurationSaving = {
      Enabled = true,
      FolderName = nil, -- Create a custom folder for your hub/game
      FileName = "Big Hub"
   },

   Discord = {
      Enabled = false, -- Prompt the user to join your Discord server if their executor supports it
      Invite = "noinvitelink", -- The Discord invite code, do not include discord.gg/. E.g. discord.gg/ ABCD would be ABCD
      RememberJoins = true -- Set this to false to make them join the discord every time they load it up
   },

   KeySystem = true, -- Set this to true to use our key system
   KeySettings = {
      Title = "Paid Cookie Clicker Key-System",
      Subtitle = "By CDT",
      Note = "Enter your premium key, or buy one.", -- Use this to tell the user how to get a key
      FileName = "CDTkeysys", -- It is recommended to use something unique as other scripts using Rayfield may overwrite your key file
      SaveKey = false, -- The user's key will be saved, but if you change the key, they will be unable to use your script
      GrabKeyFromSite = false, -- If this is true, set Key below to the RAW site you would like Rayfield to get the key from
      Key = {"CDT.irt"} -- List of keys that will be accepted by the system, can be RAW file links (pastebin, github etc) or simple strings ("hello","key22")
   }
})
Rayfield:Notify({
   Title = "Thanks for using premium!",
   Content = "We appriciate you buying premium! (buying via dming)",
   Duration = 6.5,
   Image = "crown",
})


local auto = Window:CreateTab("CCookie | Automatic", "table-cells-split") -- Title, Image
local settings = Window:CreateTab("CCookie | Settings", "settings") -- Title, Image
local customize = Window:CreateTab("CCookie | customize", "paintbrush") -- Title, Image-- Title, Image

local Dropdown = customize:CreateDropdown({
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

local ac = auto:CreateSection("Clicking")
local autoclicktogg = auto:CreateToggle({
   Name = "Auto Click",
   CurrentValue = false,
   Flag = "autoclick", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
   Callback = function(Value)
   while Value do
        game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("Cookie"):FireServer()
        wait(0.05)
    end
   end,
})
local customautoclick = auto:CreateInput({
   Name = "CUstom autoclick value",
   CurrentValue = "",
   PlaceholderText = "How much time you want to click",
   RemoveTextAfterFocusLost = true,
   Flag = "cac",
   Callback = function(Text)
   for i = 1, Text do
          game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("Cookie"):FireServer()
    end
   end,
})
local ab = auto:CreateSection("Auto buying")
local autobuy = auto:CreateDropdown({
   Name = "Buying:",
   Options = {"Clicker","Grandma"},
   CurrentOption = {""},
   MultipleOptions = false,
   Flag = "autobuy dropdown", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
   Callback = function(Options)
   userautobuy = Options[1]
   print(userautobuy)
   end,
})
local Toggle = auto:CreateToggle({
   Name = "Start Buying",
   CurrentValue = false,
   Flag = "startbuy", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
   Callback = function(Value)
   if userautobuy == "Clicker" then
       while Value do
           local args = {
	"Cursor",
	5,
	true
}
game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("BuyBuilding"):FireServer(unpack(args))
wait(0.01)
				end
				elseif userautobuy == "Grandma" then
					while Value do
						local args = {
		"Grandma",
		5,
		true
	}
	game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("BuyBuilding"):FireServer(unpack(args))
	wait(0.01)

       end
end
   end,
})
