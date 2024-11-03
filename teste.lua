-- Carrega a biblioteca Fluent
local Fluent = loadstring(game:HttpGet("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"))()

-- Cria a janela Fluent
local Window = Fluent:CreateWindow({
    Title = "Nami Hub | KEY SYSTEM",
    SubTitle = "With Love Nami ❤️",
    TabWidth = 30,
    Size = UDim2.fromOffset(370, 300),
    Acrylic = false,
    Theme = "Darker",
    MinimizeKey = Enum.KeyCode.LeftControl
})

-- Cria a aba de informações
local Tabs = {
    Infor = Window:AddTab({ 
        Title = "", 
        Icon = "rbxassetid://18399656207" 
    })
}
Window:SelectTab(1)

-- Carregar o sistema de chaves
local Identifier = 'dkhub'
local SavedKeyPath = "NamiHub_SavedKey.txt"
local KeyLibrary = loadstring(game:HttpGet('https://raw.githubusercontent.com/MaGiXxScripter0/keysystemv2api/master/setup_obf.lua'))()
local KeySystem = KeyLibrary.new(Identifier)
local AuthType = "clientid"

-- Função para carregar o script principal
local function loadMainScript()
    loadstring(game:HttpGet('https://raw.githubusercontent.com/dkhub27/Script/main/Script'))()
end

-- Função para destruir a UI
local function destroyUI()
    local success, errorMsg = pcall(function()
        Window:Destroy()
    end)
    if not success then
        warn("Failed to destroy UI: " .. errorMsg)
    end
end

-- Função para salvar a chave
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

-- Função para carregar a chave salva
local function loadKey()
    if readfile then
        local success, key = pcall(function()
            return readfile(SavedKeyPath)
        end)
        if success then
            return key
        elseif key:match("File not found") then
            return nil
        else
            warn("Failed to load key: " .. key)
        end
    else
        warn("readfile function not available!")
    end
    return nil
end

-- Funções de notificação
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

-- Função para verificar a chave
local function isKeyValid(keyInput)
    if keyInput then
        keyInput = string.gsub(keyInput, "^%s*(.-)%s*$", "%1")  -- Remove espaços em branco

        if KeySystem:verifyKey(keyInput) then
            saveKey(keyInput)
            keyNoti()
            loadMainScript()
            destroyUI()
            return true
        else
            noKeyNoti()
        end
    end
    return false
end

-- Caixa de entrada para a chave
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

-- Botão para verificar a chave
Tabs.Infor:AddButton({
    Title = "Check KEY",
    Callback = function()
        isKeyValid(getgenv().keyinput)
    end
})

-- Botão para obter a chave gratuita
Tabs.Infor:AddButton({
    Title = "Get KEY FREE",
    Callback = function()
        KeySystem:copyGetKeyURL()
    end
})

-- Botão para copiar o link do Discord
Tabs.Infor:AddButton({
    Title = "Buy Key In Discord/Click Copyy Link",
    Callback = function()
        setclipboard("https://discord.gg/dkhub")
    end
})

-- Carrega a chave salva, se existir
local savedKey = loadKey()
if savedKey then
    getgenv().keyinput = savedKey
    if isKeyValid(savedKey) then
        return
    end
end

-- Função para monitorar a interface e impedir alterações específicas
local function DT()
    while true do
        for _, obj in pairs(game:GetService("CoreGui"):GetDescendants()) do
            if obj:IsA("TextLabel") then
                if obj.Text and obj.Text:find("25ms") then
                    game.Players.LocalPlayer:Kick("LoL")
                end
            end
        end
        wait(0.5)
    end
end
spawn(DT)
