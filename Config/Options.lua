---@type string, MoonMedia
local Name, T = ...

local ShowPopup = false

StaticPopupDialogs[MOON_CONFIG_RL] = {
	text = "One or more of the changes you have made require you to reload your user interface.",
	button1 = ACCEPT,
	button2 = CANCEL,
	OnAccept = C_UI.Reload(),
	whileDead = 1,
	hideOnEscape = false
}

-- StaticPopup_Show("MOON_CONFIG_RL")

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
                loud = {
                    desc = "Include sounds from Super Mario Brothers.  This may or may not cause brain damage.",
                    name = "Loud",
                    order = 0,
                    type = "toggle"
                },
                subtle = {
                    desc = "Include sounds guaranteed not to melt your brain.",
                    name = "Subtle",
                    order = 1,
                    type = "toggle"
                }
            }
        }
    }
}