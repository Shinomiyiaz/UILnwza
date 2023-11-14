do local ui = game.CoreGui:FindFirstChild("ScreenLnw") if ui then ui:Destroy() end end

local UIS = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")

local function MakeDraggable(topobj, object)
	local Dragging = nil
	local DragInput = nil
	local DragStart = nil
	local StartPos = nil

	local function Update(input)
		local Delta = input.Position - DragStart
		local pos =
			UDim2.new(
				StartPos.X.Scale,
				StartPos.X.Offset + Delta.X,
				StartPos.Y.Scale,
				StartPos.Y.Offset + Delta.Y
			)
		-- local Tween = TweenService:Create(object, TweenInfo.new(0.2), {Position = pos})
		-- Tween:Play()
        object.Position = pos
	end

	topobj.InputBegan:Connect(
		function(input)
			if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
				Dragging = true
				DragStart = input.Position
				StartPos = object.Position

				input.Changed:Connect(
					function()
						if input.UserInputState == Enum.UserInputState.End then
							Dragging = false
						end
					end
				)
			end
		end
	)

	topobj.InputChanged:Connect(
		function(input)
			if
				input.UserInputType == Enum.UserInputType.MouseMovement or
				input.UserInputType == Enum.UserInputType.Touch
			then
				DragInput = input
			end
		end
	)

	UIS.InputChanged:Connect(
		function(input)
			if input == DragInput and Dragging then
				Update(input)
			end
		end
	)
end

local lib = {}
function lib:Window(name,description)
    local isselected = false
    local uiclosed = false

    local Screen = Instance.new("ScreenGui")
    Screen.Name = "ScreenLnw"
    Screen.Parent = game.CoreGui
    
    local Main = Instance.new("Frame")
    Main.Name = "Main"
    Main.Parent = Screen
    Main.AnchorPoint = Vector2.new(0.5, 0.5)
    Main.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Main.BackgroundTransparency = 0.500
    Main.BorderColor3 = Color3.fromRGB(0, 0, 0)
    Main.BorderSizePixel = 0
    Main.ClipsDescendants = true
    Main.Position = UDim2.new(0.5, 0, 0.5, 0)
    Main.Size = UDim2.new(0, 600, 0, 350)

    local UICorner = Instance.new("UICorner")
    UICorner.CornerRadius = UDim.new(0, 5)
    UICorner.Parent = Main

    local Top = Instance.new("Frame")
    Top.Name = "Top"
    Top.Parent = Main
    Top.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Top.BackgroundTransparency = 1.000
    Top.BorderColor3 = Color3.fromRGB(0, 0, 0)
    Top.BorderSizePixel = 0
    Top.Size = UDim2.new(1, 0, 0, 30)

    local Tabs = Instance.new("Frame")
    Tabs.Name = "Tabs"
    Tabs.Parent = Main
    Tabs.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Tabs.BackgroundTransparency = 1.000
    Tabs.BorderColor3 = Color3.fromRGB(0, 0, 0)
    Tabs.BorderSizePixel = 0
    Tabs.Size = UDim2.new(0, 225, 1, 0)
    Tabs.ZIndex = 0

    local TabScroll = Instance.new("ScrollingFrame")
    TabScroll.Name = "TabScroll"
    TabScroll.Parent = Tabs
    TabScroll.Active = true
    TabScroll.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    TabScroll.BackgroundTransparency = 1.000
    TabScroll.BorderColor3 = Color3.fromRGB(0, 0, 0)
    TabScroll.BorderSizePixel = 0
    TabScroll.Position = UDim2.new(0, 0, 0, 50)
    TabScroll.Size = UDim2.new(0, 225, 1, -50)
    TabScroll.ScrollBarThickness = 0

    local TabList = Instance.new("UIListLayout")
    TabList.Name = "TabList"
    TabList.Parent = TabScroll
    TabList.SortOrder = Enum.SortOrder.LayoutOrder
    TabList.Padding = UDim.new(0, 5)

    local TabPadd = Instance.new("UIPadding")
    TabPadd.Name = "TabPadd"
    TabPadd.Parent = TabScroll
    TabPadd.PaddingLeft = UDim.new(0, 10)
    TabPadd.PaddingTop = UDim.new(0, 10)

    local NameHub = Instance.new("TextLabel")
    NameHub.Name = "NameHub"
    NameHub.Parent = Tabs
    NameHub.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    NameHub.BackgroundTransparency = 1.000
    NameHub.BorderColor3 = Color3.fromRGB(0, 0, 0)
    NameHub.BorderSizePixel = 0
    NameHub.Position = UDim2.new(0, 0, 0, 10)
    NameHub.Size = UDim2.new(0, 130, 0, 20)
    NameHub.Font = Enum.Font.GothamBold
    NameHub.Text = name or "MARU HUB"
    NameHub.TextColor3 = Color3.fromRGB(25, 25, 25)
    NameHub.TextSize = 20.000
    
    local Desc = Instance.new("TextLabel")
    Desc.Name = "Desc"
    Desc.Parent = Tabs
    Desc.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Desc.BackgroundTransparency = 1.000
    Desc.BorderColor3 = Color3.fromRGB(0, 0, 0)
    Desc.BorderSizePixel = 0
    Desc.Position = UDim2.new(0, 14, 0.0670000017, 5)
    Desc.Size = UDim2.new(0, 208, 0, 20)
    Desc.Font = Enum.Font.GothamMedium
    Desc.Text = "[ "..description.." ]" or "[ 2 Years Anniversary Version ]"
    Desc.TextColor3 = Color3.fromRGB(0, 0, 0)
    Desc.TextSize = 11.000
    Desc.TextTransparency = 0.500
    Desc.TextXAlignment = Enum.TextXAlignment.Left

    local Page = Instance.new("Frame")
    Page.Name = "Page"
    Page.Parent = Main
    Page.Active = true
    Page.BackgroundColor3 = Color3.fromRGB(225, 225, 225)
    Page.BackgroundTransparency = 0.250
    Page.BorderColor3 = Color3.fromRGB(0, 0, 0)
    Page.BorderSizePixel = 0
    Page.ClipsDescendants = true
    Page.Position = UDim2.new(0, 225, 0, 0)
    Page.Size = UDim2.new(0, 375, 1, 0)
    Page.ZIndex = 0

    local UICorner_4 = Instance.new("UICorner")
    UICorner_4.CornerRadius = UDim.new(0, 5)
    UICorner_4.Parent = Page

    local PagesFolder = Instance.new("Folder")
    PagesFolder.Name = "PagesFolder"
    PagesFolder.Parent = Page
    
    local UIPadding_6 = Instance.new("UIPadding")
    UIPadding_6.Parent = Page
    UIPadding_6.PaddingTop = UDim.new(0, 30)
    
    local TopPage = Instance.new("Frame")
    TopPage.Name = "TopPage"
    TopPage.Parent = Page
    TopPage.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    TopPage.BackgroundTransparency = 0.250
    TopPage.BorderColor3 = Color3.fromRGB(0, 0, 0)
    TopPage.BorderSizePixel = 0
    TopPage.Position = UDim2.new(0, 0, 0, -30)
    TopPage.Size = UDim2.new(1, 0, 0, 30)

    local UICorner_18 = Instance.new("UICorner")
    UICorner_18.CornerRadius = UDim.new(0, 5)
    UICorner_18.Parent = TopPage
    
    MakeDraggable(Top, Main)

    UIS.InputBegan:Connect(function(input)
        if input.KeyCode == Enum.KeyCode.F4 then
            if uiclosed == false then
                uiclosed = true
                TweenService:Create(
                    Main,
                    TweenInfo.new(0.3,Enum.EasingStyle.Back,Enum.EasingDirection.In),
                    {Size = UDim2.new(0, 0, 0, 0)}
                ):Play()
            else
                uiclosed = false
                TweenService:Create(
                    Main,
                    TweenInfo.new(0.3,Enum.EasingStyle.Back,Enum.EasingDirection.Out),
                    {Size = UDim2.new(0, 650, 0, 350)}
                ):Play()
                repeat wait() until Main.Size == UDim2.new(0, 650, 0, 350)
            end
        end
    end)

    local tab = {}
    function tab:Tab(title,Desc,image)
        local TabButton = Instance.new("Frame")
        TabButton.Name = "TabButton"
        TabButton.Parent = TabScroll
        TabButton.BackgroundColor3 = Color3.fromRGB(10, 120, 255)
        TabButton.BackgroundTransparency = 1 -- 0.25
        TabButton.BorderColor3 = Color3.fromRGB(0, 0, 0)
        TabButton.BorderSizePixel = 0
        TabButton.Size = UDim2.new(1, -10, 0, 25)

        local UICorner_2 = Instance.new("UICorner")
        UICorner_2.CornerRadius = UDim.new(0, 5)
        UICorner_2.Parent = TabButton

        local TabImage = Instance.new("ImageLabel")
        TabImage.Name = "TabImage"
        TabImage.Parent = TabButton
        TabImage.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        TabImage.BackgroundTransparency = 1.000
        TabImage.BorderColor3 = Color3.fromRGB(0, 0, 0)
        TabImage.BorderSizePixel = 0
        TabImage.Position = UDim2.new(0, 5, 0, 4)
        TabImage.Size = UDim2.new(0, 16, 0, 16)
        TabImage.Image = "rbxassetid://"..tostring(image) or "6034837807"
        TabImage.ImageTransparency = 0.250
        TabImage.ImageColor3 = Color3.fromRGB(10, 120, 255)

        local TabBTN = Instance.new("TextButton")
        TabBTN.Name = "TabBTN"
        TabBTN.Parent = TabButton
        TabBTN.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        TabBTN.BackgroundTransparency = 1.000
        TabBTN.BorderColor3 = Color3.fromRGB(0, 0, 0)
        TabBTN.BorderSizePixel = 0
        TabBTN.Position = UDim2.new(0, 30, 0, 0)
        TabBTN.Size = UDim2.new(1, -30, 1, 0)
        TabBTN.Font = Enum.Font.Gotham
        TabBTN.Text = title
        TabBTN.TextColor3 = Color3.fromRGB(0, 0, 0)
        TabBTN.TextSize = 12.000
        TabBTN.TextTransparency = 0.250
        TabBTN.TextXAlignment = Enum.TextXAlignment.Left

        local PageInv = Instance.new("Frame")
        PageInv.Name = "PageInv"
        PageInv.Parent = PagesFolder
        PageInv.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        PageInv.BackgroundTransparency = 1.000
        PageInv.BorderColor3 = Color3.fromRGB(0, 0, 0)
        PageInv.BorderSizePixel = 0
        PageInv.ClipsDescendants = true
        PageInv.Size = UDim2.new(1, 0, 1, 0)
        PageInv.ZIndex = 0
        PageInv.Visible = false
        
        local LeftRight = Instance.new("UIListLayout")
        LeftRight.Name = "LeftRight"
        LeftRight.Parent = PageInv
        LeftRight.FillDirection = Enum.FillDirection.Horizontal
        LeftRight.SortOrder = Enum.SortOrder.LayoutOrder

        local Left = Instance.new("ScrollingFrame")
        Left.Name = "Left"
        Left.Parent = PageInv
        Left.Active = true
        Left.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        Left.BackgroundTransparency = 1.000
        Left.BorderColor3 = Color3.fromRGB(0, 0, 0)
        Left.BorderSizePixel = 0
        Left.Size = UDim2.new(0.5, 0, 1, 0)
        Left.ScrollBarThickness = 0

        local LeftPadding = Instance.new("UIPadding")
        LeftPadding.Parent = Left
        LeftPadding.PaddingLeft = UDim.new(0, 10)
        LeftPadding.PaddingTop = UDim.new(0, 10)

        local LeftListLayout = Instance.new("UIListLayout")
        LeftListLayout.Parent = Left
        LeftListLayout.FillDirection = Enum.FillDirection.Vertical
        LeftListLayout.SortOrder = Enum.SortOrder.LayoutOrder
        LeftListLayout.Padding = UDim.new(0, 5)

        local Right = Instance.new("ScrollingFrame")
        Right.Name = "Right"
        Right.Parent = PageInv
        Right.Active = true
        Right.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        Right.BackgroundTransparency = 1.000
        Right.BorderColor3 = Color3.fromRGB(0, 0, 0)
        Right.BorderSizePixel = 0
        Right.Size = UDim2.new(0.5, 0, 1, 0)
        Right.ScrollBarThickness = 0

        local RightListLayout = Instance.new("UIListLayout")
        RightListLayout.Parent = Right
        RightListLayout.FillDirection = Enum.FillDirection.Vertical
        RightListLayout.SortOrder = Enum.SortOrder.LayoutOrder
        RightListLayout.Padding = UDim.new(0, 5)

        local RightPadding = Instance.new("UIPadding")
        RightPadding.Parent = Right
        RightPadding.PaddingLeft = UDim.new(0, 10)
        RightPadding.PaddingTop = UDim.new(0, 10)

        local TopPAGE = Instance.new("Frame")
        TopPAGE.Name = "TopPAGE"
        TopPAGE.Parent = TopPage
        TopPAGE.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        TopPAGE.BackgroundTransparency = 1
        TopPAGE.BorderColor3 = Color3.fromRGB(0, 0, 0)
        TopPAGE.BorderSizePixel = 0
        TopPAGE.Position = UDim2.new(0, 0, 0, 0)
        TopPAGE.Size = UDim2.new(1, 0, 1, 0)
        TopPAGE.Visible = false

        local PageImage = Instance.new("ImageLabel")
        PageImage.Name = "PageImage"
        PageImage.Parent = TopPAGE
        PageImage.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        PageImage.BackgroundTransparency = 1.000
        PageImage.BorderColor3 = Color3.fromRGB(0, 0, 0)
        PageImage.BorderSizePixel = 0
        PageImage.Position = UDim2.new(0, 7, 0, 3)
        PageImage.Size = UDim2.new(0, 24, 0, 24)
        PageImage.Image = "rbxassetid://"..tostring(image) or "6034837807"
        PageImage.ImageColor3 = Color3.fromRGB(10, 120, 255)

        local PageTitle = Instance.new("TextLabel")
        PageTitle.Name = "PageTitle"
        PageTitle.Parent = TopPAGE
        PageTitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        PageTitle.BackgroundTransparency = 1.000
        PageTitle.BorderColor3 = Color3.fromRGB(0, 0, 0)
        PageTitle.BorderSizePixel = 0
        PageTitle.Position = UDim2.new(0, 40, 0, 0)
        PageTitle.Size = UDim2.new(0, 125, 1, 0)
        PageTitle.Font = Enum.Font.GothamMedium
        PageTitle.Text = title
        PageTitle.TextColor3 = Color3.fromRGB(0, 0, 0)
        PageTitle.TextSize = 15.000
        PageTitle.TextWrapped = true
        PageTitle.TextXAlignment = Enum.TextXAlignment.Left
        
        local PageDesc = Instance.new("TextLabel")
        PageDesc.Name = "PageDesc"
        PageDesc.Parent = TopPAGE
        PageDesc.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        PageDesc.BackgroundTransparency = 1.000
        PageDesc.BorderColor3 = Color3.fromRGB(0, 0, 0)
        PageDesc.BorderSizePixel = 0
        PageDesc.Position = UDim2.new(1, -210, 0, 0)
        PageDesc.Size = UDim2.new(0, 200, 0, 30)
        PageDesc.Font = Enum.Font.GothamMedium
        PageDesc.Text = Desc
        PageDesc.TextColor3 = Color3.fromRGB(0, 0, 0)
        PageDesc.TextSize = 9.000
        PageDesc.TextTransparency = 0.250
        PageDesc.TextWrapped = true
        PageDesc.TextXAlignment = Enum.TextXAlignment.Left

        LeftListLayout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
            Left.CanvasSize = UDim2.new(0, 0, 0, LeftListLayout.AbsoluteContentSize.Y + 5)
        end)

        RightListLayout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
            Right.CanvasSize = UDim2.new(0, 0, 0, RightListLayout.AbsoluteContentSize.Y + 5)
        end)

        if isselected == false then
            for i,v in next,PagesFolder:GetChildren() do
                if v.Name == "PageInv" then
                    v.Visible = false
                end
                PageInv.Visible = true
            end
            for i,v in next,TabScroll:GetChildren() do
                if v.Name == "TabButton" then
                    v.TabImage.ImageColor3 = Color3.fromRGB(10, 120, 255)
                    v.TabBTN.TextColor3 = Color3.fromRGB(0,0,0)
                    TweenService:Create(
                        v,
                        TweenInfo.new(0.3,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
                        {BackgroundTransparency = 1}
                    ):Play()
                end
                TabImage.ImageColor3 = Color3.fromRGB(255, 255, 255)
                TabBTN.TextColor3 = Color3.fromRGB(255, 255, 255)
                TweenService:Create(
                    TabButton,
                    TweenInfo.new(0.3,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
                    {BackgroundTransparency = 0.25}
                ):Play()
            end
            for i,v in next,TopPage:GetChildren() do
                if v.Name == "TopPAGE" then
                    v.Visible = false
                end
                TopPAGE.Visible = true
            end
            isselected = true
        end

        TabBTN.MouseButton1Click:Connect(function()
            for i,v in next,PagesFolder:GetChildren() do
                if v.Name == "PageInv" then
                    v.Visible = false
                end
                PageInv.Visible = true
            end
            for i,v in next,TabScroll:GetChildren() do
                if v.Name == "TabButton" then
                    v.TabImage.ImageColor3 = Color3.fromRGB(10, 120, 255)
                    v.TabBTN.TextColor3 = Color3.fromRGB(0,0,0)
                    TweenService:Create(
                        v,
                        TweenInfo.new(0.3,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
                        {BackgroundTransparency = 1}
                    ):Play()
                end
                TabImage.ImageColor3 = Color3.fromRGB(255, 255, 255)
                TabBTN.TextColor3 = Color3.fromRGB(255, 255, 255)
                TweenService:Create(
                    TabButton,
                    TweenInfo.new(0.3,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
                    {BackgroundTransparency = 0.25}
                ):Play()
            end
            for i,v in next,TopPage:GetChildren() do
                if v.Name == "TopPAGE" then
                    v.Visible = false
                end
                TopPAGE.Visible = true
            end
        end)

        local sect = {}
        function sect:Section(Side)
            local Section = Instance.new("Frame")
            Section.Name = "Section"
            if Side == "Left" then
                Section.Parent = Left
            end
            if Side == "Right" then
                Section.Parent = Right
            end
            Section.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            Section.BackgroundTransparency = 0.500
            Section.BorderColor3 = Color3.fromRGB(0, 0, 0)
            Section.BorderSizePixel = 0

            local UIPadding_2 = Instance.new("UIPadding")
            UIPadding_2.Parent = Section
            UIPadding_2.PaddingLeft = UDim.new(0, 10)
            UIPadding_2.PaddingTop = UDim.new(0, 10)

            local UIListLayout_2 = Instance.new("UIListLayout")
            UIListLayout_2.Parent = Section
            UIListLayout_2.SortOrder = Enum.SortOrder.LayoutOrder
            UIListLayout_2.Padding = UDim.new(0, 5)
            
            UIListLayout_2:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
                Section.Size = UDim2.new(1, -10, 0, UIListLayout_2.AbsoluteContentSize.Y + 20)
            end)

            local main = {}

            function main:Button(text,callback)
                local ActualTypes = {
                    Circle = "ImageLabel"
                }
                
                local Properties = {
                    Circle = {
                        BackgroundTransparency = 1,
                        Image = "http://www.roblox.com/asset/?id=5554831670"
                    }
                }
                
                local Types = {
                    "Circle"
                }
                
                function FindType(String)
                    for _, Type in next, Types do
                        if Type:sub(1, #String):lower() == String:lower() then
                            return Type
                        end
                    end
                    return false
                end
                
                local Objects = {}
                
                function Objects.new(Type)
                    local TargetType = FindType(Type)
                    if TargetType then
                        local NewImage = Instance.new(ActualTypes[TargetType])
                        if Properties[TargetType] then
                            for Property, Value in next, Properties[TargetType] do
                                NewImage[Property] = Value
                            end
                        end
                        return NewImage
                    else
                        return Instance.new(Type)
                    end
                end
                
                local function GetXY(GuiObject)
                    local Mouse = game.Players.LocalPlayer:GetMouse()
                    local Max, May = GuiObject.AbsoluteSize.X, GuiObject.AbsoluteSize.Y
                    local Px, Py = math.clamp(Mouse.X - GuiObject.AbsolutePosition.X, 0, Max), math.clamp(Mouse.Y - GuiObject.AbsolutePosition.Y, 0, May)
                    return Px/Max, Py/May
                end
                
                local function CircleAnim(GuiObject, EndColour, StartColour)
                    local PX, PY = GetXY(GuiObject)
                    local Circle = Objects.new("Circle")
                    Circle.Size = UDim2.fromScale(0,0)
                    Circle.Position = UDim2.fromScale(PX,PY)
                    Circle.ImageColor3 = StartColour or GuiObject.ImageColor3
                    Circle.ZIndex = 200
                    Circle.Parent = GuiObject
                    local Size = GuiObject.AbsoluteSize.X
                    TweenService:Create(Circle, TweenInfo.new(0.4), {Position = UDim2.fromScale(PX,PY) - UDim2.fromOffset(Size/2,Size/2), ImageTransparency = 1, ImageColor3 = EndColour, Size = UDim2.fromOffset(Size,Size)}):Play()
                    task.spawn(function()
                        wait(0.4)
                        Circle:Destroy()
                    end)
                end

                local Button = Instance.new("TextButton")
                Button.Name = "Button"
                Button.Parent = Section
                Button.BackgroundColor3 = Color3.fromRGB(10, 120, 255)
                Button.BackgroundTransparency = 0.250
                Button.Size = UDim2.new(1, -10, 0, 25)
                Button.AutoButtonColor = false
                Button.Font = Enum.Font.GothamMedium
                Button.Text = text
                Button.TextColor3 = Color3.fromRGB(255, 255, 255)
                Button.TextSize = 10.000
                Button.TextTransparency = 0.250
                Button.ClipsDescendants = true

                local UICorner_10 = Instance.new("UICorner")
                UICorner_10.CornerRadius = UDim.new(0, 5)
                UICorner_10.Parent = Button

                Button.MouseButton1Click:Connect(function()
                    CircleAnim(Button, Color3.fromRGB(255, 255, 255), Color3.fromRGB(255, 255, 255))
                    callback()
                end)
            end
            function main:Toggle(text,default,callback)
                local istoggled = default or false

                local Toggle = Instance.new("TextButton")
                Toggle.Name = "Toggle"
                Toggle.Parent = Section
                Toggle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                Toggle.BackgroundTransparency = 1.000
                Toggle.BorderColor3 = Color3.fromRGB(0, 0, 0)
                Toggle.BorderSizePixel = 0
                Toggle.Size = UDim2.new(1, -10, 0, 25)
                Toggle.Font = Enum.Font.SourceSans
                Toggle.Text = ""
                Toggle.TextColor3 = Color3.fromRGB(0, 0, 0)
                Toggle.TextSize = 14.000

                local ToggleTitle = Instance.new("TextLabel")
                ToggleTitle.Name = "ToggleTitle"
                ToggleTitle.Parent = Toggle
                ToggleTitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                ToggleTitle.BackgroundTransparency = 1.000
                ToggleTitle.BorderColor3 = Color3.fromRGB(0, 0, 0)
                ToggleTitle.BorderSizePixel = 0
                ToggleTitle.Position = UDim2.new(0, 10, 0, 0)
                ToggleTitle.Size = UDim2.new(1, -50, 0, 25)
                ToggleTitle.Font = Enum.Font.GothamMedium
                ToggleTitle.Text = text
                ToggleTitle.TextColor3 = Color3.fromRGB(25, 25, 25)
                ToggleTitle.TextSize = 10.000
                ToggleTitle.TextTransparency = 0.250
                ToggleTitle.TextXAlignment = Enum.TextXAlignment.Left

                local Image = Instance.new("Frame")
                Image.Name = "Image"
                Image.Parent = Toggle
                Image.BackgroundColor3 = Color3.fromRGB(214, 75, 50)
                Image.BackgroundTransparency = 0.250
                Image.BorderColor3 = Color3.fromRGB(0, 0, 0)
                Image.BorderSizePixel = 0
                Image.Position = UDim2.new(1, -40, 0, 0)
                Image.Size = UDim2.new(0, 40, 0, 25)

                local UICorner_6 = Instance.new("UICorner")
                UICorner_6.CornerRadius = UDim.new(0, 5)
                UICorner_6.Parent = Image
                
                local White = Instance.new("Frame")
                White.Name = "White"
                White.Parent = Image
                White.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                White.BackgroundTransparency = 0.250
                White.BorderColor3 = Color3.fromRGB(0, 0, 0)
                White.BorderSizePixel = 0
                White.Position = UDim2.new(0, 2, 0, 2)
                White.Size = UDim2.new(0, 21, 0, 21)
                
                local UICorner_7 = Instance.new("UICorner")
                UICorner_7.CornerRadius = UDim.new(0, 5)
                UICorner_7.Parent = White
                
                if default == true then
                    TweenService:Create(
                        White,
                        TweenInfo.new(0.3,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
                        {Position = UDim2.new(1, -23, 0, 2)}
                    ):Play()
                    TweenService:Create(
                        Image,
                        TweenInfo.new(0.3,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
                        {BackgroundColor3 = Color3.fromRGB(62, 214, 54)}
                    ):Play()
                    pcall(callback,istoggled)
                end

                Toggle.MouseButton1Click:Connect(function()
                    if istoggled == false then
                        TweenService:Create(
                            White,
                            TweenInfo.new(0.3,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
                            {Position = UDim2.new(1, -23, 0, 2)}
                        ):Play()
                        TweenService:Create(
                            Image,
                            TweenInfo.new(0.3,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
                            {BackgroundColor3 = Color3.fromRGB(62, 214, 54)}
                        ):Play()
                    else
                        TweenService:Create(
                            White,
                            TweenInfo.new(0.3,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
                            {Position = UDim2.new(0, 2, 0, 2)}
                        ):Play()
                        TweenService:Create(
                            Image,
                            TweenInfo.new(0.3,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
                            {BackgroundColor3 = Color3.fromRGB(214, 75, 50)}
                        ):Play()
                    end
                    istoggled = not istoggled
                    pcall(callback,istoggled)
                end)
            end
            function main:Dropdown(text,default,multi,option,callback)
                local dropclicked = false
                local count = 0
                if multi then
                    Multi = {}
                end
                local drop = {}
                drop.values = {}
                local DropSize = 25

                local Dropdown = Instance.new("Frame")
                Dropdown.Name = "Dropdown"
                Dropdown.Parent = Section
                Dropdown.Active = true
                Dropdown.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                Dropdown.BackgroundTransparency = 1.000
                Dropdown.BorderColor3 = Color3.fromRGB(0, 0, 0)
                Dropdown.BorderSizePixel = 0
                Dropdown.ClipsDescendants = true
                Dropdown.Position = UDim2.new(0, 0, 0.374111772, 0)
                Dropdown.Size = UDim2.new(1, -10, 0, 25)
                
                local DropFrame = Instance.new("TextButton")
                DropFrame.Name = "DropFrame"
                DropFrame.Parent = Dropdown
                DropFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                DropFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
                DropFrame.BorderSizePixel = 0
                DropFrame.Size = UDim2.new(1, 0, 0, 25)
                DropFrame.AutoButtonColor = false
                DropFrame.Font = Enum.Font.SourceSans
                DropFrame.Text = ""
                DropFrame.TextColor3 = Color3.fromRGB(0, 0, 0)
                DropFrame.TextSize = 14.000

                local UICorner_11 = Instance.new("UICorner")
                UICorner_11.CornerRadius = UDim.new(0, 5)
                UICorner_11.Parent = DropFrame

                local DropTitle = Instance.new("TextLabel")
                DropTitle.Name = "DropTitle"
                DropTitle.Parent = DropFrame
                DropTitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                DropTitle.BackgroundTransparency = 1.000
                DropTitle.BorderColor3 = Color3.fromRGB(0, 0, 0)
                DropTitle.BorderSizePixel = 0
                DropTitle.Position = UDim2.new(0, 10, 0, 0)
                DropTitle.Size = UDim2.new(1, -35, 1, 0)
                DropTitle.Font = Enum.Font.GothamMedium
                DropTitle.Text = text
                DropTitle.TextColor3 = Color3.fromRGB(0, 0, 0)
                DropTitle.TextSize = 10.000
                DropTitle.TextTransparency = 0.250
                DropTitle.TextXAlignment = Enum.TextXAlignment.Left
                DropTitle.ClipsDescendants = true
                
                local DropImage = Instance.new("ImageLabel")
                DropImage.Name = "DropImage"
                DropImage.Parent = DropFrame
                DropImage.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                DropImage.BackgroundTransparency = 1.000
                DropImage.BorderColor3 = Color3.fromRGB(0, 0, 0)
                DropImage.BorderSizePixel = 0
                DropImage.Position = UDim2.new(1, -23, 0, 3)
                DropImage.Size = UDim2.new(0, 19, 0, 19)
                DropImage.Image = "rbxassetid://6022668911"
                DropImage.ImageColor3 = Color3.fromRGB(0, 0, 0)
                DropImage.ImageTransparency = 0.250

                local Items = Instance.new("ScrollingFrame")
                Items.Name = "Items"
                Items.Parent = Dropdown
                Items.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                Items.BorderColor3 = Color3.fromRGB(0, 0, 0)
                Items.BorderSizePixel = 0
                Items.Position = UDim2.new(0, 0, 0, 30)
                Items.Size = UDim2.new(1, 0, 0, 25)
                Items.CanvasSize = UDim2.new(0, 0, 0, 0)
                Items.ScrollBarThickness = 3

                local UIListLayout_3 = Instance.new("UIListLayout")
                UIListLayout_3.Parent = Items
                UIListLayout_3.SortOrder = Enum.SortOrder.LayoutOrder
                
                function drop:isSelected(item)
                    for i, v in pairs(drop.values) do
                        if v == item then
                            return true
                        end
                    end
                    return false
                end

                function drop:updateText(pp)
                    DropTitle.Text = text.." : "..pp
                end
                drop.Changed = Instance.new("BindableEvent")
                function drop:Set(value)
                    if type(value) == "table" then
                        drop.values = value
                        drop:updateText(table.concat(value, ", "))
                        pcall(callback, value)
                    else
                        drop.values = {
                            value
                        }
                        drop:updateText(value)
                        pcall(callback, value)
                    end
                    drop.Changed:Fire(value)
                end

                if default then
                    drop:Set(default)
                end
                function drop:Clear()
                    DropSize = 25
                    if drop.values ~= nil and drop.values ~= "" then
                        if typeof(drop.values) == "table" then
                            DropTitle.Text = text.." : "..table.concat(drop.values, ", ")
                        else
                            DropTitle.Text = text.." : "..tostring(drop.values or "N/A")
                        end
                    else
                        DropTitle.Text = text.." : ".."N/A"
                    end
                    Dropdown.Size = UDim2.new(1,-10,0,25)
                    Items.Size = UDim2.new(1,0,0,25)
                    TweenService:Create(
                        DropImage,
                        TweenInfo.new(0.3,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
                        {Rotation = 0}
                    ):Play()
                    dropclicked = false
                    for i, v in next, Items:GetChildren() do
                        if v:IsA("TextButton") then
                            v:Destroy()
                        end
                    end
                end

                function drop:Add(vv)
                    count = count + 1
                    if count == 1 then
                        DropSize = 25
                    elseif count == 2 then
                        DropSize = 50
                    elseif count == 3 then
                        DropSize = 75
                    elseif count > 3 then
                        DropSize = 100
                    end
    
                    local ItemButton = Instance.new("TextButton")
                    ItemButton.Name = "ItemButton"
                    ItemButton.Parent = Items
                    ItemButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                    ItemButton.BackgroundTransparency = 0
                    ItemButton.BorderColor3 = Color3.fromRGB(0, 0, 0)
                    ItemButton.BorderSizePixel = 0
                    ItemButton.Size = UDim2.new(1, 0, 0, 25)
                    ItemButton.AutoButtonColor = false
                    ItemButton.Font = Enum.Font.GothamMedium
                    ItemButton.Text = tostring(vv)
                    ItemButton.TextColor3 = Color3.fromRGB(0, 0, 0)
                    ItemButton.TextSize = 11.000
                    ItemButton.TextTransparency = 0.250
                    ItemButton.TextXAlignment = Enum.TextXAlignment.Left

                    local Check = Instance.new("ImageLabel")
                    Check.Name = "Check"
                    Check.Parent = ItemButton
                    Check.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                    Check.BackgroundTransparency = 1.000
                    Check.BorderColor3 = Color3.fromRGB(0, 0, 0)
                    Check.BorderSizePixel = 0
                    Check.Position = UDim2.new(1, -21, 0, 4)
                    Check.Size = UDim2.new(0, 17, 0, 17)
                    Check.Image = "rbxassetid://6031094667"
                    Check.ImageColor3 = Color3.fromRGB(0, 0, 0)
                    Check.ImageTransparency = 1
                    
                    local UIPadding_4 = Instance.new("UIPadding")
                    UIPadding_4.Parent = ItemButton
                    UIPadding_4.PaddingLeft = UDim.new(0, 10)

                    Items.CanvasSize = UDim2.new(0,0,0,UIListLayout_3.AbsoluteContentSize.Y)

                    ItemButton.MouseButton1Click:Connect(function()
                        if multi then
                            if drop:isSelected(tostring(vv)) then
                                for i2, v2 in pairs(drop.values) do
                                    if v2 == vv then
                                        table.remove(drop.values, i2)
                                    end
                                end
                                drop:Set(drop.values)
                            else
                                table.insert(drop.values, vv)
                                drop:Set(drop.values)
                            end
                            return
                        end
                        drop:Set(vv)
                        return
                    end)
                    game:GetService("RunService").Stepped:Connect(function()
                        if multi and drop:isSelected(vv) or drop.values[1] == vv then
                            ItemButton.BackgroundTransparency = 0
                            ItemButton.BackgroundColor3 = Color3.fromRGB(255,255,255)
                            Check.ImageTransparency = 0.25
                        else
                            ItemButton.BackgroundColor3 = Color3.fromRGB(225,225,225)
                            ItemButton.BackgroundTransparency = 0.25
                            Check.ImageTransparency = 1
                        end
                    end)
                end
                for i,v in next,option do
                    count = count + 1
                    if count == 1 then
                        DropSize = 25
                    elseif count == 2 then
                        DropSize = 50
                    elseif count == 3 then
                        DropSize = 75
                    elseif count > 3 then
                        DropSize = 100
                    end
    
                    Items.Size = UDim2.new(1,0,0,DropSize)
                    local ItemButton = Instance.new("TextButton")
                    ItemButton.Name = "ItemButton"
                    ItemButton.Parent = Items
                    ItemButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                    ItemButton.BackgroundTransparency = 0
                    ItemButton.BorderColor3 = Color3.fromRGB(0, 0, 0)
                    ItemButton.BorderSizePixel = 0
                    ItemButton.Size = UDim2.new(1, 0, 0, 25)
                    ItemButton.AutoButtonColor = false
                    ItemButton.Font = Enum.Font.GothamMedium
                    ItemButton.Text = tostring(v)
                    ItemButton.TextColor3 = Color3.fromRGB(0, 0, 0)
                    ItemButton.TextSize = 11.000
                    ItemButton.TextTransparency = 0.250
                    ItemButton.TextXAlignment = Enum.TextXAlignment.Left

                    local Check = Instance.new("ImageLabel")
                    Check.Name = "Check"
                    Check.Parent = ItemButton
                    Check.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                    Check.BackgroundTransparency = 1.000
                    Check.BorderColor3 = Color3.fromRGB(0, 0, 0)
                    Check.BorderSizePixel = 0
                    Check.Position = UDim2.new(1, -21, 0, 4)
                    Check.Size = UDim2.new(0, 17, 0, 17)
                    Check.Image = "rbxassetid://6031094667"
                    Check.ImageColor3 = Color3.fromRGB(0, 0, 0)
                    Check.ImageTransparency = 1
                    
                    local UIPadding_4 = Instance.new("UIPadding")
                    UIPadding_4.Parent = ItemButton
                    UIPadding_4.PaddingLeft = UDim.new(0, 10)

                    Items.CanvasSize = UDim2.new(0,0,0,UIListLayout_3.AbsoluteContentSize.Y)

                    ItemButton.MouseButton1Click:Connect(function()
                        if multi then
                            if drop:isSelected(tostring(v)) then
                                for i2, v2 in pairs(drop.values) do
                                    if v2 == v then
                                        table.remove(drop.values, i2)
                                    end
                                end
                                drop:Set(drop.values)
                            else
                                table.insert(drop.values, v)
                                drop:Set(drop.values)
                            end
                            return
                        end
                        drop:Set(v)
                        if multi and drop:isSelected(v) or drop.values[1] == v then
                            ItemButton.BackgroundTransparency = 0.25
                            Check.ImageTransparency = 1
                        else
                            ItemButton.BackgroundTransparency = 0
                            Check.ImageTransparency = 0.25
                        end
                        return
                    end)
                    game:GetService("RunService").Stepped:Connect(function()
                        if multi and drop:isSelected(v) or drop.values[1] == v then
                            ItemButton.BackgroundTransparency = 0
                            ItemButton.BackgroundColor3 = Color3.fromRGB(255,255,255)
                            Check.ImageTransparency = 0.25
                        else
                            ItemButton.BackgroundColor3 = Color3.fromRGB(225,225,225)
                            ItemButton.BackgroundTransparency = 0.25
                            Check.ImageTransparency = 1
                        end
                    end)
                end
                DropFrame.MouseButton1Click:Connect(function()
                    if dropclicked == false then
                        Dropdown.Size = UDim2.new(1,-10,0,DropSize + 30)
                        TweenService:Create(
                            DropImage,
                            TweenInfo.new(0.3,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
                            {Rotation = -180}
                        ):Play()
                    else
                        Dropdown.Size = UDim2.new(1,-10,0,25)
                        TweenService:Create(
                            DropImage,
                            TweenInfo.new(0.3,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
                            {Rotation = 0}
                        ):Play()
                        --[[TweenService:Create(
                            Dropdown,
                            TweenInfo.new(0.3,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
                            {Size = UDim2.new(1,-5,0,23)}
                        ):Play()
                        TweenService:Create(
                            ImageLabel,
                            TweenInfo.new(0.3,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
                            {Rotation = 0}
                        ):Play()]]
                    end
                    Items.CanvasSize = UDim2.new(0,0,0,UIListLayout_3.AbsoluteContentSize.Y)
                    dropclicked = not dropclicked
                end)

            end
            function main:Slider(text,min,max,set,callback)
                if tonumber(set) > tonumber(max) then
                    set = (max)
                end                
                if tonumber(set) < tonumber(min) then
                    set = (max)
                end
                callback(set)

                local Slide = Instance.new("Frame")
                Slide.Name = "Slide"
                Slide.Parent = Section
                Slide.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                Slide.BorderColor3 = Color3.fromRGB(0, 0, 0)
                Slide.BorderSizePixel = 0
                Slide.Size = UDim2.new(1, -10, 0, 40)
                
                local UICorner_13 = Instance.new("UICorner")
                UICorner_13.CornerRadius = UDim.new(0, 5)
                UICorner_13.Parent = Slide
                
                local SlideTitle = Instance.new("TextLabel")
                SlideTitle.Name = "SlideTitle"
                SlideTitle.Parent = Slide
                SlideTitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                SlideTitle.BorderColor3 = Color3.fromRGB(0, 0, 0)
                SlideTitle.BorderSizePixel = 0
                SlideTitle.Position = UDim2.new(0, 10, 0, 0)
                SlideTitle.Size = UDim2.new(1, -65, 0, 25)
                SlideTitle.Font = Enum.Font.GothamMedium
                SlideTitle.Text = text
                SlideTitle.TextColor3 = Color3.fromRGB(0, 0, 0)
                SlideTitle.TextSize = 10.000
                SlideTitle.TextTransparency = 0.25
                SlideTitle.TextWrapped = true
                SlideTitle.ClipsDescendants = true
                SlideTitle.TextXAlignment = Enum.TextXAlignment.Left
                
                local SlideValue = Instance.new("TextBox")
                SlideValue.Name = "SlideValue"
                SlideValue.Parent = Slide
                SlideValue.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                SlideValue.BorderColor3 = Color3.fromRGB(0, 0, 0)
                SlideValue.BorderSizePixel = 0
                SlideValue.ClipsDescendants = true
                SlideValue.Position = UDim2.new(1, -35, 0, 3)
                SlideValue.Size = UDim2.new(0, 30, 0, 20)
                SlideValue.Font = Enum.Font.GothamMedium
                SlideValue.Text = set
                SlideValue.TextColor3 = Color3.fromRGB(0, 0, 0)
                SlideValue.TextSize = 9.000
                SlideValue.TextTransparency = 0.250
                SlideValue.TextWrapped = true

                local Fill = Instance.new("Frame")
                Fill.Name = "Fill"
                Fill.Parent = Slide
                Fill.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
                Fill.BackgroundTransparency = 0.750
                Fill.BorderColor3 = Color3.fromRGB(0, 0, 0)
                Fill.BorderSizePixel = 0
                Fill.ClipsDescendants = true
                Fill.Position = UDim2.new(0, 5, 1, -12)
                Fill.Size = UDim2.new(1, -10, 0, 8)

                local UICorner_14 = Instance.new("UICorner")
                UICorner_14.CornerRadius = UDim.new(0, 5)
                UICorner_14.Parent = Fill

                local Color = Instance.new("Frame")
                Color.Name = "Color"
                Color.Parent = Fill
                Color.BackgroundColor3 = Color3.fromRGB(10, 120, 255)
                Color.BackgroundTransparency = 0.250
                Color.BorderColor3 = Color3.fromRGB(0, 0, 0)
                Color.BorderSizePixel = 0
                Color.Size = UDim2.new(0, 0, 1, 0)
                
                local UICorner_15 = Instance.new("UICorner")
                UICorner_15.CornerRadius = UDim.new(0, 5)
                UICorner_15.Parent = Color

                Color:TweenSize(UDim2.new((SlideValue.Text or 0) / max, 0, 1, 0), "Out", "Sine", 0.2, true)
                local function move(input)
                    local pos = UDim2.new(
                        math.clamp((input.Position.X - Fill.AbsolutePosition.X) / Fill.AbsoluteSize.X, 0, 1),
                        0,
                        1,
                        0
                    )

                    Color:TweenSize(pos, "Out", "Sine", 0.2, true)
                    local value = math.floor(((pos.X.Scale * max) / max) * (max - min) + min)
                    SlideValue.Text = tostring(value)
                    callback(value)
                end
                local dragging = false
                Fill.InputBegan:Connect(
                    function(input)
                        if input.UserInputType == Enum.UserInputType.MouseButton1 then
                            dragging = true

                        end
                    end
                )
                Fill.InputEnded:Connect(
                    function(input)
                        if input.UserInputType == Enum.UserInputType.MouseButton1 then
                            dragging = false

                        end
                    end
                )
                game:GetService("UserInputService").InputChanged:Connect(function(input)
                    if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
                        move(input)
                    end
                end)

                SlideValue.FocusLost:Connect(function()
                    if SlideValue.Text == "" then
                        SlideValue.Text = set
                    end
                    if tonumber(SlideValue.Text) > max then
                        SlideValue.Text = max
                    end
                    if tonumber(SlideValue.Text) < min then
                        SlideValue.Text = min
                    end
                    Color:TweenSize(UDim2.new((SlideValue.Text or 0) / max, 0, 1, 0), "Out", "Sine", 0.2, true)
                    SlideValue.Text = tostring(SlideValue.Text) -- and math.floor( (SlideValue.Text / max) * (max - min) + min) )
                    pcall(callback, SlideValue.Text)
                end)
            end
            function main:Label(text)
                local label = {}

                local Label = Instance.new("TextLabel")
                Label.Name = "Label"
                Label.Parent = Section
                Label.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                Label.BackgroundTransparency = 1.000
                Label.BorderColor3 = Color3.fromRGB(0, 0, 0)
                Label.BorderSizePixel = 0
                Label.Size = UDim2.new(1, -10, 0, 25)
                Label.Font = Enum.Font.GothamMedium
                Label.Text = text
                Label.TextColor3 = Color3.fromRGB(0, 0, 0)
                Label.TextSize = 10.000
                Label.TextTransparency = 0.250
                
                function label:Set(t)
                    Label.Text = t
                end
                return label
            end
            function main:Line()
                local Line = Instance.new("Frame")
                Line.Name = "Line"
                Line.Parent = Section
                Line.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                Line.BackgroundTransparency = 1.000
                Line.BorderColor3 = Color3.fromRGB(0, 0, 0)
                Line.BorderSizePixel = 0
                Line.Size = UDim2.new(1, -10, 0, 25)
                
                local Facebook = Instance.new("Frame")
                Facebook.Name = "Facebook"
                Facebook.Parent = Line
                Facebook.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
                Facebook.BackgroundTransparency = 0.500
                Facebook.BorderColor3 = Color3.fromRGB(0, 0, 0)
                Facebook.BorderSizePixel = 0
                Facebook.Position = UDim2.new(0, 0, 0.5, 0)
                Facebook.Size = UDim2.new(1, 0, 0, 1)
            end
            function main:Textbox(text,default,callback)
                local Textbox = Instance.new("Frame")
                Textbox.Name = "Textbox"
                Textbox.Parent = Section
                Textbox.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                Textbox.BorderColor3 = Color3.fromRGB(0, 0, 0)
                Textbox.BorderSizePixel = 0
                Textbox.Size = UDim2.new(1, -10, 0, 25)
                
                local UICorner_16 = Instance.new("UICorner")
                UICorner_16.CornerRadius = UDim.new(0, 5)
                UICorner_16.Parent = Textbox

                local TextboxTitle = Instance.new("TextLabel")
                TextboxTitle.Name = "TextboxTitle"
                TextboxTitle.Parent = Textbox
                TextboxTitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                TextboxTitle.BackgroundTransparency = 1.000
                TextboxTitle.BorderColor3 = Color3.fromRGB(0, 0, 0)
                TextboxTitle.BorderSizePixel = 0
                TextboxTitle.Position = UDim2.new(0, 10, 0, 0)
                TextboxTitle.Size = UDim2.new(0, 82, 0, 25)
                TextboxTitle.Font = Enum.Font.GothamMedium
                TextboxTitle.Text = text
                TextboxTitle.TextColor3 = Color3.fromRGB(0, 0, 0)
                TextboxTitle.TextSize = 10.000
                TextboxTitle.TextWrapped = true
                TextboxTitle.TextTransparency = 0.250
                TextboxTitle.TextXAlignment = Enum.TextXAlignment.Left
                TextboxTitle.ClipsDescendants = true
                
                local TextBox = Instance.new("TextBox")
                TextBox.Parent = Textbox
                TextBox.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
                TextBox.BackgroundTransparency = 0.750
                TextBox.BorderColor3 = Color3.fromRGB(0, 0, 0)
                TextBox.BorderSizePixel = 0
                TextBox.Position = UDim2.new(1, -52, 0, 2)
                TextBox.Size = UDim2.new(0, 50, 0, 21)
                TextBox.Font = Enum.Font.GothamMedium
                TextBox.Text = default or ""
                TextBox.TextColor3 = Color3.fromRGB(0, 0, 0)
                TextBox.TextSize = 9.000
                TextBox.TextTransparency = 0.250
                TextBox.ClipsDescendants = true
                
                local UICorner_17 = Instance.new("UICorner")
                UICorner_17.CornerRadius = UDim.new(0, 5)
                UICorner_17.Parent = TextBox

                TextBox.FocusLost:Connect(function()
                    if TextBox.Text == "" then TextBox.Text = set end
                    pcall(callback,TextBox.Text)
                end)
            end
            return main
        end
        return sect
    end
    return tab
end

local win = lib:Window("Maru Hub","New UI Version")
local tab = win:Tab("First Tab","This is a first tab in this ui",6034837807)
local tab2 = win:Tab("Second Tab","This is a second tab in this ui",6034837807)
local sec = tab:Section("Left")
local sec2 = tab:Section("Right")

sec:Label("Example Label")

sec:Button("Get 100000 Robux",function()

end)

sec:Toggle("Is Nino Noob?",false,function(value)

end)

sec:Line()

sec:Textbox("Send me your Password","Password",function(value)

end)

sec:Slider("How old are you?",1,50,999,function(value)

end)

local DropTable = {
    1;2;3;
}

local Drop = sec2:Dropdown("Dropdown",3,false,DropTable,function(value)

end)

sec2:Button("Clear",function()
    Drop:Clear()
end)

sec2:Button("Add",function()
    for i,v in next,DropTable do
        Drop:Add(v)
    end
end)

MultiTest = {
    1;2;3;4;5;6;7;8;9;0;
}

_G.Multi = {5;3;2}

local Drop = sec2:Dropdown("Multi Dropdown",_G.Multi,true,MultiTest,function(value)
    _G.Multi = value
end)

sec2:Button("Show Multi",function()
    print(unpack(_G.Multi))
end)
