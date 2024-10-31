---@type string, MoonMedia
local Name, T = ...
local LSM = LibStub("LibSharedMedia-3.0")

local Path = [[Interface\AddOns\MoonMedia\]]
local Sounds = {
    loud = {
        "smb_bowserfalls.ogg",
        "smb_bowserfire.ogg",
        "smb_breakblock.ogg",
        "smb_bump.ogg",
        "smb_coin.ogg",
        "smb_fireball.ogg",
        "smb_fireworks.ogg",
        "smb_flagpole.ogg",
        "smb_gameover.ogg",
        "smb_jump-small.ogg",
        "smb_jump-super.ogg",
        "smb_kick.ogg",
        "smb_mariodie.ogg",
        "smb_pause.ogg",
        "smb_pipe.ogg",
        "smb_powerup.ogg",
        "smb_powerup_appears.ogg",
        "smb_stage_clear.ogg",
        "smb_stomp.ogg",
        "smb_vine.ogg",
        "smb_warning.ogg",
        "smb_world_clear.ogg"
    },
    subtle = {
        "red-blip.ogg",
        "redalert-soft.ogg",
        "redalert.ogg",
        "redalertdouble.ogg",
        "redalertdoublehigh.ogg",
        "redcelebration.ogg",
        "redchangedown-old.ogg",
        "redchangedown.ogg",
        "redchangeup-old.ogg",
        "redchangeup.ogg",
        "reddropdown.ogg",
        "rederror-soft.ogg",
        "rederror.ogg",
        "rederrordown.ogg",
        "redfadeout-gentle.ogg",
        "redfadeout-harsh.ogg",
        "redlongalert.ogg",
        "redrefresh.ogg",
        "redring.ogg",
        "redrise.ogg"
    }
}

local function LoadMedia()
    for category in next, Sounds do
        if T.db.sets[category] then
            print(category)
        end
    end

    -- local path = Path[Type]
	-- if path then
	-- 	local key = File:gsub('%.%w-$','')
	-- 	local file = path .. File

	-- 	local pathKey = MediaKey[Type]
	-- 	if pathKey then E.Media[pathKey][key] = file end

	-- 	if Name then -- Register to LSM
	-- 		local nameKey = (Name == true and key) or Name
	-- 		if type(CustomType) == 'table' then
	-- 			for _, name in ipairs(CustomType) do
	-- 				LSM:Register(name, nameKey, file, Mask)
	-- 			end
	-- 		else
	-- 			LSM:Register(CustomType or Type, nameKey, file, Mask)
	-- 		end
	-- 	end
	-- end
end

local function LoadDatabase()
    if not MoonMediaDB then
        MoonMediaDB = {}
    end

    for key, value in pairs(T.Defaults) do
        if MoonMediaDB[key] == nil then
            MoonMediaDB[key] = value
        end
    end

    if not MoonMediaDB.version or MoonMediaDB.version ~= T.Version then
        MoonMediaDB.version = T.Version
    end

    T.db = MoonMediaDB

    T.Defaults = nil
end

local function Enable()
    LoadDatabase()
    LoadMedia()

    LibStub("AceConfig-3.0"):RegisterOptionsTable(Name, T.Options)
    LibStub("AceConfigDialog-3.0"):AddToBlizOptions(Name, Name)
end

EventUtil.ContinueOnAddOnLoaded(Name, Enable)