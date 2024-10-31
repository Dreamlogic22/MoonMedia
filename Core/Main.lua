---@type string, MoonMedia
local Name, T = ...
local LSM = LibStub("LibSharedMedia-3.0")

local function LoadMedia()
    local ListPrefix = "|cff33ff99M|r "
    local Path = [[Interface\AddOns\MoonMedia\]]

    for name, list in pairs(T.Sounds) do
        if T.db.sets[name] then
            for _, info in ipairs(list) do
                LSM:Register("sound", ListPrefix .. info.key, Path .. info.file)
            end
        end
    end

    T.Sounds = nil
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