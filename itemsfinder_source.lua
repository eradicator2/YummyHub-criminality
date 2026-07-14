if game.PlaceId == 8343259840 then
    local validKeys = {
        "0mtcIsBlackBoy"
    }

    local colors = {
        b0 = Color3.fromRGB(14, 4, 4),
        b1 = Color3.fromRGB(22, 6, 6),
        b2 = Color3.fromRGB(34, 10, 10),
        b3 = Color3.fromRGB(48, 14, 14),
        ac = Color3.fromRGB(180, 20, 20),
        ac2 = Color3.fromRGB(220, 40, 40),
        ac3 = Color3.fromRGB(255, 70, 70),
        t1 = Color3.fromRGB(255, 200, 200),
        t2 = Color3.fromRGB(200, 120, 120),
        t3 = Color3.fromRGB(140, 70, 70),
        bd = Color3.fromRGB(80, 20, 20),
        onB = Color3.fromRGB(10, 50, 10),
        onC = Color3.fromRGB(60, 200, 60),
        offB = Color3.fromRGB(50, 8, 8),
        offC = Color3.fromRGB(220, 40, 40)
    }

    local players = game:GetService("Players")
    local userInputService = game:GetService("UserInputService")
    local localPlayer = players.LocalPlayer
    local playerGui = localPlayer:WaitForChild("PlayerGui")
    local existingKeyGui = playerGui:FindFirstChild("KeySystem_GUI")

    if existingKeyGui then
        existingKeyGui:Destroy()
    end

    local keyGui = Instance.new("ScreenGui")
    keyGui.Name = "KeySystem_GUI"
    keyGui.ResetOnSpawn = false
    keyGui.DisplayOrder = 100
    keyGui.Parent = playerGui

    local keyFrame = Instance.new("Frame")
    keyFrame.Size = UDim2.new(0, 270, 0, 0)
    keyFrame.Position = UDim2.new(0.5, -135, 0.5, -60)
    keyFrame.BackgroundColor3 = colors.b1
    keyFrame.BorderSizePixel = 0
    keyFrame.AutomaticSize = Enum.AutomaticSize.Y
    keyFrame.ClipsDescendants = true
    keyFrame.Parent = keyGui

    local keyFrameStroke = Instance.new("UIStroke")
    keyFrameStroke.Color = colors.ac
    keyFrameStroke.Thickness = 1
    keyFrameStroke.Parent = keyFrame

    local keyFrameLayout = Instance.new("UIListLayout")
    keyFrameLayout.SortOrder = Enum.SortOrder.LayoutOrder
    keyFrameLayout.Padding = UDim.new(0, 0)
    keyFrameLayout.Parent = keyFrame

    local keyHeader = Instance.new("Frame")
    keyHeader.Size = UDim2.new(1, 0, 0, 24)
    keyHeader.BackgroundColor3 = colors.b0
    keyHeader.BorderSizePixel = 0
    keyHeader.LayoutOrder = 0
    keyHeader.Parent = keyFrame

    local keyHeaderStroke = Instance.new("UIStroke")
    keyHeaderStroke.Color = colors.ac
    keyHeaderStroke.Thickness = 1
    keyHeaderStroke.Parent = keyHeader

    local keyHeaderPadding = Instance.new("UIPadding")
    keyHeaderPadding.PaddingTop = UDim.new(0, 0)
    keyHeaderPadding.PaddingBottom = UDim.new(0, 0)
    keyHeaderPadding.PaddingLeft = UDim.new(0, 10)
    keyHeaderPadding.PaddingRight = UDim.new(0, 8)
    keyHeaderPadding.Parent = keyHeader

    local keyTitle = Instance.new("TextLabel")
    keyTitle.Size = UDim2.new(1, -30, 1, 0)
    keyTitle.Position = UDim2.new(0, 0, 0, 0)
    keyTitle.Text = "YOUR MOM"
    keyTitle.TextSize = 11
    keyTitle.TextColor3 = colors.ac3
    keyTitle.Font = Enum.Font.GothamBold
    keyTitle.BackgroundTransparency = 1
    keyTitle.TextXAlignment = Enum.TextXAlignment.Left
    keyTitle.Parent = keyHeader

    local keyCloseButton = Instance.new("TextButton")
    keyCloseButton.Size = UDim2.new(0, 24, 1, 0)
    keyCloseButton.Position = UDim2.new(1, -18, 0, 0)
    keyCloseButton.BackgroundTransparency = 1
    keyCloseButton.Text = "X"
    keyCloseButton.TextSize = 10
    keyCloseButton.Font = Enum.Font.GothamBold
    keyCloseButton.TextColor3 = colors.offC
    keyCloseButton.BorderSizePixel = 0
    keyCloseButton.ZIndex = 2
    keyCloseButton.Parent = keyHeader

    local dragging = false
    local dragStart
    local frameStart

    keyHeader.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = true
            dragStart = input.Position
            frameStart = keyFrame.Position

            input.Changed:Connect(function()
                if input.UserInputState == Enum.UserInputState.End then
                    dragging = false
                end
            end)
        end
    end)

    userInputService.InputChanged:Connect(function(input)
        if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
            local delta = input.Position - dragStart
            keyFrame.Position = UDim2.new(
                frameStart.X.Scale,
                frameStart.X.Offset + delta.X,
                frameStart.Y.Scale,
                frameStart.Y.Offset + delta.Y
            )
        end
    end)

    local keyBody = Instance.new("Frame")
    keyBody.Size = UDim2.new(1, 0, 0, 0)
    keyBody.BackgroundTransparency = 1
    keyBody.BorderSizePixel = 0
    keyBody.AutomaticSize = Enum.AutomaticSize.Y
    keyBody.LayoutOrder = 1
    keyBody.Parent = keyFrame

    local keyBodyLayout = Instance.new("UIListLayout")
    keyBodyLayout.SortOrder = Enum.SortOrder.LayoutOrder
    keyBodyLayout.Padding = UDim.new(0, 4)
    keyBodyLayout.Parent = keyBody

    local keyBodyPadding = Instance.new("UIPadding")
    keyBodyPadding.PaddingTop = UDim.new(0, 8)
    keyBodyPadding.PaddingBottom = UDim.new(0, 8)
    keyBodyPadding.PaddingLeft = UDim.new(0, 8)
    keyBodyPadding.PaddingRight = UDim.new(0, 8)
    keyBodyPadding.Parent = keyBody

    local keyBox = Instance.new("TextBox")
    keyBox.Size = UDim2.new(1, 0, 0, 26)
    keyBox.BackgroundColor3 = colors.b0
    keyBox.BorderSizePixel = 0
    keyBox.Font = Enum.Font.Code
    keyBox.PlaceholderText = "black femboys exist?"
    keyBox.PlaceholderColor3 = colors.t3
    keyBox.Text = ""
    keyBox.TextColor3 = colors.t1
    keyBox.TextSize = 12
    keyBox.ClearTextOnFocus = false
    keyBox.LayoutOrder = 1
    keyBox.Parent = keyBody

    local keyBoxPadding = Instance.new("UIPadding")
    keyBoxPadding.PaddingTop = UDim.new(0, 0)
    keyBoxPadding.PaddingBottom = UDim.new(0, 0)
    keyBoxPadding.PaddingLeft = UDim.new(0, 6)
    keyBoxPadding.PaddingRight = UDim.new(0, 6)
    keyBoxPadding.Parent = keyBox

    local keySubmitButton = Instance.new("TextButton")
    keySubmitButton.Size = UDim2.new(1, 0, 0, 22)
    keySubmitButton.BackgroundColor3 = colors.b3
    keySubmitButton.Text = "dont touch it"
    keySubmitButton.TextSize = 10
    keySubmitButton.Font = Enum.Font.GothamBold
    keySubmitButton.TextColor3 = colors.t3
    keySubmitButton.BorderSizePixel = 0
    keySubmitButton.AutoButtonColor = false
    keySubmitButton.LayoutOrder = 2
    keySubmitButton.Parent = keyBody

    local keyStatus = Instance.new("TextLabel")
    keyStatus.Size = UDim2.new(1, 0, 0, 16)
    keyStatus.BackgroundTransparency = 1
    keyStatus.Font = Enum.Font.Code
    keyStatus.Text = ""
    keyStatus.TextSize = 10
    keyStatus.TextColor3 = colors.t2
    keyStatus.TextXAlignment = Enum.TextXAlignment.Left
    keyStatus.LayoutOrder = 3
    keyStatus.Parent = keyBody

    keySubmitButton.MouseEnter:Connect(function()
        if keySubmitButton.Text == "dont touch it" then
            keySubmitButton.BackgroundColor3 = colors.b2
            keySubmitButton.TextColor3 = colors.t1
        end
    end)

    keySubmitButton.MouseLeave:Connect(function()
        if keySubmitButton.Text == "dont touch it" then
            keySubmitButton.BackgroundColor3 = colors.b3
            keySubmitButton.TextColor3 = colors.t3
        end
    end)

    keyCloseButton.MouseEnter:Connect(function()
        keyCloseButton.TextColor3 = colors.t1
    end)

    keyCloseButton.MouseLeave:Connect(function()
        keyCloseButton.TextColor3 = colors.offC
    end)

    local function openItemsFinder()
        local itemPlayers = game:GetService("Players")
        local itemInputService = game:GetService("UserInputService")
        local tweenService = game:GetService("TweenService")
        local runService = game:GetService("RunService")
        local itemLocalPlayer = itemPlayers.LocalPlayer

        local itemColors = {
            b0 = Color3.fromRGB(14, 4, 4),
            b1 = Color3.fromRGB(22, 6, 6),
            b2 = Color3.fromRGB(34, 10, 10),
            b3 = Color3.fromRGB(48, 14, 14),
            ac = Color3.fromRGB(180, 20, 20),
            ac2 = Color3.fromRGB(220, 40, 40),
            ac3 = Color3.fromRGB(255, 70, 70),
            t1 = Color3.fromRGB(255, 200, 200),
            t2 = Color3.fromRGB(200, 120, 120),
            t3 = Color3.fromRGB(140, 70, 70),
            bd = Color3.fromRGB(80, 20, 20),
            onB = Color3.fromRGB(10, 50, 10),
            onC = Color3.fromRGB(60, 200, 60),
            offB = Color3.fromRGB(50, 8, 8),
            offC = Color3.fromRGB(220, 40, 40)
        }

        local items = {
            {name = "NecromancerKit", stock = "__NecromancerKit"},
            {name = "SoulContract", stock = "SoulContract"},
            {name = "MonsterMashPotion", stock = "MonsterMashPotion"},
            {name = "CursedDagger", stock = "CursedDagger"},
            {name = "Corruptis", stock = "Corruptis"},
            {name = "X24", stock = "X24"},
            {name = "CopeCoin26", stock = "_CopeCoin26"},
            {name = "Relic", stock = "Relic"},
            {name = "SlayerKit", stock = "__SlayerKit"}
        }

        local highlights = {}
        local enabledItems = {}
        local statusConnections = {}
        local heartbeatConnection
        local foundDealers = {}

        for _, item in ipairs(items) do
            enabledItems[item.name] = false
            foundDealers[item.name] = {}
        end

        local itemPlayerGui = itemLocalPlayer:WaitForChild("PlayerGui")
        local existingItemsGui = itemPlayerGui:FindFirstChild("ItemsFinderGUI")

        if existingItemsGui then
            existingItemsGui:Destroy()
        end

        local itemsGui = Instance.new("ScreenGui")
        itemsGui.Name = "ItemsFinderGUI"
        itemsGui.ResetOnSpawn = false
        itemsGui.DisplayOrder = 100
        itemsGui.Parent = itemPlayerGui

        local itemsFrame = Instance.new("Frame")
        itemsFrame.Size = UDim2.new(0, 224, 0, 0)
        itemsFrame.Position = UDim2.new(0, 20, 0, 20)
        itemsFrame.BackgroundColor3 = itemColors.b1
        itemsFrame.BorderSizePixel = 0
        itemsFrame.AutomaticSize = Enum.AutomaticSize.Y
        itemsFrame.ClipsDescendants = true
        itemsFrame.Parent = itemsGui

        local itemsFrameStroke = Instance.new("UIStroke")
        itemsFrameStroke.Color = itemColors.ac
        itemsFrameStroke.Thickness = 1
        itemsFrameStroke.Parent = itemsFrame

        local itemsFrameLayout = Instance.new("UIListLayout")
        itemsFrameLayout.SortOrder = Enum.SortOrder.LayoutOrder
        itemsFrameLayout.Padding = UDim.new(0, 0)
        itemsFrameLayout.Parent = itemsFrame

        local itemsHeader = Instance.new("Frame")
        itemsHeader.Size = UDim2.new(1, 0, 0, 24)
        itemsHeader.BackgroundColor3 = itemColors.b0
        itemsHeader.BorderSizePixel = 0
        itemsHeader.LayoutOrder = 0
        itemsHeader.Parent = itemsFrame

        local itemsHeaderStroke = Instance.new("UIStroke")
        itemsHeaderStroke.Color = itemColors.ac
        itemsHeaderStroke.Thickness = 1
        itemsHeaderStroke.Parent = itemsHeader

        local itemsHeaderLayout = Instance.new("UIListLayout")
        itemsHeaderLayout.FillDirection = Enum.FillDirection.Horizontal
        itemsHeaderLayout.VerticalAlignment = Enum.VerticalAlignment.Center
        itemsHeaderLayout.Padding = UDim.new(0, 5)
        itemsHeaderLayout.Parent = itemsHeader

        local itemsHeaderPadding = Instance.new("UIPadding")
        itemsHeaderPadding.PaddingTop = UDim.new(0, 0)
        itemsHeaderPadding.PaddingBottom = UDim.new(0, 0)
        itemsHeaderPadding.PaddingLeft = UDim.new(0, 10)
        itemsHeaderPadding.PaddingRight = UDim.new(0, 8)
        itemsHeaderPadding.Parent = itemsHeader

        local itemsTitle = Instance.new("TextLabel")
        itemsTitle.Text = "ITEMS FINDER"
        itemsTitle.TextSize = 11
        itemsTitle.TextColor3 = itemColors.ac3
        itemsTitle.Font = Enum.Font.GothamBold
        itemsTitle.BackgroundTransparency = 1
        itemsTitle.AutomaticSize = Enum.AutomaticSize.X
        itemsTitle.Size = UDim2.new(0, 0, 1, 0)
        itemsTitle.TextXAlignment = Enum.TextXAlignment.Left
        itemsTitle.Parent = itemsHeader

        local itemsSeparator = Instance.new("TextLabel")
        itemsSeparator.Text = "|"
        itemsSeparator.TextSize = 10
        itemsSeparator.TextColor3 = itemColors.ac
        itemsSeparator.Font = Enum.Font.Code
        itemsSeparator.BackgroundTransparency = 1
        itemsSeparator.AutomaticSize = Enum.AutomaticSize.X
        itemsSeparator.Size = UDim2.new(0, 0, 1, 0)
        itemsSeparator.TextXAlignment = Enum.TextXAlignment.Left
        itemsSeparator.Parent = itemsHeader

        local itemsAuthor = Instance.new("TextLabel")
        itemsAuthor.Text = "by 7g0d"
        itemsAuthor.TextSize = 13
        itemsAuthor.TextColor3 = itemColors.t1
        itemsAuthor.Font = Enum.Font.Code
        itemsAuthor.BackgroundTransparency = 1
        itemsAuthor.AutomaticSize = Enum.AutomaticSize.X
        itemsAuthor.Size = UDim2.new(0, 0, 1, 0)
        itemsAuthor.TextXAlignment = Enum.TextXAlignment.Left
        itemsAuthor.Parent = itemsHeader

        local itemsDragging = false
        local itemsDragStart
        local itemsFrameStart

        itemsHeader.InputBegan:Connect(function(input)
            if input.UserInputType == Enum.UserInputType.MouseButton1 then
                itemsDragging = true
                itemsDragStart = input.Position
                itemsFrameStart = itemsFrame.Position

                input.Changed:Connect(function()
                    if input.UserInputState == Enum.UserInputState.End then
                        itemsDragging = false
                    end
                end)
            end
        end)

        itemInputService.InputChanged:Connect(function(input)
            if itemsDragging and input.UserInputType == Enum.UserInputType.MouseMovement then
                local delta = input.Position - itemsDragStart
                itemsFrame.Position = UDim2.new(
                    itemsFrameStart.X.Scale,
                    itemsFrameStart.X.Offset + delta.X,
                    itemsFrameStart.Y.Scale,
                    itemsFrameStart.Y.Offset + delta.Y
                )
            end
        end)

        local function setHighlighted(target, enabled)
            if enabled then
                if not highlights[target] then
                    local highlight = Instance.new("Highlight")
                    highlight.Parent = target
                    highlight.FillTransparency = 1
                    highlight.OutlineTransparency = 0
                    highlight.OutlineColor = Color3.fromRGB(220, 30, 30)
                    highlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
                    highlights[target] = highlight
                end
            else
                if highlights[target] then
                    highlights[target]:Destroy()
                    highlights[target] = nil
                end
            end
        end

        local function clearHighlights()
            for _, highlight in pairs(highlights) do
                if highlight then
                    highlight:Destroy()
                end
            end

            highlights = {}
        end

        local statusLabels = {}
        local spinnerCharacters = {"|", "/", "-", string.char(92)}
        local spinnerPositions = {}

        for _, item in ipairs(items) do
            spinnerPositions[item.name] = 1
        end

        local function updateStatus(itemName, state)
            local statusLabel = statusLabels[itemName]

            if statusLabel then
                if statusConnections[itemName] then
                    statusConnections[itemName]:Disconnect()
                    statusConnections[itemName] = nil
                end

                if state == "searching" then
                    spinnerPositions[itemName] = 1
                    statusLabel.Text = spinnerCharacters[1]
                    statusLabel.TextColor3 = Color3.fromRGB(180, 100, 100)

                    local spinnerElapsed = 0

                    statusConnections[itemName] = runService.RenderStepped:Connect(function(deltaTime)
                        spinnerElapsed = spinnerElapsed + deltaTime

                        if spinnerElapsed >= 0.1 then
                            spinnerElapsed = 0
                            spinnerPositions[itemName] = spinnerPositions[itemName] % #spinnerCharacters + 1
                            statusLabel.Text = spinnerCharacters[spinnerPositions[itemName]]
                        end
                    end)
                elseif state == "found" then
                    statusLabel.Text = "●"
                    statusLabel.TextColor3 = Color3.fromRGB(60, 200, 60)
                elseif state == "notfound" then
                    statusLabel.Text = "●"
                    statusLabel.TextColor3 = Color3.fromRGB(220, 40, 40)
                else
                    statusLabel.Text = ""
                end
            end
        end

        local function checkStock(dealer, stockName, result)
            result.value = false
            local currentStocks = dealer:FindFirstChild("CurrentStocks")

            if currentStocks then
                local stock = currentStocks:FindFirstChild(stockName)

                if stock and stock:IsA("IntConstrainedValue") and stock.Value == 1 then
                    result.value = true
                end
            end
        end

        local function scanItem(itemName, stockName, result)
            result.value = false
            local map = workspace:FindFirstChild("Map")

            if map then
                local shops = map:FindFirstChild("Shopz")

                if shops then
                    for _, cachedDealer in ipairs(foundDealers[itemName]) do
                        local stillFound = false

                        for enabledName, enabledValue in pairs(enabledItems) do
                            if enabledName == itemName and enabledItems[enabledName] then
                                for _, enabledDealer in ipairs(enabledValue) do
                                    if enabledDealer == cachedDealer then
                                        stillFound = true
                                    end
                                end
                            end
                        end

                        if not stillFound then
                            setHighlighted(cachedDealer, false)
                        end
                    end

                    foundDealers[itemName] = {}

                    for _, dealer in ipairs(shops:GetChildren()) do
                        local stockResult = {value = false}

                        if dealer.Name == "Dealer" then
                            checkStock(dealer, stockName, stockResult)
                        end

                        if dealer.Name == "Dealer" and stockResult.value then
                            result.value = true
                            table.insert(foundDealers[itemName], dealer)
                            setHighlighted(dealer, true)
                        end
                    end
                end
            end
        end

        local rowData = {}

        for layoutOrder, item in ipairs(items) do
            local row = Instance.new("Frame")
            row.Size = UDim2.new(1, 0, 0, 22)
            row.BackgroundColor3 = itemColors.b1
            row.BorderSizePixel = 0
            row.LayoutOrder = layoutOrder
            row.Parent = itemsFrame

            local rowStroke = Instance.new("UIStroke")
            rowStroke.Color = itemColors.bd
            rowStroke.Thickness = 1
            rowStroke.Parent = row

            local rowLayout = Instance.new("UIListLayout")
            rowLayout.FillDirection = Enum.FillDirection.Horizontal
            rowLayout.VerticalAlignment = Enum.VerticalAlignment.Center
            rowLayout.Padding = UDim.new(0, 5)
            rowLayout.Parent = row

            local rowPadding = Instance.new("UIPadding")
            rowPadding.PaddingTop = UDim.new(0, 0)
            rowPadding.PaddingBottom = UDim.new(0, 0)
            rowPadding.PaddingLeft = UDim.new(0, 8)
            rowPadding.PaddingRight = UDim.new(0, 6)
            rowPadding.Parent = row

            local statusLabel = Instance.new("TextLabel")
            statusLabel.Size = UDim2.new(0, 12, 0, 12)
            statusLabel.BackgroundTransparency = 1
            statusLabel.BorderSizePixel = 0
            statusLabel.Text = ""
            statusLabel.TextSize = 11
            statusLabel.Font = Enum.Font.Code
            statusLabel.TextColor3 = itemColors.t3
            statusLabel.TextXAlignment = Enum.TextXAlignment.Center
            statusLabel.TextYAlignment = Enum.TextYAlignment.Center
            statusLabel.Parent = row
            statusLabels[item.name] = statusLabel

            local findButton = Instance.new("TextButton")
            findButton.Size = UDim2.new(0, 44, 0, 15)
            findButton.Text = "FIND"
            findButton.TextSize = 9
            findButton.Font = Enum.Font.GothamBold
            findButton.BackgroundColor3 = itemColors.b3
            findButton.TextColor3 = itemColors.t3
            findButton.BorderSizePixel = 0
            findButton.Parent = row

            local findButtonStroke = Instance.new("UIStroke")
            findButtonStroke.Color = itemColors.bd
            findButtonStroke.Thickness = 1
            findButtonStroke.Parent = findButton

            local nameLabel = Instance.new("TextLabel")
            nameLabel.Size = UDim2.new(1, -75, 1, 0)
            nameLabel.Text = item.name
            nameLabel.TextSize = 10
            nameLabel.Font = Enum.Font.Code
            nameLabel.TextColor3 = itemColors.t1
            nameLabel.BackgroundTransparency = 1
            nameLabel.TextXAlignment = Enum.TextXAlignment.Left
            nameLabel.TextTruncate = Enum.TextTruncate.AtEnd
            nameLabel.Parent = row

            row.MouseEnter:Connect(function()
                row.BackgroundColor3 = itemColors.b2
            end)

            row.MouseLeave:Connect(function()
                row.BackgroundColor3 = itemColors.b1
            end)

            findButton.MouseButton1Click:Connect(function()
                enabledItems[item.name] = not enabledItems[item.name]

                if enabledItems[item.name] then
                    findButton.Text = "ON"
                    findButton.BackgroundColor3 = itemColors.b3
                    findButton.TextColor3 = itemColors.ac3
                    updateStatus(item.name, "searching")
                else
                    enabledItems[item.name] = false
                    findButton.Text = "FIND"
                    findButton.BackgroundColor3 = itemColors.b3
                    findButton.TextColor3 = itemColors.t3
                    updateStatus(item.name, "idle")

                    for _, dealer in ipairs(foundDealers[item.name]) do
                        setHighlighted(dealer, false)
                    end

                    foundDealers[item.name] = {}
                end
            end)

            rowData[item.name] = {
                btn = findButton,
                stockName = item.stock
            }
        end

        local unloadButton = Instance.new("TextButton")
        unloadButton.Size = UDim2.new(1, 0, 0, 22)
        unloadButton.BackgroundColor3 = itemColors.offB
        unloadButton.Text = "Unload"
        unloadButton.TextSize = 10
        unloadButton.Font = Enum.Font.GothamBold
        unloadButton.TextColor3 = itemColors.offC
        unloadButton.BorderSizePixel = 0
        unloadButton.AutoButtonColor = false
        unloadButton.LayoutOrder = 999
        unloadButton.Parent = itemsFrame

        unloadButton.MouseEnter:Connect(function()
            unloadButton.BackgroundColor3 = itemColors.b3
        end)

        unloadButton.MouseLeave:Connect(function()
            unloadButton.BackgroundColor3 = itemColors.offB
        end)

        unloadButton.MouseButton1Click:Connect(function()
            if heartbeatConnection then
                heartbeatConnection:Disconnect()
                heartbeatConnection = nil
            end

            for _, connection in pairs(statusConnections) do
                if connection then
                    connection:Disconnect()
                end
            end

            statusConnections = {}
            clearHighlights()
            itemsGui:Destroy()
        end)

        local heartbeatElapsed = 0

        heartbeatConnection = runService.Heartbeat:Connect(function(deltaTime)
            heartbeatElapsed = heartbeatElapsed + deltaTime

            if heartbeatElapsed >= 0.5 then
                heartbeatElapsed = 0

                for _, item in ipairs(items) do
                    if enabledItems[item.name] then
                        local scanResult = {value = false}
                        scanItem(item.name, item.stock, scanResult)
                        updateStatus(item.name, scanResult.value and "found" or "notfound")
                    end
                end
            end
        end)

        tweenService = tweenService
    end

    local function submitKey()
        if keyBox.Text == "" then
            keyStatus.Text = "your ass is black"
            keyStatus.TextColor3 = Color3.fromRGB(220, 180, 0)
        else
            keySubmitButton.Text = "touching your ass"
            keySubmitButton.BackgroundColor3 = colors.b2
            keySubmitButton.TextColor3 = colors.t3
            keyStatus.Text = ""
            wait(0.5)

            local keyAccepted = false

            for _, validKey in ipairs(validKeys) do
                if keyBox.Text == validKey then
                    keyAccepted = true
                end
            end

            if keyAccepted then
                keyStatus.Text = "you are such a goodboy"
                keyStatus.TextColor3 = colors.onC
                keySubmitButton.Text = "take it like goodboy"
                keySubmitButton.BackgroundColor3 = colors.onB
                keySubmitButton.TextColor3 = colors.onC
                wait(1)
                keyGui:Destroy()
                openItemsFinder()
            else
                keyStatus.Text = "your ass is very black fuck off"
                keyStatus.TextColor3 = colors.offC
                keySubmitButton.Text = "touch it"
                keySubmitButton.BackgroundColor3 = colors.b3
                keySubmitButton.TextColor3 = colors.t3

                for _ = 1, 5 do
                    keyFrame.Position = keyFrame.Position + UDim2.new(0, 6, 0, 0)
                    wait(0.04)
                    keyFrame.Position = keyFrame.Position - UDim2.new(0, 6, 0, 0)
                    wait(0.04)
                end
            end
        end
    end

    keySubmitButton.MouseButton1Click:Connect(submitKey)

    keyBox.FocusLost:Connect(function(enterPressed)
        if enterPressed then
            submitKey()
        end
    end)

    keyCloseButton.MouseButton1Click:Connect(function()
        keyGui:Destroy()
    end)
end
