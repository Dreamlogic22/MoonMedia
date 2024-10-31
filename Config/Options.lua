---@type string, MoonMedia
local Name, T = ...

local ShowPopup = false

StaticPopupDialogs["MOON_CONFIG_RL"] = {
	text = "One or more of the changes you have made require you to reload your user interface.",
	button1 = ACCEPT,
	button2 = CANCEL,
	OnAccept = ReloadUI,
	whileDead = 1,
	hideOnEscape = false
}

---@class Options
T.Options = {
    name = C_AddOns.GetAddOnMetadata(Name, "Title"),
    type = "group",
    args = {
        sets = {
            inline = true,
            name = "Sound Sets",
            type = "group",
            order = 0,
            get = function(info) return T.db.sets[info[#info]] end,
            set = function(info, value) T.db.sets[info[#info]] = value; ShowPopup = true end,
            args = {
                red = {
                    desc = "Sounds customized by Red.",
                    name = "Red",
                    order = 0,
                    type = "toggle"
                },
                mario = {
                    desc = "Sounds from Super Mario Brothers.",
                    name = "Super Mario",
                    order = 1,
                    type = "toggle"
                }
            }
        }
    }
}

hooksecurefunc(SettingsPanel, "Close", function()
    if ShowPopup then
        StaticPopup_Show("MOON_CONFIG_RL")
        ShowPopup = false
    end
end)