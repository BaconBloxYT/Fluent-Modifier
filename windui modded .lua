local a
a = {
    cache = {},
    load = function(b)
        if not a.cache[b] then
            a.cache[b] = {c = a[b]()}
        end
        return a.cache[b].c
    end
}
do
    function a.a()
        return {
            Primary = Color3.fromHex "#0091FF",
            White = Color3.new(1, 1, 1),
            Black = Color3.new(0, 0, 0),
            Dialog = "Accent",
            Background = "Accent",
            BackgroundTransparency = 0,
            Hover = "Text",
            WindowBackground = "Background",
            WindowShadow = "Black",
            WindowTopbarTitle = "Text",
            WindowTopbarAuthor = "Text",
            WindowTopbarIcon = "Icon",
            WindowTopbarButtonIcon = "Icon",
            TabBackground = "Hover",
            TabTitle = "Text",
            TabIcon = "Icon",
            ElementBackground = "Text",
            ElementTitle = "Text",
            ElementDesc = "Text",
            ElementIcon = "Icon",
            PopupBackground = "Background",
            PopupBackgroundTransparency = "BackgroundTransparency",
            PopupTitle = "Text",
            PopupContent = "Text",
            PopupIcon = "Icon",
            DialogBackground = "Background",
            DialogBackgroundTransparency = "BackgroundTransparency",
            DialogTitle = "Text",
            DialogContent = "Text",
            DialogIcon = "Icon",
            Toggle = "Button",
            ToggleBar = "White",
            Checkbox = "Primary",
            CheckboxIcon = "White",
            Slider = "Primary",
            SliderThumb = "White",
            SliderIconFrom = Color3.fromHex "#908F95",
            SliderIconTo = Color3.fromHex "#908F95",
            Tooltip = Color3.fromHex "4C4C4C",
            TooltipText = "White",
            TooltipSecondary = "Primary",
            TooltipSecondaryText = "White"
        }
    end
    function a.b()
        local b = (cloneref or clonereference or function(b)
                return b
            end)

        local d = b(game:GetService("RunService"))
        local e = b(game:GetService("UserInputService"))
        local f = b(game:GetService("TweenService"))
        local g = b(game:GetService("LocalizationService"))
        local h = b(game:GetService("HttpService"))
        local i = d.Heartbeat

        local j = "https://raw.githubusercontent.com/Footagesus/Icons/main/Main-v2.lua"

        local l_content
        if game.HttpGet then 
            l_content = game:HttpGet(j)
        else
            l_content = h:GetAsync(j)
        end

        local l = loadstring(l_content)()
        l.SetIconsType("lucide")

        local m

        local p = {
            Font = "rbxassetid://12187365364",
            Localization = nil,
            CanDraggable = true,
            Theme = nil,
            Themes = nil,
            Icons = l,
            Signals = {},
            Objects = {},
            LocalizationObjects = {},
            FontObjects = {},
            Language = string.match(g.SystemLocaleId, "^[a-z]+"),
            Request = http_request or (syn and syn.request) or request or (function(req) return {Body = h:GetAsync(req.Url)} end),
            DefaultProperties = {
                ScreenGui = {
                    ResetOnSpawn = false,
                    ZIndexBehavior = "Sibling"
                },
                CanvasGroup = {
                    BorderSizePixel = 0,
                    BackgroundColor3 = Color3.new(1, 1, 1)
                },
                Frame = {
                    BorderSizePixel = 0,
                    BackgroundColor3 = Color3.new(1, 1, 1)
                },
                TextLabel = {
                    BackgroundColor3 = Color3.new(1, 1, 1),
                    BorderSizePixel = 0,
                    Text = "",
                    RichText = true,
                    TextColor3 = Color3.new(1, 1, 1),
                    TextSize = 14
                },
                TextButton = {
                    BackgroundColor3 = Color3.new(1, 1, 1),
                    BorderSizePixel = 0,
                    Text = "",
                    AutoButtonColor = false,
                    TextColor3 = Color3.new(1, 1, 1),
                    TextSize = 14
                },
                TextBox = {
                    BackgroundColor3 = Color3.new(1, 1, 1),
                    BorderColor3 = Color3.new(0, 0, 0),
                    ClearTextOnFocus = false,
                    Text = "",
                    TextColor3 = Color3.new(0, 0, 0),
                    TextSize = 14
                },
                ImageLabel = {
                    BackgroundTransparency = 1,
                    BackgroundColor3 = Color3.new(1, 1, 1),
                    BorderSizePixel = 0
                },
                ImageButton = {
                    BackgroundColor3 = Color3.new(1, 1, 1),
                    BorderSizePixel = 0,
                    AutoButtonColor = false
                },
                UIListLayout = {
                    SortOrder = "LayoutOrder"
                },
                ScrollingFrame = {
                    ScrollBarImageTransparency = 1,
                    BorderSizePixel = 0
                },
                VideoFrame = {
                    BorderSizePixel = 0
                }
            },
            Colors = {
                Red = "#e53935",
                Orange = "#f57c00",
                Green = "#43a047",
                Blue = "#039be5",
                White = "#ffffff",
                Grey = "#484848"
            },
            ThemeFallbacks = a.load "a",
            Shapes = {
                Square = "rbxassetid://82909646051652",
                ["Square-Outline"] = "rbxassetid://72946211851948",
                Squircle = "rbxassetid://80999662900595",
                SquircleOutline = "rbxassetid://117788349049947",
                ["Squircle-Outline"] = "rbxassetid://117817408534198",
                SquircleOutline2 = "rbxassetid://117817408534198",
                ["Shadow-sm"] = "rbxassetid://84825982946844",
                ["Squircle-TL-TR"] = "rbxassetid://73569156276236",
                ["Squircle-BL-BR"] = "rbxassetid://93853842912264",
                ["Squircle-TL-TR-Outline"] = "rbxassetid://136702870075563",
                ["Squircle-BL-BR-Outline"] = "rbxassetid://75035847706564"
            }
        }

        function p.Init(r)
            m = r
        end

        function p.AddSignal(r, u)
            local v = r:Connect(u)
            table.insert(p.Signals, v)
            return v
        end

        function p.DisconnectAll()
            for r, u in next, p.Signals do
                local v = table.remove(p.Signals, r)
                v:Disconnect()
            end
        end

        function p.SafeCallback(r, ...)
            if not r then
                return
            end

            local u, v = pcall(r, ...)
            if not u then
                if m and m.Window and m.Window.Debug then
                    local x, z = v:find ":%d+: "

                    warn("[ WindUI: DEBUG Mode ] " .. v)

                    return m:Notify {
                        Title = "DEBUG Mode: Error",
                        Content = not z and v or v:sub(z + 1),
                        Duration = 8
                    }
                end
            end
        end

        function p.Gradient(r, u)
            if m and m.Gradient then
                return m:Gradient(r, u)
            end

            local v = {}
            local x = {}

            for z, A in next, r do
                local B = tonumber(z)
                if B then
                    B = math.clamp(B / 100, 0, 1)
                    table.insert(v, ColorSequenceKeypoint.new(B, A.Color))
                    table.insert(x, NumberSequenceKeypoint.new(B, A.Transparency or 0))
                end
            end

            table.sort(
                v,
                function(B, C)
                    return B.Time < C.Time
                end
            )
            table.sort(
                x,
                function(B, C)
                    return B.Time < C.Time
                end
            )

            if #v < 2 then
                error "ColorSequence requires at least 2 keypoints"
            end

            local B = {
                Color = ColorSequence.new(v),
                Transparency = NumberSequence.new(x)
            }

            if u then
                for C, F in pairs(u) do
                    B[C] = F
                end
            end

            return B
        end

        function p.SetTheme(r)
            p.Theme = r
            p.UpdateTheme(nil, false)
        end

        function p.AddFontObject(r)
            table.insert(p.FontObjects, r)
            p.UpdateFont(p.Font)
        end

        function p.UpdateFont(r)
            p.Font = r
            for u, v in next, p.FontObjects do
                v.FontFace = Font.new(r, v.FontFace.Weight, v.FontFace.Style)
            end
        end

        function p.GetThemeProperty(r, u)
            local function getValue(v, x)
                local z = x[v]

                if z == nil then
                    return nil
                end

                if typeof(z) == "string" and string.sub(z, 1, 1) == "#" then
                    return Color3.fromHex(z)
                end

                if typeof(z) == "Color3" then
                    return z
                end

                if typeof(z) == "number" then
                    return z
                end

                if typeof(z) == "table" and z.Color and z.Transparency then
                    return z
                end

                if typeof(z) == "function" then
                    return z()
                end

                return z
            end

            local v = getValue(r, u)
            if v ~= nil then
                if typeof(v) == "string" and string.sub(v, 1, 1) ~= "#" then
                    local x = p.GetThemeProperty(v, u)
                    if x ~= nil then
                        return x
                    end
                else
                    return v
                end
            end

            local x = p.ThemeFallbacks[r]
            if x ~= nil then
                if typeof(x) == "string" and string.sub(x, 1, 1) ~= "#" then
                    return p.GetThemeProperty(x, u)
                else
                    return getValue(r, {[r] = x})
                end
            end

            v = getValue(r, p.Themes.Dark)
            if v ~= nil then
                if typeof(v) == "string" and string.sub(v, 1, 1) ~= "#" then
                    local z = p.GetThemeProperty(v, p.Themes.Dark)
                    if z ~= nil then
                        return z
                    end
                else
                    return v
                end
            end

            if x ~= nil then
                if typeof(x) == "string" and string.sub(x, 1, 1) ~= "#" then
                    return p.GetThemeProperty(x, p.Themes.Dark)
                else
                    return getValue(r, {[r] = x})
                end
            end

            return nil
        end

        function p.AddThemeObject(r, u)
            p.Objects[r] = {Object = r, Properties = u}
            p.UpdateTheme(r, false)
            return r
        end

        function p.AddLangObject(r)
            local u = p.LocalizationObjects[r]
            local v = u.Object
            local x = currentObjTranslationId
            p.UpdateLang(v, x)
            return v
        end

        function p.UpdateTheme(r, u)
            local function ApplyTheme(v)
                for x, z in pairs(v.Properties or {}) do
                    local A = p.GetThemeProperty(z, p.Theme)
                    if A ~= nil then
                        if typeof(A) == "Color3" then
                            local B = v.Object:FindFirstChild "WindUIGradient"
                            if B then
                                B:Destroy()
                            end

                            if not u then
                                v.Object[x] = A
                            else
                                p.Tween(v.Object, 0.08, {[x] = A}):Play()
                            end
                        elseif typeof(A) == "table" and A.Color and A.Transparency then
                            v.Object[x] = Color3.new(1, 1, 1)

                            local B = v.Object:FindFirstChild "WindUIGradient"
                            if not B then
                                B = Instance.new "UIGradient"
                                B.Name = "WindUIGradient"
                                B.Parent = v.Object
                            end

                            B.Color = A.Color
                            B.Transparency = A.Transparency

                            for C, F in pairs(A) do
                                if C ~= "Color" and C ~= "Transparency" and B[C] ~= nil then
                                    B[C] = F
                                end
                            end
                        elseif typeof(A) == "number" then
                            if not u then
                                v.Object[x] = A
                            else
                                p.Tween(v.Object, 0.08, {[x] = A}):Play()
                            end
                        end
                    else
                        local B = v.Object:FindFirstChild "WindUIGradient"
                        if B then
                            B:Destroy()
                        end
                    end
                end
            end

            if r then
                local v = p.Objects[r]
                if v then
                    ApplyTheme(v)
                end
            else
                for v, x in pairs(p.Objects) do
                    ApplyTheme(x)
                end
            end
        end

        function p.SetLangForObject(r)
            if p.Localization and p.Localization.Enabled then
                local u = p.LocalizationObjects[r]
                if not u then
                    return
                end

                local v = u.Object
                local x = u.TranslationId

                local z = p.Localization.Translations[p.Language]
                if z and z[x] then
                    v.Text = z[x]
                else
                    local A = p.Localization and p.Localization.Translations and p.Localization.Translations.en or nil
                    if A and A[x] then
                        v.Text = A[x]
                    else
                        v.Text = "[" .. x .. "]"
                    end
                end
            end
        end

        function p.ChangeTranslationKey(r, u, v)
            if p.Localization and p.Localization.Enabled then
                local x = string.match(v, "^" .. p.Localization.Prefix .. "(.+)")
                if x then
                    for z, A in ipairs(p.LocalizationObjects) do
                        if A.Object == u then
                            A.TranslationId = x
                            p.SetLangForObject(z)
                            return
                        end
                    end

                    table.insert(
                        p.LocalizationObjects,
                        {
                            TranslationId = x,
                            Object = u
                        }
                    )
                    p.SetLangForObject(#p.LocalizationObjects)
                end
            end
        end

        function p.UpdateLang(r)
            if r then
                p.Language = r
            end

            for u = 1, #p.LocalizationObjects do
                local v = p.LocalizationObjects[u]
                if v.Object and v.Object.Parent ~= nil then
                    p.SetLangForObject(u)
                else
                    p.LocalizationObjects[u] = nil
                end
            end
        end

        function p.SetLanguage(r)
            p.Language = r
            p.UpdateLang()
        end

        function p.Icon(r, u)
            return l.Icon(r, nil, u ~= false)
        end

        function p.AddIcons(r, u)
            return l.AddIcons(r, u)
        end

        function p.New(r, u, v)
            local x = Instance.new(r)

            for z, A in next, p.DefaultProperties[r] or {} do
                x[z] = A
            end

            for B, C in next, u or {} do
                if B ~= "ThemeTag" then
                    x[B] = C
                end
                if p.Localization and p.Localization.Enabled and B == "Text" then
                    local F = string.match(C, "^" .. p.Localization.Prefix .. "(.+)")
                    if F then
                        local G = #p.LocalizationObjects + 1
                        p.LocalizationObjects[G] = {TranslationId = F, Object = x}

                        p.SetLangForObject(G)
                    end
                end
            end

            for F, G in next, v or {} do
                G.Parent = x
            end

            if u and u.ThemeTag then
                p.AddThemeObject(x, u.ThemeTag)
            end
            if u and u.FontFace then
                p.AddFontObject(x)
            end
            return x
        end

        function p.Tween(r, u, v, ...)
            return f:Create(r, TweenInfo.new(u, ...), v)
        end

        function p.NewRoundFrame(r, u, v, x, B, C)
            local function getImageForType(F)
                return p.Shapes[F]
            end

            local function getSliceCenterForType(F)
                return F ~= "Shadow-sm" and Rect.new(256, 256, 256, 256) or Rect.new(512, 512, 512, 512)
            end

            local F =
                p.New(
                B and "ImageButton" or "ImageLabel",
                {
                    Image = getImageForType(u),
                    ScaleType = "Slice",
                    SliceCenter = getSliceCenterForType(u),
                    SliceScale = 1,
                    BackgroundTransparency = 1,
                    ThemeTag = v.ThemeTag and v.ThemeTag
                },
                x
            )

            for G, H in pairs(v or {}) do
                if G ~= "ThemeTag" then
                    F[G] = H
                end
            end

            local function UpdateSliceScale(J)
                local L = u ~= "Shadow-sm" and (J / (256)) or (J / 512)
                F.SliceScale = math.max(L, 0.0001)
            end

            local J = {}

            function J.SetRadius(L, M)
                UpdateSliceScale(M)
            end

            function J.SetType(L, M)
                u = M
                F.Image = getImageForType(M)
                F.SliceCenter = getSliceCenterForType(M)
                UpdateSliceScale(r)
            end

            function J.UpdateShape(L, M, N)
                if N then
                    u = N
                    F.Image = getImageForType(N)
                    F.SliceCenter = getSliceCenterForType(N)
                end
                if M then
                    r = M
                end
                UpdateSliceScale(r)
            end

            function J.GetRadius(L)
                return r
            end

            function J.GetType(L)
                return u
            end

            UpdateSliceScale(r)

            return F, C and J or nil
        end

        local r = p.New
        local u = p.Tween

        function p.SetDraggable(v)
            p.CanDraggable = v
        end

        function p.Drag(v, x, B)
            local C
            local F, G, H
            local J = {
                CanDraggable = true
            }

            if not x or typeof(x) ~= "table" then
                x = {v}
            end

            local function update(L)
                if not F or not J.CanDraggable then
                    return
                end

                local M = L.Position - G
                p.Tween(
                    v,
                    0.02,
                    {
                        Position = UDim2.new(H.X.Scale, H.X.Offset + M.X, H.Y.Scale, H.Y.Offset + M.Y)
                    }
                ):Play()
            end

            for L, M in pairs(x) do
                M.InputBegan:Connect(
                    function(N)
                        if
                            (N.UserInputType == Enum.UserInputType.MouseButton1 or
                                N.UserInputType == Enum.UserInputType.Touch) and
                                J.CanDraggable
                         then
                            if C == nil then
                                C = M
                                F = true
                                G = N.Position
                                H = v.Position

                                if B and typeof(B) == "function" then
                                    B(true, C)
                                end

                                N.Changed:Connect(
                                    function()
                                        if N.UserInputState == Enum.UserInputState.End then
                                            F = false
                                            C = nil

                                            if B and typeof(B) == "function" then
                                                B(false, nil)
                                            end
                                        end
                                    end
                                )
                            end
                        end
                    end
                )

                M.InputChanged:Connect(
                    function(N)
                        if F and C == M then
                            if
                                N.UserInputType == Enum.UserInputType.MouseMovement or
                                    N.UserInputType == Enum.UserInputType.Touch
                             then
                                update(N)
                            end
                        end
                    end
                )
            end

            e.InputChanged:Connect(
                function(N)
                    if F and C ~= nil then
                        if
                            N.UserInputType == Enum.UserInputType.MouseMovement or
                                N.UserInputType == Enum.UserInputType.Touch
                         then
                            update(N)
                        end
                    end
                end
            )

            function J.Set(N, O)
                J.CanDraggable = O
            end

            return J
        end

        l.Init(r, "Icon")

        function p.SanitizeFilename(v)
            local x = v:match "([^/]+)$" or v

            x = x:gsub("%.[^%.]+$", "")

            x = x:gsub("[^%w%-_]", "_")

            if #x > 50 then
                x = x:sub(1, 50)
            end

            return x
        end

        function p.Image(v, x, B, C, F, G, H, J)
            C = C or "Temp"
            x = p.SanitizeFilename(x)

            local L =
                r(
                "Frame",
                {
                    Size = UDim2.new(0, 0, 0, 0),
                    BackgroundTransparency = 1
                },
                {
                    r(
                        "ImageLabel",
                        {
                            Name = "ImageLabel",
                            Size = UDim2.new(1, 0, 1, 0),
                            BackgroundTransparency = 1,
                            ScaleType = "Crop",
                            ThemeTag = (p.Icon(v) or H) and
                                {
                                    ImageColor3 = G and (J or "Icon") or nil
                                } or
                                nil
                        },
                        {
                            r(
                                "UICorner",
                                {
                                    CornerRadius = UDim.new(0, B)
                                }
                            )
                        }
                    )
                }
            )
            if p.Icon(v) then
                local oldImg = L:FindFirstChild("ImageLabel")
                if oldImg then
                    oldImg:Destroy()
                end

                local M =
                    l.Image {
                    Icon = v,
                    Size = UDim2.new(1, 0, 1, 0),
                    Colors = {
                        (G and (J or "Icon") or false),
                        "Button"
                    }
                }.IconFrame
                M.Parent = L
            elseif string.find(v, "http") then
                local M = "WindUI/" .. C .. "/assets/." .. F .. "-" .. x .. ".png"
                local N, O =
                    pcall(
                    function()
                        task.spawn(
                            function()
                                local N =
                                    p.Request {
                                    Url = v,
                                    Method = "GET"
                                }.Body

                                writefile(M, N)

                                local O, P = pcall(getcustomasset, M)
                                if O then
                                    local img = L:FindFirstChild("ImageLabel")
                                    if img then
                                        img.Image = P
                                    end
                                else
                                    warn(
                                        string.format(
                                            "[ WindUI.Creator ] Failed to load custom asset '%s': %s",
                                            M,
                                            tostring(P)
                                        )
                                    )
                                    L:Destroy()

                                    return
                                end
                            end
                        )
                    end
                )
                if not N then
                    warn(
                        "[ WindUI.Creator ]  '" .. identifyexecutor() .. "' doesnt support the URL Images. Error: " .. O
                    )

                    L:Destroy()
                end
            elseif v == "" then
                L.Visible = false
            else
                local img = L:FindFirstChild("ImageLabel")
                if img then
                    img.Image = v
                end
            end

            return L
        end

        function p.Color3ToHSB(v)
            local x, B, C = v.R, v.G, v.B
            local F = math.max(x, B, C)
            local G = math.min(x, B, C)
            local H = F - G

            local J = 0
            if H ~= 0 then
                if F == x then
                    J = (B - C) / H % 6
                elseif F == B then
                    J = (C - x) / H + 2
                else
                    J = (x - B) / H + 4
                end
                J = J * 60
            else
                J = 0
            end

            local L = (F == 0) and 0 or (H / F)
            local M = F

            return {
                h = math.floor(J + 0.5),
                s = L,
                b = M
            }
        end

        function p.GetPerceivedBrightness(v)
            local x = v.R
            local B = v.G
            local C = v.B
            return 0.299 * x + 0.587 * B + 0.114 * C
        end

        function p.GetTextColorForHSB(v)
            local x = p.Color3ToHSB(v)
            local B, C, F = x.h, x.s, x.b
            if p.GetPerceivedBrightness(v) > 0.68 then
                return Color3.fromHSV(B / 360, 0, 0.05)
            else
                return Color3.fromHSV(B / 360, 0, 0.98)
            end
        end

        function p.GetAverageColor(v)
            local x, B, C = 0, 0, 0
            local F = v.Color.Keypoints
            for G, H in ipairs(F) do
                x = x + H.Value.R
                B = B + H.Value.G
                C = C + H.Value.B
            end
            local J = #F
            return Color3.new(x / J, B / J, C / J)
        end

        return p
    end
    function a.c()
        local b = {}

        function b.New(d, e, f)
            local g = {
                Enabled = e.Enabled or false,
                Translations = e.Translations or {},
                Prefix = e.Prefix or "loc:",
                DefaultLanguage = e.DefaultLanguage or "en"
            }

            f.Localization = g

            return g
        end

        return b
    end
    function a.d()
        local b = a.load "b"
        local e = b.New
        local f = b.Tween

        local g = {
            Size = UDim2.new(0, 300, 1, -156),
            SizeLower = UDim2.new(0, 300, 1, -56),
            UICorner = 13,
            UIPadding = 14,
            Holder = nil,
            NotificationIndex = 0,
            Notifications = {}
        }

        function g.Init(h)
            local i = {
                Lower = false
            }

            function i.SetLower(j)
                i.Lower = j
                i.Frame.Size = j and g.SizeLower or g.Size
            end

            i.Frame =
                e(
                "Frame",
                {
                    Position = UDim2.new(1, -29, 0, 56),
                    AnchorPoint = Vector2.new(1, 0),
                    Size = g.Size,
                    Parent = h,
                    BackgroundTransparency = 1
                },
                {
                    e(
                        "UIListLayout",
                        {
                            HorizontalAlignment = "Center",
                            SortOrder = "LayoutOrder",
                            VerticalAlignment = "Bottom",
                            Padding = UDim.new(0, 8)
                        }
                    ),
                    e(
                        "UIPadding",
                        {
                            PaddingBottom = UDim.new(0, 29)
                        }
                    )
                }
            )
            return i
        end

        function g.New(h)
            local i = {
                Title = h.Title or "Notification",
                Content = h.Content or nil,
                Icon = h.Icon or nil,
                IconThemed = h.IconThemed,
                Background = h.Background,
                BackgroundImageTransparency = h.BackgroundImageTransparency,
                Duration = h.Duration or 5,
                Buttons = h.Buttons or {},
                CanClose = true,
                UIElements = {},
                Closed = false,
                TitleColor = h.TitleColor,
                ContentColor = h.ContentColor,
                IconColor = h.IconColor,
                BackgroundColor = h.BackgroundColor,
                ProgressBarColor = h.ProgressBarColor,
                CloseButtonColor = h.CloseButtonColor
            }
            if i.CanClose == nil then
                i.CanClose = true
            end
            g.NotificationIndex = g.NotificationIndex + 1
            g.Notifications[g.NotificationIndex] = i

            local j

            if i.Icon then
                j = b.Image(i.Icon, i.Title .. ":" .. i.Icon, 0, h.Window, "Notification", i.IconThemed)
                j.Size = UDim2.new(0, 26, 0, 26)
                j.Position = UDim2.new(0, g.UIPadding, 0, g.UIPadding)

                if i.IconColor and j:FindFirstChild("ImageLabel") then
                    j.ImageLabel.ImageColor3 = i.IconColor
                    if j.ImageLabel:FindFirstChild("ThemeTag") then
                        j.ImageLabel.ThemeTag:Destroy()
                    end
                end
            end

            local l
            if i.CanClose then
                l =
                    e(
                    "ImageButton",
                    {
                        Image = b.Icon "x"[1],
                        ImageRectSize = b.Icon "x"[2].ImageRectSize,
                        ImageRectOffset = b.Icon "x"[2].ImageRectPosition,
                        BackgroundTransparency = 1,
                        Size = UDim2.new(0, 16, 0, 16),
                        Position = UDim2.new(1, -g.UIPadding, 0, g.UIPadding),
                        AnchorPoint = Vector2.new(1, 0),
                        ImageColor3 = i.CloseButtonColor or nil,
                        ThemeTag = (not i.CloseButtonColor) and
                            {
                                ImageColor3 = "Text"
                            } or
                            nil,
                        ImageTransparency = .4
                    },
                    {
                        e(
                            "TextButton",
                            {
                                Size = UDim2.new(1, 8, 1, 8),
                                BackgroundTransparency = 1,
                                AnchorPoint = Vector2.new(0.5, 0.5),
                                Position = UDim2.new(0.5, 0, 0.5, 0),
                                Text = ""
                            }
                        )
                    }
                )
            end

            local m =
                e(
                "Frame",
                {
                    Size = UDim2.new(0, 0, 1, 0),
                    BackgroundTransparency = .95,
                    BackgroundColor3 = i.ProgressBarColor or nil,
                    ThemeTag = (not i.ProgressBarColor) and
                        {
                            BackgroundColor3 = "Text"
                        } or
                        nil
                }
            )

            local p =
                e(
                "Frame",
                {
                    Size = UDim2.new(1, i.Icon and -28 - g.UIPadding or 0, 1, 0),
                    Position = UDim2.new(1, 0, 0, 0),
                    AnchorPoint = Vector2.new(1, 0),
                    BackgroundTransparency = 1,
                    AutomaticSize = "Y"
                },
                {
                    e(
                        "UIPadding",
                        {
                            PaddingTop = UDim.new(0, g.UIPadding),
                            PaddingLeft = UDim.new(0, g.UIPadding),
                            PaddingRight = UDim.new(0, g.UIPadding),
                            PaddingBottom = UDim.new(0, g.UIPadding)
                        }
                    ),
                    e(
                        "TextLabel",
                        {
                            AutomaticSize = "Y",
                            Size = UDim2.new(1, -30 - g.UIPadding, 0, 0),
                            TextWrapped = true,
                            TextXAlignment = "Left",
                            RichText = true,
                            BackgroundTransparency = 1,
                            TextSize = 16,
                            TextColor3 = i.TitleColor or nil,
                            ThemeTag = (not i.TitleColor) and
                                {
                                    TextColor3 = "Text"
                                } or
                                nil,
                            Text = i.Title,
                            FontFace = Font.new(b.Font, Enum.FontWeight.Medium)
                        }
                    ),
                    e(
                        "UIListLayout",
                        {
                            Padding = UDim.new(0, g.UIPadding / 3)
                        }
                    )
                }
            )

            if i.Content then
                e(
                    "TextLabel",
                    {
                        AutomaticSize = "Y",
                        Size = UDim2.new(1, 0, 0, 0),
                        TextWrapped = true,
                        TextXAlignment = "Left",
                        RichText = true,
                        BackgroundTransparency = 1,
                        TextTransparency = .4,
                        TextSize = 15,
                        TextColor3 = i.ContentColor or nil,
                        ThemeTag = (not i.ContentColor) and
                            {
                                TextColor3 = "Text"
                            } or
                            nil,
                        Text = i.Content,
                        FontFace = Font.new(b.Font, Enum.FontWeight.Medium),
                        Parent = p
                    }
                )
            end

            local r =
                b.NewRoundFrame(
                g.UICorner,
                "Squircle",
                {
                    Size = UDim2.new(1, 0, 0, 0),
                    Position = UDim2.new(2, 0, 1, 0),
                    AnchorPoint = Vector2.new(0, 1),
                    AutomaticSize = "Y",
                    ImageTransparency = .05,
                    ImageColor3 = i.BackgroundColor or nil,
                    ThemeTag = (not i.BackgroundColor) and
                        {
                            ImageColor3 = "Background"
                        } or
                        nil
                },
                {
                    e(
                        "CanvasGroup",
                        {
                            Size = UDim2.new(1, 0, 1, 0),
                            BackgroundTransparency = 1
                        },
                        {
                            m,
                            e(
                                "UICorner",
                                {
                                    CornerRadius = UDim.new(0, g.UICorner)
                                }
                            )
                        }
                    ),
                    e(
                        "ImageLabel",
                        {
                            Name = "Background",
                            Image = i.Background,
                            BackgroundTransparency = 1,
                            Size = UDim2.new(1, 0, 1, 0),
                            ScaleType = "Crop",
                            ImageTransparency = i.BackgroundImageTransparency
                        },
                        {
                            e(
                                "UICorner",
                                {
                                    CornerRadius = UDim.new(0, g.UICorner)
                                }
                            )
                        }
                    ),
                    p,
                    j,
                    l
                }
            )

            local u =
                e(
                "Frame",
                {
                    BackgroundTransparency = 1,
                    Size = UDim2.new(1, 0, 0, 0),
                    Parent = h.Holder
                },
                {
                    r
                }
            )

            function i.Close(v)
                if not i.Closed then
                    i.Closed = true
                    f(u, 0.45, {Size = UDim2.new(1, 0, 0, -8)}, Enum.EasingStyle.Quint, Enum.EasingDirection.Out):Play()
                    f(r, 0.55, {Position = UDim2.new(2, 0, 1, 0)}, Enum.EasingStyle.Quint, Enum.EasingDirection.Out):Play(

                    )
                    task.wait(.45)
                    u:Destroy()
                end
            end

            task.spawn(
                function()
                    task.wait()
                    f(
                        u,
                        0.45,
                        {
                            Size = UDim2.new(1, 0, 0, r.AbsoluteSize.Y)
                        },
                        Enum.EasingStyle.Quint,
                        Enum.EasingDirection.Out
                    ):Play()
                    f(r, 0.45, {Position = UDim2.new(0, 0, 1, 0)}, Enum.EasingStyle.Quint, Enum.EasingDirection.Out):Play(

                    )
                    if i.Duration then
                        f(
                            m,
                            i.Duration,
                            {Size = UDim2.new(1, 0, 1, 0)},
                            Enum.EasingStyle.Linear,
                            Enum.EasingDirection.InOut
                        ):Play()
                        task.wait(i.Duration)
                        i:Close()
                    end
                end
            )

            if l then
                b.AddSignal(
                    l.TextButton.MouseButton1Click,
                    function()
                        i:Close()
                    end
                )
            end

            return i
        end

        return g
    end
    function a.Section()
        local Section = {}

        local Creator = a.load "b"
        local New = Creator.New
        local Tween = Creator.Tween

        local TabModule = a.load "U"  -- Adjust if your Tab module is under a different key

        function Section.New(SectionConfig, Parent, Folder, UIScale, Window)
            local SectionModule = {
                Title = SectionConfig.Title or "Section",
                Icon = SectionConfig.Icon,
                IconThemed = SectionConfig.IconThemed,
                Opened = SectionConfig.Opened or false,
                
                HeaderSize = 42,
                IconSize = 18,
                
                Expandable = false,
            }
            
            local IconFrame
            if SectionModule.Icon then
                IconFrame = Creator.Image(
                    SectionModule.Icon,
                    SectionModule.Icon,
                    0,
                    Folder,
                    "Section",
                    true,
                    SectionModule.IconThemed
                )
                
                IconFrame.Size = UDim2.new(0,SectionModule.IconSize,0,SectionModule.IconSize)
                IconFrame.ImageLabel.ImageTransparency = .25
            end
            
            local ChevronIconFrame = New("Frame", {
                Size = UDim2.new(0,SectionModule.IconSize,0,SectionModule.IconSize),
                BackgroundTransparency = 1,
                Visible = false
            }, {
                New("ImageLabel", {
                    Size = UDim2.new(1,0,1,0),
                    BackgroundTransparency = 1,
                    Image = Creator.Icon("chevron-down")[1],
                    ImageRectSize = Creator.Icon("chevron-down")[2].ImageRectSize,
                    ImageRectOffset = Creator.Icon("chevron-down")[2].ImageRectPosition,
                    ThemeTag = {
                        ImageColor3 = "Icon",
                    },
                    ImageTransparency = .7,
                })
            })
            
            local SectionFrame = New("Frame", {
                Size = UDim2.new(1,0,0,SectionModule.HeaderSize),
                BackgroundTransparency = 1,
                Parent = Parent,
                ClipsDescendants = true,
            }, {
                New("TextButton", {
                    Size = UDim2.new(1,0,0,SectionModule.HeaderSize),
                    BackgroundTransparency = 1,
                    Text = "",
                }, {
                    IconFrame,
                    New("TextLabel", {
                        Text = SectionModule.Title,
                        TextXAlignment = "Left",
                        Size = UDim2.new(
                            1, 
                            IconFrame and (-SectionModule.IconSize-10)*2
                                or (-SectionModule.IconSize-10),
                                
                            1,
                            0
                        ),
                        ThemeTag = {
                            TextColor3 = "Text",
                        },
                        FontFace = Font.new(Creator.Font, Enum.FontWeight.SemiBold),
                        TextSize = 14,
                        BackgroundTransparency = 1,
                        TextTransparency = .7,
                        TextWrapped = true
                    }),
                    New("UIListLayout", {
                        FillDirection = "Horizontal",
                        VerticalAlignment = "Center",
                        Padding = UDim.new(0,10)
                    }),
                    ChevronIconFrame,
                    New("UIPadding", {
                        PaddingLeft = UDim.new(0,11),
                        PaddingRight = UDim.new(0,11),
                    })
                }),
                New("Frame", {
                    BackgroundTransparency = 1,
                    Size = UDim2.new(1,0,0,0),
                    AutomaticSize = "Y",
                    Name = "Content",
                    Visible = true,
                    Position = UDim2.new(0,0,0,SectionModule.HeaderSize)
                }, {
                    New("UIListLayout", {
                        FillDirection = "Vertical",
                        Padding = UDim.new(0,Window.Gap or 8),
                        VerticalAlignment = "Bottom",
                    }),
                })
            })
            
            
            function SectionModule:Tab(TabConfig)
                if not SectionModule.Expandable then
                    SectionModule.Expandable = true
                    ChevronIconFrame.Visible = true
                end
                TabConfig.Parent = SectionFrame.Content
                return TabModule.New(TabConfig, UIScale)
            end
            
            function SectionModule:Open()
                if SectionModule.Expandable then
                    SectionModule.Opened = true
                    Tween(SectionFrame, 0.33, {
                        Size = UDim2.new(1,0,0, SectionModule.HeaderSize + (SectionFrame.Content.AbsoluteSize.Y/UIScale))
                    }, Enum.EasingStyle.Quint, Enum.EasingDirection.Out):Play()
                    
                    Tween(ChevronIconFrame.ImageLabel, 0.1, {Rotation = 180}, Enum.EasingStyle.Quint, Enum.EasingDirection.Out):Play()
                end
            end
            function SectionModule:Close()
                if SectionModule.Expandable then
                    SectionModule.Opened = false
                    Tween(SectionFrame, 0.26, {
                        Size = UDim2.new(1,0,0, SectionModule.HeaderSize)
                    }, Enum.EasingStyle.Quint, Enum.EasingDirection.Out):Play()
                    Tween(ChevronIconFrame.ImageLabel, 0.1, {Rotation = 0}, Enum.EasingStyle.Quint, Enum.EasingDirection.Out):Play()
                end
            end
            
            Creator.AddSignal(SectionFrame.TextButton.MouseButton1Click, function()
                if SectionModule.Expandable then
                    if SectionModule.Opened then
                        SectionModule:Close()
                    else
                        SectionModule:Open()
                    end
                end
            end)
            
            Creator.AddSignal(SectionFrame.Content.UIListLayout:GetPropertyChangedSignal("AbsoluteContentSize"), function()
                if SectionModule.Opened then
                    SectionModule:Open()
                end
            end)
            
            if SectionModule.Opened then
                task.spawn(function()
                    task.wait()
                    SectionModule:Open()
                end)
            end

            
            
            return SectionModule
        end


        return Section
    end
    -- Add more a.functions if there are any after this in the original
end

local aa = {
    Window = nil,
    Theme = nil,
    Creator = a.load "b",
    LocalizationModule = a.load "c",
    NotificationModule = a.load "d",
    Themes = nil,
    Transparent = false,
    TransparencyValue = .15,
    UIScale = 1,
    ConfigManager = nil,
    Version = "0.0.0",
    Services = a.load "h",
    OnThemeChangeFunction = nil,
    cloneref = nil,
    UIScaleObj = nil
}

local ae = (cloneref or clonereference or function(ae)
        return ae
    end)

aa.cloneref = ae

local af = ae(game:GetService "HttpService")
local ah = ae(game:GetService "Players")
local aj = ae(game:GetService "CoreGui")
local ak = ah.LocalPlayer or nil

local al = af:JSONDecode(a.load "i")
if al then
    aa.Version = al.version
end

local am = a.load "m"
local an = aa.Services

local ao = aa.Creator

local ap = ao.New
local aq = ao.Tween

local ar = a.load "q"

local as = protectgui or (syn and syn.protect_gui) or function()
    end

local au = gethui and gethui() or (aj or game.Players.LocalPlayer:WaitForChild "PlayerGui")

local av =
    ap(
    "UIScale",
    {
        Scale = aa.Scale
    }
)

aa.UIScaleObj = av

aa.ScreenGui =
    ap(
    "ScreenGui",
    {
        Name = "WindUI",
        Parent = au,
        IgnoreGuiInset = true,
        ScreenInsets = "None"
    },
    {
        ap(
            "Folder",
            {
                Name = "Window"
            }
        ),
        ap(
            "Folder",
            {
                Name = "KeySystem"
            }
        ),
        ap(
            "Folder",
            {
                Name = "Popups"
            }
        ),
        ap(
            "Folder",
            {
                Name = "ToolTips"
            }
        )
    }
)

aa.NotificationGui =
    ap(
    "ScreenGui",
    {
        Name = "WindUI/Notifications",
        Parent = au,
        IgnoreGuiInset = true
    }
)
aa.DropdownGui =
    ap(
    "ScreenGui",
    {
        Name = "WindUI/Dropdowns",
        Parent = au,
        IgnoreGuiInset = true
    }
)
aa.TooltipGui =
    ap(
    "ScreenGui",
    {
        Name = "WindUI/Tooltips",
        Parent = au,
        IgnoreGuiInset = true
    }
)
as(aa.ScreenGui)
as(aa.NotificationGui)
as(aa.DropdownGui)
as(aa.TooltipGui)

ao.Init(aa)

function aa.SetParent(aw, ax)
    aa.ScreenGui.Parent = ax
    aa.NotificationGui.Parent = ax
    aa.DropdownGui.Parent = ax
end
math.clamp(aa.TransparencyValue, 0, 1)

local aw = aa.NotificationModule.Init(aa.NotificationGui)

function aa.Notify(ax, ay)
    ay.Holder = aw.Frame
    ay.Window = aa.Window

    return aa.NotificationModule.New(ay)
end

function aa.SetNotificationLower(ax, ay)
    aw.SetLower(ay)
end

function aa.SetFont(ax, ay)
    ao.UpdateFont(ay)
end

function aa.OnThemeChange(ax, ay)
    aa.OnThemeChangeFunction = ay
end

function aa.AddTheme(ax, ay)
    aa.Themes[ay.Name] = ay
    return ay
end

function aa.SetTheme(ax, ay)
    if aa.Themes[ay] then
        aa.Theme = aa.Themes[ay]
        ao.SetTheme(aa.Themes[ay])

        if aa.OnThemeChangeFunction then
            aa.OnThemeChangeFunction(ay)
        end

        return aa.Themes[ay]
    end
    return nil
end

function aa.GetThemes(ax)
    return aa.Themes
end
function aa.GetCurrentTheme(ax)
    return aa.Theme.Name
end
function aa.GetTransparency(ax)
    return aa.Transparent or false
end
function aa.GetWindowSize(ax)
    return Window.UIElements.Main.Size
end
function aa.Localization(ax, ay)
    return aa.LocalizationModule:New(ay, ao)
end

function aa.SetLanguage(ax, ay)
    if ao.Localization then
        return ao.SetLanguage(ay)
    end
    return false
end

function aa.ToggleAcrylic(ax, ay)
    if aa.Window and aa.Window.AcrylicPaint and aa.Window.AcrylicPaint.Model then
        aa.Window.Acrylic = ay
        aa.Window.AcrylicPaint.Model.Transparency = ay and 0.98 or 1
        if ay then
            ar.Enable()
        else
            ar.Disable()
        end
    end
end

function aa.Gradient(ax, ay, az)
    local aA = {}
    local aB = {}

    for aC, aD in next, ay do
        local aE = tonumber(aC)
        if aE then
            aE = math.clamp(aE / 100, 0, 1)
            table.insert(aA, ColorSequenceKeypoint.new(aE, aD.Color))
            table.insert(aB, NumberSequenceKeypoint.new(aE, aD.Transparency or 0))
        end
    end

    table.sort(
        aA,
        function(aE, aF)
            return aE.Time < aF.Time
        end
    )
    table.sort(
        aB,
        function(aE, aF)
            return aE.Time < aF.Time
        end
    )

    if #aA < 2 then
        error "ColorSequence requires at least 2 keypoints"
    end

    local aE = {
        Color = ColorSequence.new(aA),
        Transparency = NumberSequence.new(aB)
    }

    if az then
        for aF, b in pairs(az) do
            aE[aF] = b
        end
    end

    return aE
end

function aa.Popup(ax, ay)
    ay.WindUI = aa
    return a.load "r".new(ay)
end

aa.Themes = a.load "s"(aa)

ao.Themes = aa.Themes

aa:SetTheme "Dark"
aa:SetLanguage(ao.Language)

function aa.CreateWindow(ax, ay)
    local az = a.load "Y"

    if not isfolder "WindUI" then
        makefolder "WindUI"
    end
    if ay.Folder then
        makefolder(ay.Folder)
    else
        makefolder(ay.Title)
    end

    ay.WindUI = aa
    ay.Parent = aa.ScreenGui.Window

    if aa.Window then
        warn "You cannot create more than one window"
        return
    end

    local aA = true

    local aB = aa.Themes[ay.Theme or "Dark"]

    ao.SetTheme(aB)

    local aC = gethwid or function()
            return ah.LocalPlayer.UserId
        end

    local aD = aC()

    if ay.KeySystem then
        aA = false

        local function loadKeysystem()
            am.new(
                ay,
                aD,
                function(aE)
                    aA = aE
                end
            )
        end

        local aE = (ay.Folder or "Temp") .. "/" .. aD .. ".key"

        if ay.KeySystem.KeyValidator then
            if ay.KeySystem.SaveKey and isfile(aE) then
                local aF = readfile(aE)
                local b = ay.KeySystem.KeyValidator(aF)

                if b then
                    aA = true
                else
                    loadKeysystem()
                end
            else
                loadKeysystem()
            end
        elseif not ay.KeySystem.API then
            if ay.KeySystem.SaveKey and isfile(aE) then
                local aF = readfile(aE)
                local b =
                    (type(ay.KeySystem.Key) == "table") and table.find(ay.KeySystem.Key, aF) or
                    tostring(ay.KeySystem.Key) == tostring(aF)

                if b then
                    aA = true
                else
                    loadKeysystem()
                end
            else
                loadKeysystem()
            end
        else
            if isfile(aE) then
                local aF = readfile(aE)
                local b = false

                for d, f in next, ay.KeySystem.API do
                    local g = aa.Services[f.Type]
                    if g then
                        local h = {}
                        for j, l in next, g.Args do
                            table.insert(h, f[l])
                        end

                        local m = g.New(table.unpack(h))
                        local p = m.Verify(aF)
                        if p then
                            b = true
                            break
                        end
                    end
                end

                aA = b
                if not b then
                    loadKeysystem()
                end
            else
                loadKeysystem()
            end
        end

        repeat
            task.wait()
        until aA
    end

    local aE = az(ay)

    aa.Transparent = ay.Transparent
    aa.Window = aE

    if ay.Acrylic then
        ar.init()
    end

    return aE
end

return aa
