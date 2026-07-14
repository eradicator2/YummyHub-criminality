local protectionMessage = "this script is protected using Polymorphine obfuscator"

local function runProtectionChecks()
    local localizationService = game:GetService("LocalizationService")

    local localizationOk = pcall(function()
        local translator = localizationService:GetTranslatorForLocaleAsync("tv-tv")

        if typeof(translator) ~= "Instance" then
            error(protectionMessage, 0)
        end

        if not translator:IsA("Translator") then
            error(protectionMessage, 0)
        end

        local localeId = translator.LocaleId

        if type(localeId) ~= "string" or #localeId == 0 then
            error(protectionMessage, 0)
        end
    end)

    if not localizationOk then
        error(protectionMessage, 0)
    end

    local captureService = game:GetService("CaptureService")

    if typeof(captureService.CaptureBegan) ~= "RBXScriptSignal" then
        error(protectionMessage, 0)
    end

    local captureConnection = captureService.CaptureBegan:Connect(function()
    end)

    if typeof(captureConnection) ~= "RBXScriptConnection" then
        error(protectionMessage, 0)
    end

    captureConnection:Disconnect()

    if captureConnection.Connected ~= false then
        error(protectionMessage, 0)
    end

    local contextActionService = game:GetService("ContextActionService")
    local boundActions = contextActionService:GetAllBoundActionInfo()

    if type(boundActions) ~= "table" then
        error(protectionMessage, 0)
    end

    contextActionService:BindAction("LeakD110", function()
    end, false, Enum.KeyCode.F)

    boundActions = contextActionService:GetAllBoundActionInfo()

    if boundActions.LeakD110 == nil then
        error(protectionMessage, 0)
    end

    if type(boundActions.LeakD110.inputTypes) ~= "table" then
        error(protectionMessage, 0)
    end

    if boundActions.LeakD110.inputTypes[1] ~= Enum.KeyCode.F then
        error(protectionMessage, 0)
    end

    contextActionService:UnbindAction("LeakD110")

    local overlapParams = OverlapParams.new()

    if typeof(overlapParams) ~= "OverlapParams" then
        error(protectionMessage, 0)
    end

    if overlapParams.MaxParts ~= 0 then
        error(protectionMessage, 0)
    end

    if overlapParams.FilterType ~= Enum.RaycastFilterType.Exclude then
        error(protectionMessage, 0)
    end

    overlapParams.MaxParts = 10

    if overlapParams.MaxParts ~= 10 then
        error(protectionMessage, 0)
    end

    local filterDescendants = overlapParams.FilterDescendantsInstances

    if type(filterDescendants) ~= "table" then
        error(protectionMessage, 0)
    end

    if #filterDescendants ~= 0 then
        error(protectionMessage, 0)
    end
end

runProtectionChecks()
runProtectionChecks()
