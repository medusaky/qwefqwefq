
-- Load necessary libraries
local Fluent = loadstring(game:HttpGet("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"))()

-- Create Fluent window
local Window = Fluent:CreateWindow({
    Title = "Nami Hub | KEY SYSTEM",
    SubTitle = "With Love Nami ❤️",
    TabWidth = 30,
    Size = UDim2.fromOffset(370, 300),  -- Adjusted size
    Acrylic = false,
    Theme = "Darker",
    MinimizeKey = Enum.KeyCode.LeftControl
})

-- Create Tabs
local Tabs = {
    Infor = Window:AddTab({ 
        Title = "", 
        Icon = "rbxassetid://18399656207" 
    }),
}
Window:SelectTab(1)

-- Load key system
local Identifier = 'dkhub'
local SavedKeyPath = "NamiHub_SavedKey.txt" -- Updated path to avoid directory issues
local KeyLibrary = loadstring(game:HttpGet('https://raw.githubusercontent.com/MaGiXxScripter0/keysystemv2api/master/setup_obf.lua'))()
local KeySystem = KeyLibrary.new(Identifier)
local AuthType = "clientid"
local function loadMainScript()
    loadstring(game:HttpGet('https://raw.githubusercontent.com/dkhub27/Script/main/Script'))()
end

local function destroyUI()
    local success, errorMsg = pcall(function()
        Window:Destroy()
    end)
    if not success then
        warn("Failed to destroy UI: " .. errorMsg)
    end
end

local function saveKey(key)
    if writefile then
        local success, errorMsg = pcall(function()
            writefile(SavedKeyPath, key)
        end)
        if not success then
            warn("Failed to save key: " .. errorMsg)
        else
            print("Key saved successfully!")
        end
    else
        warn("writefile function not available!")
    end
end

local function loadKey()
    if readfile then
        local success, key = pcall(function()
            return readfile(SavedKeyPath)
        end)
        if success then
            return key
        elseif key:match("File not found") then
            -- If the file is not found, don't warn about it
            return nil
        else
            warn("Failed to load key: " .. key)
        end
    else
        warn("readfile function not available!")
    end
    return nil
end

local function keyNoti()
    Fluent:Notify({
        Title = "Correct Key",
        Content = "Access granted",
        Duration = 5
    })
end

local function noKeyNoti()
    Fluent:Notify({
        Title = "Incorrect Key",
        Content = "No access granted, incorrect key",
        Duration = 5
    })
end

-- Gera um nome aleatório começando com "dknami"
local function generateRandomName(prefix, length)
    local characters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
    local randomName = prefix
    for i = 1, length - #prefix do
        local randomIndex = math.random(1, #characters)
        randomName = randomName .. string.sub(characters, randomIndex, randomIndex)
    end
    return randomName
end

-- Cria uma parte com um nome que começa com "dknami"
local function createPartWithRandomName(parent)
    local part = Instance.new("Part")
    part.Name = generateRandomName("dknami", 255)
    part.Size = Vector3.new(4, 1, 2)
    part.Position = Vector3.new(math.random(-100, 100), math.random(1, 50), math.random(-100, 100))
    part.Anchored = true
    part.Parent = parent
end

-- Cria uma parte com um nome específico
local function createPartWithSpecificName(parent, name)
    local part = Instance.new("Part")
    part.Name = name
    part.Size = Vector3.new(4, 1, 2)
    part.Position = Vector3.new(math.random(-100, 100), math.random(1, 50), math.random(-100, 100))
    part.Anchored = true
    part.Parent = parent
end

-- Função para criar múltiplas partes
local function createMultipleParts(countRandom, specificNames)
    local services = {
        game.Workspace, game.Players, game.CoreGui, game.ReplicatedStorage,
        game.Lighting, game.CorePackages, game.ReplicatedFirst, game.StarterPlayer,
        game.TextChatService, game.MarketplaceService, game.StarterGui, game.NetworkClient,
        game.StarterPack, game.Teams, game.MaterialService,
        game.SoundService, game.Chat
    }
    
    -- Criar partes com nomes aleatórios
    for i = 1, countRandom do
        for _, service in ipairs(services) do
            createPartWithRandomName(service)
        end
    end
    
    -- Criar partes com nomes específicos
    for _, specificName in ipairs(specificNames) do
        for _, service in ipairs(services) do
            createPartWithSpecificName(service, specificName)
        end
    end
end

local function isKeyValid(keyInput)
    if keyInput then
        -- Remove espaços em branco no início e no final da chave
        keyInput = string.gsub(keyInput, "^%s*(.-)%s*$", "%1")
        
        local isKeyValid = KeySystem:verifyKey(keyInput)
        if isKeyValid then
            saveKey(keyInput)
            keyNoti()

            -- Create multiple parts upon valid key
            createMultipleParts(100, {
                "dknami6iMIAeC0fQikFByq6qRcAr6BH3gKroOzpoFFKPJoLCfhhwpmrvsgs38d54E7Q1qbbXPBrZgHDhWH78yPbMkTDdxJoEy8zG",
                "dknami58D7cvCUNPTuNt6aNZs10YlNhmxaG6XPFneUSs9zuoWGE88P9HxLmL85R7I2SCc9Mtz9AWoB6dOnvQZA8qr0rl1KPDH5R5",
                "dknamiIz2eW9ezk9WT0jVOXx1OluLuqN8kIMJrfmBOgyHzn0eO33hy3AJ41OEDX1k2zI9tUuVpnxbFBcz26Xl4NbUPLIgldZNlzb",
                "dknamiMM9H2MESXTKxA0YzJY5M39gLgrcyOpPjdR7KFBcfGNVwfKytLgVQdwhIXdPIZClqOVz724DSYAvD4whDnBQh4EjVWc1qaL",
                "dknamiUX4HCmu9agG46T8UGVZbw0yCiH0RxstoXvRbAJt7erupQ5pLGhuWfODzk9CRmsUvvEazWWaIzpo1uE0GFvK5cR55br257b",
                "dknamibIHfGFj8OcZG1kuvY6JEqv2EC73OFJgsd6LHkJlZ5iiiDEQlKAhrduximPUikm4Ls6YJOxGjEtP55O6i9iXK3AIlMmXOko",
                "dknamibIHfGFj8OcZG1kuvY6JEqv2EC73OFJgsd6LHkJlZ5iiiDEQlKAhrduximPUikm4Ls6YJOxGjEtP55O6i9iXK3AIlMmXOk1", 
                "dknamibIHfGFj8OcZG1kuvY6JEqv2EC73OFJgsd6LHkJlZ5iiiDEQlKAhrduximPUikm4Ls6YJOxGjEtP55O6i9iXK3AIlMmXOk2", 
                "dknamibIHfGFj8OcZG1kuvY6JEqv2EC73OFJgsd6LHkJlZ5iiiDEQlKAhrduximPUikm4Ls6YJOxGjEtP55O6i9iXK3AIlMmXOk3", 
                "dknamibIHfGFj8OcZG1kuvY6JEqv2EC73OFJgsd6LHkJlZ5iiiDEQlKAhrduximPUikm4Ls6YJOxGjEtP55O6i9iXK3AIlMmXOk4", 
                "dknamibIHfGFj8OcZG1kuvY6JEqv2EC73OFJgsd6LHkJlZ5iiiDEQlKAhrduximPUikm4Ls6YJOxGjEtP55O6i9iXK3AIlMmXOk5", 
                "dknamibIHfGFj8OcZG1kuvY6JEqv2EC73OFJgsd6LHkJlZ5iiiDEQlKAhrduximPUikm4Ls6YJOxGjEtP55O6i9iXK3AIlMmXOk9", 
                "dknamibIHfGFj8OcZG1kuvY6JEqv2EC73OFJgsd6LHkJlZ5iiiDEQlKA2duximPUikm4Ls6YJOxGjEtP55O6i9iXK3AIlMmXO11", 
                "dknamiluuNd3KiyJcuxUf4FtL9ZdLlcdjzDmnGdCH7bx4cHFg8qdjBzIEoCHJy31DAx5enw77Yo18Sv54HhZSa8tn2VT9BsgAgDG", 
                "dknamiIz2eW9ezk9WT0jVOXx1OluLuqN8kIMJrfmBOgyHzn0eO33hy3AJ41OEDX1k2zI9tUuVpnxbFBcz2DXl4NbUPLIgldZNlzb", 
                "dknamiMM9HGMESXTKxA0YzJY5M39gLgrcyOpPjdR7KFBcfGNVwfKytLgVQdwhIXdPIZClqOVz724DSYAvD4whDnBQh4EjVWc1qaL", 
                "dknamiUX4HCmu9agG46T8UGVZbw0yCiH0RxstoXvRbAJt7erupQ5pLGhuWfODzk9CRmsUvvEazWWaIzpo1uE0GFvK5cR55br257b", 
                "dknamibIHfGFj8OcZG1kuvY6JEqv2EC73OFJgsd6LHkJlZ5iiiDEQlKAhrduximPUikm4Ls6YJOxGjEtP55O6i9iXK3AIlMmXOko", 
                "dknamibIHfGFj8OcZG1kuvY6JEqv2EC73OFJgsd6LHkJlZ5iiiDEQlKAhrduximPUikm4Ls6YJOxGjEtP55O6i9iXK3AIlMmXOk1", 
                "dknamibIHfGFj8OcZG1kuvY6JEqv2EC73OFJgsd6LHkJlZ5iiiDEQlKAhrduximPUikm4Ls6YJOxGjEtP55O6i9iXK3AIlMmXOk2", 
                "dknamibIHfGFj8OcZG1kuvY6JEqv2EC73OFJgsd6LHkJlZ5iiiDEQlKAhrduximPUikm4Ls6YJOxGjEtP55O6i9iXK3AIlMmXOk3", 
                "dknamibIHfGFj8OcZG1kuvY6JEqv2EC73OFJgsd6LHkJlZ5iiiDEQlKAhrduximPUikm4Ls6YJOxGjEtP55O6i9iXK3AIlMmXOk4", 
                "dknamibIHfGFj8OcZG1kuvY6JEqv2EC73OFJgsd6LHkJlZ5iiiDEQlKAhrduximPUikm4Ls6YJOxGjEtP55O6i9iXK3AIlMmXOk5", 
                "dknamibIHfGFj8OcZG1kuvY6JEqv2EC73OFJgsd6LHkJlZ5iiiDEQlKAhrduximPUikm4Ls6YJOxGjEtP55O6i9iXK3AIlMmXOk9", 
                "dknamibIHfGFj8OcZG1kuvY6JEqv2EC73OFJgsd6LHkJlZ5iiiDEQlKAhrduximPUikm4Ls6YJOxGjEtP55O6i9iXK3AIlMmXO11", 
                "dknamiluuNd3KiyJcuxUf4FtL9ZdLlcdjzDmnGdVHAbx4cHFg8qdjBzIEoCHJy31DAx5enw77Yo18Sv54HhZSa8tn2VT9BsgAgDG", 
                "dknamiIz2eW9ezk9WT0jVOXx1OluLuqN8kIMJrfmBOgyHzn0eO33hy3AJ41OEDX1k2zI9tUuVpnxbFBcz2DXl4NbUPLIgldZNlzb", 
                "dknamiMM9HGMESXTKxA0YzJY5M39gLgrcyOpPjdR7KFBcfGNVwfKytLgVQdwhIXdPIZClqOVz724DSYAvD4whDnBQh4EjVWc1qaL", 
                "dknamiUX4HCmu9agG46T8UGVZbw0yCiH0RxstoXvRbAJt7erupQ5pLGhuWfODzk9CRmsUvvEazWWaIzpo1uE0GFvK5cR55br257b", 
                "dknamibIHfGFj8OcZG1kuvY6JEqv2EC73OFJgsd6LHkJlZ5iiiDEQlKAhrduximPUikm4Ls6YJOxGjEtP55O6i9iXK3AIlMmXOko", 
                "dknamibIHfGFj8OcZG1kuvY6JEqv2EC73OFJgsd6LHkJlZ5iiiDEQlKAhrduximPUikm4Ls6YJOxGjEtP55O6i9iXK3AIlMmXOk1", 
                "dknamibIHfGFj8OcZG1kuvY6JEqv2EC73OFJgsd6LHkJlZ5iiiDEQlKAhrduximPUikm4Ls6YJOxGjEtP55O6i9iXK3AIlMmXOk2", 
                "dknamibIHfGFj8OcZG1kuvY6JEqv2EC73OFJgsd6LHkJlZ5iiiDEQlKAhrduximPUikm4Ls6YJOxGjEtP55O6i9iXK3AIlMmXOk3", 
                "dknamibIHfGFj8OcZG1kuvY6JEqv2EC73OFJgsd6LHkJlZ5iiiDEQlKAhrduximPUikm4Ls6YJOxGjEtP55O6i9iXK3AIlMmXOk4", 
                "dknamibIHfGFj8OcZG1kuvY6JEqv2EC73OFJgsd6LHkJlZ5iiiDEQlKAhrduximPUikm4Ls6YJOxGjEtP55O6i9iXK3AIlMmXOk5", 
                "dknamibIHfGFj8OcZG1kuvY6JEqv2EC73OFJgsd6LHkJlZ5iiiDEQlKAhrduximPUikm4Ls6YJOxGjEtP55O6i9iXK3AIlMmXOk9", 
                "dknamibIHfGFj8OcZG1kuvY6JEqv2EC73OFJgsd6LHkJlZ5iiiDEQlKAhrduximPUikm4Ls6YJOxGjEtP55O6i9iXK3AIlMmXO11", 
                "dknamiluuNd3KiyJcuxUf4FtL9ZdLlcdjzDmnGdCH7bx4cHFg8qdjBzIEoCHJy31DAx5enw77Yo18Sv54HhZSa8tn2VT9BsgAgDG", 
                "dknamiIz2eW9ezk9WT0jVOXx1OluLuqN8kIMJrfmBOgyHzn0eO33hy3AJ41OEDX1k2zI9tUuVpnxbFBcz2DXl4NbUPLIgldZNlzb", 
                "dknamiMM9HGMESXTKxA0YzJY5M39gLgrcyOpPjdR7KFBcfGN1wfKytLgVQdwhIXdPIZClqOVz724DSYAvD4whDnBQh4EjVWc1qaL", 
                "dknamiUX4HCmu9agG46T8UGVZbw0yCiH0RxstoXvRbAJt7erupQ5pLGhuWfODzk9CRmsUvvEazWWaIzpo1uE0GFvK5cR55br257b", 
                "dknamibIHfGFj8OcZG1kuvY6JEqv2EC73OFJgsd6LHkJlZ5iiiDEQlKAhrduximPUikm4Ls6YJOxGjEtP55O6i9iXK3AIlMmXOko", 
                "dknamibIHfGFj8OcZG1kuvY6JEqv2EC73OFJgsd6LHkJlZ5iiiDEQlKAhrduximPUikm4Ls6YJOxGjEtP55O6i9iXK3AIlMmXOk1", 
                "dknamibIHfGFj8OcZG1kuvY6JEqv2EC73OFJgsd6LHkJlZ5iiiDEQlKAhrduximPUikm4Ls6YJOxGjEtP55O6i9iXK3AIlMmXOk2", 
                "dknamibIHfGFj8OcZG1kuvY6JEqv2EC73OFJgsd6LHkJlZ5iiiDEQlKAhrduximPUikm4Ls6YJOxGjEtP55O6i9iXK3AIlMmXOk3", 
                "dknamibIHfGFj8OcZG1kuvY6JEqv2EC73OFJgsd6LHkJlZ5iiiDEQlKAhrduximPUikm4Ls6YJOxGjEtP55O6i9iXK3AIlMmXOk4", 
                "dknamibIHfGFj8OcZG1kuvY6JEqv2EC73OFJgsd6LHkJlZ5iiiDEQlKAhrduximPUikm4Ls6YJOxGjEtP55O6i9iXK3AIlMmXOk5", 
                "dknamibIHfGFj8OcZG1kuvY6JEqv2EC73OFJgsd6LHkJlZ5iiiDEQlKAhrduximPUikm4Ls6YJOxGjEtP55O6i9iXK3AIlMmXOk9", 
                "dknamibIHfGFj8OcZG1kuvY6JEqv2EC73OFJgsd6LHkJlZ5iiiDEQlKAhrduximPUikm4Ls6YJOxGjEtP55O6i9iXK3AIlMmXO11", 
                "dknamiluuNd3KiyJcuxUf4FtL9ZdLlcdjzDmnGdCH7bx4cHFg8qdjBzIEoCHJy31DAx5enw77Yo18Sv54HhZSa8tn2VT9BsgAgDG", 
                "dknamiIz2eW9ezk9WT0jVOXx1OluLuqN8kIMJrfmBOgyHzn0eO33hy3AJ41OEDX1k2zI9tUuVpnxbFBcz2DXl4NbUPLIgldZNlzb", 
                "dknamiMM9HGMESXTKxA0YzJY5M39gLgrcyOpPjdR7KFBcfGNVwfKytLgVQdwhIXdPIZClqOVz724DSYAvD4whDnBQh4EjVWc1qaL", 
                "dknamiUX4HCmu9agG46T8UGVZbw0yCiH0RxstoXvRbAJt7erupQ5pLGhuWfODzk9CRmsUvvEazWWaIzpo1uE0GFvK5cR55br257b", 
                "dknamibIHfGFj8OcZG1kuvY6JEqv2EC73OFJgsd6LHkJlZ5iiiDEQlKAhrduximPUikm4Ls6YJOxGjEtP55O6i9iXK3AIlMmXOko", 
                "dknamibIHfGFj8OcZG1kuvY6JEqv2EC73OFJgsd6LHkJlZ5iiiDEQlKAhrduximPUikm4Ls6YJOxGjEtP55O6i9iXK3AIlMmXOk1", 
                "dknamibIHfGFj8OcZG1kuvY6JEqv2EC73OFJgsd6LHkJlZ5iiiDEQlKAhrduximPUikm4Ls6YJOxGjEtP55O6i9iXK3AIlMmXOk2", 
                "dknamibIHfGFj8OcZG1kuvY6JEqv2EC73OFJgsd6LHkJlZ5iiiDEQlKAhrduximPUikm4Ls6YJOxGjEtP55O6i9iXK3AIlMmXOk3", 
                "dknamibIHfGFj8OcZG1kuvY6JEqv2EC73OFJgsd6LHkJlZ5iiiDEQlKAhrdubnmPUikm4Ls6YJOxGjEtP55O6i9iXK3AIlMmXOk4", 
                "dknamibIHfGFj8OcZG1kuvY6JEqv2EC73OFJgsd6LHkJlZ5iiiDEQlKAhrduxaimPUikm4Ls6YJOxGjEtP55O6i9iXK3AIlMmXOk5", 
                "dknamibIHfGFj8OcZG1kuvY6JEqv2EC73OFJgsd6LHkJlZ5iiiDEQlKAhrduxxmPUikm4Ls6YJOxGjEtP55O6i9iXK3AIlMmXOk9", 
                "dknamibIHfGFj8OcZG1kuvY6JEqv2EC73OFJgsd6LHkJlZ5iiiDEQlKAhrduximPUikm4Ls6YJOxGjEtP55O6i9iXK3AIlMmXO11", 
                "dknamiluuNd3KiyJcuxUf4FtL9ZdLlcdjzDmnGdCH7bx4cHFg8qdjBzIEoCHJd31DAx5enw77Yo18Sv54HhZSa8tn2VT9BsgAgDG", 
                "dknamiIz2eW9ezk9WT0jVOXx1OluLuqN8kIMJrfmBOgyHzn0eO33hy3AJ41OEpX1k2zI9tUuVpnxbFBcz2DXl4NbUPLIgldZNlzb", 
                "dknamiMM9HGMESXTKxA0YzJY5M39gLgrcyOpPjdR7KFBcfGNVwfKytLgVQdwhoXdPIZClqOVz724DSYAvD4whDnBQh4EjVWc1qaL", 
                "dknamiUX4HCmu9agG46T8UGVZbw0yCiH0RxstoXvRbAJt7erupQ5pLGhuWfODuk9CRmsUvvEazWWaIzpo1uE0GFvK5cR55br257b", 
                "dknamibIHfGFj8OcZG1kuvY6JEqv2EC73OFJgsd6LHkJlZ5iiiDEQlKAhrduxymPUikm4Ls6YJOxGjEtP55O6i9iXK3AIlMmXOko", 
                "dknamibIHfGFj8OcZG1kuvY6JEqv2EC73OFJgsd6LHkJlZ5iiiDEQlKAhrduxqmPUikm4Ls6YJOxGjEtP55O6i9iXK3AIlMmXOk1", 
                "dknamibIHfGFj8OcZG1kuvY6JEqv2EC73OFJgsd6LHkJlZ5iiiDEQlKAhrduxzmPUikm4Ls6YJOxGjEtP55O6i9iXK3AIlMmXOk2", 
                "dknamibIHfGFj8OcZG1kuvY6JEqv2EC73OFJgsd6LHkJlZ5iiiDEQlKAhrduxxmPUikm4Ls6YJOxGjEtP55O6i9iXK3AIlMmXOk3", 
                "dknamibIHfGFj8OcZG1kuvY6JEqv2EC73OFJgsd6LHkJlZ5iiiDEQlKAhrduxcmPUikm4Ls6YJOxGjEtP55O6i9iXK3AIlMmXOk4", 
                "dknamibIHfGFj8OcZG1kuvY6JEqv2EC73OFJgsd6LHkJlZ5iiiDEQlKAhrduximPUikm4Ls6YJOxGjEtP55O6i9iXK3AIlMmXOk5", 
                "dknamibIHfGFj8OcZG1kuvY6JEqv2EC73OFJgsd6LHkJlZ5iiiDEQlKAhrduximPUikm4Ls6YJOxGjEtP55O6i9iXK3AIlMmXOk9", 
                "dknamibIHfGFj8OcZG1kuvY6JEqv2EC73OFJgsd6LHkJlZ5iiiDEQlKAhrduximPUikm4Ls6YJOxGjEtP55O6i9iXK3AIlMmXO11", 
                "dknamiluuNd3KiyJcuxUf4FtL9ZdLlcdjzDmnGdCH7bx4cHFg8qdjBzIEoCHJy31DAx5enw77Yo18Sv54HhZSa8tn2VT9BsgAgDG", 
                "dknamiIz2eW9ezk9WT0jVOXx1OluLuqN8kIMJrfmBOgyHzn0eO33hy3AJ41OpDX1k2zI9tUuVpnxbFBcz2DXl4NbUPLIgldZNlzb", 
                "dknamiMM9HGMESXTKxA0YzJY5M39gLgrcyOpPjdR7KFBcfGNVwfKytLgVQdwoIXdPIZClqOVz724DSYAvD4whDnBQh4EjVWc1qaL", 
                "dknamiUX4HCmu9agG46T8UGVZbw0yCiH0RxstoXvRbAJt7erupQ5pLGhuWfOuzk9CRmsUvvEazWWaIzpo1uE0GFvK5cR55br257b", 
                "dknamibIHfGFj8OcZG1kuvY6JEqv2EC73OFJgsd6LHkJlZ5iiiDEQlKAhrduyimPUikm4Ls6YJOxGjEtP55O6i9iXK3AIlMmXOko", 
                "dknamibIHfGFj8OcZG1kuvY6JEqv2EC73OFJgsd6LHkJlZ5iiiDEQlKAhrdutimPUikm4Ls6YJOxGjEtP55O6i9iXK3AIlMmXOk1", 
                "dknamibIHfGFj8OcZG1kuvY6JEqv2EC73OFJgsd6LHkJlZ5iiiDEQlKAhrduqimPUikm4Ls6YJOxGjEtP55O6i9iXK3AIlMmXOk2", 
                "dknamibIHfGFj8OcZG1kuvY6JEqv2EC73OFJgsd6LHkJlZ5iiiDEQlKAhrduximPUikm4Ls6YJOxGjEtP55O6i9iXK3AIlMmXOk3", 
                "dknamibIHfGFj8OcZG1kuvY6JEqv2EC73OFJgsd6LHkJlZ5iiiDEQlKAhrduximPUikm4Ls6YJOxGjEtP55O6i9iXK3AIlMmXOk4", 
                "dknamibIHfGFj8OcZG1kuvY6JEqv2EC73OFJgsd6LHkJlZ5iiiDEQlKAhrduximPUikm4Ls6YJOxGjEtP55O6i9iXK3AIlMmXOk5", 
                "dknamibIHfGFj8OcZG1kuvY6JEqv2EC73OFJgsd6LHkJlZ5iiiDEQlKAhrduximPUikm4Ls6YJOxGjEtP55O6i9iXK3AIlMmXOk9", 
                "dknamibIHfGFj8OcZG1kuvY6JEqv2EC73OFJgsd6LHkJlZ5iiiDEQlKAhrduximPUikm4Ls6YJOxGjEtP55O6i9iXK3AIlMmXO11", 
                "dknamiluuNd3KiyJcuxUf4FtL9ZdLlcdjzDmnGdCH7bx4cHFg8qdjBzIEoCHJy31DAx5enw77Yo18Sv54HhZSa8tn2VT9BsgAgDG", 
                "dknamiIz2eW9ezk9WT0jVOXx1OluLuqN8kIMJrfmBOgyHzn0eO33hy3AJ41OEDX1k2zI9tUuVpnxbFBcz2DXl4NbUPLIgldZNlzb", 
                "dknamiMM9HGMESXTKxA0YzJY5M39gLgrcyOpPjdR7KFBcfGNVwfKytLgVQdwhIXdPIZClqOVz724DSYAvD4whDnBQh4EjVWc1qaL", 
                "dknamiUX4HCmu9agG46T8UGVZbw0yCiH0RxstoXvRbAJt7erupQ5pLGhuWfODzk9CRmsUvvEazWWaIzpo1uE0GFvK5cR55br257b", 
                "dknamibIHfGFj8OcZG1kuvY6JEqv2EC73OFJgsd6LHkJlZ5iiiDEQlKAhrduximPUikm4Ls6YJOxGjEtP55O6i9iXK3AIlMmXOko", 
                "dknamibIHfGFj8OcZG1kuvY6JEqv2EC73OFJgsd6LHkJlZ5iiiDEQlKAhrduximPUikm4Ls6YJOxGjEtP55O6i9iXK3AIlMmXOk1", 
                "dknamibIHfGFj8OcZG1kuvY6JEqv2EC73OFJgsd6LHkJlZ5iiiDEQlKAhrduximPUikm4Ls6YJOxGjEtP55O6i9iXK3AIlMmXOk2", 
                "dknamibIHfGFj8OcZG1kuvY6JEqv2EC73OFJgsd6LHkJlZ5iiiDEQlKAhrduximPUikm4Ls6YJOxGjEtP55O6i9iXK3AIlMmXOk3", 
                "dknamibIHfGFj8OcZG1kuvY6JEqv2EC73OFJgsd6LHkJlZ5iiiDEQlKAhrduximPUikm4Ls6YJOxGjEtP55O6i9iXK4AIlMmXOk4", 
                "dknamibIHfGFj8OcZG1kuvY6JEqv2EC73OFJgsd6LHkJlZ5iiiDEQlKAhrduximPUikm4Ls6YJOxGjEtP55O6i9iXK3AIlMmXOk5", 
                "dknamibIHfGFj8OcZG1kuvY6JEqv2EC73OFJgsd6LHkJlZ5iiiDEQlKAhrduximPUikm4Ls6YJOxGjEtP55O6i9iXK3AIlMmXOk9", 
                "dknamibIHfGFj8OcZG1kuvY6JEqv2EC73OFJgsd6LHkJlZ5iiiDEQlKAhrduximPUikm4Ls6YJOxGjEtP55O6i9iXK3AIlMmXO11", 
                "dknamiluuNd3KiyJcuxUf4FtL9ZdLlcdj0DmnGdCH7bx4cHFg8qdjBzIEoCHJy31DAx5enw77Yo18Sv54HhZSa8tn2VT9BsgAgDG", 
                "dknamiIz2eW9ezk9WT0jVOXx1OluLuqN8kIMJrfmBOgyHzn0eO33hy3AJ41OEDX1k2zI9tUuVpnxbFBcz2DXl4NbUPLIgldZNlzb", 
                "dknamiMM9HGMESXTKxA0YzJY5M39gLgrcyOpPjdR7KFBcfGNVwfKytLgVQdwhIXdPIZClqOVz724DSYAvD4whDnBQh4EjVWc1qaL", 
                "dknamiUX4HCmu9agG46T8UGVZbw0yCiHRxstoXv2RbAJt7erupQ5pLGhuWfODzk9CRmsUvvEazWWaIzpo1uE0GFvK5cR55br257b", 
                "dknamibIHfGFj8OcZG1kuvY6JEqv2EC73OFJgsd6LHkJlZ5iiiDEQlKAhrduximPUikm4Ls6YJOxGjEtP55O6i9iXK3AIlMmXOko", 
                "dknamibIHfGFj8OcZG1kuvY6JEqv2EC73OFJgsd6LHkJlZ5iiiDEQlKAhrduximPUikm4Ls6YJOxGjEtP55O6i9iXK3AIlMmXOk1", 
                "dknamibIHfGFj8OcZG1kuvY6JEqv2EC73OFJgsd6LHkJlZ5iiiDEQlKAhrduximPUikm4Ls6YJOxGjEtP55O6i9iXK6AIlMmXOk2", 
                "dknamibIHfGFj8OcZG1kuvY6JEqv2EC73OFJgsd6LHkJlZ5iiiDEQlKAhrduximPUikm4Ls6YJOxGjEtP55O6i9iXK3AIlMmXOk3", 
                "dknamibIHfGFj8OcZG1kuvY6JEqv2EC73OFJgsd6LHkJlZ5iiiDEQlKAhrduximPUikm4Ls6YJOxGjEtP55O6i9iXK3AIlMmXOk4", 
                "dknamibIHfGFj8OcZG1kuvY6JEqv2EC73OFJgsd6LHkJlZ5iiiDEQlKAhrduximPUikm4Ls6YJOxGjEtP55O6i9iXK3AIlMmXOk5", 
                "dknamibIHfGFj8OcZG1kuvY6JEqv2EC73OFJgsd6LHkJlZ5iiiDEQlKAhrduximPUikm4Ls6YJOxGjEtP55O6i9iXK3AIlMmXOk9", 
                "dknamibIHfGFj8OcZG1kuvY6JEqv2EC73OFJgsd6LHkJlZ5iiiDEQlKAhrduximPUikm4Ls6YJOxGjEtP55O6i9iXK3AIlMmXO11", 
                "dknamiluuNd3KiyJcuxUf4FtL9ZdLlcdj00DmnGdCH7bx4cHg8qdjBzIEoCHJy31DAx5enw77Yo18Sv54HhZSa8tn2VT9BsgAgDG",
                "dknamiOCnNEK9zpYVqfghKvPjRwLrWjVPLKjdUNgs9Hym9ZZJRAI2CZOAtgdCWmqntRcUmJRbmC94BzFbEfBLs8pPtZtWGBJCpwm",
                "dkhub",
                "dkhub0",
                "dkhub1",
                "dkhub2",
                "dkhub3",
                "dkhub4",
                "dkhub5",
                "dkhub6",
                "dkhub7",
                "dkhub8",
                "dkhub10",
                "dkhub00",
                "dkhub11",
                "dkhub22",
                "dkhub33",
                "dkhub44",
                "dkhub55",
                "dkhub66",
                "dkhub77",
                "dkhub88",
                "dkhub109",
                "dkhub087",
                "dkhub111",
                "dkhub212",
                "dkhub3323",
                "dkhub4345",
                "dkhub5623",
                "dkhub6623",
                "dkhub721562",
                "dkhub81262",
                "dkhub102231",
                "dkhub0123612",
                "dkhub161231",
                "dkhub21236",
                "dkhub3612361",
                "dkhub4126361",
                "dkhub512361",
                "dkhub6123626",
                "dkhub71236123",
                "dkhub812361236",
                "dkhub1012356216",
                "dknami7jQ7Kx0rpb1XE8riPCpItrcLNMO6RpUjMdGM6DvmhMG9igtbgrcLWt6a0p007G5apmoqjD0HWRu9spXfpLlOPacz6Hr8Qn",
                "dknamiAKfbyGaT39Q90qcnERGWicudAUrF0j9gPoYO2Zk1Ly4LzT7wq2H54Vp4eiTZb1htYGDsyPqXBnwqFnWju9yhjcppb0ywFu",
                "dknami7jQ7Kx0rpb1XE8riPCpItrcLNMO6RpUjMdGM6DvmhMG9igtbgrcLWt6a0p007G5apmoqjD0HWRu9spXfpLlOPacz6Hr8Q1",
                "dknami7jQ7Kx0rpb1XE8riPCpItrcLNMO6RpUjMdGM6DvmhMG9igtbgrcLWt6a0p007G5apmoqjD0HWRu9spXfpLlOPacz6Hr8Q2",
                "dknamiAmzgwL1mEFKnpBHZTYyGaHweaZXGeoVswQ0xaAj1se7LgfDeHAlWFmSzrJP9xXu4vBxD8PYXaHy714piTi7sfY2JPTS6kf",
                "dknamiCNnMFT0WwY6SIuGcb9iMPepvs25Jo3MV1yfsHOqrh1rAlsCZ2A0GpgqikNCFSaNzo1KGC6s8prL1QJWODWkmKeHwDdIkGF",
                "!dknamiO8BLmUw4UkrDzUo5mC0PZ6l56ef1CTs71aDTOn8tH2QhqoLUHuwNobWOSX6vzbgBvx56nyKSGkwnI1rdAAYP6jxLUIwwf",
                "dknamiO8BLmUw4UkrDzUo5mC0PZ6l56ef1CTs7n1aDTOn8tH2QhqoLUHudkhubOSX6vzbgBvx56nyKSGkwnI1rdAAYP6jxLUIww?",
                "dknamiaC62LNH8WdajKitBB5EhpOXB14R5bChTxmkHEDkAFite8REQUbdknameBdazxvOCSnUxRN5N96Gu0af4HVwxs2qcBZkWqt",
                "dknamizBdSbcvVXkd4lK9VdPBFP3cI9elkkErRegEw5rpG99Mz0ArAhp0xRL3dkhub1iH7fKUTP56kmYtTr9sGtCrIZVc0Hl1bpx",
                "dknamiyz8jsTyA1pdH1A8IrZlB37Pl8gJmRja5ydKxerHZmYGc8GwUsKfAWLSpMJ58dknamiWIwzTLkPNd5dmQVvvRZSoXHzkaMB",
                "dknamiSda9l8SBuc0wNTzsNvXdgC3hEZ99oTuA8S1qhTimE7X5tYC9i5HRcNamisWeV7S78p79XxjapdoNuvxM5FqRphkQIv1odC",
                "dknamiXxBKmQEAm9g0E45BwOguxAJE33reRWzcgCE5vSNrXLqohirneoyzQOl6h9QXAXbuiMYfD3grqALmmYu3jOLqGBmy1i92Ru",
                "dknamibIHfGFj8OcZG1kuvY6JEqv2EC73OFJgsd6LHkJlZ5iiiDEQlKAhrduximPUikm4Ls6YJOxGjEtP55O6i9iXK3AIlMmXO11",
                "dknamie8DF9jtctaqzQ2Op73QWzfJZNlSYqWxiZUk2ECXs263j43Qf0UHbR7xPzHOKBghgqFYiyHcyVYtUju8oaRAKEpvSLDzGUI",
                "dknamigIFpTOcYLHKvhXBvSVTZAbGne6PM7qhGcCJ0mm2HukPvrpzt0hYWTq4tacUwySZWkKonP95f96mStFhNrryB2A8DBxeGVY",
                "dknamimMdvW7o90U3qOI3TYfql5oZ1zwT0kTERoxfFgnRRZB7fiuSzy9fxvGv81wtC6aWwN9Q7kPXgvDJ1DxOfvryDLKxemT9sg0",
                "dknamiusPzQHZgxXCTZfw1ydxH63ek9ugCw3pnEzYFKjFtnZ8VRfHi8JkdMJs5LqhS6yLJPzdLuoAJvTAJZCZRRKp8LmFvkURKpG",
                "dknamiuy8OrYc4b7XbzRhb35uEO2qN0La0d73tsHtBPo6Wk4GWjzff4vd7T8UzNoLpw39j9xOqDF6CGPV7SXzBy6jFo6oN65RlKe",
                "dknamiwXz89ghY7Lh3VuvCLDP0Aya4H9YabNGP98K4O6YQYZH9TUhENcWYsKTPs0zpv8zsrAuovZxuDZIFcV4SSGWvgikQOMMMUM",
                "dknamixcDgIq0pHt7Dbz3AHcfSC6KYNb2FnaCTdqLObs0321a771v1WaHyUt6Jd4wUHS5r6349Xna7JA9AVtT7AfrxUuvlhOUF6n7",
                "dknamixcDgIq0pHt7Dbz3AHcfSC6KYNb2FnaCTdqLO270321a771v1WaHyUt6Jd4227122019349a7JA9AVtT7AfrxUuvlhOUF6n7",
                "dknamixcDgIq0pHt7Dbz3AHcfSC6KYNb2FnaCTdqLO270321a771v1WaHyUt6Jd4227122019349a7JA9AVtT7AfdkhubuvOUF6n9",
                "dknamiyz8jsTyA1pdH1A8IrZlB37Pl8gJmRja5ydKxerHZmYGc8GwUsKfAWLSpMJ58iZqq2RWIwzTLkPNd5dmQVvvRZSoXHzkaMB",
                "dknamizxaGoSdMmflvkUpF0zpEzF42hDyHezI2PjkkMWOGf4ImgLstjlwPEHLkQTjas0VbPs3VxAOY7CcmMZukwLodr8z42gglSZ",
                "1234124124124215612361236123612361236126347428791238751289357891235127036801236012790612379061290612",
                "4127835691278180-70-18267-1238-612-8060-126812690127903612736792169126-12786-1-61=236=126=1236012061",
                "dknami1234123123412177777777777777777777777777777777777777777777717777777777777777777777777777777777",
                "dknamizxaGoSdMmflvkUpF0zpEzF42hDyHezI27877878877878877878877887878787877887xAOY7CcmMZukwLodr8z2gglSZ",
                "01100100 01101011 01101110 01100011 01101101 01101001 01110110 01111100 02100011 1110001101 011100011",
                "01100100 01101011 01101110 01100011 01101101 01101001 01120110 01111100 02100011 111000101 011100011",
                "01100100 01101011 01101110 01100011 01101101 01101001 01130110 01111100 02100011 111000101 011100011",
                "01100100 01101011 01101110 01100011 01101101 01101001 01140110 01111100 02100011 1110011101 011100011",
                "01100100 01101011 01101110 01100011 01101101 01101001 01150110 01111100 02101011 111011001 011100011",
                "01100100 01101011 01101110 01100011 01101101 01101001 01160110 01111100 02101011 01103001 011100011",
                "01100100 01101011 01101110 01100011 01101101 01101001 01170110 01111100 02101011 011021011 01110001",
                "01100100 01101011 01101110 01100011 01101101 01101001 01180110 01111100 02101011 01101011 011100011",
                "01100100 01101011 01101110 01100011 01101101 01C01001 01190110 01111100 01201011 01101011 011100011",
                "01100100 01101011 01101110 01100011 01101101 01B01001 01125110 01111100 01201011 011010111 011100101",
                "01100100 01101011 01101110 01100011 01101101 01K01001 01134110 01111100 01200011 01101011 011100101",
                "01100100 01101011 01101110 01100011 01101101 01H01001 01143110 01111100 01200011 011010111 011110001",
                "01100100 01101011 01101110 01100011 01101101 01L01001 01152110 01111100 01200011 011010111 011110001",
                "01100100 01101011 01101110 01100011 01101101 01Y01001 01161110 01111100 01200011 011010111 011110001",
                "01100100 01101011 01101110 01100011 01101101 011T1001 01110110 01111100 02100011 1110001101 011100011",
                "01100100 01101011 01101110 01100011 01101101 01I01001 01120110 01111100 02100011 111000101 011100011",
                "01100100 01101011 01101110 01100011 01101101 011W1001 01130110 01111100 02100011 111000101 011100011",
                "01100100 01101011 01101110 01100011 01101101 011Q1001 01140110 01111100 02100011 1110011101 011100011",
                "01100100 01101011 01101110 01100011 01101101 011V1001 01150110 01111100 02101011 111011001 011100011",
                "01100100 01101011 01101110 01100011 01101101 011M1001 01160110 01111100 02101011 01103001 011100011",
                "01100100 01101011 01101110 01100011 01101101 011N1001 01170110 01111100 02101011 011021011 01110001",
                "01100100 01101011 01101110 01100011 01101101 011H1001 01180110 01111100 02101011 01101011 011100011",
                "01100100 01101011 01101110 01100011 01101101 011F1001 01190110 01111100 01201011 01101011 011100011",
                "01100100 01101011 01101110 01100011 01101101 011E1001 01125110 01111100 01201011 011010111 011100101",
                "01100100 01101011 01101110 01100011 01101101 011D1001 01134110 01111100 01200011 01101011 011100101",
                "01100100 01101011 01101110 01100011 01101101 011C1001 01143110 01111100 01200011 011010111 011110001",
                "01100100 01101011 01101110 01100011 01101101 011B1001 01152110 01111100 01200011 011010111 011110001",
                "01100100 01101011 01101110 01100011 01101101 011A1001 01161110 01111100 01200011 011010111 011110001",
                "01100100 01101011 01101110 01100011 01101101 01101001 01110110 01111100 02100011 1110001101 011100011",
                "01100100 01101011 01101110 01100011 01101101 01101001 01120110 01111100 02100011 111000101 011100011",
                "01100100 01101011 01101110 01100011 01101101 01101001 01130110 01111100 02100011 111000101 011100011",
                "01100100 01101011 01101110 01100011 01101101 01101001 01140110 01111100 02100011 11100N1101 011100011",
                "01100100 01101011 01101110 01100011 01101101 01101001 01150110 01111100 02101011 11101B001 011100011",
                "01100100 01101011 01101110 01100011 01101101 01101001 01160110 01111100 02101011 01103X01 011100011",
                "01100100 01101011 01101110 01100011 01101101 01101001 01170110 01111100 02101011 01102Z011 01110001",
                "01100100 01101011 01101110 01100011 01101101 01101001 01180110 01111100 02101011 01101U11 011100011",
                "01100100 01101011 01101110 01100011 01101101 01C01001 01190110 01111100 01201011 01101T1 011100011",
                "01100100 01101011 01101110 01100011 01101101 01B01001 01125110 01111100 01201011 01101QW111 011100101",
                "01100100 01101011 01101110 01100011 01101101 01K01001 01134110 01111100 01200011 011DS011 011100101",
                "01100100 01101011 01101110 01100011 01101101 01H01001 01143110 01111100 01200011 018010111 011110001",
                "01100100 01101011 01101110 01100011 01101101 01L01001 01152110 01111100 01200011 016010111 011110001",
                "01100100 01101011 01101110 01100011 01101101 01Y01001 01161110 01111100 01200011 013010111 011110001",
                "01100100 01101011 01101110 01100011 01101101 011T1001 01110110 01111100 02100011 1150001101 011100011",
                "01100100 01101011 01101110 01100011 01101101 01I01001 01120110 01111100 02100011 112000101 011100011",
                "01100100 01101011 01101110 01100011 01101101 011W1001 01130110 01111100 02100011 111000101 0111000W1",
                "01100100 01101011 01101110 01100011 01101101 011Q1001 01140110 01111100 02100011 1110011101 011100Q11",
                "01100100 01101011 01101110 01100011 01101101 011V1001 01150110 01111100 02101011 111011001 0111000A1",
                "01100100 01101011 01101110 01100011 01101101 011M1001 01160110 01111100 02101011 01103001 011100010",
                "01100100 01101011 01101110 01100011 01101101 011N1001 01170110 01111100 02101011 011021011 01110009",
                "01100100 01101011 01101110 01100011 01101101 011H1001 01180110 01111100 02101011 01101011 011100018",
                "01100100 01101011 01101110 01100011 01101101 011F1001 01190110 01111100 01201011 01101011 011100017",
                "01100100 01101011 01101110 01100011 01101101 011E1001 01125110 01111100 01201011 011010111 011100161",
                "01100100 01101011 01101110 01100011 01101101 011D1001 01134110 01111100 01200011 01101011 011100105",
                "01100100 01101011 01101110 01100011 01101101 011C1001 01143110 01111100 01200011 011010111 011110004",
                "01100100 01101011 01101110 01100011 01101101 011B1001 01152110 01111100 01200011 011010111 011110003",
                "01100100 01101011 01101110 01100011 01101101 011A1001 01161110 01111100 01200011 011010111 011110002",
                "Blade Slayer",
                "Pet Fighters Simulator", 
                "Anime Transform Simulator", 
                "Reborn As Swordman",
                "Warrior Simulator",
                "Anime Odyssey", 
                "Anime Realms Simulator", 
                "Anime Punching Simulator 2",
                "Anime Max", 
                "Anime Racing 2", 
                "Slayer Corps", 
                "Murder Mystery 2", 
                "Anime Heroes Simulator",
                "Rebirth Champions X", 
                "Anime Relms", 
                "Anime Haven Simulator", 
                "Anime Destiny Simulator",
                "Ultimate Anime Simulator", 
                "Weapon Fighting Simulator", 
                "Anime Realms By Voxer", 
                "Magic Blade Simulator",
                "Princess Fighter Simulator", 
                "Aqua Racer", 
                "Scythe Simulator", 
                "Anime Ascensions Simulator", 
                "Demonfall", 
                "Anime Power Evolution Simulator"
            })

            loadMainScript()
            destroyUI()
            return true
        else
            noKeyNoti()
        end
    end
    return false
end


-- Add Input for Key
local keyInputBox = Tabs.Infor:AddInput("Input", {
    Title = "",
    Default = "",
    Numeric = false,
    Finished = false,
    Placeholder = "Put Your Key",
    Callback = function(Value)
        getgenv().keyinput = Value
    end
})

-- Check Key Button
Tabs.Infor:AddButton({
    Title = "Check KEY",
    Callback = function()
        isKeyValid(getgenv().keyinput)
    end
})

-- Get Key Button
Tabs.Infor:AddButton({
    Title = "Get KEY FREE",
    Callback = function()
        KeySystem:copyGetKeyURL()
    end
})

-- Join Discord Button
Tabs.Infor:AddButton({
    Title = "Buy Key In Discord/Click Copyy Link",
    Callback = function()
        setclipboard("https://discord.gg/dkhub")
    end
})

-- Load saved key if exists
local savedKey = loadKey()
if savedKey then
    getgenv().keyinput = savedKey
    if isKeyValid(savedKey) then
        return
    end
end

-- Anti-bypass script
local Players = game:GetService("Players")
local CoreGui = game:GetService("CoreGui")

-- Função de verificação
local function checkForBypass()
    for _, obj in pairs(CoreGui:GetDescendants()) do
        if obj:IsA("TextLabel") and obj.Text:find("25ms") then
            Players.LocalPlayer:Kick("LoL")
            return true -- Bypass detectado
        end
    end
    return false -- Bypass não detectado
end

-- Execução rápida
local function startAntiBypass()
    while true do
        if checkForBypass() then
            break -- Para o loop se o bypass for detectado
        end
        wait(0.5) -- Intervalo de verificação
    end
end

spawn(startAntiBypass)
