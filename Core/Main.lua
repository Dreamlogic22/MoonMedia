---@type string, MoonMedia
local Name, T = ...
local LSM = LibStub("LibSharedMedia-3.0")

local function LoadMedia()
    local ListPrefix = "|TInterface\\AddOns\\MoonMedia\\Logo.tga:16:16:0:0:50:50:4:46:4:46|t"
    local Path = [[Interface\AddOns\MoonMedia\]]

    for setName in next, T.Sounds do
        if T.db.sets[setName] then
            for _, info in ipairs(T.Sounds[setName]) do
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