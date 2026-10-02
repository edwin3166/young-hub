local players = game:GetService("Players")
local runService = game:GetService("RunService")
local replicatedStorage = game:GetService("ReplicatedStorage")
local userInputService = game:GetService("UserInputService")
local tweenService = game:GetService("TweenService")
local localPlayer = players.LocalPlayer
local by = "Young0xOnTop"
do
  local currentCamera = workspace.CurrentCamera
  local trainingPoseRig = currentCamera and currentCamera:FindFirstChild("TrainingPoseRig")
  if trainingPoseRig then trainingPoseRig:Destroy() end
end
local tbl = {
  BackgroundAsset = "rbxassetid://93236131139308",
  Colors = {
    bg = Color3.fromRGB(6, 7, 15),
    surface = Color3.fromRGB(12, 14, 25),
    surface2 = Color3.fromRGB(19, 22, 38),
    border = Color3.fromRGB(118, 123, 205),
    red = Color3.fromRGB(226, 24, 43),
    blue = Color3.fromRGB(154, 132, 255),
    cyan = Color3.fromRGB(103, 211, 255),
    pink = Color3.fromRGB(196, 92, 255),
    green = Color3.fromRGB(54, 211, 99),
    text = Color3.fromRGB(248, 248, 248),
    textDim = Color3.fromRGB(185, 185, 185),
    white = Color3.fromRGB(255, 255, 255),
    pillOff = Color3.fromRGB(38, 38, 38),
  },
  UI = { hubW = 600, hubH = 380, titleH = 54, tabH = 46, tabY = 54 },
  Timing = {
    tween = TweenInfo.new(0.12, Enum.EasingStyle.Quad),
    minimizeDur = 0.18,
    gradPulse = 0.05,
    dotPulse = 0.7,
    borderGlow = 1.2,
    alertBlink = 0.5,
    alertAutohide = 3,
  },
  Texts = {
    title = "Young0x Hub",
    notifTitle = "Young0x Hub!",
    notifReady = "@Real_Young0x",
    notifAntiLag = "60% Optimizado",
    discordInvite = "https://discord.gg/NxZNRGJfQc",
    youtubeUrl = "https://www.youtube.com/@Real_Young0x",
    afkTitle = "Young0x Hub - Muscle Legends",
  },
  Rocks = {
    {
      label = " Overcharged Rock ",
      req = 0,
      minDur = 0,
      objectName = "Overcharged Rock",
      eventObject = "OverchargedMap",
    },
    { label = " Industrial Rock ", req = 25000000, minDur = 25000000 },
    { label = " Ancient Rock ", req = 10000000, minDur = 10000000 },
    { label = " Muscle King Rock ", req = 5000000, minDur = 5000000 },
    { label = " Legend Rock ", req = 1000000, minDur = 1000000 },
    { label = " Eternal Rock ", req = 750000, minDur = 750000 },
    { label = " Mythical Rock ", req = 400000, minDur = 400000 },
    { label = " Frost Rock ", req = 150000, minDur = 150000 },
    { label = " Beach Rock ", req = 5000, minDur = 5000 },
    { label = " Starter Rock ", req = 100, minDur = 100 },
    { label = " Tiny Rock ", req = 0, minDur = 0 },
  },
  Machines = {
    {
      section = "Overcharge Event",
      label = "Overcharged Bar Lift",
      object = "Overcharged Bar Lift",
      eventObject = "OverchargedMap",
    },
    {
      section = "Overcharge Event",
      label = "Overcharged Squat",
      object = "Overcharged Squat",
      eventObject = "OverchargedMap",
    },
    {
      section = "Overcharge Event",
      label = "Overcharged Bench",
      object = "Overcharged Bench",
      eventObject = "OverchargedMap",
    },
    {
      section = "Overcharge Event",
      label = "Overcharged Boulder",
      object = "Overcharged Boulder",
      eventObject = "OverchargedMap",
    },
    {
      section = "Industrial Machines",
      label = "Industrial Bar Lift",
      object = "Industrial Bar Lift",
      fallback = CFrame.new(-5492.7051, 82.9405, 4643.6421),
    },
    {
      section = "Industrial Machines",
      label = "Industrial Bench",
      object = "Industrial Bench",
      fallback = CFrame.new(-5014.7197, 101.4016, 4467.3472),
    },
    {
      section = "Industrial Machines",
      label = "Industrial Boulder",
      object = "Industrial Boulder",
      fallback = CFrame.new(-5456.4297, 85.4802, 5231.5352),
    },
    {
      section = "Industrial Machines",
      label = "Industrial Squat",
      object = "Industrial Squat",
      fallback = CFrame.new(-5422.1152, 76.9691, 5443.0771),
    },
    {
      section = "Jungle Gym Machines",
      label = "Jungle Bar Lift",
      object = "Jungle Bar Lift",
      fallback = CFrame.new(-8652.8672, 29.2667, 2089.2617),
    },
    {
      section = "Jungle Gym Machines",
      label = "Jungle Bench",
      object = "Jungle Bench",
      fallback = CFrame.new(-8174.8818, 47.7279, 1912.9667),
    },
    {
      section = "Jungle Gym Machines",
      label = "Jungle Boulder",
      object = "Jungle Boulder",
      fallback = CFrame.new(-8616.5918, 31.8064, 2677.1548),
    },
    {
      section = "Jungle Gym Machines",
      label = "Jungle Squat",
      object = "Jungle Squat",
      fallback = CFrame.new(-8377.2773, 34.8563, 2863.6965),
    },
    {
      section = "Legends Gym Machines",
      label = "Legends Lift",
      object = "Legends Lift",
      fallback = CFrame.new(4532.2178, 1012.4910, -4002.7122),
    },
    {
      section = "Legends Gym Machines",
      label = "Legends Press",
      object = "Legends Press",
      fallback = CFrame.new(4109.9131, 1012.2094, -3802.1533),
    },
    {
      section = "Legends Gym Machines",
      label = "Legends Squat",
      object = "Legends Squat",
      fallback = CFrame.new(4437.1465, 1015.8768, -3633.6763),
    },
    {
      section = "Legends Gym Machines",
      label = "Legends Throw",
      object = "Legends Throw",
      fallback = CFrame.new(4189.9614, 1004.3785, -3903.0166),
    },
    {
      section = "Muscle King Machines",
      label = "Muscle King Lift",
      object = "Muscle King Lift",
      fallback = CFrame.new(-8772.9707, 39.1910, -5663.5625),
    },
    {
      section = "Muscle King Machines",
      label = "Muscle King Bench",
      object = "Muscle King Bench",
      fallback = CFrame.new(-8590.2354, 37.7592, -6044.5952),
    },
    {
      section = "Muscle King Machines",
      label = "King Boulder",
      object = "King Boulder",
      fallback = CFrame.new(-8942.1289, 43.7785, -5691.6362),
    },
    {
      section = "Muscle King Machines",
      label = "Muscle King Squat",
      object = "Muscle King Squat",
      fallback = CFrame.new(-8758.4424, 32.8662, -6043.0693),
    },
  },
  FullTrainAreas = {
    { section = "Eternal Gym", center = Vector3.new(-6768, 0, -1287) },
    { section = "Mythical Gym", center = Vector3.new(2255, 0, 1071) },
    { section = "Frost Gym", center = Vector3.new(-2650, 0, -393) },
    { section = "Playa", center = Vector3.new(9, 0, 100) },
    { section = "Magma Ring", center = Vector3.new(4400, 0, -8400) },
    { section = "Desert Ring", center = Vector3.new(900, 0, -7000) },
    { section = "Boxing Ring", center = Vector3.new(-1900, 0, -5820) },
    { section = "Tiny Island", center = Vector3.new(50, 0, 1918) },
  },
}
local colors = tbl.Colors
local uI = tbl.UI
local timing = tbl.Timing
getgenv().Young0xDiscordIconData = "iVBORw0KGgoAAAANSUhEUgAAAGQAAABkCAYAAABw4pVUAAAACXBIWXMAAAsTAAALEwEAmpwYAAAGYklEQVR4nO2dfcxXYxjHj15VPEwvE5bWUsIf3h4V8jJ52SwbNlboZdLWY5iXZbM1Yiyv8Z/+UEtGzFDYlJrxVIQp60VJQkUZSVT09rFLF549+/3Oue9z7nN+5+e5Ptvzz9PvOdf3/l3n3G/nur9FkWEYhmEYhmEYhmEYhmEYhmFkAjgMOAW4CXgUeAtYBfwGbAVG5BBzBPC9xlilMSX2aOBU0RS1JYCTgDv1i/iZeH4EOgaM3RHYlhBzO/A2cBcwMPo/ApwMTAW+xI8DwMUBdVwE7PfU8BXwuDzJUT0DdALGAYs9Gr8NeEnvzguAI3PQdQQwTJ/SFx2emJZ8CNwCdI7qBe0WpD/e4PgEfKpPz/lAuxpplrHjXuBdYJ+D7q36+cOjMgOMAr5xaNAmYApwYlQygD6qTTQm8R1wQ1Q2gOOAdxyehrnAlUB7j2v3Ai4EJgBPAnOAD4B1wGYdhPfrz3b93Tr9jHz2Cf1buUZPj7jtVetc1R7HfPkOojKgDY3rh6UxLwOnOVyrHTBYx5BX9A4Mzbd6bYlxjks3Kdq1DXGJke/gvKiWqNCdMSKXAI0Og+y1wEzPATYUEnMGcA3QLUFrI7A05lq/yLQ+quHgvTxG3JS4RRZwFjA9IaFFI1qeBc5MWMw+mHATOnfJwQBujRG1q9KCTrukUTqzKjufACMrdWl6M0obqzG6sESooK66/VCNP4Hurf7m8oQnqqx8JtpbtaU7sDfmbzbKOqzIhExyaMh7uriTmcoi6p+FwGXapmaHz99WVDIaHPagDP5ePHYtIiG317qldcT4IhIiW9aGGyvyTsYljkKM/xiaZ0JebRHIcGN2nvtVcVM9ozJ/+Oyh+STk7ioBjWSa8kjIMofARmXez+MdwcEqwYxkZJf4+KJX5kY8d4RMSD1sBpadpaGS0c+6qyDId9gnREJsqyQcE0Mk5M2Agto6r4WorZKSSyMMv2aqxNRKPyMs6QshgIcDizHggSwJ+bggkbu15qpRX4A1aInOU8CeOowTfvoLHONQIBYCeb/SL0ZHf2B1HcVJQgr6jk6TkCsKEPc10MNBSw8tHCh7HFcuTZOQyWUa4DhUXFD2OK7clyYh83IWtSCFpoUljpPveiSh7ioEY1NournEcXzY7CvoBPLHuwYWGFDiOL709hF0dQGCvGuWgG4ljuPLVT6CHilAUGyleSXkiFuJ4/jykI+gNwoQlKYrGVjiOPkN7MDKAgSNS/FFjS9xnHyK6PT8w+8FCEozHV1U4ji+7HQVcyzFMczz6FzZ4/jSy0XQuQUK2ui4pdHT8XRvreP4MsQlIeI7UiSyodc/YU3wRR3F8SH5SDVwP8UjW9/T9ATuUfozBHg68LZ4UXFcmeySEDkNaxTDcy4JESccoxjmuSTko4LEGLDEJSHra62yDbHWJSG1cFNoq/zgkpAdGQKItdHzalVRi1lLkYdwZmpbXeycqrHdJSFSmZGWfx0MgEF1ahSQxPKW7nLAGNKzyyUhvhZ4LWnt3tBZPU+yJLks7Na2dK7g6pCW/S4JcXGCq8bIKtfsq9Z9RZQVheaAWgH2rdI28UNJywaXhIjZV1p2xRmv6HuGmXVyeHSvah0Q054xCSY0SUxw3X7PWnXxepzDmhzvUs/CNZSPNaotSX/Wl3gLnD2C1VZPisuyILO1JqBDQqx/SjlXUjtWqobBCVo7aJukij0LG7yPSqvjdIg1yVrgOkcrvd662zxL/XLzOLl1UBe/szRWYvWH+nxdr23Jinyng7yS0WrqKqaSIRAT5Yk+VSAcKjaQ9zNjpSgAeEG708+BLWp62dKRbqf+Tv5thXYLs9UBTq4x1McLWH3BmlIYQFdjU2a3bO0vxbYuFDt0QTW8rD7rHLIffAb4KWC7FwdzLtWTVI9lXKNU60unaXI6BRGbvn3D9b1Ilml/JfapUXT49ukALF6EeTA9uGD3dokZZx6I+8XZeYuXafGNgaesMoA35Co8vk0NqiEUq9Xss7guWRMzXE/pHsz4SCe/7M8ZuZPVvDPrODGi5mOjGipPTXmXTYpKAuksRNZr2xOdu2sCcIZOM5sd7rgFtfofEWLWG6Ipaeu9WTcaT4/qCaCLHq2+R9+RLNM1wh4170+slSoaPdY2XzVuUc0ztA1SRNelcFGGYRiGYRiGYRiGYRiGYRiGYRiGYURtg78AMLqLjkX9nPAAAAAASUVORK5CYII="
getgenv().Young0xResolveDiscordIcon = function()
  local _G2 = getgenv and getgenv() or _G
  local value = rawget(_G2, "base64_decode") or rawget(_G2, "base64decode")
  local value2 = rawget(_G2, "getcustomasset") or rawget(_G2, "getsynasset")
  local value3 = rawget(_G2, "writefile")
  local value4 = rawget(_G2, "isfolder")
  local value5 = rawget(_G2, "makefolder")
  if type(value2) == "function" and type(value3) == "function" and type(value) == "function" then
    pcall(function()
      if type(value4) == "function" and type(value5) == "function" and not value4("Young0xHub") then
        value5("Young0xHub")
      end
      value3("Young0xHub/discord-white.png", value(_G2.Young0xDiscordIconData))
    end)
    local ok, result = pcall(value2, "Young0xHub/discord-white.png")
    if ok and type(result) == "string" and result ~= "" then return result end
  end
  return "rbxthumb://type=Asset&id=16584754901&w=420&h=420"
end
if not (function()
  local _G2 = getgenv and getgenv() or _G
  local num = math.clamp(math.floor(tonumber(_G2.Young0xPublicTrainingLanguage) or 1), 1, 4)
  local tbl2 = {
    [1] = {
      subtitle = "Sistema de key · 24 h",
      placeholder = "Pegá la key",
      enter = "Entrar",
      getKey = "Obtener key",
      paste = "Pegá la key",
      validating = "Validando...",
      checking = "Comprobando key...",
      success = "Key válida, Cargando...",
      expired = "La key venció. Sacá una nueva.",
      device = "La key pertenece a otro dispositivo.",
      invalidated = "La key fue desactivada.",
      used = "La key ya fue utilizada.",
      mismatch = "La key no pertenece a este script.",
      invalid = "Key inválida",
      retry = "Esperá unos minutos e intentá otra vez.",
      connection = "No se pudo conectar. Intentá otra vez.",
      loading = "Cargando...",
      copied = "Copiado",
      opened = "Abierto",
      copy = "Copiar link",
      linkCopied = "Link copiado",
      linkOpened = "Link abierto",
      openAbove = "Abrí el link de arriba",
      kickExpired = "Tu key venció. Conseguí una nueva",
      kickInvalid = "Tu acceso ya no es válido.",
      helpTitle = "¿Cómo sacar la key?",
      helpIntro = "Seguí estos pasos:",
      helpSteps = {
        "Tocá Obtener key.",
        "Abrí o pegá el link en Chrome.",
        "Completá LootLabs y copiá tu key.",
        "Volvé, pegala y tocá Entrar.",
      },
      videoSoon = "Tutorial en video: próximamente.",
    },
    [2] = {
      subtitle = "24h Key System",
      placeholder = "Paste the key",
      enter = "Enter",
      getKey = "Get Key",
      paste = "Paste the key",
      validating = "Validating...",
      checking = "Checking key...",
      success = "Correct key. Loading...",
      expired = "The key expired. Get a new one.",
      device = "This key belongs to another device.",
      invalidated = "The key was disabled.",
      used = "This key has already been used.",
      mismatch = "This key does not belong to this script.",
      invalid = "Invalid key",
      retry = "Wait a few minutes and try again.",
      connection = "Could not connect. Try again.",
      loading = "Loading...",
      copied = "Copied",
      opened = "Opened",
      copy = "Copy link",
      linkCopied = "Link copied",
      linkOpened = "Link opened",
      openAbove = "Open the link shown above",
      kickExpired = "Your key expired. Get a new one",
      kickInvalid = "Your access is no longer valid.",
      helpTitle = "How do I get a key?",
      helpIntro = "Follow these steps:",
      helpSteps = {
        "Press Get Key.",
        "Open or paste the link in Chrome.",
        "Complete LootLabs and copy your key.",
        "Come back, paste it, and press Enter.",
      },
      videoSoon = "Video tutorial: coming soon.",
    },
    [3] = {
      subtitle = "Sistema de key · 24h",
      placeholder = "Cole a key",
      enter = "Entrar",
      getKey = "Obter key",
      paste = "Cole a key",
      validating = "Validando...",
      checking = "Verificando key...",
      success = "Key correta. Carregando...",
      expired = "A key expirou. Obtenha uma nova.",
      device = "A key pertence a outro dispositivo.",
      invalidated = "A key foi desativada.",
      used = "A key já foi utilizada.",
      mismatch = "A key não pertence a este script.",
      invalid = "Key inválida",
      retry = "Aguarde alguns minutos e tente novamente.",
      connection = "Não foi possível conectar. Tente novamente.",
      loading = "Carregando...",
      copied = "Copiado",
      opened = "Aberto",
      copy = "Copiar link",
      linkCopied = "Link copiado",
      linkOpened = "Link aberto",
      openAbove = "Abra o link acima",
      kickExpired = "Sua key expirou. Obtenha uma nova",
      kickInvalid = "Seu acesso não é mais válido.",
      helpTitle = "Como obter a key?",
      helpIntro = "Siga estes passos:",
      helpSteps = {
        "Toque em Obter key.",
        "Abra ou cole o link no Chrome.",
        "Complete o LootLabs e copie sua key.",
        "Volte, cole a key e toque em Entrar.",
      },
      videoSoon = "Tutorial em vídeo: em breve.",
    },
    [4] = {
      subtitle = "نظام المفتاح · 24 ساعة",
      placeholder = "ألصق المفتاح",
      enter = "دخول",
      getKey = "الحصول على المفتاح",
      paste = "ألصق المفتاح",
      validating = "جارٍ التحقق...",
      checking = "جارٍ فحص المفتاح...",
      success = "المفتاح صحيح. جارٍ التحميل...",
      expired = "انتهت صلاحية المفتاح. احصل على مفتاح جديد.",
      device = "هذا المفتاح مرتبط بجهاز آخر.",
      invalidated = "تم تعطيل المفتاح.",
      used = "تم استخدام المفتاح مسبقاً.",
      mismatch = "هذا المفتاح لا يخص هذا السكربت.",
      invalid = "مفتاح غير صالح",
      retry = "انتظر بضع دقائق وحاول مرة أخرى.",
      connection = "تعذر الاتصال. حاول مرة أخرى.",
      loading = "جارٍ التحميل...",
      copied = "تم النسخ",
      opened = "تم الفتح",
      copy = "نسخ الرابط",
      linkCopied = "تم نسخ الرابط",
      linkOpened = "تم فتح الرابط",
      openAbove = "افتح الرابط الظاهر أعلاه",
      kickExpired = "انتهت صلاحية مفتاحك. احصل على مفتاح جديد",
      kickInvalid = "لم يعد وصولك صالحاً.",
      helpTitle = "كيف تحصل على المفتاح؟",
      helpIntro = "اتبع هذه الخطوات:",
      helpSteps = {
        "اضغط على الحصول على المفتاح.",
        "افتح الرابط أو الصقه في Chrome.",
        "أكمل LootLabs وانسخ المفتاح.",
        "ارجع والصق المفتاح ثم اضغط دخول.",
      },
      videoSoon = "شرح الفيديو: قريباً.",
    },
  }
  local item = tbl2[num]
  local flag = _G2.Young0xPublicTrainingPreviewBypass == true
  _G2.Young0xPublicTrainingPreviewBypass = nil
  local flag2 = _G2.Young0xPublicTrainingKeySystemPreview == true
  _G2.Young0xPublicTrainingKeySystemPreview = nil
  local flag3 = _G2.Young0xPublicTrainingResume == true
  local flag4 = false
  _G2.Young0xPublicTrainingResume = nil
  if flag3 and type(isfile) == "function" and type(readfile) == "function" then
    local text = "Young0xHub/PublicTraining/session-" .. tostring(localPlayer.UserId) .. ".txt"
    local ok, result = pcall(function()
      if not isfile(text) then return nil end
      return game:GetService("HttpService"):JSONDecode(readfile(text))
    end)
    if ok and type(result) == "table" and result.resume == true and tonumber(result.userId) == localPlayer.UserId and tonumber(result.placeId) == game.PlaceId then
      flag4 = true
    end
  end
  local tbl3 = {
    service = "Young0x Hub - Public Training",
    identifier = "1189636",
    provider = "Free 24H - LootLabs",
    directLink = "https://jnkie.com/get-key/young0xhub-muscle-legends",
    sdkUrl = "https://jnkie.com/sdk/library.lua",
  }
  local text = "Young0xHub/PublicTraining/key-" .. tostring(localPlayer.UserId) .. ".txt"
  local playerGui = localPlayer:WaitForChild("PlayerGui")
  local young0xKeySystem = playerGui:FindFirstChild("Young0xKeySystem")
  if young0xKeySystem then young0xKeySystem:Destroy() end
  if flag then
    _G2.Young0xPublicTrainingExpiresAt = tonumber(_G2.Young0xPublicTrainingExpiresAt) or (os.time() + 86400)
    _G2.Young0xPublicTrainingStartedAt = tonumber(_G2.Young0xPublicTrainingStartedAt) or (_G2.Young0xPublicTrainingExpiresAt - 86400)
    return true
  end
  local screenGui = Instance.new("ScreenGui")
  screenGui.Name = "Young0xKeySystem"
  screenGui:SetAttribute("Young0x", by)
  screenGui:SetAttribute("Young0xBuild", "public-training-2026.09.26-overcharge-release")
  screenGui.ResetOnSpawn = false
  screenGui.IgnoreGuiInset = false
  screenGui.DisplayOrder = 10000
  screenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
  screenGui.Parent = playerGui
  local num2 = math.clamp(workspace.CurrentCamera.ViewportSize.X - 28, 316, 410)
  local textWrapped = num2 < 370
  local textWrapped2 = textWrapped and 282 or 250
  local canvasGroup = Instance.new("CanvasGroup")
  canvasGroup.Name = "KeyPanel"
  canvasGroup.AnchorPoint = Vector2.new(0.5, 0.5)
  canvasGroup.Size = UDim2.fromOffset(num2, textWrapped2)
  canvasGroup.Position = UDim2.new(0.5, 0, 0.5, 14)
  canvasGroup.BackgroundColor3 = Color3.fromRGB(8, 8, 9)
  canvasGroup.BackgroundTransparency = 0.02
  canvasGroup.BorderSizePixel = 0
  canvasGroup.ClipsDescendants = true
  canvasGroup.Active = true
  canvasGroup.Draggable = false
  canvasGroup.GroupTransparency = 1
  canvasGroup.Parent = screenGui
  Instance.new("UICorner", canvasGroup).CornerRadius = UDim.new(0, 13)
  local imageLabel = Instance.new("ImageLabel")
  imageLabel.Name = "BackgroundArt"
  imageLabel.Size = UDim2.fromScale(1, 1)
  imageLabel.BackgroundTransparency = 1
  imageLabel.BorderSizePixel = 0
  imageLabel.Image = tbl.BackgroundAsset
  imageLabel.ImageColor3 = Color3.fromRGB(204, 211, 255)
  imageLabel.ImageTransparency = 0.44
  imageLabel.ScaleType = Enum.ScaleType.Crop
  imageLabel.ZIndex = 1
  imageLabel.Parent = canvasGroup
  Instance.new("UICorner", imageLabel).CornerRadius = UDim.new(0, 13)
  local frame = Instance.new("Frame")
  frame.Name = "BackgroundShade"
  frame.Size = UDim2.fromScale(1, 1)
  frame.BackgroundColor3 = Color3.fromRGB(4, 5, 13)
  frame.BackgroundTransparency = 0.31
  frame.BorderSizePixel = 0
  frame.ZIndex = 1
  frame.Parent = canvasGroup
  Instance.new("UICorner", frame).CornerRadius = UDim.new(0, 13)
  local uIScale = Instance.new("UIScale", canvasGroup)
  uIScale.Scale = 0.9
  local uIStroke = Instance.new("UIStroke", canvasGroup)
  uIStroke.Color = Color3.fromRGB(92, 94, 101)
  uIStroke.Thickness = 1
  uIStroke.Transparency = 0.38
  local frame2 = Instance.new("Frame")
  frame2.Name = "TopAccent"
  frame2.Size = UDim2.new(1, -42, 0, 1)
  frame2.Position = UDim2.fromOffset(21, 0)
  frame2.BackgroundColor3 = Color3.fromRGB(222, 223, 228)
  frame2.BackgroundTransparency = 0.28
  frame2.BorderSizePixel = 0
  frame2.ZIndex = 3
  frame2.Parent = canvasGroup
  local uIGradient = Instance.new("UIGradient", frame2)
  uIGradient.Transparency = NumberSequence.new({
    NumberSequenceKeypoint.new(0, 1),
    NumberSequenceKeypoint.new(0.5, 0),
    NumberSequenceKeypoint.new(1, 1),
  })
  local frame3 = Instance.new("Frame")
  frame3.Name = "DragHandle"
  frame3.Size = UDim2.new(1, -72, 0, 54)
  frame3.Position = UDim2.fromOffset(36, 0)
  frame3.BackgroundTransparency = 1
  frame3.Active = true
  frame3.ZIndex = 2
  frame3.Parent = canvasGroup
  local textLabel = Instance.new("TextLabel")
  textLabel.Name = "Title"
  textLabel.Size = UDim2.new(1, -84, 0, 29)
  textLabel.Position = UDim2.fromOffset(42, 4)
  textLabel.BackgroundTransparency = 1
  textLabel.Text = "Young0x Hub"
  textLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
  textLabel.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
  textLabel.TextStrokeTransparency = 0.72
  textLabel.Font = Enum.Font.GothamBlack
  textLabel.TextSize = 22
  textLabel.AutoLocalize = false
  textLabel.ZIndex = 4
  textLabel.Parent = canvasGroup
  local uIStroke2 = Instance.new("UIStroke", textLabel)
  uIStroke2.Color = Color3.fromRGB(255, 255, 255)
  uIStroke2.Thickness = 0.55
  uIStroke2.Transparency = 0.58
  local uIGradient2 = Instance.new("UIGradient", textLabel)
  uIGradient2.Name = "GrayscaleSheen"
  uIGradient2.Color = ColorSequence.new({
    ColorSequenceKeypoint.new(0, Color3.fromRGB(142, 125, 232)),
    ColorSequenceKeypoint.new(0.20, Color3.fromRGB(191, 203, 255)),
    ColorSequenceKeypoint.new(0.38, Color3.fromRGB(242, 246, 255)),
    ColorSequenceKeypoint.new(0.50, Color3.fromRGB(249, 250, 252)),
    ColorSequenceKeypoint.new(0.62, Color3.fromRGB(211, 245, 255)),
    ColorSequenceKeypoint.new(0.80, Color3.fromRGB(137, 211, 255)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(123, 102, 224)),
  })
  uIGradient2.Offset = Vector2.new(-0.62, 0)
  uIGradient2.Rotation = 0
  tweenService:Create(
    uIGradient2,
    TweenInfo.new(3.8, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut, -1, true),
    { Offset = Vector2.new(0.62, 0) }
  ):Play()
  local textLabel2 = Instance.new("TextLabel")
  textLabel2.Name = "Subtitle"
  textLabel2.Size = UDim2.new(1, -84, 0, 17)
  textLabel2.Position = UDim2.fromOffset(42, 33)
  textLabel2.BackgroundTransparency = 1
  textLabel2.Text = "K-System"
  textLabel2.TextColor3 = Color3.fromRGB(146, 149, 158)
  textLabel2.Font = Enum.Font.RobotoMono
  textLabel2.TextSize = 10
  textLabel2.TextStrokeTransparency = 1
  textLabel2.AutoLocalize = false
  textLabel2.ZIndex = 4
  textLabel2.Parent = canvasGroup
  local frame4 = Instance.new("Frame")
  frame4.Name = "HeaderDivider"
  frame4.Size = UDim2.new(1, -32, 0, 1)
  frame4.Position = UDim2.fromOffset(16, 54)
  frame4.BackgroundColor3 = Color3.fromRGB(58, 59, 65)
  frame4.BackgroundTransparency = 0.42
  frame4.BorderSizePixel = 0
  frame4.ZIndex = 3
  frame4.Parent = canvasGroup
  local canvasGroup2 = Instance.new("CanvasGroup")
  canvasGroup2.Name = "MainContent"
  canvasGroup2.Size = UDim2.fromScale(1, 1)
  canvasGroup2.BackgroundTransparency = 1
  canvasGroup2.BorderSizePixel = 0
  canvasGroup2.GroupTransparency = 0
  canvasGroup2.ZIndex = 2
  canvasGroup2.Parent = canvasGroup
  local imageLabel2 = Instance.new("ImageLabel")
  imageLabel2.Name = "WeaponIcon"
  imageLabel2.AnchorPoint = Vector2.new(0.5, 0.5)
  imageLabel2.Size = textWrapped and UDim2.fromOffset(150, 112) or UDim2.fromOffset(194, 148)
  imageLabel2.Position = textWrapped and UDim2.new(0.5, 0, 0, 104) or UDim2.fromOffset(86, 120)
  imageLabel2.BackgroundTransparency = 1
  imageLabel2.Image = "rbxthumb://type=Asset&id=134462651083567&w=420&h=420"
  imageLabel2.ImageColor3 = Color3.fromRGB(255, 255, 255)
  imageLabel2.ImageTransparency = 0.02
  imageLabel2.ScaleType = Enum.ScaleType.Fit
  imageLabel2.ZIndex = 3
  imageLabel2.Parent = canvasGroup2
  local position = imageLabel2.Position
  local textBox = Instance.new("TextBox")
  textBox.Name = "KeyInput"
  textBox.Size = textWrapped and UDim2.new(1, -44, 0, 42) or UDim2.new(1, -176, 0, 42)
  textBox.Position = textWrapped and UDim2.fromOffset(22, 154) or UDim2.fromOffset(160, 101)
  textBox.BackgroundColor3 = Color3.fromRGB(12, 12, 13)
  textBox.BackgroundTransparency = 1
  textBox.BorderSizePixel = 0
  textBox.ClearTextOnFocus = false
  textBox.MultiLine = false
  textBox.TextWrapped = false
  textBox.TextScaled = true
  textBox.ClipsDescendants = true
  textBox.PlaceholderText = "Key..."
  textBox.PlaceholderColor3 = Color3.fromRGB(145, 148, 157)
  textBox.Text = ""
  textBox.TextColor3 = Color3.fromRGB(235, 235, 238)
  textBox.Font = Enum.Font.RobotoMono
  textBox.TextSize = 15
  textBox.TextStrokeTransparency = 1
  textBox.TextXAlignment = Enum.TextXAlignment.Center
  textBox.TextTruncate = Enum.TextTruncate.None
  textBox.AutoLocalize = false
  textBox.ZIndex = 5
  textBox.Parent = canvasGroup2
  Instance.new("UICorner", textBox).CornerRadius = UDim.new(0, 8)
  local uIPadding = Instance.new("UIPadding", textBox)
  uIPadding.PaddingLeft = UDim.new(0, 6)
  uIPadding.PaddingRight = UDim.new(0, 6)
  local uITextSizeConstraint = Instance.new("UITextSizeConstraint", textBox)
  uITextSizeConstraint.MinTextSize = 7
  uITextSizeConstraint.MaxTextSize = 15
  local uIStroke3 = Instance.new("UIStroke", textBox)
  uIStroke3.Color = Color3.fromRGB(91, 93, 100)
  uIStroke3.Thickness = 1
  uIStroke3.Transparency = 0.25
  textBox.Focused:Connect(function()
    textBox.TextColor3 = Color3.fromRGB(190, 193, 201)
    tweenService:Create(
      uIStroke3,
      TweenInfo.new(0.18, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
      { Color = Color3.fromRGB(105, 108, 116), Thickness = 1, Transparency = 0.3 }
    ):Play()
  end)
  textBox.FocusLost:Connect(function()
    textBox.TextColor3 = Color3.fromRGB(190, 193, 201)
    tweenService:Create(
      uIStroke3,
      TweenInfo.new(0.18, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
      { Color = Color3.fromRGB(91, 93, 100), Thickness = 1, Transparency = 0.25 }
    ):Play()
  end)
  local num3 = 48
  local flag5 = false
  textBox:GetPropertyChangedSignal("Text"):Connect(function()
    if textBox.Text == "" then
      textBox.CursorPosition = -1
      textBox.SelectionStart = -1
      return
    end
    if flag5 or #textBox.Text <= num3 then return end
    flag5 = true
    textBox.Text = textBox.Text:sub(1, num3)
    textBox.CursorPosition = #textBox.Text + 1
    flag5 = false
  end)
  local textLabel3 = Instance.new("TextLabel")
  textLabel3.Name = "Status"
  textLabel3.Size = textWrapped and UDim2.new(1, -44, 0, 21) or UDim2.new(1, -176, 0, 21)
  textLabel3.Position = textWrapped and UDim2.fromOffset(22, 201) or UDim2.fromOffset(160, 148)
  textLabel3.BackgroundTransparency = 1
  textLabel3.Text = ""
  textLabel3.TextColor3 = Color3.fromRGB(128, 128, 128)
  textLabel3.Font = Enum.Font.Gotham
  textLabel3.TextSize = 10
  textLabel3.TextStrokeTransparency = 1
  textLabel3.AutoLocalize = false
  textLabel3.ZIndex = 4
  textLabel3.Parent = canvasGroup2
  local textButton = Instance.new("TextButton")
  textButton.Name = "EnterButton"
  textButton.Size = UDim2.new(0.5, -18, 0, 42)
  textButton.Position = UDim2.new(0.5, 4, 1, -54)
  textButton.BackgroundColor3 = Color3.fromRGB(238, 238, 240)
  textButton.BorderSizePixel = 0
  textButton.Text = item.enter
  textButton.TextColor3 = Color3.fromRGB(11, 11, 12)
  textButton.Font = Enum.Font.RobotoMono
  textButton.TextSize = 13
  textButton.TextStrokeTransparency = 1
  textButton.AutoButtonColor = false
  textButton.AutoLocalize = false
  textButton.ZIndex = 5
  textButton.Parent = canvasGroup2
  Instance.new("UICorner", textButton).CornerRadius = UDim.new(0, 9)
  local uIStroke4 = Instance.new("UIStroke", textButton)
  uIStroke4.Color = Color3.fromRGB(255, 255, 255)
  uIStroke4.Thickness = 1
  uIStroke4.Transparency = 0.72
  local textButton2 = Instance.new("TextButton")
  textButton2.Name = "GetKeyButton"
  textButton2.Size = UDim2.new(0.5, -18, 0, 42)
  textButton2.Position = UDim2.new(0, 14, 1, -54)
  textButton2.BackgroundColor3 = Color3.fromRGB(19, 19, 21)
  textButton2.BorderSizePixel = 0
  textButton2.Text = item.getKey
  textButton2.TextColor3 = Color3.fromRGB(235, 235, 240)
  textButton2.Font = Enum.Font.RobotoMono
  textButton2.TextSize = 13
  textButton2.TextStrokeTransparency = 1
  textButton2.AutoButtonColor = false
  textButton2.AutoLocalize = false
  textButton2.ZIndex = 5
  textButton2.Parent = canvasGroup2
  Instance.new("UICorner", textButton2).CornerRadius = UDim.new(0, 9)
  local uIStroke5 = Instance.new("UIStroke", textButton2)
  uIStroke5.Color = Color3.fromRGB(80, 82, 89)
  uIStroke5.Thickness = 1
  uIStroke5.Transparency = 0.35

  local function fn(arg, arg2, backgroundColor3, backgroundColor32, color, color2)
    local uIScale2 = Instance.new("UIScale", arg)
    uIScale2.Scale = 1
    local flag6 = false
    arg.MouseEnter:Connect(function()
      flag6 = true
      tweenService:Create(uIScale2, TweenInfo.new(0.18, Enum.EasingStyle.Back, Enum.EasingDirection.Out), { Scale = 1.045 }):Play()
      tweenService:Create(arg, TweenInfo.new(0.16), { BackgroundColor3 = backgroundColor32 }):Play()
      tweenService:Create(arg2, TweenInfo.new(0.16), { Color = color2, Transparency = 0.08 }):Play()
    end)
    arg.MouseLeave:Connect(function()
      flag6 = false
      tweenService:Create(uIScale2, TweenInfo.new(0.16, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), { Scale = 1 }):Play()
      tweenService:Create(arg, TweenInfo.new(0.16), { BackgroundColor3 = backgroundColor3 }):Play()
      tweenService:Create(arg2, TweenInfo.new(0.16), { Color = color, Transparency = arg == textButton and 0.72 or 0.35 }):Play()
    end)
    arg.MouseButton1Down:Connect(function()
      tweenService:Create(uIScale2, TweenInfo.new(0.07), { Scale = 0.965 }):Play()
    end)
    arg.MouseButton1Up:Connect(function()
      tweenService:Create(uIScale2, TweenInfo.new(0.15, Enum.EasingStyle.Back, Enum.EasingDirection.Out), { Scale = flag6 and 1.045 or 1 }):Play()
    end)
    return uIScale2
  end
  fn(
    textButton2,
    uIStroke5,
    Color3.fromRGB(19, 19, 21),
    Color3.fromRGB(31, 31, 35),
    Color3.fromRGB(80, 82, 89),
    Color3.fromRGB(208, 209, 215)
  )
  fn(
    textButton,
    uIStroke4,
    Color3.fromRGB(238, 238, 240),
    Color3.fromRGB(255, 255, 255),
    Color3.fromRGB(255, 255, 255),
    Color3.fromRGB(255, 255, 255)
  )
  local textButton3 = Instance.new("TextButton")
  textButton3.Name = "HelpButton"
  textButton3.Size = UDim2.fromOffset(30, 30)
  textButton3.Position = UDim2.fromOffset(9, 8)
  textButton3.BackgroundTransparency = 1
  textButton3.BorderSizePixel = 0
  textButton3.Text = "?"
  textButton3.TextColor3 = Color3.fromRGB(174, 176, 184)
  textButton3.Font = Enum.Font.GothamBlack
  textButton3.TextSize = 18
  textButton3.TextStrokeTransparency = 1
  textButton3.AutoButtonColor = false
  textButton3.AutoLocalize = false
  textButton3.ZIndex = 20
  textButton3.Parent = canvasGroup
  local uIScale2 = Instance.new("UIScale", textButton3)
  local textButton4 = Instance.new("TextButton")
  textButton4.Name = "CloseButton"
  textButton4.AnchorPoint = Vector2.new(1, 0)
  textButton4.Size = UDim2.fromOffset(30, 30)
  textButton4.Position = UDim2.new(1, -9, 0, 8)
  textButton4.BackgroundTransparency = 1
  textButton4.BorderSizePixel = 0
  textButton4.Text = "X"
  textButton4.TextColor3 = Color3.fromRGB(255, 255, 255)
  textButton4.Font = Enum.Font.GothamBold
  textButton4.TextScaled = true
  textButton4.TextStrokeTransparency = 1
  textButton4.AutoButtonColor = false
  textButton4.ZIndex = 20
  textButton4.Parent = canvasGroup
  local uIScale3 = Instance.new("UIScale", textButton4)
  textButton3.MouseEnter:Connect(function()
    tweenService:Create(uIScale2, TweenInfo.new(0.18, Enum.EasingStyle.Back, Enum.EasingDirection.Out), { Scale = 1.16 }):Play()
    tweenService:Create(textButton3, TweenInfo.new(0.18), { Rotation = -10, TextColor3 = Color3.fromRGB(248, 248, 250) }):Play()
  end)
  textButton3.MouseLeave:Connect(function()
    tweenService:Create(uIScale2, TweenInfo.new(0.16), { Scale = 1 }):Play()
    tweenService:Create(textButton3, TweenInfo.new(0.16), { Rotation = 0, TextColor3 = Color3.fromRGB(174, 176, 184) }):Play()
  end)
  textButton3.MouseButton1Down:Connect(function()
    tweenService:Create(uIScale2, TweenInfo.new(0.07), { Scale = 0.9 }):Play()
  end)
  textButton3.MouseButton1Up:Connect(function()
    tweenService:Create(uIScale2, TweenInfo.new(0.16, Enum.EasingStyle.Back, Enum.EasingDirection.Out), { Scale = 1.12 }):Play()
  end)
  local value = nil
  local value2 = nil
  textButton4.MouseEnter:Connect(function()
    tweenService:Create(uIScale3, TweenInfo.new(0.12, Enum.EasingStyle.Quad), { Scale = 1.14 }):Play()
    if value2 then
      value2:Disconnect()
      value2 = nil
    end
    if value then value:Cancel() end
    textButton4.Rotation = 0
    value = tweenService:Create(textButton4, TweenInfo.new(1.12, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), { Rotation = 360 })
    local value3 = value
    value2 = value3.Completed:Connect(function(arg)
      if value ~= value3 then return end
      value = nil
      if value2 then
        value2:Disconnect()
        value2 = nil
      end
      if arg == Enum.PlaybackState.Completed and textButton4.Parent then textButton4.Rotation = 0 end
    end)
    value:Play()
  end)
  textButton4.MouseLeave:Connect(function()
    if value2 then
      value2:Disconnect()
      value2 = nil
    end
    if value then value:Cancel() end
    value = nil
    tweenService:Create(uIScale3, TweenInfo.new(0.12, Enum.EasingStyle.Quad), { Scale = 1 }):Play()
    textButton4.Rotation = 0
  end)
  local canvasGroup3 = Instance.new("CanvasGroup")
  canvasGroup3.Name = "HelpPanel"
  canvasGroup3.Size = UDim2.new(1, -24, 1, -67)
  canvasGroup3.Position = UDim2.fromOffset(12, 55)
  canvasGroup3.BackgroundColor3 = Color3.fromRGB(8, 8, 9)
  canvasGroup3.BackgroundTransparency = 1
  canvasGroup3.BorderSizePixel = 0
  canvasGroup3.ClipsDescendants = true
  canvasGroup3.GroupTransparency = 1
  canvasGroup3.Visible = false
  canvasGroup3.ZIndex = 12
  canvasGroup3.Parent = canvasGroup
  local uIScale4 = Instance.new("UIScale", canvasGroup3)
  uIScale4.Scale = 0.94
  local textLabel4 = Instance.new("TextLabel")
  textLabel4.Name = "HelpTitle"
  textLabel4.Size = UDim2.new(1, -80, 0, 28)
  textLabel4.Position = UDim2.fromOffset(14, 7)
  textLabel4.BackgroundTransparency = 1
  textLabel4.Text = tbl2[1].helpTitle
  textLabel4.TextColor3 = Color3.fromRGB(245, 245, 247)
  textLabel4.Font = Enum.Font.RobotoMono
  textLabel4.FontFace = Font.new("rbxasset://fonts/families/RobotoMono.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal)
  textLabel4.TextSize = textWrapped and 16 or 18
  textLabel4.TextStrokeTransparency = 1
  textLabel4.TextXAlignment = Enum.TextXAlignment.Left
  textLabel4.AutoLocalize = false
  textLabel4.ZIndex = 13
  textLabel4.Parent = canvasGroup3
  local textLabel5 = Instance.new("TextLabel")
  textLabel5.Name = "HelpIntro"
  textLabel5.Size = UDim2.new(1, -28, 0, 20)
  textLabel5.Position = UDim2.fromOffset(14, 36)
  textLabel5.BackgroundTransparency = 1
  textLabel5.Text = tbl2[1].helpIntro
  textLabel5.TextColor3 = Color3.fromRGB(172, 175, 184)
  textLabel5.Font = Enum.Font.RobotoMono
  textLabel5.FontFace = Font.new("rbxasset://fonts/families/RobotoMono.json", Enum.FontWeight.Medium, Enum.FontStyle.Normal)
  textLabel5.TextSize = textWrapped and 11 or 12
  textLabel5.TextStrokeTransparency = 1
  textLabel5.TextXAlignment = Enum.TextXAlignment.Left
  textLabel5.AutoLocalize = false
  textLabel5.ZIndex = 13
  textLabel5.Parent = canvasGroup3
  local tbl4 = {}
  local tbl5 = {}
  local textWrapped3 = textWrapped and 32 or 27
  local textWrapped4 = textWrapped and 35 or 27
  for index, text2 in ipairs(tbl2[1].helpSteps) do
    local frame5 = Instance.new("Frame")
    frame5.Name = "Step" .. tostring(index)
    frame5.Size = UDim2.new(1, -28, 0, textWrapped3)
    frame5.Position = UDim2.fromOffset(14, 60 + ((index - 1) * textWrapped4))
    frame5.BackgroundTransparency = 1
    frame5.ZIndex = 13
    frame5.Parent = canvasGroup3
    local textLabel6 = Instance.new("TextLabel")
    textLabel6.Name = "Number"
    textLabel6.Size = UDim2.fromOffset(20, textWrapped3)
    textLabel6.Position = UDim2.fromOffset(0, 0)
    textLabel6.BackgroundTransparency = 1
    textLabel6.BorderSizePixel = 0
    textLabel6.Text = tostring(index) .. "."
    textLabel6.TextColor3 = Color3.fromRGB(190, 192, 200)
    textLabel6.Font = Enum.Font.RobotoMono
    textLabel6.FontFace = Font.new("rbxasset://fonts/families/RobotoMono.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal)
    textLabel6.TextSize = textWrapped and 12 or 13
    textLabel6.TextStrokeTransparency = 1
    textLabel6.ZIndex = 14
    textLabel6.Parent = frame5
    tbl4[index] = textLabel6
    local textLabel7 = Instance.new("TextLabel")
    textLabel7.Name = "Text"
    textLabel7.Size = UDim2.new(1, -26, 1, 0)
    textLabel7.Position = UDim2.fromOffset(26, 0)
    textLabel7.BackgroundTransparency = 1
    textLabel7.Text = text2
    textLabel7.TextColor3 = Color3.fromRGB(226, 227, 232)
    textLabel7.Font = Enum.Font.RobotoMono
    textLabel7.FontFace = Font.new("rbxasset://fonts/families/RobotoMono.json", Enum.FontWeight.SemiBold, Enum.FontStyle.Normal)
    textLabel7.TextSize = textWrapped and 11 or 12
    textLabel7.TextStrokeTransparency = 1
    textLabel7.TextXAlignment = Enum.TextXAlignment.Left
    textLabel7.TextWrapped = textWrapped
    textLabel7.TextYAlignment = Enum.TextYAlignment.Center
    textLabel7.TextTruncate = Enum.TextTruncate.None
    textLabel7.AutoLocalize = false
    textLabel7.ZIndex = 14
    textLabel7.Parent = frame5
    tbl5[index] = textLabel7
  end
  local num4 = 1
  local tbl6 = { "ES", "EN", "PT", "AR" }
  local textButton5 = Instance.new("TextButton")
  textButton5.Name = "TutorialLanguage"
  textButton5.AnchorPoint = Vector2.new(1, 0)
  textButton5.Size = UDim2.fromOffset(22, 23)
  textButton5.Position = UDim2.new(1, -1, 0, 6)
  textButton5.BackgroundTransparency = 1
  textButton5.BorderSizePixel = 0
  textButton5.Text = tbl6[num4]
  textButton5.TextColor3 = Color3.fromRGB(172, 175, 184)
  textButton5.Font = Enum.Font.RobotoMono
  textButton5.FontFace = Font.new("rbxasset://fonts/families/RobotoMono.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal)
  textButton5.TextSize = 10
  textButton5.TextStrokeTransparency = 1
  textButton5.AutoButtonColor = false
  textButton5.AutoLocalize = false
  textButton5.ZIndex = 18
  textButton5.Parent = canvasGroup3
  local uIScale5 = Instance.new("UIScale", textButton5)

  local function fn2()
    local item2 = tbl2[num4]
    local flag6 = num4 == 4
    textLabel4.Text = item2.helpTitle
    textLabel5.Text = item2.helpIntro
    textLabel4.TextXAlignment = flag6 and Enum.TextXAlignment.Right or Enum.TextXAlignment.Left
    textLabel5.TextXAlignment = flag6 and Enum.TextXAlignment.Right or Enum.TextXAlignment.Left
    for index, text2 in ipairs(item2.helpSteps) do
      local item3 = tbl4[index]
      local item4 = tbl5[index]
      item3.Position = flag6 and UDim2.new(1, -20, 0, 0) or UDim2.fromOffset(0, 0)
      item4.Position = flag6 and UDim2.fromOffset(0, 0) or UDim2.fromOffset(26, 0)
      item4.TextXAlignment = flag6 and Enum.TextXAlignment.Right or Enum.TextXAlignment.Left
      item4.Text = text2
    end
    textButton5.Text = tbl6[num4]
  end
  textButton5.MouseEnter:Connect(function()
    tweenService:Create(uIScale5, TweenInfo.new(0.16, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), { Scale = 1.12 }):Play()
    tweenService:Create(textButton5, TweenInfo.new(0.16), { TextColor3 = Color3.fromRGB(248, 248, 250) }):Play()
  end)
  textButton5.MouseLeave:Connect(function()
    tweenService:Create(uIScale5, TweenInfo.new(0.16, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), { Scale = 1 }):Play()
    tweenService:Create(textButton5, TweenInfo.new(0.16), { TextColor3 = Color3.fromRGB(172, 175, 184) }):Play()
  end)
  textButton5.Activated:Connect(function()
    tweenService:Create(uIScale5, TweenInfo.new(0.07), { Scale = 0.9 }):Play()
    num4 = (num4 % #tbl6) + 1
    fn2()
    task.delay(0.08, function()
      if uIScale5.Parent then
        tweenService:Create(uIScale5, TweenInfo.new(0.16, Enum.EasingStyle.Back, Enum.EasingDirection.Out), { Scale = 1 }):Play()
      end
    end)
  end)
  fn2()
  local flag6 = false
  local flag7 = false

  local function fn3(arg)
    if flag7 or flag6 == arg then return end
    flag7 = true
    flag6 = arg
    if arg then
      tweenService:Create(textButton3, TweenInfo.new(0.18), { TextColor3 = Color3.fromRGB(250, 250, 252) }):Play()
      tweenService:Create(canvasGroup2, TweenInfo.new(0.12, Enum.EasingStyle.Quad, Enum.EasingDirection.In), { GroupTransparency = 1 }):Play()
      task.delay(0.13, function()
        if not flag6 or not canvasGroup3.Parent then return end
        canvasGroup2.Visible = false
        canvasGroup3.Visible = true
        canvasGroup3.GroupTransparency = 1
        uIScale4.Scale = 0.94
        tweenService:Create(canvasGroup3, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), { GroupTransparency = 0 }):Play()
        tweenService:Create(uIScale4, TweenInfo.new(0.25, Enum.EasingStyle.Back, Enum.EasingDirection.Out), { Scale = 1 }):Play()
        task.delay(0.26, function()
          flag7 = false
        end)
      end)
    else
      tweenService:Create(canvasGroup3, TweenInfo.new(0.16, Enum.EasingStyle.Quad, Enum.EasingDirection.In), { GroupTransparency = 1 }):Play()
      tweenService:Create(uIScale4, TweenInfo.new(0.16, Enum.EasingStyle.Quad, Enum.EasingDirection.In), { Scale = 0.95 }):Play()
      tweenService:Create(textButton3, TweenInfo.new(0.16), { TextColor3 = Color3.fromRGB(174, 176, 184) }):Play()
      task.delay(0.17, function()
        if canvasGroup3.Parent and not flag6 then
          canvasGroup3.Visible = false
          canvasGroup2.Visible = true
          canvasGroup2.GroupTransparency = 1
          tweenService:Create(canvasGroup2, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), { GroupTransparency = 0 }):Play()
          task.delay(0.21, function()
            flag7 = false
          end)
        end
      end)
    end
  end
  textButton3.Activated:Connect(function()
    fn3(not flag6)
  end)
  local userInputService2 = game:GetService("UserInputService")
  local flag8 = false
  local value3 = nil
  local value4 = nil
  local value5 = nil
  local uDim2 = UDim2.fromScale(0.5, 0.5)
  frame3.InputBegan:Connect(function(arg)
    if arg.UserInputType == Enum.UserInputType.MouseButton1 or arg.UserInputType == Enum.UserInputType.Touch then
      flag8 = true
      value4 = arg.Position
      uDim2 = canvasGroup.Position
      value5 = uDim2
      arg.Changed:Connect(function()
        if arg.UserInputState == Enum.UserInputState.End then flag8 = false end
      end)
    end
  end)
  frame3.InputChanged:Connect(function(arg)
    if arg.UserInputType == Enum.UserInputType.MouseMovement or arg.UserInputType == Enum.UserInputType.Touch then
      value3 = arg
    end
  end)
  local connection = userInputService2.InputChanged:Connect(function(arg)
    if flag8 and arg == value3 and value4 and value5 then
      local num5 = arg.Position - value4
      uDim2 = UDim2.new(value5.X.Scale, value5.X.Offset + num5.X, value5.Y.Scale, value5.Y.Offset + num5.Y)
    end
  end)
  local connection2 = runService.RenderStepped:Connect(function(arg)
    local num5 = 1 - math.exp(-12 * math.min(arg, 0.05))
    canvasGroup.Position = canvasGroup.Position:Lerp(uDim2, num5)
  end)
  local now = os.clock()
  local v
  v = runService.RenderStepped:Connect(function()
    if not screenGui.Parent or not imageLabel2.Parent then
      v:Disconnect()
      return
    end
    local num5 = math.sin(((os.clock() - now) * math.pi / 1.55) - (math.pi * 0.5))
    local num6 = -((num5 + 1) * 1.5)
    imageLabel2.Position = UDim2.new(position.X.Scale, position.X.Offset, position.Y.Scale, position.Y.Offset + num6)
    imageLabel2.Rotation = 0.3 + (num5 * 1.05)
  end)

  local function fn4(arg)
    if arg:IsA("TextLabel") or arg:IsA("TextButton") or arg:IsA("TextBox") then
      arg.Font = Enum.Font.Garamond
      if not arg.TextScaled and arg:GetAttribute("Young0xKeyTypography") ~= true then
        arg:SetAttribute("Young0xKeyTypography", true)
        arg.TextSize += 1
      end
    end
  end
  for index, item2 in ipairs(screenGui:GetDescendants()) do
    fn4(item2)
  end
  screenGui.DescendantAdded:Connect(fn4)
  tweenService:Create(canvasGroup, TweenInfo.new(0.28, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), { GroupTransparency = 0 }):Play()
  tweenService:Create(uIScale, TweenInfo.new(0.34, Enum.EasingStyle.Back, Enum.EasingDirection.Out), { Scale = 1 }):Play()
  local flag9 = false
  local flag10 = false
  local flag11 = false
  local value6 = nil
  local num5 = 0

  local function fn5(text2, textColor3, arg)
    num5 += 1
    local num6 = num5
    textLabel3.TextTransparency = 1
    textLabel3.Text = text2
    textLabel3.TextColor3 = textColor3
    if text2 ~= "" then
      tweenService:Create(textLabel3, TweenInfo.new(0.16, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), { TextTransparency = 0 }):Play()
    end
    if arg then
      task.delay(arg, function()
        if not flag9 and screenGui.Parent and num6 == num5 then
          local tween = tweenService:Create(textLabel3, TweenInfo.new(0.14, Enum.EasingStyle.Quad, Enum.EasingDirection.In), { TextTransparency = 1 })
          tween:Play()
          tween.Completed:Wait()
          if screenGui.Parent and num6 == num5 then
            textLabel3.Text = ""
            textLabel3.TextColor3 = Color3.fromRGB(128, 128, 128)
          end
        end
      end)
    end
  end

  local function fn6()
    if value6 then return value6 end
    local ok, result = pcall(function()
      local httpGet = game:HttpGet(tbl3.sdkUrl)
      local result = loadstring(httpGet)
      if type(result) ~= "function" then error("SDK_INVALID") end
      return result()
    end)
    if not ok or type(result) ~= "table" then return nil end
    result.service = tbl3.service
    result.identifier = tbl3.identifier
    result.provider = tbl3.provider
    value6 = result
    return value6
  end

  local function fn7(arg)
    arg = tonumber(arg)
    if not arg then return nil end
    if arg > 100000000000 then arg = math.floor(arg / 1000) end
    arg = math.floor(arg)
    return arg > 0 and arg or nil
  end
  local value7 = nil

  local function fn8()
    if type(isfile) ~= "function" or type(readfile) ~= "function" then return nil end
    local ok, key = pcall(function()
      if isfile(text) then return readfile(text) end
      return nil
    end)
    if not ok or type(key) ~= "string" or key == "" then return nil end
    local ok2, result = pcall(function()
      return game:GetService("HttpService"):JSONDecode(key)
    end)
    if ok2 and type(result) == "table" and type(result.key) == "string" and result.key ~= "" then
      local expiresAt = fn7(result.expiresAt)
      local startedAt = fn7(result.startedAt)
      if not startedAt and expiresAt then startedAt = expiresAt - 86400 end
      startedAt = startedAt or fn7(result.validatedAt)
      value7 = { key = result.key, expiresAt = expiresAt, startedAt = startedAt }
      return value7.key
    end
    value7 = { key = key, expiresAt = nil, startedAt = nil }
    return key
  end

  local function fn9(key, expiresAt, startedAt)
    if type(writefile) ~= "function" then return end
    pcall(function()
      if type(isfolder) == "function" and type(makefolder) == "function" then
        if not isfolder("Young0xHub") then makefolder("Young0xHub") end
        if not isfolder("Young0xHub/PublicTraining") then makefolder("Young0xHub/PublicTraining") end
      end
      local json = game:GetService("HttpService"):JSONEncode({
        version = 2,
        key = key,
        expiresAt = expiresAt,
        startedAt = startedAt,
        validatedAt = startedAt,
        lastCheckedAt = os.time(),
      })
      writefile(text, json)
    end)
  end

  local function fn10()
    if type(isfile) == "function" and type(delfile) == "function" then
      pcall(function()
        if isfile(text) then delfile(text) end
      end)
    end
  end

  local function getInvalid(arg)
    local message = type(arg) == "table" and (arg.error or arg.message) or nil
    if message == "KEY_EXPIRED" then return item.expired end
    if message == "HWID_MISMATCH" then return item.device end
    if message == "KEY_INVALIDATED" then return item.invalidated end
    if message == "ALREADY_USED" then return item.used end
    if message == "SERVICE_MISMATCH" then return item.mismatch end
    if type(message) == "string" and message:match("429") then return item.retry end
    return item.invalid
  end

  local function fn11(arg, arg2)
    task.spawn(function()
      while localPlayer.Parent do
        task.wait(180)
        local ok, result = pcall(function()
          return arg.check_key(arg2)
        end)
        if ok and type(result) == "table" and result.valid ~= true then
          local message = result.error or result.message
          if message == "KEY_EXPIRED" or message == "KEY_INVALIDATED" or message == "HWID_MISMATCH" then
            fn10()
            localPlayer:Kick(message == "KEY_EXPIRED" and item.kickExpired or item.kickInvalid)
            break
          end
        end
      end
    end)
  end

  local function fn12()
    if flag11 or flag9 then return end
    local match = tostring(textBox.Text or ""):match("^%s*(.-)%s*$")
    if match == "" then
      fn5(item.paste, Color3.fromRGB(230, 165, 70), 1.5)
      return
    end
    flag11 = true
    textButton.Text = item.validating
    fn5(item.checking, Color3.fromRGB(185, 185, 185))
    local young0xPublicTrainingKeyClie = fn6()
    if not young0xPublicTrainingKeyClie then
      flag11 = false
      textButton.Text = item.enter
      fn5(item.connection, Color3.fromRGB(255, 95, 95), 3)
      return
    end
    local ok, result = pcall(function()
      return young0xPublicTrainingKeyClie.check_key(match)
    end)
    flag11 = false
    textButton.Text = item.enter
    if ok and type(result) == "table" and result.valid == true then
      local young0xPublicTrainingKey = _G2.Young0xPublicTrainingKey
      local young0xPublicTrainingStarted = young0xPublicTrainingKey == match and fn7(_G2.Young0xPublicTrainingStartedAt) or nil
      if not young0xPublicTrainingStarted and young0xPublicTrainingKey == match then
        local result2 = fn7(_G2.Young0xPublicTrainingExpiresAt)
        young0xPublicTrainingStarted = result2 and (result2 - 86400) or nil
      end
      if value7 and value7.key == match then
        young0xPublicTrainingStarted = value7.startedAt or young0xPublicTrainingStarted
      end
      young0xPublicTrainingStarted = young0xPublicTrainingStarted or os.time()
      local young0xPublicTrainingExpires = young0xPublicTrainingStarted + 86400
      if value7 and value7.key == match and value7.expiresAt then
        young0xPublicTrainingExpires = value7.expiresAt
      end
      if young0xPublicTrainingExpires <= os.time() then
        fn10()
        textBox.Text = ""
        fn5(item.expired, Color3.fromRGB(255, 95, 95), 3)
        return
      end
      _G2.SCRIPT_KEY = match
      _G2.Young0xPublicTrainingKey = match
      _G2.Young0xPublicTrainingKeyClient = young0xPublicTrainingKeyClie
      _G2.Young0xPublicTrainingStartedAt = young0xPublicTrainingStarted
      _G2.Young0xPublicTrainingExpiresAt = young0xPublicTrainingExpires
      if flag4 then _G2.Young0xPublicTrainingResumeValidated = true end
      fn9(match, young0xPublicTrainingExpires, young0xPublicTrainingStarted)
      flag9 = true
      fn5(item.success, Color3.fromRGB(75, 235, 125))
    else
      local invalid = getInvalid(result)
      fn5(invalid, Color3.fromRGB(255, 95, 95), 3)
      if invalid == item.invalid then
        local text2 = textBox.Text
        local num6 = num5
        task.delay(3, function()
          if screenGui.Parent and num5 == num6 and textBox.Text == text2 then textBox.Text = "" end
        end)
      end
    end
  end
  textButton.Activated:Connect(fn12)
  textBox.FocusLost:Connect(function(arg)
    if arg then fn12() end
  end)
  textButton2.Activated:Connect(function()
    if flag11 or flag9 then return end
    flag11 = true
    textButton2.Text = item.loading
    fn5("", Color3.fromRGB(128, 128, 128))
    local result = fn6()
    local text2 = nil
    if result then
      pcall(function()
        text2 = result.get_key_link()
      end)
    end
    if type(text2) ~= "string" or text2 == "" then text2 = tbl3.directLink end
    local flag12 = false
    local openUrl = _G2.openurl or _G2.open_url
    if type(openUrl) == "function" then flag12 = pcall(openUrl, text2) end
    if not flag12 then
      flag12 = pcall(function()
        game:GetService("GuiService"):OpenBrowserWindow(text2)
      end)
    end
    local toclipboard2 = setclipboard or toclipboard
    local flag13 = false
    if type(toclipboard2) == "function" then flag13 = pcall(toclipboard2, text2) end
    if flag13 then
      textButton2.Text = item.copied
      fn5(item.linkCopied, Color3.fromRGB(75, 235, 125), 1.5)
    elseif flag12 then
      textButton2.Text = item.opened
      fn5(item.linkOpened, Color3.fromRGB(75, 235, 125), 1.5)
    else
      textBox.Text = text2
      textButton2.Text = item.copy
      fn5(item.openAbove, Color3.fromRGB(230, 165, 70), 1.5)
    end
    task.wait(0.7)
    if textButton2.Parent then textButton2.Text = item.getKey end
    flag11 = false
  end)
  local text2 = flag2 and nil or fn8()
  if type(text2) == "string" and text2 ~= "" then
    if value7 and value7.expiresAt and value7.expiresAt <= os.time() then
      fn10()
      value7 = nil
      fn5(item.expired, Color3.fromRGB(255, 95, 95), 3)
    elseif value7 and value7.expiresAt then
      _G2.Young0xPublicTrainingStartedAt = value7.startedAt
      _G2.Young0xPublicTrainingExpiresAt = value7.expiresAt
      textBox.Text = text2
      task.defer(fn12)
    else
      textBox.Text = text2
      task.defer(fn12)
    end
  end
  local flag12 = false

  local function fn13()
    if flag12 then return end
    flag12 = true
    flag8 = false
    local tween = tweenService:Create(uIScale, TweenInfo.new(0.16, Enum.EasingStyle.Quad, Enum.EasingDirection.In), { Scale = 0.9 })
    local tween2 = tweenService:Create(canvasGroup, TweenInfo.new(0.17, Enum.EasingStyle.Quad, Enum.EasingDirection.In), { GroupTransparency = 1 })
    tween:Play()
    tween2:Play()
    tween2.Completed:Wait()
  end
  textButton4.Activated:Connect(function()
    if flag12 then return end
    task.spawn(function()
      fn13()
      flag10 = true
      screenGui.Enabled = false
    end)
  end)
  repeat
    task.wait(0.1)
  until flag9 or flag10
  if flag10 then
    connection:Disconnect()
    connection2:Disconnect()
    screenGui:Destroy()
    return false
  end
  task.wait(0.12)
  fn13()
  connection:Disconnect()
  connection2:Disconnect()
  screenGui:Destroy()
  return true
end)() then
  return
end
task.spawn(function()
  pcall(function()
    local _G2 = getgenv and getgenv() or _G
    local value = rawget(_G2, "syn") or rawget(_G, "syn")
    local request = rawget(_G2, "request") or rawget(_G2, "http_request") or (type(value) == "table" and value.request)
    if type(request) ~= "function" then return end
    local executor, executorVersion = "No disponible", ""
    local value2 = rawget(_G2, "identifyexecutor") or rawget(_G2, "getexecutorname")
    if type(value2) == "function" then
      local ok, result, result2 = pcall(value2)
      if ok and result ~= nil then
        executor = tostring(result)
        executorVersion = result2 ~= nil and tostring(result2) or ""
      end
    end
    local platform = "No disponible"
    pcall(function()
      platform = tostring(userInputService:GetPlatform()):gsub("Enum.Platform.", "")
    end)
    local serverType = "Publico"
    pcall(function()
      if tostring(game.PrivateServerId or "") ~= "" then serverType = "Privado" end
    end)
    local httpService = game:GetService("HttpService")
    local guid = httpService:GenerateGUID(false)
    request({
      Url = "https://api.young0x.com/v1/public-training/execution",
      Method = "POST",
      Headers = { ["Content-Type"] = "application/json" },
      Body = httpService:JSONEncode({
        eventId = guid,
        version = "Public Training",
        robloxUserId = tostring(localPlayer.UserId),
        username = localPlayer.Name,
        displayName = localPlayer.DisplayName,
        executor = executor,
        executorVersion = executorVersion,
        platform = platform,
        placeId = tostring(game.PlaceId),
        universeId = tostring(game.GameId),
        jobId = tostring(game.JobId),
        playerCount = #players:GetPlayers(),
        maxPlayers = players.MaxPlayers,
        serverType = serverType,
      }),
      Timeout = 4,
    })
  end)
end)
do
  local _G2 = getgenv and getgenv() or _G
  local young0xPublicTrainingExpiryA = _G2.Young0xPublicTrainingExpiryAntiAfk
  if type(young0xPublicTrainingExpiryA) == "table" then
    young0xPublicTrainingExpiryA.running = false
    if young0xPublicTrainingExpiryA.idled then
      pcall(function()
        young0xPublicTrainingExpiryA.idled:Disconnect()
      end)
    end
    if young0xPublicTrainingExpiryA.thread then pcall(task.cancel, young0xPublicTrainingExpiryA.thread) end
  end
  _G2.Young0xPublicTrainingExpiryAntiAfk = nil
end
local parent = nil
local closeHub = nil
local requestCloseConfirmation = nil
local setHubMinimized = nil
local flag = false
local value = nil
local value2 = nil
local tbl2 = {}

local function fn(arg)
  tbl2[#tbl2 + 1] = arg
  return arg
end

local function fn2()
  for index, item in ipairs(tbl2) do
    if item then
      pcall(function()
        item:Disconnect()
      end)
    end
  end
  tbl2 = {}
end
local vector2 = workspace.CurrentCamera and workspace.CurrentCamera.ViewportSize or Vector2.new(1280, 720)
local touchEnabled = userInputService.TouchEnabled or (vector2.X <= 820 and vector2.Y <= 700)
if touchEnabled then
  local flag2 = vector2.X > vector2.Y
  uI.hubW = math.floor(math.min(math.max(280, vector2.X - 10), math.clamp(vector2.X * (flag2 and 0.78 or 0.96), 320, flag2 and 560 or 430)))
  uI.hubH = math.floor(math.min(math.max(270, vector2.Y - 10), math.clamp(vector2.Y * (flag2 and 0.78 or 0.72), 300, 390)))
  uI.titleH = 48
  uI.tabH = 44
  uI.tabY = 48
end
local bRG = getgenv().BRG
getgenv().BRG = { young0xReloading = true }
if type(bRG) == "table" then
  if type(bRG.closeHub) == "function" then
    pcall(bRG.closeHub, true)
  elseif type(bRG.stopAutoTraining) == "function" then
    pcall(bRG.stopAutoTraining)
  else
    for index, item in ipairs({ "setAutoWeight", "setAutoHandstands", "setAutoPushups", "setAutoSitups" }) do
      if type(bRG[item]) == "function" then pcall(bRG[item], false) end
    end
  end
end
if type(bRG) == "table" and bRG.autoKingPlatform then
  pcall(function()
    bRG.autoKingPlatform:Destroy()
  end)
end
local young0xAutoKingPlatform = workspace:FindFirstChild("Young0xAutoKingPlatform")
if young0xAutoKingPlatform then
  pcall(function()
    young0xAutoKingPlatform:Destroy()
  end)
end
getgenv().BRG = {}
local bRG2 = getgenv().BRG
bRG2.credit = by
bRG2.young0xBuild = "public-training-2026.09.26-overcharge-release"
bRG2.Young0x = { by = by, text = "Young0x Hub On Top", channel = tbl.Texts.youtubeUrl }
bRG2.fastPunch = false
bRG2.selectedRock = nil
bRG2.selectedRockDefinition = nil
bRG2.autoFarm = false
bRG2.antiAfk = false
bRG2.afkStartTime = nil
bRG2.afkStartedAtUnix = nil
bRG2.fly = false
bRG2.flySpeed = 10
bRG2.stars = false
bRG2.hideDurability = false
bRG2.trainingMode = nil
bRG2.machineDefinition = nil
bRG2.machineSeat = nil
bRG2.machineModel = nil
bRG2.autoWeight = false
bRG2.autoHandstands = false
bRG2.autoPushups = false
bRG2.autoSitups = false
bRG2.fastRep = false
bRG2.autoEgg = false
bRG2.autoEggRun = 0
bRG2.autoKing = false
bRG2.autoKingRun = 0
bRG2.autoKingCFrame = nil
bRG2.autoKingPlatform = nil
bRG2.lockPosition = false
bRG2.lockPositionRun = 0
bRG2.lockPositionCFrame = nil
bRG2.autoRebirth = false
bRG2.autoRebirthRun = 0
bRG2.rebirthTargetMode = false
bRG2.rebirthTarget = nil
bRG2.autoSpinFortune = false
bRG2.autoSpinFortuneRun = 0
bRG2.consumeAll = false
bRG2.autoMapChests = false
bRG2.collectingMapChests = false
bRG2.resumeRequested = getgenv().Young0xPublicTrainingResumeValidated == true
getgenv().Young0xPublicTrainingResumeValidated = nil
bRG2.resumePath = "Young0xHub/PublicTraining/session-" .. tostring(localPlayer.UserId) .. ".txt"
bRG2.profileRoot = "Young0xHub/PublicTraining/profiles"
bRG2.profileFolder = bRG2.profileRoot .. "/" .. tostring(localPlayer.UserId)
bRG2.publicModuleUrl = "https://raw.githubusercontent.com/Young0xHUB/MuscleLegends/main/modules/pt.lua"
bRG2.antiLagUsed = false
bRG2.combatAntiLag = false
bRG2.selectedRockRequirement = nil
bRG2.giftSelectedUserId = nil
bRG2.giftAmount = "10"
bRG2.keyExpiresAt = tonumber(getgenv().Young0xPublicTrainingExpiresAt) or (os.time() + 86400)
bRG2.keyStartedAt = tonumber(getgenv().Young0xPublicTrainingStartedAt) or (bRG2.keyExpiresAt - 86400)
bRG2.keyClient = getgenv().Young0xPublicTrainingKeyClient
bRG2.keyValue = getgenv().Young0xPublicTrainingKey
bRG2.accessExpired = false
bRG2.tabOpenHandlers = {}
bRG2.petShopModuleUrl = "https://raw.githubusercontent.com/Young0xHUB/Young0x-HUB/refs/heads/main/modules/pets.lua"

local function fn3()
  local players2 = game:GetService("Players")
  local replicatedStorage2 = game:GetService("ReplicatedStorage")
  local userInputService2 = game:GetService("UserInputService")
  local tweenService2 = game:GetService("TweenService")
  local runService2 = game:GetService("RunService")
  local httpService = game:GetService("HttpService")
  local teleportService = game:GetService("TeleportService")
  local collectionService = game:GetService("CollectionService")
  local localPlayer2 = players2.LocalPlayer
  local playerGui = localPlayer2:WaitForChild("PlayerGui")
  local _G2 = getgenv and getgenv() or _G
  local brawl = replicatedStorage2:WaitForChild("shared"):WaitForChild("state"):WaitForChild("Brawl")
  local brawlEvent = replicatedStorage2:WaitForChild("rEvents"):WaitForChild("brawlEvent")
  local tbl3 = {}
  local str = "https://raw.githubusercontent.com/Young0xHUB/MuscleLegends/main/modules/pt.lua"
  local str2 = "https://cdn.jsdelivr.net/gh/Young0xHUB/MuscleLegends@main/modules/pt.lua"
  local str3 = "https://games.roblox.com/v1/games/%d/servers/Public?sortOrder=%s&limit=100"
  local num = 60
  local num2 = 10
  local num3 = 3
  local num4 = 50
  local num5 = 0.75
  local num6 = 4.5
  local num7 = 5
  local num8 = 0.06
  local num9 = 0.1
  local num10 = 0.025
  local num11 = 0.8
  local num12 = 0.2
  local num13 = 4.5
  local num14 = 4
  local num15 = 0.8
  local num16 = 0.75
  local num17 = 0.02
  local str4 = "InBossArena"
  local str5 = "BossArenaSpawn"
  local num18 = 300
  local num19 = 2955289715
  local str6 = "Young0xKillsServerHop"
  local str7 = "Young0xKillsStateV2"
  local cFrame = CFrame.new(
    2.584275245666504,
    85.0835952758789,
    244.5189208984375,
    0.99989253282547,
    -2.7966475357743548e-8,
    0.014658823609352112,
    2.9541384449771616e-8,
    1,
    -1.0722103382931893e-7,
    -0.014658823609352112,
    1.0764255620188125e-7,
    0.99989253282547
  )
  local flag2 = false
  pcall(function()
    flag2 = teleportService:GetTeleportSetting(str6) == true
  end)
  local value3 = nil
  pcall(function()
    local teleportSetting = teleportService:GetTeleportSetting(str7)
    if type(teleportSetting) == "table" then value3 = teleportSetting end
  end)
  local flag3 = _G2.Young0xKillsServerHopSticky == true
  local gethiddenprop = _G2.gethiddenproperty or _G2.gethiddenprop
  local flag4, str8 = false, ""
  if #tbl3 > 0 and type(gethiddenprop) == "function" then
    flag4, str8 = pcall(gethiddenprop, game, "PrivateServerId")
  end
  local str9 = flag4 and tostring(str8 or "") or ""
  if str9 ~= "" and table.find(tbl3, str9) then return end
  local young0xAutoKill = _G2.Young0xAutoKill
  local young0xKillsResume = type(_G2.Young0xKillsResume) == "table" and _G2.Young0xKillsResume or value3 or nil
  if not young0xKillsResume and young0xAutoKill and type(young0xAutoKill.State) == "table" and young0xAutoKill.State.running then
    local state = young0xAutoKill.State
    young0xKillsResume = {
      autoKill = state.autoKill,
      autoWinBrawl = state.autoWinBrawl,
      protectFriends = state.protectFriends,
      serverHop = state.serverHop,
      killBoss = state.killBoss,
      serverHistory = state.serverHistory,
      friendIds = state.friendIds,
    }
  end
  if young0xAutoKill and type(young0xAutoKill.Shutdown) == "function" then
    pcall(young0xAutoKill.Shutdown, true)
  end
  _G2.Young0xKillsResume = nil
  local young0xAutoKill2 = {
    BossReporter = {
      Api = "https://api.young0x.com/v1/boss/report",
      Token = "1c38160ff96fb532d2ac192e5e49d5eedad1850fac807077e2038eaa457d1a24",
      PlaceId = 3623096087,
      LastStatus = "not-started",
      LastHttpStatus = nil,
      LastAttemptAt = 0,
      LastRefreshAt = 0,
      LastPlayerCount = -1,
      QueueCount = 0,
      LastReport = type(_G2.Young0xLastBossReport) == "table" and _G2.Young0xLastBossReport or nil,
      Profiles = {
        [1] = {
          rarityName = "Common",
          displayName = "Common Boss",
          modelName = "Boss1",
          maxHealth = 63250,
        },
        [2] = { rarityName = "Rare", displayName = "Rare Boss", modelName = "Boss2", maxHealth = 77000 },
        [3] = { rarityName = "Epic", displayName = "Epic Boss", modelName = "Boss3", maxHealth = 88000 },
        [4] = {
          rarityName = "Legendary",
          displayName = "Legendary Boss",
          modelName = "Boss4",
          maxHealth = 115500,
        },
        [5] = {
          rarityName = "Mythic",
          displayName = "Mythic Boss",
          modelName = "Boss5",
          maxHealth = 126500,
        },
        [6] = {
          rarityName = "Rainbow",
          displayName = "Rainbow Boss",
          modelName = "BossRainbow",
          maxHealth = 101750,
        },
      },
    },
    RefreshBossHealthCard = function() end,
  }
  local state = {
    running = true,
    autoKill = false,
    autoWinBrawl = false,
    brawlPhase = "IDLE",
    brawlBusy = false,
    brawlCombat = false,
    brawlJoined = false,
    brawlJoinSent = false,
    brawlChosen = nil,
    brawlBaselineWins = nil,
    protectFriends = false,
    targetMode = false,
    target = nil,
    lockCFrame = nil,
    lockCharacter = nil,
    combatCFrame = nil,
    targetRetryAt = {},
    targetRejectedCharacter = {},
    unsafeTargets = {},
    activeKillTarget = nil,
    lastCombatTarget = nil,
    lastCombatTargetAt = 0,
    movementWalkSpeed = nil,
    serverHop = false,
    killBoss = false,
    bossCombat = false,
    bossStatus = "Sin boss activo",
    bossDamage = 0,
    bossAttacks = 0,
    bossHits = 0,
    antiLag60 = false,
    serverHistory = young0xKillsResume and type(young0xKillsResume.serverHistory) == "table" and young0xKillsResume.serverHistory or {},
    lastObservedKills = nil,
    lastKillAt = os.clock(),
    autoKillCycleStartedAt = 0,
    autoKillCycleEndsAt = 0,
    autoKillCycleKills = 0,
    autoKillCycleAttempts = 0,
    autoKillCycleSkipped = 0,
    updateHopStatus = nil,
    updateProtectionStatus = nil,
    hopRetrying = false,
    hopInProgress = false,
    forceHopReason = nil,
    serverHopEnabledAt = 0,
    serverHopCycleEndsAt = 0,
    serverHopImmediate = false,
    friendProtectionReady = young0xKillsResume and type(young0xKillsResume.friendIds) == "table" or false,
    friendIds = young0xKillsResume and type(young0xKillsResume.friendIds) == "table" and young0xKillsResume.friendIds or nil,
  }
  if game.JobId ~= "" and not table.find(state.serverHistory, game.JobId) then
    state.serverHistory[#state.serverHistory + 1] = game.JobId
  end
  local tbl4 = {}
  local tbl5 = {}
  local tbl6 = {}
  if young0xKillsResume and type(young0xKillsResume.friendIds) == "table" then
    for index, item in ipairs(young0xKillsResume.friendIds) do
      item = tonumber(item)
      if item then tbl6[item] = true end
    end
  end
  local flag5 = false
  local shutdown = nil
  young0xAutoKill2.BossReporter.ReportedEvents = type(_G2.Young0xReportedBossEvents) == "table" and _G2.Young0xReportedBossEvents or {}
  _G2.Young0xReportedBossEvents = young0xAutoKill2.BossReporter.ReportedEvents

  function young0xAutoKill2.BossReporter:GetRequestFunction()
    if type(_G2.request) == "function" then return _G2.request end
    if type(_G2.http_request) == "function" then return _G2.http_request end
    if type(_G2.syn) == "table" and type(_G2.syn.request) == "function" then return _G2.syn.request end
    if type(_G2.http) == "table" and type(_G2.http.request) == "function" then return _G2.http.request end
    return nil
  end

  function young0xAutoKill2.BossReporter:SetStatus(lastStatus, lastHttpStatus)
    self.LastStatus = lastStatus
    self.LastHttpStatus = lastHttpStatus
    self.LastAttemptAt = os.time()
    return lastStatus == "reported" or lastStatus == "already-reported" or lastStatus == "expired" or lastStatus == "already-expired" or lastStatus == "probe-ok"
  end

  function young0xAutoKill2.BossReporter:Probe()
    local requestFunction = self:GetRequestFunction()
    if type(requestFunction) ~= "function" then return self:SetStatus("request-unavailable") end
    if #self.Token < 32 or string.find(self.Token, "__", 1, true) then
      return self:SetStatus("token-unavailable")
    end
    local ok, result = pcall(requestFunction, {
      Url = self.Api,
      Method = "POST",
      Headers = { ["Content-Type"] = "application/json", ["X-Young0x-Boss-Token"] = self.Token },
      Body = "{}",
    })
    local ok2 = ok and type(result) == "table" and tonumber(result.StatusCode or result.Status or result.status_code) or nil
    if ok2 == 400 then return self:SetStatus("probe-ok", ok2) end
    return self:SetStatus(ok and "probe-rejected" or "probe-request-error", ok2)
  end

  function young0xAutoKill2.BossReporter:IsPublicServer()
    if game.PlaceId ~= self.PlaceId or game.JobId == "" then return false end
    local ok, result = pcall(function()
      return game.PrivateServerId
    end)
    return ok and tostring(result or "") == ""
  end

  function young0xAutoKill2.BossReporter:ReportActive()
    if not state.running or not state.killBoss or workspace:GetAttribute("BossActive") ~= true then
      return self:SetStatus("boss-inactive")
    end
    if not self:IsPublicServer() then return self:SetStatus("not-public-server") end
    if #self.Token < 32 or string.find(self.Token, "__", 1, true) then
      return self:SetStatus("token-unavailable")
    end
    local requestFunction = self:GetRequestFunction()
    local spawnSequence = math.floor(tonumber(workspace:GetAttribute("BossSpawnSequence")) or 0)
    local rarity = math.floor(tonumber(workspace:GetAttribute("BossRarity")) or 0)
    local item = self.Profiles[rarity]
    pcall(function()
      local shared = replicatedStorage2:FindFirstChild("shared")
      local config = shared and shared:FindFirstChild("config")
      local bossEventConfig = config and config:FindFirstChild("BossEventConfig")
      local module = bossEventConfig and require(bossEventConfig)
      local item2 = type(module) == "table" and type(module.RARITIES) == "table" and module.RARITIES[rarity]
      if type(item2) == "table" and type(item2.Name) == "string" and type(item2.DisplayName) == "string" and type(item2.BossModel) == "string" and type(item2.MaxHealth) == "number" then
        item = {
          rarityName = item2.Name,
          displayName = item2.DisplayName,
          modelName = item2.BossModel,
          maxHealth = math.floor(item2.MaxHealth),
        }
      end
    end)
    if type(requestFunction) ~= "function" then return self:SetStatus("request-unavailable") end
    if spawnSequence < 1 or not item then return self:SetStatus("boss-attributes-invalid") end
    local health = math.floor(tonumber(workspace:GetAttribute("BossHealth")) or item.maxHealth)
    local maxHealth = math.floor(tonumber(workspace:GetAttribute("BossMaxHealth")) or item.maxHealth)
    local defeatTime = math.floor(tonumber(workspace:GetAttribute("BossDefeatTime")) or 0)
    if maxHealth ~= item.maxHealth or health < 0 or health > maxHealth or defeatTime <= os.time() then
      return self:SetStatus("boss-values-invalid")
    end
    local text = table.concat({ tostring(game.PlaceId), game.JobId, tostring(defeatTime), tostring(rarity) }, ":")
    local lastPlayerCount = #players2:GetPlayers()
    local now = os.clock()
    if self.ReportedEvents[text] and self.LastPlayerCount == lastPlayerCount and now - self.LastRefreshAt < 18 then
      return self:SetStatus("already-reported", 200)
    end
    local young0xLastBossReport = {
      placeId = game.PlaceId,
      jobId = game.JobId,
      spawnSequence = spawnSequence,
      rarity = rarity,
      rarityName = item.rarityName,
      displayName = item.displayName,
      modelName = item.modelName,
      health = health,
      maxHealth = maxHealth,
      defeatTime = defeatTime,
      players = lastPlayerCount,
      maxPlayers = players2.MaxPlayers,
      publicServer = true,
    }
    local json = httpService:JSONEncode(young0xLastBossReport)
    local ok, result = pcall(requestFunction, {
      Url = self.Api,
      Method = "POST",
      Headers = { ["Content-Type"] = "application/json", ["X-Young0x-Boss-Token"] = self.Token },
      Body = json,
    })
    local ok2 = ok and type(result) == "table" and tonumber(result.StatusCode or result.Status or result.status_code) or nil
    if ok2 and ok2 >= 200 and ok2 < 300 then
      self.ReportedEvents[text] = true
      self.LastRefreshAt = now
      self.LastPlayerCount = lastPlayerCount
      self.LastReport = young0xLastBossReport
      _G2.Young0xLastBossReport = young0xLastBossReport
      return self:SetStatus("reported", ok2)
    end
    return self:SetStatus(ok and "report-rejected" or "report-request-error", ok2)
  end

  function young0xAutoKill2.BossReporter:ReportExpired()
    local lastReport = self.LastReport
    if not state.running or type(lastReport) ~= "table" or workspace:GetAttribute("BossActive") == true then
      return self:SetStatus("no-expired-boss")
    end
    local requestFunction = self:GetRequestFunction()
    if type(requestFunction) ~= "function" or #self.Token < 32 or string.find(self.Token, "__", 1, true) then
      return self:SetStatus("expire-unavailable")
    end
    local ok, result = pcall(requestFunction, {
      Url = self.Api,
      Method = "POST",
      Headers = { ["Content-Type"] = "application/json", ["X-Young0x-Boss-Token"] = self.Token },
      Body = httpService:JSONEncode({
        active = false,
        placeId = lastReport.placeId,
        jobId = lastReport.jobId,
        spawnSequence = lastReport.spawnSequence,
        rarity = lastReport.rarity,
        defeatTime = lastReport.defeatTime,
      }),
    })
    local ok2 = ok and type(result) == "table" and tonumber(result.StatusCode or result.Status or result.status_code) or nil
    if ok2 and ok2 >= 200 and ok2 < 300 then
      self.LastReport = nil
      _G2.Young0xLastBossReport = nil
      return self:SetStatus("expired", ok2)
    end
    return self:SetStatus(ok and "expire-rejected" or "expire-request-error", ok2)
  end

  function young0xAutoKill2.BossReporter:Queue()
    local self2 = self
    self.QueueCount = self.QueueCount + 1
    task.spawn(function()
      task.wait(0.4)
      for i = 1, 4 do
        if not state.running or not state.killBoss then return end
        if self2:ReportActive() then return end
        task.wait(i == 1 and 1 or 4)
      end
    end)
  end

  function young0xAutoKill2.BossReporter:QueueExpired()
    local self2 = self
    task.spawn(function()
      task.wait(0.25)
      for i = 1, 3 do
        if not state.running or workspace:GetAttribute("BossActive") == true then return end
        if self2:ReportExpired() then return end
        task.wait(3)
      end
    end)
  end

  local function fn4(arg)
    tbl4[#tbl4 + 1] = arg
    return arg
  end

  local function fn5(arg)
    local item = tbl5[arg]
    if item then
      pcall(task.cancel, item)
      tbl5[arg] = nil
    end
  end

  local function fn6(arg, arg2)
    fn5(arg)
    local v
    v = task.defer(function()
      local ok, result = pcall(arg2)
      if not ok and state.running then
        warn("[Young0x Auto Kill] Error en " .. tostring(arg) .. ": " .. tostring(result))
      end
      if tbl5[arg] == v then tbl5[arg] = nil end
    end)
    tbl5[arg] = v
    return v
  end

  local function fn7()
    for index, item in ipairs(tbl4) do
      pcall(function()
        item:Disconnect()
      end)
    end
    tbl4 = {}
    local tbl7 = {}
    for key in pairs(tbl5) do
      tbl7[#tbl7 + 1] = key
    end
    for index, item in ipairs(tbl7) do
      fn5(item)
    end
  end

  local function fn8(arg)
    local num20 = math.floor(tonumber(arg) or 0)
    local str10 = num20 < 0 and "-" or ""
    local str11 = tostring(math.abs(num20))
    local tbl7 = {}
    while #str11 > 3 do
      table.insert(tbl7, 1, str11:sub(-3))
      str11 = str11:sub(1, -4)
    end
    table.insert(tbl7, 1, str11)
    return str10 .. table.concat(tbl7, ".")
  end

  local function fn9()
    local leaderstats = localPlayer2:FindFirstChild("leaderstats")
    local kills = leaderstats and leaderstats:FindFirstChild("Kills")
    local kills2 = kills and tonumber(kills.Value)
    return kills2 and math.floor(kills2) or nil
  end

  local function fn10(arg)
    local num20 = tonumber(arg)
    if not num20 then return end
    local lastObservedKills = math.floor(num20)
    local lastObservedKills2 = state.lastObservedKills
    state.lastObservedKills = lastObservedKills
    if lastObservedKills2 == nil or lastObservedKills > lastObservedKills2 then
      state.lastKillAt = os.clock()
      if lastObservedKills2 ~= nil and state.autoKill then
        state.autoKillCycleKills = state.autoKillCycleKills + (lastObservedKills - lastObservedKills2)
      end
    end
  end

  local function getWait()
    local character = localPlayer2.Character
    if character then return character end
    return localPlayer2.CharacterAdded:Wait()
  end

  local function getHumanoid()
    local wait = getWait()
    return wait and wait:FindFirstChildWhichIsA("Humanoid")
  end

  local function getHumanoidRootPart()
    local wait = getWait()
    return wait and wait:FindFirstChild("HumanoidRootPart")
  end

  local function fn11()
    pcall(function()
      local character = localPlayer2.Character
      local backpack = localPlayer2:FindFirstChild("Backpack")
      local punch = character and character:FindFirstChild("Punch")
      if punch and backpack then punch.Parent = backpack end
    end)
  end

  local function fn12()
    local tbl7 = {}
    local friendProtectionReady = false
    local text = string.format("https://friends.roblox.com/v1/users/%d/friends", localPlayer2.UserId)
    local ok, result = pcall(game.HttpGet, game, text, true)
    if ok and type(result) == "string" then
      local ok2, result2 = pcall(httpService.JSONDecode, httpService, result)
      if ok2 and type(result2) == "table" and type(result2.data) == "table" then
        for index, item in ipairs(result2.data) do
          local num20 = tonumber(item.id or item.Id)
          if num20 then tbl7[num20] = true end
        end
        friendProtectionReady = true
      end
    end
    if not friendProtectionReady then
      friendProtectionReady = pcall(function()
        local friendsAsync = players2:GetFriendsAsync(localPlayer2.UserId)
        while state.running and state.protectFriends do
          for index, item in ipairs(friendsAsync:GetCurrentPage()) do
            local num20 = tonumber(item.Id)
            if num20 then tbl7[num20] = true end
          end
          if friendsAsync.IsFinished then break end
          friendsAsync:AdvanceToNextPageAsync()
        end
      end)
    end
    if friendProtectionReady then
      for index, item in ipairs(players2:GetPlayers()) do
        if item ~= localPlayer2 and tbl7[item.UserId] == nil then tbl7[item.UserId] = false end
      end
      tbl6 = tbl7
      state.friendIds = {}
      for key in pairs(tbl7) do
        if tbl7[key] == true then state.friendIds[#state.friendIds + 1] = key end
      end
    end
    state.friendProtectionReady = friendProtectionReady
    if type(state.updateProtectionStatus) == "function" then task.defer(state.updateProtectionStatus) end
    return friendProtectionReady
  end

  local function fn13(arg)
    local ok, result = pcall(localPlayer2.IsFriendsWithAsync, localPlayer2, arg.UserId)
    if ok then return result == true end
    local ok2, result2 = pcall(localPlayer2.IsFriendsWith, localPlayer2, arg.UserId)
    if ok2 then return result2 == true end
    return nil
  end

  local function fn14(arg)
    if not state.protectFriends or not arg or arg == localPlayer2 then return false end
    local item = tbl6[arg.UserId]
    if item ~= nil and state.friendProtectionReady then return item == true end
    local result = fn13(arg)
    if result ~= nil then
      tbl6[arg.UserId] = result
      return result
    end
    return true
  end

  local function fn15(arg)
    return false
  end

  local function fn16(arg)
    if not arg or arg == localPlayer2 then return true end
    if fn15(arg) then return true end
    return fn14(arg)
  end

  local function fn17(arg)
    local attribute = arg and arg:GetAttribute("SpawnProtectedUntil")
    if type(attribute) == "number" and workspace:GetServerTimeNow() < attribute then return true end
    return arg ~= nil and (arg:FindFirstChildOfClass("ForceField") ~= nil or arg:FindFirstChild("spawnProtectionHighlight") ~= nil)
  end

  local function fn18(arg)
    if not arg then return false end
    if arg:GetAttribute(str4) == true then return true end
    local humanoidRootPart = arg:FindFirstChild("HumanoidRootPart")
    if not humanoidRootPart then return false end
    for index, item in ipairs(collectionService:GetTagged(str5)) do
      local basePart = item:IsA("BasePart") and item or (item:IsA("Model") and (item.PrimaryPart or item:FindFirstChildWhichIsA("BasePart", true)))
      if basePart and (humanoidRootPart.Position - basePart.Position).Magnitude <= num18 then return true end
    end
    local events = workspace:FindFirstChild("Events")
    local bossArena = events and events:FindFirstChild("BossArena")
    if bossArena and bossArena:IsA("Model") then
      local boundingBox, extra = bossArena:GetBoundingBox()
      local pointToObjectSpace = boundingBox:PointToObjectSpace(humanoidRootPart.Position)
      if math.abs(pointToObjectSpace.X) <= extra.X * 0.5 + 12 and math.abs(pointToObjectSpace.Y) <= extra.Y * 0.5 + 35 and math.abs(pointToObjectSpace.Z) <= extra.Z * 0.5 + 12 then
        return true
      end
    end
    return false
  end

  local function fn19(arg)
    return fn17(arg) or (arg ~= nil and arg:GetAttribute("InTinyIsland") == true) or fn18(arg)
  end

  local function fn20(arg)
    local character = arg and arg.Character
    return character ~= nil and character:GetAttribute("LastMapCFrame") ~= nil
  end

  local function fn21(arg)
    local character = arg and arg.Character
    return character ~= nil and character:GetAttribute("InBattle") == true
  end

  local function fn22()
    local leaderstats = localPlayer2:FindFirstChild("leaderstats")
    local brawls = leaderstats and leaderstats:FindFirstChild("Brawls")
    local brawls2 = brawls and tonumber(brawls.Value)
    return brawls2 and math.floor(brawls2) or nil
  end

  local function fn23()
    local gameGui = playerGui:FindFirstChild("gameGui")
    local brawlJoinLabel = gameGui and gameGui:FindFirstChild("brawlJoinLabel")
    return brawlJoinLabel ~= nil and brawlJoinLabel.Visible == true
  end

  local function fn24()
    local tbl7 = {}
    local tbl8 = {}
    if not state.brawlCombat or not fn20(localPlayer2) or not fn21(localPlayer2) then return tbl7 end

    local function fn25(player)
      if not player or player == localPlayer2 or tbl8[player.UserId] or fn16(player) then return end
      local character = player.Character
      local humanoid = character and character:FindFirstChildWhichIsA("Humanoid")
      local humanoidRootPart = character and character:FindFirstChild("HumanoidRootPart")
      if not humanoid or humanoid.Health <= 0 or not humanoidRootPart or not fn20(player) or not fn21(player) or fn19(character) then
        return
      end
      tbl8[player.UserId] = true
      tbl7[#tbl7 + 1] = { player = player, health = humanoid.Health }
    end
    fn25(state.brawlChosen)
    for index, item in ipairs(players2:GetPlayers()) do
      fn25(item)
    end
    table.sort(tbl7, function(arg, arg2)
      if arg.player == state.brawlChosen then
        return true
      elseif arg2.player == state.brawlChosen then
        return false
      end
      return arg.health < arg2.health
    end)
    return tbl7
  end

  local function fn25()
    fn5("friendRefresh")
    if not state.protectFriends then return end
    fn6("friendRefresh", function()
      while state.running and state.protectFriends do
        fn12()
        for i = 1, 60 do
          if not state.running or not state.protectFriends then return end
          task.wait(1)
        end
      end
    end)
  end

  local function fn26()
    local wait = getWait()
    local humanoid = getHumanoid()
    local backpack = localPlayer2:FindFirstChild("Backpack")
    if not wait or not humanoid then return nil end
    local punch = wait:FindFirstChild("Punch") or (backpack and backpack:FindFirstChild("Punch"))
    if punch and punch.Parent ~= wait then
      pcall(function()
        humanoid:EquipTool(punch)
      end)
    end
    if punch then
      local attackTime = punch:FindFirstChild("attackTime")
      if attackTime and attackTime:IsA("ValueBase") then
        pcall(function()
          attackTime.Value = 0
        end)
      end
    end
    return punch
  end

  local function fn27()
    local muscleEvent = localPlayer2:FindFirstChild("muscleEvent") or replicatedStorage2:FindFirstChild("muscleEvent")
    if not muscleEvent or not muscleEvent:IsA("RemoteEvent") then return false end
    local ok = pcall(muscleEvent.FireServer, muscleEvent, "punch", "rightHand")
    local ok2 = pcall(muscleEvent.FireServer, muscleEvent, "punch", "leftHand")
    return ok or ok2
  end

  local function getLowerTorso(arg, arg2)
    return arg and (arg:FindFirstChild("UpperTorso") or arg:FindFirstChild("Torso") or arg:FindFirstChild("LowerTorso")) or arg2
  end

  local function getCFrame(arg, arg2, arg3, arg4, arg5)
    local assemblyLinearVelocity = arg4.AssemblyLinearVelocity
    local num20 = Vector3.new(assemblyLinearVelocity.X, 0, assemblyLinearVelocity.Z) * num10
    if num20.Magnitude > num11 then num20 = num20.Unit * num11 end
    local lowerTorso = getLowerTorso(arg, arg2)
    local lowerTorso2 = getLowerTorso(arg3, arg4)
    local zero = lowerTorso and (lowerTorso.Position - arg2.Position) or Vector3.zero
    if zero.Magnitude > 4 then zero = Vector3.new(0, 1, 0) end
    local num21 = ((arg5 or 1) - 1) % 5 + 1
    local num22 = arg4.Position + num20
    local num23 = (lowerTorso2 and lowerTorso2.Position or arg4.Position) + num20
    if lowerTorso2 then
      local size = lowerTorso2.Size
      local rightArm = arg:FindFirstChild("RightHand") or arg:FindFirstChild("Right Arm")
      if arg4.Size.X <= num16 and rightArm then
        local v
        local v2
        if num21 == 1 then
          v = -lowerTorso2.CFrame.LookVector
          v2 = size.Z * 0.5
        elseif num21 == 2 then
          v = lowerTorso2.CFrame.RightVector
          v2 = size.X * 0.5
        elseif num21 == 3 then
          v = lowerTorso2.CFrame.LookVector
          v2 = size.Z * 0.5
        elseif num21 == 4 then
          v = -lowerTorso2.CFrame.RightVector
          v2 = size.X * 0.5
        else
          v = -lowerTorso2.CFrame.LookVector
          v2 = 0
        end
        local cFrame2 = CFrame.lookAt(Vector3.zero, -v)
        local pointToObjectSpace = arg2.CFrame:PointToObjectSpace(rightArm.Position)
        local num24 = num23 + v * (v2 + num17) - cFrame2:VectorToWorldSpace(pointToObjectSpace)
        return CFrame.new(num24) * cFrame2.Rotation
      end
      local flag6 = math.max(size.X, size.Y, size.Z) >= num13
      local flag7 = (lowerTorso2.Position - arg4.Position).Magnitude >= num14
      if not flag6 and not flag7 then
        local v
        local v2
        if num21 == 1 then
          v = -arg4.CFrame.LookVector
          v2 = arg4.Size.Z * 0.5
        elseif num21 == 2 then
          v = arg4.CFrame.RightVector
          v2 = arg4.Size.X * 0.5
        elseif num21 == 3 then
          v = arg4.CFrame.LookVector
          v2 = arg4.Size.Z * 0.5
        elseif num21 == 4 then
          v = -arg4.CFrame.RightVector
          v2 = arg4.Size.X * 0.5
        end
        if v and v2 then
          local num24 = math.max(arg2.Size.Z * 0.5, 0.15)
          local num25 = num22 + v * (v2 + num24 + num12)
          return CFrame.lookAt(num25, num22)
        end
        return CFrame.lookAt(num22 - arg4.CFrame.LookVector * num9, num22)
      end
      if flag7 and not flag6 then num21 = num21 == 1 and 5 or num21 - 1 end
      local v
      local v2
      if num21 == 1 then
        v = lowerTorso2.CFrame.RightVector
        v2 = size.X * 0.5
      elseif num21 == 2 then
        v = -lowerTorso2.CFrame.RightVector
        v2 = size.X * 0.5
      elseif num21 == 3 then
        v = -lowerTorso2.CFrame.LookVector
        v2 = size.Z * 0.5
      elseif num21 == 4 then
        v = lowerTorso2.CFrame.LookVector
        v2 = size.Z * 0.5
      end
      if v and v2 then
        local num24 = num23 + v * (v2 + num12)
        return CFrame.lookAt(num24, num23)
      end
    end
    local vector3 = Vector3.new(arg4.CFrame.LookVector.X, 0, arg4.CFrame.LookVector.Z)
    if vector3.Magnitude < 0.01 then
      vector3 = Vector3.zAxis
    else
      vector3 = vector3.Unit
    end
    local num24 = num23 - zero - vector3 * num9
    return CFrame.lookAt(num24, num23)
  end

  local function fn28(arg)
    local animator = arg and arg:FindFirstChildOfClass("Animator")
    if not animator then return end
    for index, item in ipairs(animator:GetPlayingAnimationTracks()) do
      local text = string.lower(item.Name)
      if string.find(text, "walk", 1, true) or string.find(text, "run", 1, true) then pcall(item.Stop, item, 0) end
    end
  end

  local function fn29()
    local humanoid = getHumanoid()
    if not humanoid then return end
    humanoid:Move(Vector3.zero, false)
    if humanoid.WalkSpeed <= 0 then humanoid.WalkSpeed = state.movementWalkSpeed or 16 end
    humanoid.AutoRotate = true
  end

  function young0xAutoKill2.ReadPlayerStat(arg, arg2)
    local leaderstats = arg and arg:FindFirstChild("leaderstats")
    local findFirstChild = leaderstats and leaderstats:FindFirstChild(arg2)
    return findFirstChild and tonumber(findFirstChild.Value) or nil
  end

  function young0xAutoKill2.MarkUnsafeTarget(arg, arg2)
    if not arg or arg == localPlayer2 then return false end
    state.unsafeTargets[arg.UserId] = { reason = tostring(arg2 or "danger"), at = os.clock(), character = arg.Character }
    state.targetRejectedCharacter[arg.UserId] = arg.Character
    state.targetRetryAt[arg.UserId] = nil
    if state.activeKillTarget == arg then state.activeKillTarget = nil end
    return true
  end

  function young0xAutoKill2.TargetLooksDangerous(arg, arg2)
    if not arg or state.unsafeTargets[arg.UserId] ~= nil then return true end
    local humanoid = getHumanoid()
    return not humanoid or humanoid.Health <= 0
  end

  local function fn30(lastCombatTarget, arg, arg2)
    if not lastCombatTarget or lastCombatTarget == localPlayer2 or fn16(lastCombatTarget) then return false end
    local character = lastCombatTarget.Character
    local humanoid = character and character:FindFirstChildWhichIsA("Humanoid")
    local humanoidRootPart = character and character:FindFirstChild("HumanoidRootPart")
    if not humanoid or humanoid.Health <= 0 or not humanoidRootPart or fn19(character) then return false end
    local health = humanoid.Health
    local health2 = health
    local result = fn26()
    if not result then return false end
    runService2.Heartbeat:Wait()
    local num20 = os.clock() + math.max(0.1, tonumber(arg) or num5)
    if type(arg2) == "number" then num20 = math.min(num20, arg2) end
    local flag6 = false
    local num21 = 1
    local num22 = 0
    local num23 = 0
    local autoKill = state.autoKill and not state.targetMode and not state.brawlCombat
    if autoKill then
      state.autoKillCycleAttempts = state.autoKillCycleAttempts + 1
      if young0xAutoKill2.TargetLooksDangerous(lastCombatTarget, humanoid) then
        state.autoKillCycleSkipped = state.autoKillCycleSkipped + 1
        return false
      end
      state.activeKillTarget = lastCombatTarget
      state.lastCombatTarget = lastCombatTarget
      state.lastCombatTargetAt = os.clock()
    end
    local humanoid2 = getHumanoid()
    local health3 = humanoid2 and humanoid2.Health or nil
    if humanoid2 then
      humanoid2:Move(Vector3.zero, false)
      fn28(humanoid2)
    end
    while state.running and not state.bossCombat and not (state.killBoss and workspace:GetAttribute("BossActive") == true) and os.clock() < num20 do
      if state.brawlCombat then
        if not fn20(localPlayer2) or not fn21(localPlayer2) or not fn20(lastCombatTarget) or not fn21(lastCombatTarget) then
          break
        end
      elseif state.targetMode then
        if state.target ~= lastCombatTarget.Name then break end
      elseif not state.autoKill then
        break
      end
      character = lastCombatTarget.Character
      humanoid = character and character:FindFirstChildWhichIsA("Humanoid")
      humanoidRootPart = character and character:FindFirstChild("HumanoidRootPart")
      if not humanoid or humanoid.Health <= 0 or not humanoidRootPart or fn19(character) then break end
      local wait = getWait()
      local humanoidRootPart2 = wait and wait:FindFirstChild("HumanoidRootPart")
      if not humanoidRootPart2 then break end
      if humanoid2 then
        humanoid2:Move(Vector3.zero, false)
        fn28(humanoid2)
      end
      state.combatCFrame = getCFrame(wait, humanoidRootPart2, character, humanoidRootPart, num21)
      wait:PivotTo(state.combatCFrame)
      humanoidRootPart2.AssemblyLinearVelocity = Vector3.zero
      humanoidRootPart2.AssemblyAngularVelocity = Vector3.zero
      runService2.Heartbeat:Wait()
      character = lastCombatTarget.Character
      humanoid = character and character:FindFirstChildWhichIsA("Humanoid")
      humanoidRootPart = character and character:FindFirstChild("HumanoidRootPart")
      if not humanoid or humanoid.Health <= 0 or not humanoidRootPart or fn19(character) then break end
      if (humanoidRootPart2.Position - state.combatCFrame.Position).Magnitude > 0.35 then
        wait:PivotTo(state.combatCFrame)
        humanoidRootPart2.AssemblyLinearVelocity = Vector3.zero
        humanoidRootPart2.AssemblyAngularVelocity = Vector3.zero
        runService2.Heartbeat:Wait()
      end
      if not result or result.Parent ~= wait then result = fn26() end
      if result then
        pcall(result.Deactivate, result)
        runService2.Heartbeat:Wait()
        pcall(result.Activate, result)
        fn27()
        num22 = num22 + 1
        task.wait(num8)
        pcall(result.Deactivate, result)
      end
      health3 = humanoid2 and humanoid2.Health or health3
      if humanoid.Health < health2 then
        flag6 = true
        num23 = 0
      else
        num23 = num23 + 1
      end
      health2 = humanoid.Health
      if autoKill and num23 >= num7 and humanoid.Health > 0 then break end
      num21 = num21 + 1
      task.wait()
    end
    state.combatCFrame = nil
    if state.activeKillTarget == lastCombatTarget then state.activeKillTarget = nil end
    if result then pcall(result.Deactivate, result) end
    local humanoidRootPart2 = getHumanoidRootPart()
    if humanoidRootPart2 and state.lockCFrame then
      humanoidRootPart2.CFrame = state.lockCFrame
      humanoidRootPart2.AssemblyLinearVelocity = Vector3.zero
      humanoidRootPart2.AssemblyAngularVelocity = Vector3.zero
    end
    local humanoid3 = humanoid and humanoid.Health <= 0
    local killBoss = state.bossCombat or (state.killBoss and workspace:GetAttribute("BossActive") == true)
    if killBoss then
      state.targetRejectedCharacter[lastCombatTarget.UserId] = nil
      state.targetRetryAt[lastCombatTarget.UserId] = nil
    elseif autoKill and not humanoid3 then
      state.targetRejectedCharacter[lastCombatTarget.UserId] = character
      state.targetRetryAt[lastCombatTarget.UserId] = nil
      state.autoKillCycleSkipped = state.autoKillCycleSkipped + 1
    elseif flag6 or humanoid3 then
      state.targetRejectedCharacter[lastCombatTarget.UserId] = nil
      state.targetRetryAt[lastCombatTarget.UserId] = nil
    elseif not state.targetMode then
      state.targetRetryAt[lastCombatTarget.UserId] = os.clock() + num15
    end
    return flag6 or humanoid3 or false
  end

  local function fn31()
    local tbl7 = {}
    for index, player in ipairs(players2:GetPlayers()) do
      if player ~= localPlayer2 and not fn16(player) then
        local character = player.Character
        local humanoid = character and character:FindFirstChildWhichIsA("Humanoid")
        local humanoidRootPart = character and character:FindFirstChild("HumanoidRootPart")
        local item = state.targetRetryAt[player.UserId]
        local item2 = state.targetRejectedCharacter[player.UserId]
        if item2 ~= nil and item2 ~= character then
          state.targetRejectedCharacter[player.UserId] = nil
          item2 = nil
        end
        if humanoid and humanoid.Health > 0 and humanoidRootPart and not fn19(character) and not young0xAutoKill2.TargetLooksDangerous(player, humanoid) and item2 == nil and (not item or os.clock() >= item) then
          tbl7[#tbl7 + 1] = {
            player = player,
            health = humanoid.Health,
            strength = young0xAutoKill2.ReadPlayerStat(player, "Strength") or math.huge,
          }
        end
      end
    end
    table.sort(tbl7, function(arg, arg2)
      if arg.health ~= arg2.health then return arg.health < arg2.health end
      return arg.strength < arg2.strength
    end)
    return tbl7
  end
  young0xAutoKill2.ResetAutoKillCycle = function()
    local now = os.clock()
    state.autoKillCycleStartedAt = now
    state.autoKillCycleEndsAt = now + num4
    state.autoKillCycleKills = 0
    state.autoKillCycleAttempts = 0
    state.autoKillCycleSkipped = 0
    state.targetRejectedCharacter = {}
    state.targetRetryAt = {}
  end

  local function fn32()
    fn5("killFarm")
    if state.bossCombat or (state.killBoss and workspace:GetAttribute("BossActive") == true) or (not state.autoKill and not state.targetMode and not state.brawlCombat) then
      fn11()
      return
    end
    fn6("killFarm", function()
      while state.running and not state.bossCombat and not (state.killBoss and workspace:GetAttribute("BossActive") == true) and (state.autoKill or state.targetMode or state.brawlCombat) do
        if state.brawlBusy then
          if state.brawlCombat then
            for index, item in ipairs(fn24()) do
              if not state.running or not state.brawlCombat then break end
              fn30(item.player)
            end
          end
        elseif state.targetMode then
          local findFirstChild = state.target and players2:FindFirstChild(state.target)
          if findFirstChild then fn30(findFirstChild) end
        else
          if state.autoKillCycleEndsAt <= os.clock() then young0xAutoKill2.ResetAutoKillCycle() end
          local result = fn31()
          for index, item in ipairs(result) do
            local now = os.clock()
            if not state.running or not state.autoKill or state.bossCombat or (state.killBoss and workspace:GetAttribute("BossActive") == true) or now >= state.autoKillCycleEndsAt then
              break
            end
            local num20 = math.max(1, #result - index + 1)
            local num21 = math.clamp((state.autoKillCycleEndsAt - now) / num20, 0.65, num6)
            fn30(item.player, num21, state.autoKillCycleEndsAt)
          end
        end
        task.wait()
      end
      fn11()
    end)
  end

  local function fn33()
    local tbl7 = {}
    local tbl8 = {}

    local function fn34(arg)
      if type(arg) == "function" and not tbl8[arg] then
        tbl8[arg] = true
        tbl7[#tbl7 + 1] = arg
      end
    end
    fn34(_G2.queue_on_teleport)
    fn34(_G2.queueonteleport)
    fn34(_G2.queue_on_tp)
    fn34(_G2.queueontp)
    fn34(queue_on_teleport)
    fn34(queueonteleport)
    fn34(queue_on_tp)
    fn34(queueontp)
    local syn2 = _G2.syn
    if type(syn2) == "table" then fn34(syn2.queue_on_teleport) end
    local fluxus2 = _G2.fluxus
    if type(fluxus2) == "table" then fn34(fluxus2.queue_on_teleport) end
    return tbl7
  end

  local function fn34()
    return fn33()[1]
  end

  local function fn35()
    local cleartpqueue2 = _G2.clear_teleport_queue or _G2.clearqueueonteleport or _G2.clearteleportqueue or _G2.clear_tp_queue or _G2.cleartpqueue or clear_teleport_queue or clearqueueonteleport or clearteleportqueue or clear_tp_queue or cleartpqueue
    if type(cleartpqueue2) == "function" then pcall(cleartpqueue2) end
  end

  local function fn36(arg)
    return table.find(state.serverHistory, arg) ~= nil
  end

  local function fn37(arg)
    if arg and not fn36(arg) then state.serverHistory[#state.serverHistory + 1] = arg end
    while #state.serverHistory > num do
      table.remove(state.serverHistory, 1)
    end
  end

  local function fn38(url)
    local request = _G2.request or _G2.http_request or (type(_G2.syn) == "table" and _G2.syn.request)
    if type(request) == "function" then
      local ok, result = pcall(request, { Url = url, Method = "GET", Headers = { ["cache-control"] = "no-store" } })
      local body = type(result) == "table" and (result.Body or result.body) or nil
      local value4 = type(result) == "table" and tonumber(result.StatusCode or result.Status or result.status_code) or nil
      if ok and type(body) == "string" and (not value4 or (value4 >= 200 and value4 < 300)) then
        return true, body
      end
    end
    return pcall(game.HttpGet, game, url, true)
  end

  local function getId(arg)
    local tbl7 = {}
    local tbl8 = {}

    local function fn39(arg2)
      for index, item in ipairs(arg2.data or {}) do
        local value4 = type(item) == "table" and tonumber(item.playing) or nil
        local value5 = type(item) == "table" and tonumber(item.maxPlayers) or nil
        if type(item) == "table" and type(item.id) == "string" and not tbl8[item.id] and item.id ~= game.JobId and (arg or not fn36(item.id)) and value4 and value5 and value4 < value5 then
          tbl8[item.id] = true
          tbl7[#tbl7 + 1] = item
        end
      end
    end

    local function fn40(arg2, arg3)
      local value4 = nil
      for i = 1, arg3 do
        local text = string.format(str3, game.PlaceId, arg2)
        if value4 then text = text .. "&cursor=" .. httpService:UrlEncode(value4) end
        local value5 = nil
        for i2 = 1, num3 do
          local result, extra = fn38(text)
          if result and type(extra) == "string" then
            local ok, result2 = pcall(httpService.JSONDecode, httpService, extra)
            if ok and type(result2) == "table" and type(result2.data) == "table" then
              value5 = result2
              break
            end
          end
          task.wait(0.2 * i2)
        end
        if not value5 then return false end
        fn39(value5)
        value4 = value5.nextPageCursor
        if not value4 or #tbl7 >= 30 then break end
      end
      return true
    end
    fn40("Desc", num2)
    if #tbl7 == 0 then fn40("Asc", math.max(3, math.floor(num2 / 2))) end
    if #tbl7 == 0 then return nil end

    local function fn41(arg2)
      if arg2 == 18 then
        return 5000
      elseif arg2 == 19 then
        return 4500
      elseif arg2 >= 12 then
        return 3000 + arg2
      end
      return 1000 + arg2
    end
    table.sort(tbl7, function(arg2, arg3)
      local num20 = tonumber(arg2.playing)
      local num21 = tonumber(arg3.playing)
      return fn41(num20) > fn41(num21)
    end)
    local result = fn41(tonumber(tbl7[1].playing))
    local num20 = 1
    while num20 < #tbl7 and fn41(tonumber(tbl7[num20 + 1].playing)) == result do
      num20 = num20 + 1
    end
    return tbl7[math.random(1, math.min(num20, 6))].id
  end

  local function fn39()
    local tbl7 = {}
    for key, value4 in pairs(tbl6) do
      if value4 == true then tbl7[#tbl7 + 1] = key end
    end
    table.sort(tbl7)
    return tbl7
  end

  local function fn40()
    local serverHistory = {}
    local num20 = math.max(1, #state.serverHistory - 23)
    for i = num20, #state.serverHistory do
      serverHistory[#serverHistory + 1] = state.serverHistory[i]
    end
    return {
      version = 5,
      autoKill = state.autoKill == true,
      autoWinBrawl = state.autoWinBrawl == true,
      protectFriends = state.protectFriends == true,
      serverHop = state.serverHop == true,
      killBoss = state.killBoss == true,
      serverHistory = serverHistory,
      friendIds = fn39(),
      keyExpiresAt = tonumber(_G2.Young0xPublicTrainingExpiresAt),
      keyStartedAt = tonumber(_G2.Young0xPublicTrainingStartedAt),
    }
  end

  local function fn41()
    local result = fn40()
    _G2.Young0xKillsServerHopSticky = result.serverHop
    pcall(teleportService.SetTeleportSetting, teleportService, str6, result.serverHop)
    pcall(teleportService.SetTeleportSetting, teleportService, str7, result)
    return result
  end

  local function fn42(arg, arg2)
    fn37(arg2)
    local result = fn41()
    local json = httpService:JSONEncode({
      autoKill = result.autoKill,
      autoWinBrawl = result.autoWinBrawl,
      protectFriends = result.protectFriends,
      serverHop = true,
      killBoss = result.killBoss,
      serverHistory = result.serverHistory,
      friendIds = result.friendIds,
      keyExpiresAt = result.keyExpiresAt,
      keyStartedAt = result.keyStartedAt,
    })
    local flag6 = _G2.Young0xPublicTrainingLocalBuild == true
    local young0xPublicTrainingLocalFi = type(_G2.Young0xPublicTrainingLocalFile) == "string" and _G2.Young0xPublicTrainingLocalFile or ""
    local text = table.concat({
      "local players = game:GetService('Players')",
      "local teleportService = game:GetService('TeleportService')",
      "local httpService = game:GetService('HttpService')",
      "repeat task.wait(0.25) until game:IsLoaded() and players.LocalPlayer and players.LocalPlayer:FindFirstChild('PlayerGui')",
      "task.wait(3)",
      "local env = getgenv and getgenv() or _G",
      "env.Young0xKillsServerHopSticky = true",
      "pcall(function() game:GetService('TeleportService'):SetTeleportSetting(" .. string.format("%q", str6) .. ", true) end)",
      "local fallback = httpService:JSONDecode(" .. string.format("%q", json) .. ")",
      "if tonumber(fallback.keyExpiresAt) then env.Young0xPublicTrainingExpiresAt = tonumber(fallback.keyExpiresAt) end",
      "if tonumber(fallback.keyStartedAt) then env.Young0xPublicTrainingStartedAt = tonumber(fallback.keyStartedAt) end",
      "env.Young0xKillsBootstrap = {status = 'loading', attempt = 0}",
      "local localBuild = " .. tostring(flag6),
      "local localFile = " .. string.format("%q", young0xPublicTrainingLocalFi),
      "if localBuild then env.Young0xPublicTrainingLocalBuild = true; env.Young0xPublicTrainingLocalFile = localFile; env.Young0xPublicTrainingPreviewBypass = true end",
      "local urls = {" .. string.format("%q", str) .. ", " .. string.format("%q", str2) .. "}",
      "local function desiredState()",
      "    local ok, value = pcall(teleportService.GetTeleportSetting, teleportService, " .. string.format("%q", str7) .. ")",
      "    return ok and type(value) == 'table' and value or fallback",
      "end",
      "while desiredState().serverHop == true do",
      "    local controller = env.Young0xAutoKill",
      "    local state = type(controller) == 'table' and controller.State or nil",
      "    local gui = players.LocalPlayer:FindFirstChild('PlayerGui') and players.LocalPlayer.PlayerGui:FindFirstChild('Young0xAutoKillHub')",
      "    if type(state) ~= 'table' or state.running ~= true or not gui then",
      "        env.Young0xKillsBootstrap.attempt = env.Young0xKillsBootstrap.attempt + 1",
      "        local loaded, loadError = false, nil",
      "        if localBuild and localFile ~= '' and type(readfile) == 'function' then",
      "            local ok, err = pcall(function()",
      "                env.Young0xKillsResume = desiredState()",
      "                local source = readfile(localFile)",
      "                local chunk, compileError = loadstring(source)",
      "                if not chunk then error(compileError) end",
      "                chunk()",
      "            end)",
      "            loaded = ok",
      "            loadError = err",
      "        end",
      "        for _, baseUrl in ipairs(loaded and {} or urls) do",
      "            local ok, err = pcall(function()",
      "                env.Young0xKillsResume = desiredState()",
      "                local separator = string.find(baseUrl, '?', 1, true) and '&' or '?'",
      "                local source = game:HttpGet(baseUrl .. separator .. 'v=' .. tostring(os.time()) .. '-' .. tostring(env.Young0xKillsBootstrap.attempt), true)",
      "                local chunk, compileError = loadstring(source)",
      "                if not chunk then error(compileError) end",
      "                chunk()",
      "            end)",
      "            if ok then loaded = true break end",
      "            loadError = err",
      "        end",
      "        env.Young0xKillsBootstrap.status = loaded and 'loaded' or 'retrying'",
      "        env.Young0xKillsBootstrap.error = loaded and nil or tostring(loadError)",
      "        task.wait(2)",
      "    end",
      "    controller = env.Young0xAutoKill",
      "    local wanted = desiredState()",
      "    if type(controller) == 'table' and type(controller.State) == 'table' and controller.State.running then",
      "        if type(controller.SetProtectFriends) == 'function' then pcall(controller.SetProtectFriends, wanted.protectFriends == true) end",
      "        if type(controller.SetAutoKill) == 'function' then pcall(controller.SetAutoKill, wanted.autoKill == true) end",
      "        if type(controller.SetAutoWinBrawl) == 'function' then pcall(controller.SetAutoWinBrawl, wanted.autoWinBrawl == true) end",
      "        if type(controller.SetKillBoss) == 'function' then pcall(controller.SetKillBoss, wanted.killBoss == true) end",
      "        if type(controller.SetServerHop) == 'function' then pcall(controller.SetServerHop, true) end",
      "    end",
      "    task.wait(3)",
      "end",
    }, "\n")
    fn35()
    local flag7 = false
    for index, item in ipairs(arg) do
      local ok, result2 = pcall(item, text)
      if ok and result2 ~= false then
        flag7 = true
        break
      end
    end
    return flag7
  end

  local function fn43()
    local result = fn33()
    local id = getId(false) or getId(true)
    if #result == 0 then return false, "Tu executor no soporta la reconexión automática." end
    if not id then return false, "No hay otro servidor disponible. Reintentando..." end
    if not fn42(result, id) then return false, "No se pudo preparar la reconexión." end
    local ok = pcall(function()
      teleportService:TeleportToPlaceInstance(game.PlaceId, id, localPlayer2)
    end)
    if not ok then return false, "Reintentando conexión..." end
    return true
  end

  local function fn44(arg, arg2)
    if type(state.updateHopStatus) == "function" then pcall(state.updateHopStatus, arg, arg2) end
  end

  local function fn45()
    _G2.Young0xKillsServerHopSticky = false
    _G2.Young0xKillsResume = nil
    pcall(teleportService.SetTeleportSetting, teleportService, str6, false)
    pcall(teleportService.SetTeleportSetting, teleportService, str7, {
      version = 5,
      autoKill = false,
      autoWinBrawl = false,
      protectFriends = false,
      serverHop = false,
      killBoss = false,
    })
  end
  young0xAutoKill2.BossPriorityPending = function()
    if state.killBoss ~= true then return false end
    return state.bossCombat or workspace:GetAttribute("BossActive") == true or localPlayer2:GetAttribute("BossChestPending") == true
  end
  young0xAutoKill2.GetServerHopDecision = function(arg, arg2)
    arg = tonumber(arg) or os.clock()
    if state.forceHopReason then return state.forceHopReason, false end
    if arg >= state.serverHopCycleEndsAt then return "Ciclo de 50 segundos completado...", false end
    return nil, false
  end

  local function fn46(arg)
    state.serverHop = arg == true
    if state.serverHop and #fn33() == 0 then
      state.serverHop = false
      fn41()
      return false
    end
    fn41()
    fn5("serverHop")
    if not state.serverHop then
      state.hopRetrying = false
      state.hopInProgress = false
      state.forceHopReason = nil
      fn44(nil)
      return true
    end
    state.serverHopEnabledAt = os.clock()
    state.serverHopCycleEndsAt = state.serverHopEnabledAt + num4
    state.serverHopImmediate = false
    if state.autoKill then
      young0xAutoKill2.ResetAutoKillCycle()
      state.autoKillCycleEndsAt = state.serverHopCycleEndsAt
    end
    fn6("serverHop", function()
      while state.running and state.serverHop do
        local result, extra = young0xAutoKill2.GetServerHopDecision()
        if extra then
          state.serverHopCycleEndsAt = os.clock() + num4
          task.wait(1)
        else
          if not result then
            task.wait(1)
          else
            state.forceHopReason = nil
            state.hopInProgress = true
            fn44(0, result or "Buscando servidor...")
            local result2, extra2 = fn43()
            if result2 then
              fn44(0, "Conectando...")
              for i = 1, 24 do
                if not state.running or not state.serverHop or state.forceHopReason then break end
                task.wait(0.5)
              end
            else
              fn44(0, extra2 or "Reintentando...")
              state.forceHopReason = result or extra2 or "Reintentando..."
              task.wait(3)
            end
            state.hopInProgress = false
          end
        end
      end
    end)
    return true
  end
  fn4(teleportService.TeleportInitFailed:Connect(function(arg)
    if arg ~= localPlayer2 or not state.running or not state.serverHop then return end
    state.hopInProgress = false
    state.forceHopReason = "Servidor lleno. Buscando otro..."
    fn44(0, "Servidor lleno. Buscando otro...")
  end))
  local value4 = nil
  local value5 = nil

  local function fn47(arg)
    if value4 then
      pcall(function()
        value4:Disconnect()
      end)
      value4 = nil
    end
    if value5 then
      pcall(function()
        value5:Disconnect()
      end)
      value5 = nil
    end
    task.defer(function()
      local humanoid = arg and (arg:FindFirstChildWhichIsA("Humanoid") or arg:WaitForChild("Humanoid", 10))
      if not state.running or localPlayer2.Character ~= arg or not humanoid then return end
      local health = humanoid.Health
      value5 = fn4(humanoid.HealthChanged:Connect(function(arg2)
        health = arg2
      end))
      value4 = fn4(humanoid.Died:Connect(function()
        if not state.running or state.brawlBusy or state.bossCombat then return end
        if state.autoKill then
          local lastCombatTarget = state.activeKillTarget or (os.clock() - state.lastCombatTargetAt <= 3 and state.lastCombatTarget or nil)
          if lastCombatTarget then young0xAutoKill2.MarkUnsafeTarget(lastCombatTarget, "lethal-hit") end
          state.forceHopReason = nil
          state.hopInProgress = false
          fn44(nil)
          return
        end
        if state.serverHop then
          state.forceHopReason = "Te eliminaron. Cambiando servidor..."
          fn44(0, state.forceHopReason)
        end
      end))
    end)
  end
  if localPlayer2.Character then fn47(localPlayer2.Character) end
  fn4(localPlayer2.CharacterAdded:Connect(fn47))

  local function fn48(arg)
    local rEvents = replicatedStorage2:FindFirstChild("rEvents")
    local changeSpeedSizeRemote = rEvents and rEvents:FindFirstChild("changeSpeedSizeRemote")
    arg = math.clamp(math.floor((tonumber(arg) or 1) + 0.5), 1, 100)
    if not changeSpeedSizeRemote then return false end
    if changeSpeedSizeRemote:IsA("RemoteFunction") then
      return pcall(changeSpeedSizeRemote.InvokeServer, changeSpeedSizeRemote, "changeSize", arg)
    elseif changeSpeedSizeRemote:IsA("RemoteEvent") then
      return pcall(changeSpeedSizeRemote.FireServer, changeSpeedSizeRemote, "changeSize", arg)
    end
    return false
  end

  local function fn49()
    fn48(1)
  end

  local function fn50()
    fn5("killSizeOne")
    if state.bossCombat or (not state.autoKill and not state.targetMode and not state.brawlCombat) then return end
    fn6("killSizeOne", function()
      while state.running and not state.bossCombat and (state.autoKill or state.targetMode or state.brawlCombat) do
        fn49()
        task.wait(0.5)
      end
    end)
  end

  local function fn51()
    fn5("killPositionLock")
    state.combatCFrame = nil
    state.lockCFrame = nil
    state.lockCharacter = nil
    fn29()
  end

  local function fn52()
    fn51()
    local flag6 = localPlayer2.UserId == num19
    local wait = getWait()
    local humanoidRootPart = wait and wait:FindFirstChild("HumanoidRootPart")
    state.lockCFrame = flag6 and cFrame or (humanoidRootPart and humanoidRootPart.CFrame or nil)
    if wait and humanoidRootPart then
      state.lockCharacter = wait
      humanoidRootPart.CFrame = state.lockCFrame
    end
    fn6("killPositionLock", function()
      while state.running and state.autoKill and not state.brawlBusy and not state.bossCombat and not (state.killBoss and workspace:GetAttribute("BossActive") == true) do
        local wait2 = getWait()
        local humanoidRootPart2 = wait2 and wait2:FindFirstChild("HumanoidRootPart")
        if wait2 and humanoidRootPart2 then
          if state.lockCharacter ~= wait2 or not state.lockCFrame then
            state.lockCharacter = wait2
            state.lockCFrame = flag6 and cFrame or humanoidRootPart2.CFrame
          end
          humanoidRootPart2.CFrame = state.combatCFrame or state.lockCFrame
          humanoidRootPart2.AssemblyLinearVelocity = Vector3.zero
          humanoidRootPart2.AssemblyAngularVelocity = Vector3.zero
        end
        runService2.Heartbeat:Wait()
      end
    end)
  end

  local function fn53(arg)
    if arg then
      state.lastKillAt = os.clock()
      state.lastObservedKills = fn9()
      young0xAutoKill2.ResetAutoKillCycle()
      if state.serverHop and state.serverHopCycleEndsAt > os.clock() then
        state.autoKillCycleEndsAt = state.serverHopCycleEndsAt
      end
      local humanoid = getHumanoid()
      if humanoid and humanoid.WalkSpeed > 0 then state.movementWalkSpeed = humanoid.WalkSpeed end
    end
    state.autoKill = arg == true
    if state.autoKill then
      state.targetMode = false
      fn49()
      if not state.brawlBusy and not state.bossCombat and not (state.killBoss and workspace:GetAttribute("BossActive") == true) then
        fn52()
      end
    else
      fn51()
    end
    fn50()
    fn5("fastPunch")
    fn32()
    fn41()
    return true
  end

  local function fn54(arg)
    if arg and not state.target then return false end
    state.targetMode = arg == true
    if state.targetMode then
      state.autoKill = false
      fn51()
    elseif not state.autoKill then
      fn29()
    end
    fn50()
    fn5("fastPunch")
    fn32()
    fn41()
    return true
  end

  local function fn55(arg)
    state.protectFriends = arg == true
    fn25()
    fn41()
    return true
  end
  local value6 = nil
  local bossFarm = {
    active = false,
    generation = 0,
    engagedBoss = nil,
    originalCharacter = nil,
    originalPivot = nil,
    originalSize = nil,
    originalRoot = nil,
    originalRootAnchored = nil,
    returnPivot = nil,
    returnRootAnchored = nil,
    returnGeneration = 0,
    fg100Controller = nil,
    fg100FastMode = nil,
    fg100PauseState = nil,
    fg100BossController = nil,
    fg100BossFarm = nil,
    fg100BossToggle = nil,
    publicTrainingController = nil,
    publicTrainingSnapshot = nil,
    externalPauseTokens = nil,
    resumeAutoWinBrawl = false,
    hitInterval = 0.31,
    safeAttackPosition = nil,
    antiLag = false,
    antiLagOriginals = setmetatable({}, { __mode = "k" }),
    antiLagConnection = nil,
    autoLag60Enabled = false,
    autoLag60Originals = setmetatable({}, { __mode = "k" }),
    autoLag60SystemOriginals = nil,
    autoLag60Connection = nil,
    autoLag60Queue = {},
    autoLag60Queued = setmetatable({}, { __mode = "k" }),
    autoLag60WorkerRunning = false,
    cameraShakeHooks = nil,
    damagePopupSerial = 0,
    lastAttackAt = 0,
    lastConfirmedAttackAt = 0,
    contactReadyAt = 0,
    currentContactHeight = nil,
    ownBossDamage = 0,
    ownBossHits = 0,
    bossProfiles = {
      Boss1 = {
        index = 1,
        punchHeight = 100,
        punchLength = 127.5,
        stompHeight = 100,
        stompRadius = 127.5,
        maxHitDistance = 90,
        dodgeLead = 0.75,
        contactHeight = 45,
        contactHeights = { 45, -20, 30, 65 },
      },
      Boss2 = {
        index = 2,
        punchHeight = 110,
        punchLength = 135,
        stompHeight = 110,
        stompRadius = 135,
        maxHitDistance = 97.5,
        dodgeLead = 0.80,
        contactHeight = 50,
        contactHeights = { 50, -22, 35, 72 },
      },
      Boss3 = {
        index = 3,
        punchHeight = 130,
        punchLength = 157.5,
        stompHeight = 130,
        stompRadius = 157.5,
        maxHitDistance = 120,
        dodgeLead = 0.85,
        contactHeight = 60,
        contactHeights = { 60, -25, 42, 82 },
      },
      Boss4 = {
        index = 4,
        punchHeight = 140,
        punchLength = 172.5,
        stompHeight = 140,
        stompRadius = 172.5,
        maxHitDistance = 135,
        dodgeLead = 0.90,
        contactHeight = 68,
        contactHeights = { 68, -28, 48, 92 },
      },
      Boss5 = {
        index = 5,
        punchHeight = 150,
        punchLength = 187.5,
        stompHeight = 150,
        stompRadius = 187.5,
        maxHitDistance = 150,
        dodgeLead = 1,
        contactHeight = 75,
        contactHeights = { 75, -30, 55, 102 },
      },
      BossRainbow = {
        index = 6,
        punchHeight = 135,
        punchLength = 165,
        stompHeight = 135,
        stompRadius = 165,
        maxHitDistance = 127.5,
        dodgeLead = 0.90,
        contactHeight = 65,
        contactHeights = { 65, -30, 45, 85 },
      },
    },
  }

  function bossFarm:CaptureReturnPosition()
    local wait = getWait()
    local humanoidRootPart = wait and wait:FindFirstChild("HumanoidRootPart")
    local humanoid = wait and wait:FindFirstChildWhichIsA("Humanoid")
    if not wait or not humanoidRootPart or not humanoid or humanoid.Health <= 0 then return false end
    self.returnGeneration += 1
    self.returnPivot = wait:GetPivot()
    self.returnRootAnchored = humanoidRootPart.Anchored
    return true
  end

  function bossFarm:ReturnToSavedPosition()
    local returnPivot = self.returnPivot
    local returnRootAnchored = self.returnRootAnchored
    self.returnPivot = nil
    self.returnRootAnchored = nil
    self.returnGeneration += 1
    local returnGeneration = self.returnGeneration
    if typeof(returnPivot) ~= "CFrame" then return false end
    task.spawn(function()
      for i = 1, 5 do
        if self.active or self.returnGeneration ~= returnGeneration then return end
        local wait = getWait()
        local humanoidRootPart = wait and wait:FindFirstChild("HumanoidRootPart")
        local humanoid = wait and wait:FindFirstChildWhichIsA("Humanoid")
        if wait and humanoidRootPart and humanoid and humanoid.Health > 0 then
          humanoidRootPart.Anchored = false
          wait:PivotTo(returnPivot)
          humanoidRootPart.AssemblyLinearVelocity = Vector3.zero
          humanoidRootPart.AssemblyAngularVelocity = Vector3.zero
          if i == 5 then humanoidRootPart.Anchored = returnRootAnchored == true end
        end
        task.wait(i == 1 and 0.08 or 0.14)
      end
    end)
    return true
  end

  local function fn56(bossStatus, bossDamage, bossAttacks, bossHits)
    if bossStatus ~= nil then state.bossStatus = bossStatus end
    if bossDamage ~= nil then state.bossDamage = bossDamage end
    if bossAttacks ~= nil then state.bossAttacks = bossAttacks end
    if bossHits ~= nil then state.bossHits = bossHits end
    if type(young0xAutoKill2.RefreshBossHealthCard) == "function" then
      young0xAutoKill2.RefreshBossHealthCard()
    end
  end

  local function fn57()
    local tagged = collectionService:GetTagged("BossEventBoss")
    if #tagged == 0 then
      local events = workspace:FindFirstChild("Events")
      local bossArena = events and events:FindFirstChild("BossArena")
      if bossArena then
        for index, item in ipairs(bossArena:GetChildren()) do
          if item:IsA("Model") and (item:FindFirstChild("BossDamageHitbox", true) or typeof(item:GetAttribute("BossRarityIndex")) == "number") then
            tagged[#tagged + 1] = item
          end
        end
      end
    end
    for index, item in ipairs(tagged) do
      if item and item.Parent and item:GetAttribute("BossEmerging") ~= true then
        local basePart = item:FindFirstChild("BossDamageHitbox", true) or item.PrimaryPart or item:FindFirstChildWhichIsA("BasePart", true)
        if basePart and basePart:IsA("BasePart") then
          local primaryPart = item:FindFirstChild("Boss") or item:FindFirstChild("Head", true) or item.PrimaryPart
          if not primaryPart or not primaryPart:IsA("BasePart") or primaryPart == basePart then
            local num20 = -1
            for index2, item2 in ipairs(item:GetDescendants()) do
              if item2:IsA("BasePart") and item2 ~= basePart and item2.Transparency < 1 then
                local size = item2.Size
                local num21 = size.X * size.Y * size.Z
                if num21 > num20 then
                  primaryPart = item2
                  num20 = num21
                end
              end
            end
          end
          primaryPart = primaryPart or basePart
          if primaryPart and primaryPart:IsA("BasePart") then return item, basePart, primaryPart end
        end
      end
    end
    return nil, nil, nil
  end

  function bossFarm:ClaimFG100BossOwnership()
    local young0xFG100 = _G2.Young0xFG100
    local bossFarm2 = type(young0xFG100) == "table" and young0xFG100.BossFarm or nil
    if type(bossFarm2) ~= "table" or bossFarm2 == self or bossFarm2.active ~= true then return end
    if not self.fg100BossFarm then
      self.fg100BossController = young0xFG100
      self.fg100BossFarm = bossFarm2
      self.fg100BossToggle = bossFarm2.Toggle
    end
    local toggle = bossFarm2.Toggle
    if type(toggle) == "table" and type(toggle.Set) == "function" then
      pcall(toggle.Set, toggle, false)
    elseif type(bossFarm2.Set) == "function" then
      pcall(bossFarm2.Set, bossFarm2, false)
    end
  end

  function bossFarm:RestoreFG100BossOwnership()
    local fg100BossController = self.fg100BossController
    local fg100BossFarm = self.fg100BossFarm
    local fg100BossToggle = self.fg100BossToggle
    self.fg100BossController = nil
    self.fg100BossFarm = nil
    self.fg100BossToggle = nil
    if _G2.Young0xFG100 ~= fg100BossController or type(fg100BossFarm) ~= "table" or fg100BossFarm.active == true then
      return
    end
    if type(fg100BossToggle) == "table" and type(fg100BossToggle.Set) == "function" then
      pcall(fg100BossToggle.Set, fg100BossToggle, true)
    elseif type(fg100BossFarm.Set) == "function" then
      pcall(fg100BossFarm.Set, fg100BossFarm, true)
    end
  end

  function bossFarm:PauseFG100()
    local young0xFG100 = _G2.Young0xFG100
    if type(young0xFG100) ~= "table" then return end
    self.fg100Controller = young0xFG100
    local fastFarm = type(young0xFG100.FastFarm) == "table" and young0xFG100.FastFarm or nil
    local mode = fastFarm and fastFarm.mode or nil
    if mode == "strength" or mode == "rebirth" then self.fg100FastMode = mode end
    local state2 = type(young0xFG100.State) == "table" and young0xFG100.State or nil
    if state2 and type(state2.rewardPauseBegin) == "function" then
      local ok, fg100PauseState = pcall(state2.rewardPauseBegin)
      if ok and type(fg100PauseState) == "table" and type(fg100PauseState.restore) == "function" then
        self.fg100PauseState = fg100PauseState
        return
      end
    end
    if self.fg100FastMode and type(young0xFG100.SetFastFarm) == "function" then
      pcall(young0xFG100.SetFastFarm, nil)
    end
  end

  function bossFarm:RestoreFG100()
    local fg100Controller = self.fg100Controller
    local fg100PauseState = self.fg100PauseState
    local fg100FastMode = self.fg100FastMode
    self.fg100Controller = nil
    self.fg100PauseState = nil
    self.fg100FastMode = nil
    if _G2.Young0xFG100 ~= fg100Controller or type(fg100Controller) ~= "table" then return end
    if fg100PauseState and type(fg100PauseState.restore) == "function" then
      local state2 = type(fg100Controller.State) == "table" and fg100Controller.State or nil
      if state2 and state2.rewardPaused == fg100PauseState then state2.rewardPaused = nil end
      pcall(fg100PauseState.restore)
      return
    end
    if fg100FastMode and type(fg100Controller.SetFastFarm) == "function" then
      local fastFarm = fg100Controller.FastFarm
      if type(fastFarm) ~= "table" or fastFarm.mode == nil then
        pcall(fg100Controller.SetFastFarm, fg100FastMode)
      end
    end
  end

  function bossFarm:PausePublicTraining()
    local bRG3 = _G2.BRG
    if type(bRG3) ~= "table" or type(bRG3.captureOptions) ~= "function" or type(bRG3.setAutoWeight) ~= "function" or type(bRG3.setAutoKing) ~= "function" then
      return
    end
    local publicTrainingSnapshot = {
      trainingMode = bRG3.trainingMode,
      autoKing = bRG3.autoKing == true,
      lockPosition = bRG3.lockPosition == true,
      autoRebirth = bRG3.autoRebirth == true,
      fastPunch = bRG3.fastPunch == true,
      rockRequirement = bRG3.selectedRockRequirement,
      fly = bRG3.fly == true,
      autoEgg = bRG3.autoEgg == true,
      autoSpinFortune = bRG3.autoSpinFortune == true,
    }
    self.publicTrainingController = bRG3
    self.publicTrainingSnapshot = publicTrainingSnapshot
    local tbl7 = {
      weight = bRG3.setAutoWeight,
      handstands = bRG3.setAutoHandstands,
      pushups = bRG3.setAutoPushups,
      situps = bRG3.setAutoSitups,
    }
    local item = tbl7[publicTrainingSnapshot.trainingMode]
    if type(item) == "function" then pcall(item, false) end
    if publicTrainingSnapshot.fastPunch and type(bRG3.setFastPunch) == "function" then
      pcall(bRG3.setFastPunch, false)
    end
    if publicTrainingSnapshot.fly and type(bRG3.setFlyToggle) == "function" then
      pcall(bRG3.setFlyToggle, false)
    end
    if publicTrainingSnapshot.lockPosition and type(bRG3.setLockPosition) == "function" then
      pcall(bRG3.setLockPosition, false)
    end
    if publicTrainingSnapshot.autoKing then pcall(bRG3.setAutoKing, false) end
    if publicTrainingSnapshot.autoRebirth and type(bRG3.setAutoRebirth) == "function" then
      pcall(bRG3.setAutoRebirth, false)
    end
    if publicTrainingSnapshot.autoEgg and type(bRG3.setAutoEgg) == "function" then
      pcall(bRG3.setAutoEgg, false)
    end
    if publicTrainingSnapshot.autoSpinFortune and type(bRG3.setAutoSpinFortune) == "function" then
      pcall(bRG3.setAutoSpinFortune, false)
    end
  end

  function bossFarm:RestorePublicTraining()
    local publicTrainingController = self.publicTrainingController
    local publicTrainingSnapshot = self.publicTrainingSnapshot
    self.publicTrainingController = nil
    self.publicTrainingSnapshot = nil
    if _G2.BRG ~= publicTrainingController or type(publicTrainingController) ~= "table" or type(publicTrainingSnapshot) ~= "table" then
      return
    end
    local tbl7 = {
      weight = publicTrainingController.setAutoWeight,
      handstands = publicTrainingController.setAutoHandstands,
      pushups = publicTrainingController.setAutoPushups,
      situps = publicTrainingController.setAutoSitups,
    }
    local item = tbl7[publicTrainingSnapshot.trainingMode]
    if type(item) == "function" and publicTrainingController.trainingMode == nil then pcall(item, true) end
    if publicTrainingSnapshot.fastPunch and type(publicTrainingController.setFastPunch) == "function" and publicTrainingController.fastPunch ~= true then
      local ok, result = pcall(publicTrainingController.setFastPunch, true)
      if ok and result ~= false and type(publicTrainingSnapshot.rockRequirement) == "number" and type(publicTrainingController.setRock) == "function" then
        pcall(publicTrainingController.setRock, publicTrainingSnapshot.rockRequirement, true)
      end
    end
    if publicTrainingSnapshot.autoKing and publicTrainingController.autoKing ~= true and type(publicTrainingController.setAutoKing) == "function" then
      pcall(publicTrainingController.setAutoKing, true)
    end
    if publicTrainingSnapshot.autoRebirth and publicTrainingController.autoRebirth ~= true and type(publicTrainingController.setAutoRebirth) == "function" then
      pcall(publicTrainingController.setAutoRebirth, true)
    end
    if publicTrainingSnapshot.autoEgg and publicTrainingController.autoEgg ~= true and type(publicTrainingController.setAutoEgg) == "function" then
      pcall(publicTrainingController.setAutoEgg, true)
    end
    if publicTrainingSnapshot.autoSpinFortune and publicTrainingController.autoSpinFortune ~= true and type(publicTrainingController.setAutoSpinFortune) == "function" then
      pcall(publicTrainingController.setAutoSpinFortune, true)
    end
    if publicTrainingSnapshot.lockPosition and publicTrainingController.lockPosition ~= true and type(publicTrainingController.setLockPosition) == "function" then
      pcall(publicTrainingController.setLockPosition, true)
    elseif publicTrainingSnapshot.fly and publicTrainingController.fly ~= true and type(publicTrainingController.setFlyToggle) == "function" then
      pcall(publicTrainingController.setFlyToggle, true)
    end
  end

  function bossFarm:PauseRegisteredScripts()
    self.externalPauseTokens = {}
    for key, controller in pairs(_G2) do
      if type(key) == "string" and string.sub(key, 1, 7) == "Young0x" and type(controller) == "table" and controller ~= _G2.Young0xFG100 and controller ~= young0xAutoKill2 and type(controller.PauseForBoss) == "function" then
        local ok, token = pcall(controller.PauseForBoss, controller, "Auto Kills")
        if ok and (type(token) == "function" or (type(token) == "table" and type(token.restore) == "function")) then
          self.externalPauseTokens[#self.externalPauseTokens + 1] = { controller = controller, token = token }
        end
      end
    end
  end

  function bossFarm:RestoreRegisteredScripts()
    local externalPauseTokens = self.externalPauseTokens
    self.externalPauseTokens = nil
    if type(externalPauseTokens) ~= "table" then return end
    for i = #externalPauseTokens, 1, -1 do
      local item = externalPauseTokens[i]
      local token = item and item.token
      if type(token) == "function" then
        pcall(token)
      elseif type(token) == "table" and type(token.restore) == "function" then
        pcall(token.restore, token)
      end
    end
  end

  function bossFarm:PauseOtherScripts()
    self:PauseFG100()
    self:PausePublicTraining()
    self:PauseRegisteredScripts()
  end

  function bossFarm:RestoreOtherScripts()
    self:RestoreRegisteredScripts()
    self:RestorePublicTraining()
    self:RestoreFG100()
  end

  function bossFarm:WaitForReadyCharacter(arg)
    local num20 = os.clock() + (tonumber(arg) or 8)
    local v
    local v2
    local v3
    while state.running and self.active and os.clock() < num20 do
      local wait = getWait()
      local humanoidRootPart = wait and wait:FindFirstChild("HumanoidRootPart")
      local humanoid = wait and wait:FindFirstChildWhichIsA("Humanoid")
      local machineInUse = localPlayer2:FindFirstChild("machineInUse")
      local wait2 = wait and (wait:GetAttribute("IsRebirthing") == true or wait:GetAttribute("LastMapCFrame") ~= nil)
      local humanoid2 = (machineInUse and machineInUse.Value ~= nil) or (humanoid and humanoid.SeatPart ~= nil)
      if wait and humanoidRootPart and humanoid and humanoid.Health > 0 and not wait2 and not humanoid2 then
        if wait ~= v or humanoidRootPart ~= v2 then
          v = wait
          v2 = humanoidRootPart
          v3 = os.clock()
        elseif os.clock() - v3 >= 0.18 then
          return wait, humanoidRootPart, humanoid
        end
      else
        v = nil
        v2 = nil
        v3 = nil
      end
      task.wait(0.05)
    end
    return nil, nil, nil
  end

  local function fn58()
    return math.max(0, tonumber(workspace:GetAttribute("BossHealth")) or 0)
  end

  local function fn59()
    local humanoid = getHumanoid()
    local bodyHeightScale = humanoid and humanoid:FindFirstChild("BodyHeightScale")
    return math.clamp(math.floor(((bodyHeightScale and bodyHeightScale.Value) or 1) + 0.5), 1, 100)
  end

  function bossFarm:ApplyAntiLagObject(arg)
    if not self.antiLag or not arg then return end
    local property
    if arg:IsA("ParticleEmitter") or arg:IsA("Trail") or arg:IsA("Beam") or arg:IsA("Fire") or arg:IsA("Smoke") or arg:IsA("Sparkles") or arg:IsA("PointLight") or arg:IsA("SpotLight") or arg:IsA("SurfaceLight") or arg:IsA("Highlight") then
      property = "Enabled"
    elseif arg:IsA("BasePart") then
      property = "CastShadow"
    end
    if property and self.antiLagOriginals[arg] == nil then
      self.antiLagOriginals[arg] = { property = property, value = arg[property] }
      pcall(function()
        arg[property] = false
      end)
    end
  end

  function bossFarm:SetAntiLag(arg)
    self.antiLag = arg == true
    if self.antiLagConnection then
      pcall(function()
        self.antiLagConnection:Disconnect()
      end)
      self.antiLagConnection = nil
    end
    if not self.antiLag then
      if self.autoLag60Enabled then
        self.antiLagOriginals = setmetatable({}, { __mode = "k" })
        return
      end
      for key, value7 in pairs(self.antiLagOriginals) do
        if key and key.Parent then
          pcall(function()
            key[value7.property] = value7.value
          end)
        end
        self.antiLagOriginals[key] = nil
      end
      return
    end
    local events = workspace:FindFirstChild("Events")
    local bossArena = events and events:FindFirstChild("BossArena")
    if not bossArena then return end
    for index, item in ipairs(bossArena:GetDescendants()) do
      self:ApplyAntiLagObject(item)
    end
    self.antiLagConnection = bossArena.DescendantAdded:Connect(function(arg2)
      task.defer(function()
        self:ApplyAntiLagObject(arg2)
      end)
    end)
  end

  function bossFarm:ApplyAutoLag60Object(arg)
    if not self.autoLag60Enabled or not arg or not arg.Parent then return end
    pcall(function()
      local item = self.autoLag60Originals[arg]
      if not item then
        item = {}
        self.autoLag60Originals[arg] = item
      end

      local function fn60(arg2, arg3)
        if item[arg2] == nil then item[arg2] = { value = arg[arg2] } end
        arg[arg2] = arg3
      end
      if arg:IsA("ParticleEmitter") or arg:IsA("Trail") or arg:IsA("Beam") or arg:IsA("Fire") or arg:IsA("Smoke") or arg:IsA("Sparkles") or arg:IsA("Highlight") then
        fn60("Enabled", false)
      elseif arg:IsA("PointLight") or arg:IsA("SpotLight") or arg:IsA("SurfaceLight") then
        fn60("Enabled", false)
        fn60("Shadows", false)
      elseif arg:IsA("MeshPart") then
        fn60("CastShadow", false)
        fn60("Material", Enum.Material.Plastic)
        fn60("Reflectance", 0)
        fn60("TextureID", "")
      elseif arg:IsA("BasePart") then
        fn60("CastShadow", false)
        fn60("Material", Enum.Material.Plastic)
        fn60("Reflectance", 0)
      elseif arg:IsA("SpecialMesh") then
        fn60("TextureId", "")
      elseif arg:IsA("Decal") or arg:IsA("Texture") then
        fn60("Transparency", 1)
      elseif arg:IsA("SurfaceAppearance") then
        fn60("ColorMap", "")
        fn60("MetalnessMap", "")
        fn60("NormalMap", "")
        fn60("RoughnessMap", "")
      elseif arg:IsA("BloomEffect") or arg:IsA("BlurEffect") or arg:IsA("SunRaysEffect") or arg:IsA("DepthOfFieldEffect") or arg:IsA("ColorCorrectionEffect") then
        fn60("Enabled", false)
      elseif arg:IsA("Atmosphere") then
        fn60("Density", 0)
        fn60("Haze", 0)
        fn60("Glare", 0)
      end
    end)
  end

  function bossFarm:QueueAutoLag60(arg)
    if not self.autoLag60Enabled or not arg or self.autoLag60Queued[arg] then return end
    self.autoLag60Queued[arg] = true
    self.autoLag60Queue[#self.autoLag60Queue + 1] = arg
    if self.autoLag60WorkerRunning then return end
    self.autoLag60WorkerRunning = true
    fn6("antiLag60Worker", function()
      local num20 = 1
      while state.running and self.autoLag60Enabled and num20 <= #self.autoLag60Queue do
        local num21 = math.min(#self.autoLag60Queue, num20 + 89)
        while num20 <= num21 do
          local item = self.autoLag60Queue[num20]
          num20 = num20 + 1
          self.autoLag60Queued[item] = nil
          if item and item.Parent then
            self:ApplyAutoLag60Object(item)
            for index, item2 in ipairs(item:GetChildren()) do
              if not self.autoLag60Queued[item2] then
                self.autoLag60Queued[item2] = true
                self.autoLag60Queue[#self.autoLag60Queue + 1] = item2
              end
            end
          end
        end
        runService2.Heartbeat:Wait()
      end
      self.autoLag60Queue = {}
      self.autoLag60Queued = setmetatable({}, { __mode = "k" })
      self.autoLag60WorkerRunning = false
    end)
  end

  function bossFarm:SetAutoLag60(arg)
    self.autoLag60Enabled = arg == true
    state.antiLag60 = self.autoLag60Enabled
    if self.autoLag60Connection then
      self.autoLag60Connection:Disconnect()
      self.autoLag60Connection = nil
    end
    fn5("antiLag60Worker")
    self.autoLag60Queue = {}
    self.autoLag60Queued = setmetatable({}, { __mode = "k" })
    self.autoLag60WorkerRunning = false
    if not self.autoLag60Enabled then
      for key, value7 in pairs(self.autoLag60Originals) do
        if key and key.Parent then
          for key2, value8 in pairs(value7) do
            pcall(function()
              key[key2] = value8.value
            end)
          end
        end
      end
      self.autoLag60Originals = setmetatable({}, { __mode = "k" })
      local autoLag60SystemOriginals = self.autoLag60SystemOriginals
      self.autoLag60SystemOriginals = nil
      if autoLag60SystemOriginals then
        local lighting = game:GetService("Lighting")
        for key, value7 in pairs(autoLag60SystemOriginals.lighting or {}) do
          pcall(function()
            lighting[key] = value7
          end)
        end
        local terrain = workspace:FindFirstChildOfClass("Terrain")
        if terrain then
          for key, value7 in pairs(autoLag60SystemOriginals.terrain or {}) do
            pcall(function()
              terrain[key] = value7
            end)
          end
        end
      end
      return
    end
    if not self.autoLag60SystemOriginals then
      local lighting = game:GetService("Lighting")
      local terrain = workspace:FindFirstChildOfClass("Terrain")
      self.autoLag60SystemOriginals = {
        lighting = {
          GlobalShadows = lighting.GlobalShadows,
          FogEnd = lighting.FogEnd,
          Brightness = lighting.Brightness,
          EnvironmentDiffuseScale = lighting.EnvironmentDiffuseScale,
          EnvironmentSpecularScale = lighting.EnvironmentSpecularScale,
          ShadowSoftness = lighting.ShadowSoftness,
        },
        terrain = terrain and {
          WaterWaveSize = terrain.WaterWaveSize,
          WaterWaveSpeed = terrain.WaterWaveSpeed,
          WaterReflectance = terrain.WaterReflectance,
          WaterTransparency = terrain.WaterTransparency,
        } or nil,
      }
    end
    pcall(function()
      local lighting = game:GetService("Lighting")
      lighting.GlobalShadows = false
      lighting.FogEnd = 1000000000
      lighting.Brightness = 1
      lighting.EnvironmentDiffuseScale = 0
      lighting.EnvironmentSpecularScale = 0
      lighting.ShadowSoftness = 0
    end)
    pcall(function()
      local terrain = workspace:FindFirstChildOfClass("Terrain")
      if terrain then
        terrain.WaterWaveSize = 0
        terrain.WaterWaveSpeed = 0
        terrain.WaterReflectance = 0
        terrain.WaterTransparency = 1
        pcall(function()
          terrain.Decoration = false
        end)
      end
    end)
    for index, item in ipairs(workspace:GetChildren()) do
      self:QueueAutoLag60(item)
    end
    for index, item in ipairs(game:GetService("Lighting"):GetChildren()) do
      self:QueueAutoLag60(item)
    end
    self.autoLag60Connection = workspace.DescendantAdded:Connect(function(arg2)
      self:QueueAutoLag60(arg2)
    end)
  end

  function bossFarm:StopStableCamera()
    local cameraShakeHooks = self.cameraShakeHooks
    self.cameraShakeHooks = nil
    if type(cameraShakeHooks) ~= "table" then return end
    for i = #cameraShakeHooks, 1, -1 do
      local item = cameraShakeHooks[i]
      local flag6 = false
      if type(restorefunction) == "function" then
        flag6 = pcall(restorefunction, item.original, item.target)
        if not flag6 then flag6 = pcall(restorefunction, item.target) end
      end
      if not flag6 and type(hookfunction) == "function" then pcall(hookfunction, item.target, item.original) end
    end
  end

  function bossFarm:StartStableCamera()
    self:StopStableCamera()
    local client = replicatedStorage2:FindFirstChild("client")
    local utils = client and client:FindFirstChild("utils")
    local cameraShake = utils and utils:FindFirstChild("CameraShake")
    if not cameraShake or not cameraShake:IsA("ModuleScript") then return end
    local ok, result = pcall(require, cameraShake)
    if not ok or type(result) ~= "table" then return end
    if type(hookfunction) ~= "function" then return end
    local cameraShakeHooks = {}
    for index, item in ipairs({ "Play", "PlayInArena", "PlayAt" }) do
      local target = result[item]
      if type(target) == "function" then
        local ok2, original = pcall(hookfunction, target, function()
          return nil
        end)
        if ok2 and type(original) == "function" then
          cameraShakeHooks[#cameraShakeHooks + 1] = { target = target, original = original }
        end
      end
    end
    if #cameraShakeHooks > 0 then self.cameraShakeHooks = cameraShakeHooks end
  end

  function bossFarm:BeginBattle(engagedBoss)
    if self.engagedBoss == engagedBoss then return true end
    self.engagedBoss = engagedBoss
    state.bossCombat = true
    fn56(tostring(workspace:GetAttribute("BossDisplayName") or "Boss"), 0, 0, 0)
    fn5("killFarm")
    fn5("killSizeOne")
    fn51()
    self.resumeAutoWinBrawl = state.autoWinBrawl == true
    if self.resumeAutoWinBrawl and type(young0xAutoKill2.SetAutoWinBrawl) == "function" then
      pcall(young0xAutoKill2.SetAutoWinBrawl, false)
    end
    fn5("brawlRestore")
    state.brawlBusy = false
    state.brawlCombat = false
    state.brawlJoined = false
    state.brawlJoinSent = false
    state.brawlChosen = nil
    state.brawlPhase = "PAUSED_BOSS"
    self:PauseOtherScripts()
    local waitForReadyCharacter, originalRoot, extra = self:WaitForReadyCharacter(8)
    if not waitForReadyCharacter or not originalRoot or not extra or engagedBoss.Parent == nil or workspace:GetAttribute("BossActive") ~= true then
      self:RestoreBattle()
      return false
    end
    self.originalCharacter = waitForReadyCharacter
    self.originalPivot = waitForReadyCharacter:GetPivot()
    self.originalSize = fn59()
    self.originalRoot = originalRoot
    self.originalRootAnchored = originalRoot.Anchored
    originalRoot.Anchored = false
    self.contactReadyAt = os.clock() + 0.55
    self.safeAttackPosition = nil
    self.currentContactHeight = nil
    self:StartStableCamera()
    fn48(1)
    task.wait(0.55)
    return state.running and self.active and engagedBoss.Parent ~= nil
  end

  function bossFarm:GetArenaFloorY(arg)
    local events = workspace:FindFirstChild("Events")
    local bossArena = events and events:FindFirstChild("BossArena")
    local bossSpawn = bossArena and bossArena:FindFirstChild("BossSpawn", true)
    if bossSpawn and bossSpawn:IsA("BasePart") then return bossSpawn.Position.Y end
    return arg and arg.Position.Y or 0
  end

  function bossFarm:GetBossProfile(arg)
    local item = arg and self.bossProfiles[arg.Name]
    if item then return item end
    local attribute = arg and arg:GetAttribute("BossRarityIndex")
    if typeof(attribute) == "number" then
      for key, value7 in pairs(self.bossProfiles) do
        if value7.index == attribute then return value7 end
      end
    end
    return self.bossProfiles.Boss5
  end

  function bossFarm:GetBossDodgePosition(arg, arg2, arg3, arg4, arg5)
    local bossProfile = self:GetBossProfile(arg)
    local attribute = arg:GetAttribute("BossAttackKind")
    local attribute2 = arg:GetAttribute("BossAttackCFrame")
    if typeof(attribute2) ~= "CFrame" then attribute2 = CFrame.new(arg2.Position) * arg2.CFrame.Rotation end
    local num20 = arg4.Size.Y * 0.5
    local num21 = self:GetArenaFloorY(arg4) + num20 + 1.5
    local vector3 = Vector3.new(attribute2.LookVector.X, 0, attribute2.LookVector.Z)
    if vector3.Magnitude < 0.01 then
      vector3 = Vector3.new(arg2.CFrame.LookVector.X, 0, arg2.CFrame.LookVector.Z)
    end
    vector3 = vector3.Magnitude >= 0.01 and vector3.Unit or Vector3.zAxis
    local vector32 = Vector3.new(attribute2.Position.X, num21, attribute2.Position.Z)
    if attribute == "Punch" and not arg5 then
      local num22 = math.min(bossProfile.maxHitDistance * 0.38, math.max(12, arg3.Size.Z * 0.38))
      return vector32 - vector3 * num22
    end
    return vector32 + Vector3.yAxis * (bossProfile.stompHeight + num20 + 14)
  end

  function bossFarm:RestoreBattle()
    local character = localPlayer2.Character
    local humanoidRootPart = character and character:FindFirstChild("HumanoidRootPart")
    if character and humanoidRootPart and self.originalPivot then
      character:PivotTo(self.originalPivot)
      humanoidRootPart.AssemblyLinearVelocity = Vector3.zero
      humanoidRootPart.AssemblyAngularVelocity = Vector3.zero
    end
    local originalRoot = self.originalRoot
    if originalRoot and originalRoot.Parent and self.originalRootAnchored ~= nil then
      originalRoot.Anchored = self.originalRootAnchored
    end
    if self.originalSize then fn48(self.originalSize) end
    self:StopStableCamera()
    fn11()
    self.originalCharacter = nil
    self.originalPivot = nil
    self.originalSize = nil
    self.originalRoot = nil
    self.originalRootAnchored = nil
    self.safeAttackPosition = nil
    self.currentContactHeight = nil
    self.engagedBoss = nil
    state.bossCombat = false
    self:RestoreOtherScripts()
    local resumeAutoWinBrawl = self.resumeAutoWinBrawl
    self.resumeAutoWinBrawl = false
    if state.running then
      fn50()
      fn32()
      if state.autoKill and not state.brawlBusy then fn52() end
      if resumeAutoWinBrawl and not state.autoWinBrawl and type(young0xAutoKill2.SetAutoWinBrawl) == "function" then
        task.defer(function()
          if state.running and not state.bossCombat and not state.autoWinBrawl then
            pcall(young0xAutoKill2.SetAutoWinBrawl, true)
          end
        end)
      end
    end
  end

  function bossFarm:CollectChest(arg)
    local flag6 = false
    local v
    local rEvents = replicatedStorage2:FindFirstChild("rEvents")
    local bossChestOpenedEvent = rEvents and rEvents:FindFirstChild("bossChestOpenedEvent")
    if bossChestOpenedEvent and bossChestOpenedEvent:IsA("RemoteEvent") then
      v = bossChestOpenedEvent.OnClientEvent:Connect(function()
        flag6 = true
      end)
    end

    local function fn60(arg2)
      if v then v:Disconnect() end
      return arg2
    end
    local num20 = os.clock() + (tonumber(arg) or 15)
    local flag7 = false
    local flag8 = false
    local num21 = 0
    while state.running and self.active and os.clock() < num20 do
      if flag6 then
        fn56("Cofre reclamado")
        return fn60(true)
      end
      local v2
      local v3
      for index, item in ipairs(collectionService:GetTagged("BossEventChest")) do
        v3 = item:FindFirstChild("bossChestPrompt", true)
        if v3 then
          v2 = item
          break
        end
      end
      if not v3 then
        local events = workspace:FindFirstChild("Events")
        v3 = events and events:FindFirstChild("bossChestPrompt", true)
        v2 = v3 and v3:FindFirstAncestorOfClass("Model") or nil
      end
      local flag9 = localPlayer2:GetAttribute("BossChestEligible") == true
      local flag10 = localPlayer2:GetAttribute("BossChestPending") == true
      if flag10 then
        flag7 = true
      elseif flag8 and flag7 then
        fn56("Cofre reclamado")
        return fn60(true)
      end
      local flag11 = v2 and v2:GetAttribute("BossChestEmerging") == true
      if v3 and v3:IsA("ProximityPrompt") and flag9 and flag10 and not flag11 then
        fn56("Reclamando cofre")
        local wait = getWait()
        local humanoidRootPart = wait and wait:FindFirstChild("HumanoidRootPart")
        local parent2 = v3.Parent
        if wait and humanoidRootPart and parent2 and parent2:IsA("BasePart") then
          wait:PivotTo(parent2.CFrame * CFrame.new(0, math.max(4, parent2.Size.Y * 0.5 + 3), 0))
          humanoidRootPart.AssemblyLinearVelocity = Vector3.zero
          humanoidRootPart.AssemblyAngularVelocity = Vector3.zero
          task.wait(0.12)
        end
        if v3.Enabled and os.clock() - num21 >= 0.45 then
          num21 = os.clock()
          local flag12 = false
          if type(_G2.fireproximityprompt) == "function" then
            flag12 = pcall(_G2.fireproximityprompt, v3)
          elseif type(fireproximityprompt) == "function" then
            flag12 = pcall(fireproximityprompt, v3)
          else
            flag12 = pcall(function()
              v3:InputHoldBegin()
              task.wait(math.max(0.05, tonumber(v3.HoldDuration) or 0) + 0.05)
              v3:InputHoldEnd()
            end)
          end
          flag8 = flag12 or flag8
        end
      end
      task.wait(0.1)
    end
    return fn60(flag6 or (flag8 and flag7 and localPlayer2:GetAttribute("BossChestPending") ~= true))
  end

  function bossFarm:Fight(arg)
    if not self:BeginBattle(arg) then return end
    self.ownBossDamage = 0
    self.ownBossHits = 0
    local ownBossDamage = self.ownBossDamage
    local ownBossHits = self.ownBossHits
    local num20 = 0
    local num21 = 0
    local value7 = nil
    local num22 = 0
    local zero = Vector3.zero
    local num23 = 0
    local value8 = nil
    local num24 = 1
    local num25 = 0
    local num26 = 0
    local num27 = 0
    local tbl7 = {}

    local function fn60(arg2, arg3, arg4)
      local tbl8 = {}
      local tbl9 = {}

      local function fn61(arg5)
        arg5 = math.floor((tonumber(arg5) or 0) * 10 + 0.5) / 10
        if not tbl9[arg5] then
          tbl9[arg5] = true
          tbl8[#tbl8 + 1] = arg5
        end
      end
      if type(arg2.contactHeights) == "table" then
        for index, item in ipairs(arg2.contactHeights) do
          fn61(item)
        end
      else
        fn61(arg2.contactHeight)
        fn61(math.clamp(arg3.Size.Y * 0.35, 35, arg2.maxHitDistance * 0.55))
        fn61(-math.clamp(arg3.Size.Y * 0.16, 18, 40))
        fn61(math.clamp(arg4.Size.Y * 0.30, 30, arg2.maxHitDistance * 0.50))
        fn61(math.clamp(arg3.Size.Y * 0.45, 45, arg2.maxHitDistance * 0.68))
      end
      return tbl8
    end

    local function fn61(arg2)
      if not value8 or #value8 <= 1 then return end
      for i = 1, #value8 do
        num24 = num24 % #value8 + 1
        local item = value8[num24]
        if (tbl7[item] or 0) <= arg2 then break end
      end
      num25 = 0
      num26 = arg2
      self.safeAttackPosition = nil
    end
    while state.running and self.active and arg.Parent and workspace:GetAttribute("BossActive") == true do
      local result, extra, extra2 = fn57()
      if result ~= arg or not extra or not extra2 then break end
      local wait = getWait()
      local humanoidRootPart = wait and wait:FindFirstChild("HumanoidRootPart")
      local humanoid = wait and wait:FindFirstChildWhichIsA("Humanoid")
      local result2 = fn26()
      if not wait or not humanoidRootPart or not humanoid or humanoid.Health <= 0 or not result2 then break end
      local now = os.clock()
      if value7 and humanoid.Health < value7 then
        num23 = now + 1.6
        if value8 then
          tbl7[value8[num24]] = now + 10
          fn61(now)
        end
      end
      value7 = humanoid.Health
      local bossProfile = self:GetBossProfile(arg)
      if not value8 then
        value8 = fn60(bossProfile, extra, extra2)
        num24 = 1
        num26 = now
        num27 = self.ownBossHits
      end
      if self.ownBossHits > num27 then
        num27 = self.ownBossHits
        num25 = 0
      elseif num25 >= 5 and now - num26 >= 1.4 then
        fn61(now)
      end
      local attribute = arg:GetAttribute("BossAttackKind")
      local attribute2 = arg:GetAttribute("BossAttackImpactTime")
      local serverTimeNow = workspace:GetServerTimeNow()
      local num28 = 0
      pcall(function()
        num28 = math.clamp(localPlayer2:GetNetworkPing() * 0.9, 0, 0.35)
      end)
      local num29 = bossProfile.dodgeLead + num28
      local flag6 = (attribute == "Punch" or attribute == "Stomp") and typeof(attribute2) == "number" and serverTimeNow >= attribute2 - num29 and serverTimeNow <= attribute2 + 0.20
      if now >= num22 then
        num22 = now + 0.25
        zero = Vector3.zero
      end
      local num30 = humanoidRootPart.Size.Y * 0.5
      local num31 = self:GetArenaFloorY(humanoidRootPart) + num30 + 1.5
      local v
      if flag6 or now < num23 then
        v = self:GetBossDodgePosition(arg, extra, extra2, humanoidRootPart, now < num23 or attribute ~= "Punch")
        self.safeAttackPosition = nil
      else
        local currentContactHeight = value8[num24]
        self.currentContactHeight = currentContactHeight
        local safeAttackPosition = extra.Position + zero + Vector3.yAxis * currentContactHeight
        safeAttackPosition = Vector3.new(safeAttackPosition.X, math.max(safeAttackPosition.Y, num31), safeAttackPosition.Z)
        if not self.safeAttackPosition or (safeAttackPosition - self.safeAttackPosition).Magnitude > 45 then
          self.safeAttackPosition = safeAttackPosition
        else
          self.safeAttackPosition = self.safeAttackPosition:Lerp(safeAttackPosition, 0.16)
        end
        v = self.safeAttackPosition
      end
      v = Vector3.new(v.X, math.max(v.Y, num31), v.Z)
      local position = extra.Position
      humanoidRootPart.Anchored = false
      wait:PivotTo(CFrame.lookAt(v, position))
      humanoidRootPart.AssemblyLinearVelocity = Vector3.zero
      humanoidRootPart.AssemblyAngularVelocity = Vector3.zero
      local flag7 = not flag6 and now >= num23 and now >= (self.contactReadyAt or 0)
      if flag7 and now - num21 >= self.hitInterval then
        num21 = now
        self.lastAttackAt = now
        pcall(result2.Deactivate, result2)
        pcall(result2.Activate, result2)
        fn27()
        num20 = num20 + 1
        num25 = num25 + 1
      end
      ownBossDamage = self.ownBossDamage
      ownBossHits = self.ownBossHits
      fn56(tostring(workspace:GetAttribute("BossDisplayName") or "Boss"), ownBossDamage, num20, ownBossHits)
      task.wait(0.04)
    end
    local flag6 = workspace:GetAttribute("BossActive") ~= true or fn58() <= 0
    if flag6 and state.running and self.active then
      fn56("Boss derrotado", ownBossDamage, num20, ownBossHits)
      self:CollectChest(15)
    end
    self:RestoreBattle()
  end

  function bossFarm:Set(arg)
    local flag6 = self.active == true
    local active = arg == true
    if active and not flag6 then self:CaptureReturnPosition() end
    self.generation = self.generation + 1
    local generation = self.generation
    self.active = active
    state.killBoss = self.active
    fn5("bossFarm")
    if not self.active then
      fn56("Sin boss activo", 0, 0, 0)
      self:RestoreBattle()
      self:SetAntiLag(false)
      self:RestoreFG100BossOwnership()
      self:ReturnToSavedPosition()
      fn41()
      return true
    end
    local shared = replicatedStorage2:FindFirstChild("shared")
    shared = shared and shared:FindFirstChild("config")
    shared = shared and shared:FindFirstChild("BossEventConfig")
    local ok, result = pcall(function()
      return shared and require(shared)
    end)
    if not ok or type(result) ~= "table" or result.ENABLED ~= true then
      self.active = false
      state.killBoss = false
      fn56("Boss no disponible", 0, 0, 0)
      self:ReturnToSavedPosition()
      fn41()
      return false
    end
    for index, item in ipairs(type(result.RARITIES) == "table" and result.RARITIES or {}) do
      if type(item) == "table" and type(item.BossModel) == "string" then
        local item2 = self.bossProfiles[item.BossModel]
        self.bossProfiles[item.BossModel] = {
          index = index,
          punchHeight = tonumber(item.PunchHeight) or 150,
          punchLength = tonumber(item.PunchLength) or 187.5,
          stompHeight = tonumber(item.StompHeight) or 150,
          stompRadius = tonumber(item.StompRadius) or 187.5,
          maxHitDistance = tonumber(item.MaxHitDistance) or 150,
          dodgeLead = math.clamp(0.32 + index * 0.04, 0.36, 0.56),
          contactHeight = item2 and item2.contactHeight or nil,
          contactHeights = item2 and item2.contactHeights or nil,
        }
      end
    end
    self.hitInterval = math.max(0.31, (tonumber(result.MIN_HIT_INTERVAL) or 0.3) + 0.01)
    self:ClaimFG100BossOwnership()
    self:SetAntiLag(state.antiLag60)
    young0xAutoKill2.BossReporter:Queue()
    fn5("bossReporterRefresh")
    fn6("bossReporterRefresh", function()
      while state.running and self.active and self.generation == generation do
        if workspace:GetAttribute("BossActive") == true then young0xAutoKill2.BossReporter:Queue() end
        task.wait(18)
      end
    end)
    fn6("bossFarm", function()
      while state.running and self.active and self.generation == generation do
        self:ClaimFG100BossOwnership()
        if localPlayer2:GetAttribute("BossChestPending") == true then
          self:CollectChest(15)
        elseif workspace:GetAttribute("BossActive") == true then
          local result2 = fn57()
          if result2 then
            self:Fight(result2)
          else
            fn56("Esperando aparición", 0, 0)
            task.wait(0.15)
          end
        else
          fn56("Esperando boss", 0, 0)
          task.wait(0.4)
        end
      end
      if self.generation == generation then self:RestoreBattle() end
    end)
    fn41()
    return true
  end
  state.bossFarm = bossFarm
  fn4(workspace:GetAttributeChangedSignal("BossSpawnSequence"):Connect(function()
    if state.killBoss then young0xAutoKill2.BossReporter:Queue() end
  end))
  fn4(workspace:GetAttributeChangedSignal("BossActive"):Connect(function()
    if state.killBoss and workspace:GetAttribute("BossActive") == true then
      young0xAutoKill2.BossReporter:Queue()
    elseif workspace:GetAttribute("BossActive") ~= true then
      young0xAutoKill2.BossReporter:QueueExpired()
    end
  end))

  local function getSet(arg)
    return bossFarm:Set(arg)
  end

  local function fn60()
    state.brawlPhase = "IDLE"
    state.brawlBusy = false
    state.brawlCombat = false
    state.brawlJoined = false
    state.brawlJoinSent = false
    state.brawlChosen = nil
    state.lastKillAt = os.clock()
    state.forceHopReason = nil
    fn50()
    fn32()
    if state.autoKill then
      fn52()
    else
      fn29()
    end
  end

  local function fn61()
    if not state.brawlBusy and state.brawlPhase == "IDLE" then return end
    state.brawlPhase = "RESTORING"
    state.brawlCombat = false
    state.brawlChosen = nil
    state.combatCFrame = nil
    fn50()
    fn32()
    fn5("brawlRestore")
    fn6("brawlRestore", function()
      local num20 = os.clock() + 15
      while state.running and fn20(localPlayer2) do
        if brawl:GetAttribute("BrawlInProgress") ~= true and os.clock() >= num20 then break end
        task.wait(0.25)
      end
      if state.running then
        local result = fn22()
        state.lastBrawlWon = result ~= nil and state.brawlBaselineWins ~= nil and result > state.brawlBaselineWins
        fn60()
      end
    end)
  end

  local function fn62()
    if not state.brawlBusy then state.brawlBaselineWins = fn22() end
    state.brawlBusy = true
    state.brawlCombat = false
    state.brawlJoined = fn20(localPlayer2)
    state.brawlChosen = nil
    state.brawlPhase = state.brawlJoined and "WAITING" or "JOINING"
    state.forceHopReason = nil
    fn51()
    fn32()
  end

  local function fn63()
    if not state.autoWinBrawl or not fn20(localPlayer2) then return false end
    if not state.brawlBusy then fn62() end
    state.brawlJoined = true
    state.brawlCombat = true
    state.brawlPhase = "FIGHTING"
    state.brawlChosen = nil
    fn51()
    fn50()
    fn32()
    return true
  end

  local function fn64()
    if not state.autoWinBrawl or state.brawlJoinSent or brawl:GetAttribute("BrawlInProgress") ~= true or brawl:GetAttribute("BrawlStarted") == true then
      return false
    end
    fn62()
    fn49()
    state.brawlJoinSent = true
    local ok = pcall(brawlEvent.FireServer, brawlEvent, "joinBrawl")
    if not ok then
      state.brawlJoinSent = false
      fn61()
      return false
    end
    return true
  end

  local function fn65(arg)
    state.autoWinBrawl = arg == true
    fn41()
    if not state.autoWinBrawl then
      if state.brawlBusy then
        fn61()
      else
        fn60()
      end
      return true
    end
    if brawl:GetAttribute("BrawlStarted") == true then
      fn63()
    elseif fn23() then
      fn64()
    end
    return true
  end
  fn4(brawlEvent.OnClientEvent:Connect(function(arg, ...)
    if not state.running or not state.autoWinBrawl then return end
    if arg == "brawlStarting" then
      state.brawlJoinSent = false
      task.defer(fn64)
    elseif arg == "joinedBrawl" then
      if not state.brawlBusy then fn62() end
      state.brawlJoined = true
      state.brawlPhase = "WAITING"
    elseif arg == "beginBrawl" then
      fn63()
    elseif arg == "playerChosen" then
      local brawlChosen = select(1, ...)
      if typeof(brawlChosen) == "Instance" and brawlChosen:IsA("Player") then
        if brawlChosen ~= localPlayer2 and fn21(localPlayer2) then
          state.brawlChosen = brawlChosen
        else
          state.brawlChosen = nil
        end
      end
    elseif arg == "noOtherBrawlers" or arg == "endBrawl" then
      fn61()
    end
  end))
  fn4(brawl:GetAttributeChangedSignal("BrawlStarted"):Connect(function()
    if not state.running or not state.autoWinBrawl then return end
    if brawl:GetAttribute("BrawlStarted") == true then
      fn63()
    elseif brawl:GetAttribute("BrawlInProgress") ~= true then
      fn61()
    end
  end))
  fn4(brawl:GetAttributeChangedSignal("BrawlInProgress"):Connect(function()
    if not state.running or not state.autoWinBrawl then return end
    if brawl:GetAttribute("BrawlInProgress") ~= true and state.brawlBusy then fn61() end
  end))
  local young0xAutoKillHub = playerGui:FindFirstChild("Young0xAutoKillHub")
  if young0xAutoKillHub then young0xAutoKillHub:Destroy() end
  local tbl7 = {
    base = Color3.fromRGB(7, 7, 9),
    panel = Color3.fromRGB(15, 12, 16),
    panel2 = Color3.fromRGB(24, 18, 22),
    row = Color3.fromRGB(31, 22, 27),
    rowHover = Color3.fromRGB(50, 24, 32),
    rowActive = Color3.fromRGB(68, 20, 31),
    red = Color3.fromRGB(255, 55, 82),
    redBright = Color3.fromRGB(255, 101, 122),
    redDeep = Color3.fromRGB(185, 24, 48),
    redDark = Color3.fromRGB(47, 24, 32),
    white = Color3.fromRGB(255, 255, 255),
    text = Color3.fromRGB(245, 240, 242),
    dim = Color3.fromRGB(201, 185, 191),
    orange = Color3.fromRGB(255, 176, 72),
    black = Color3.fromRGB(1, 0, 2),
  }

  local function fn66(arg) end
  local function updateProtectionStatus() end
  state.updateProtectionStatus = updateProtectionStatus
  local currentCamera = workspace.CurrentCamera
  local vector22 = currentCamera and currentCamera.ViewportSize or Vector2.new(1280, 720)
  local touchEnabled2 = vector22.X < 720 or (userInputService2.TouchEnabled and vector22.X < 1100)
  local touchEnabled3 = touchEnabled2 and math.floor(math.clamp(vector22.X * 0.78, 272, 360)) or 410
  local num20 = 272
  local num21 = 290
  local num22 = 42
  local num23 = num22
  local flag6 = false
  local screenGui = Instance.new("ScreenGui")
  screenGui.Name = "Young0xAutoKillHub"
  screenGui.ResetOnSpawn = false
  screenGui.IgnoreGuiInset = true
  screenGui.DisplayOrder = 999
  screenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
  pcall(function()
    screenGui.AutoLocalize = false
  end)
  screenGui.Parent = playerGui
  local frame = Instance.new("Frame")
  frame.Name = "Shadow"
  frame.AnchorPoint = Vector2.new(0.5, 0)
  frame.Size = UDim2.fromOffset(touchEnabled3 + 12, num20 + 12)
  frame.Position = UDim2.new(0.5, 0, 0.5, -(num20 / 2) - 6)
  frame.BackgroundColor3 = Color3.fromRGB(42, 0, 14)
  frame.BackgroundTransparency = 0.38
  frame.BorderSizePixel = 0
  frame.Visible = false
  frame.ZIndex = 1
  frame.Parent = screenGui
  Instance.new("UICorner", frame).CornerRadius = UDim.new(0, 16)
  local frame2 = Instance.new("Frame")
  frame2.Name = "MainFrame"
  frame2.AnchorPoint = Vector2.new(0.5, 0)
  frame2.Size = UDim2.fromOffset(touchEnabled3, num20)
  frame2.Position = UDim2.new(0.5, 0, 0.5, -num20 / 2)
  frame2.BackgroundColor3 = tbl7.base
  frame2.BackgroundTransparency = 0.14
  frame2.BorderSizePixel = 0
  frame2.ClipsDescendants = true
  frame2.ZIndex = 2
  frame2.Parent = screenGui
  Instance.new("UICorner", frame2).CornerRadius = UDim.new(0, 16)
  local uIGradient = Instance.new("UIGradient")
  uIGradient.Color = ColorSequence.new({
    ColorSequenceKeypoint.new(0, tbl7.base),
    ColorSequenceKeypoint.new(0.55, tbl7.panel),
    ColorSequenceKeypoint.new(1, tbl7.base),
  })
  uIGradient.Rotation = 32
  uIGradient.Parent = frame2
  local frame3 = Instance.new("Frame")
  frame3.Name = "Border"
  frame3.AnchorPoint = Vector2.new(0.5, 0)
  frame3.Size = UDim2.fromOffset(touchEnabled3, num20)
  frame3.Position = frame2.Position
  frame3.BackgroundTransparency = 1
  frame3.BorderSizePixel = 0
  frame3.ZIndex = 80
  frame3.Parent = screenGui
  Instance.new("UICorner", frame3).CornerRadius = UDim.new(0, 16)
  local uIStroke = Instance.new("UIStroke")
  uIStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
  uIStroke.Color = tbl7.red
  uIStroke.Thickness = 1.25
  uIStroke.Transparency = 0.18
  uIStroke.LineJoinMode = Enum.LineJoinMode.Round
  uIStroke.Parent = frame3
  local uIGradient2 = Instance.new("UIGradient")
  uIGradient2.Color = ColorSequence.new({
    ColorSequenceKeypoint.new(0, tbl7.redDeep),
    ColorSequenceKeypoint.new(0.5, tbl7.redBright),
    ColorSequenceKeypoint.new(1, tbl7.redDeep),
  })
  uIGradient2.Parent = uIStroke
  local frame4 = Instance.new("Frame")
  frame4.Name = "Header"
  frame4.Size = UDim2.new(1, 0, 0, num22)
  frame4.BackgroundColor3 = tbl7.panel
  frame4.BackgroundTransparency = 0.20
  frame4.BorderSizePixel = 0
  frame4.ClipsDescendants = true
  frame4.ZIndex = 5
  frame4.Parent = frame2
  Instance.new("UICorner", frame4).CornerRadius = UDim.new(0, 16)
  local frame5 = Instance.new("Frame")
  frame5.Size = UDim2.new(1, 0, 0, 12)
  frame5.Position = UDim2.new(0, 0, 1, -12)
  frame5.BackgroundColor3 = tbl7.panel
  frame5.BackgroundTransparency = 1
  frame5.BorderSizePixel = 0
  frame5.ZIndex = 5
  frame5.Parent = frame4
  frame5.Visible = false
  local uIGradient3 = Instance.new("UIGradient")
  uIGradient3.Color = ColorSequence.new({
    ColorSequenceKeypoint.new(0, Color3.fromRGB(40, 15, 23)),
    ColorSequenceKeypoint.new(0.48, tbl7.panel),
    ColorSequenceKeypoint.new(1, tbl7.base),
  })
  uIGradient3.Rotation = 8
  uIGradient3.Parent = frame4
  local frame6 = Instance.new("Frame")
  frame6.Size = UDim2.fromOffset(205, 104)
  frame6.Position = UDim2.fromOffset(-64, -28)
  frame6.BackgroundColor3 = Color3.fromRGB(212, 15, 67)
  frame6.BackgroundTransparency = 0.74
  frame6.BorderSizePixel = 0
  frame6.ZIndex = 6
  frame6.Parent = frame4
  frame6.Visible = false
  Instance.new("UICorner", frame6).CornerRadius = UDim.new(1, 0)
  local uIGradient4 = Instance.new("UIGradient")
  uIGradient4.Transparency = NumberSequence.new({
    NumberSequenceKeypoint.new(0, 0.2),
    NumberSequenceKeypoint.new(0.62, 0.78),
    NumberSequenceKeypoint.new(1, 1),
  })
  uIGradient4.Parent = frame6
  local textLabel = Instance.new("TextLabel")
  textLabel.Size = UDim2.new(1, -88, 1, 0)
  textLabel.Position = UDim2.fromOffset(44, 0)
  textLabel.BackgroundTransparency = 1
  textLabel.Text = "⚠ Young0x Hub - Auto Kills ⚠"
  textLabel.TextColor3 = tbl7.white
  textLabel.TextStrokeColor3 = tbl7.black
  textLabel.TextStrokeTransparency = 0.52
  textLabel.Font = Enum.Font.GothamBlack
  textLabel.TextSize = touchEnabled2 and 17 or 19
  textLabel.TextXAlignment = Enum.TextXAlignment.Center
  textLabel.ZIndex = 8
  textLabel.Parent = frame4
  local frame7 = Instance.new("Frame")
  frame7.Size = UDim2.new(1, -20, 0, 3)
  frame7.Position = UDim2.new(0, 10, 1, -4)
  frame7.BackgroundColor3 = tbl7.redBright
  frame7.BorderSizePixel = 0
  frame7.ZIndex = 8
  frame7.Parent = frame4
  Instance.new("UICorner", frame7).CornerRadius = UDim.new(1, 0)
  local uIGradient5 = Instance.new("UIGradient")
  uIGradient5.Color = ColorSequence.new(tbl7.red)
  uIGradient5.Parent = frame7
  local textButton = Instance.new("TextButton")
  textButton.Size = UDim2.fromScale(1, 1)
  textButton.BackgroundTransparency = 1
  textButton.BorderSizePixel = 0
  textButton.Text = ""
  textButton.AutoButtonColor = false
  textButton.ZIndex = 10
  textButton.Parent = frame4
  local scrollingFrame = Instance.new("ScrollingFrame")
  scrollingFrame.Name = "Body"
  scrollingFrame.Size = UDim2.new(1, 0, 1, -num22)
  scrollingFrame.Position = UDim2.new(0, 0, 0, num22)
  scrollingFrame.BackgroundColor3 = Color3.fromRGB(6, 3, 8)
  scrollingFrame.BackgroundTransparency = 1
  scrollingFrame.BorderSizePixel = 0
  scrollingFrame.ScrollBarThickness = 2
  scrollingFrame.ScrollBarImageColor3 = tbl7.redBright
  scrollingFrame.ScrollBarImageTransparency = 0.1
  scrollingFrame.CanvasSize = UDim2.new()
  scrollingFrame.ZIndex = 4
  scrollingFrame.Parent = frame2
  Instance.new("UICorner", scrollingFrame).CornerRadius = UDim.new(0, 14)
  local uIPadding = Instance.new("UIPadding")
  uIPadding.PaddingLeft = UDim.new(0, 10)
  uIPadding.PaddingRight = UDim.new(0, 10)
  uIPadding.PaddingTop = UDim.new(0, 7)
  uIPadding.PaddingBottom = UDim.new(0, 8)
  uIPadding.Parent = scrollingFrame
  local uIListLayout = Instance.new("UIListLayout")
  uIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
  uIListLayout.Padding = UDim.new(0, 3)
  uIListLayout.Parent = scrollingFrame
  fn4(uIListLayout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
    scrollingFrame.CanvasSize = UDim2.fromOffset(0, uIListLayout.AbsoluteContentSize.Y + 16)
  end))

  local function fn67(parent2, arg)
    parent2.Size = UDim2.new(1, 0, 0, arg)
    parent2.BackgroundColor3 = tbl7.row
    parent2.BackgroundTransparency = 0.16
    parent2.BorderSizePixel = 0
    parent2.ClipsDescendants = true
    parent2.ZIndex = 5
    Instance.new("UICorner", parent2).CornerRadius = UDim.new(0, 11)
    local frame8 = Instance.new("Frame")
    frame8.Size = UDim2.new(1, -2, 0, 13)
    frame8.Position = UDim2.fromOffset(1, 1)
    frame8.BackgroundColor3 = tbl7.white
    frame8.BackgroundTransparency = 0.92
    frame8.BorderSizePixel = 0
    frame8.Active = false
    frame8.ZIndex = 6
    frame8.Parent = parent2
    Instance.new("UICorner", frame8).CornerRadius = UDim.new(0, 10)
    local uIGradient6 = Instance.new("UIGradient")
    uIGradient6.Transparency = NumberSequence.new({ NumberSequenceKeypoint.new(0, 0.18), NumberSequenceKeypoint.new(1, 1) })
    uIGradient6.Rotation = 90
    uIGradient6.Parent = frame8
    local uIStroke2 = Instance.new("UIStroke")
    uIStroke2.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
    uIStroke2.Color = tbl7.redDeep
    uIStroke2.Thickness = 1.15
    uIStroke2.Transparency = 0.40
    uIStroke2.Parent = parent2
    return uIStroke2
  end

  local function fn68(text, layoutOrder, arg)
    local textButton2 = Instance.new("TextButton")
    textButton2.LayoutOrder = layoutOrder
    textButton2.Text = ""
    textButton2.AutoButtonColor = false
    textButton2.Parent = scrollingFrame
    local result = fn67(textButton2, 38)
    local frame8 = Instance.new("Frame")
    frame8.Size = UDim2.fromOffset(3, 24)
    frame8.Position = UDim2.new(0, 8, 0.5, -12)
    frame8.BackgroundColor3 = tbl7.red
    frame8.BorderSizePixel = 0
    frame8.ZIndex = 7
    frame8.Parent = textButton2
    Instance.new("UICorner", frame8).CornerRadius = UDim.new(1, 0)
    local uIGradient6 = Instance.new("UIGradient")
    uIGradient6.Color = ColorSequence.new({
      ColorSequenceKeypoint.new(0, tbl7.redDeep),
      ColorSequenceKeypoint.new(0.52, tbl7.redBright),
      ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 199, 209)),
    })
    uIGradient6.Rotation = 90
    uIGradient6.Parent = frame8
    local textLabel2 = Instance.new("TextLabel")
    textLabel2.Size = UDim2.new(1, -76, 1, 0)
    textLabel2.Position = UDim2.fromOffset(19, 0)
    textLabel2.BackgroundTransparency = 1
    textLabel2.Text = text
    textLabel2.TextColor3 = tbl7.white
    textLabel2.Font = Enum.Font.GothamBlack
    textLabel2.TextSize = touchEnabled2 and 12 or 14
    textLabel2.TextXAlignment = Enum.TextXAlignment.Left
    textLabel2.ZIndex = 7
    textLabel2.Parent = textButton2
    local frame9 = Instance.new("Frame")
    frame9.Size = UDim2.fromOffset(40, 20)
    frame9.Position = UDim2.new(1, -50, 0.5, -10)
    frame9.BackgroundColor3 = tbl7.redDark
    frame9.BorderSizePixel = 0
    frame9.ZIndex = 7
    frame9.Parent = textButton2
    Instance.new("UICorner", frame9).CornerRadius = UDim.new(1, 0)
    local uIGradient7 = Instance.new("UIGradient")
    uIGradient7.Color = ColorSequence.new({
      ColorSequenceKeypoint.new(0, Color3.fromRGB(93, 9, 32)),
      ColorSequenceKeypoint.new(1, Color3.fromRGB(39, 5, 18)),
    })
    uIGradient7.Parent = frame9
    local frame10 = Instance.new("Frame")
    frame10.Size = UDim2.fromOffset(14, 14)
    frame10.Position = UDim2.fromOffset(3, 3)
    frame10.BackgroundColor3 = tbl7.dim
    frame10.BorderSizePixel = 0
    frame10.ZIndex = 8
    frame10.Parent = frame9
    Instance.new("UICorner", frame10).CornerRadius = UDim.new(1, 0)
    local uIStroke2 = Instance.new("UIStroke")
    uIStroke2.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
    uIStroke2.Color = Color3.fromRGB(255, 205, 215)
    uIStroke2.Thickness = 1
    uIStroke2.Transparency = 0.52
    uIStroke2.Parent = frame10
    local flag7 = false
    local tbl8 = {}

    local function fn69(arg2)
      local tweenInfo = TweenInfo.new(arg2 and 0 or 0.14, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
      tweenService2:Create(textButton2, tweenInfo, { BackgroundColor3 = flag7 and tbl7.rowActive or tbl7.row }):Play()
      tweenService2:Create(result, tweenInfo, {
        Color = flag7 and tbl7.redBright or tbl7.redDeep,
        Transparency = flag7 and 0.02 or 0.22,
      }):Play()
      tweenService2:Create(frame8, tweenInfo, { BackgroundColor3 = flag7 and tbl7.redBright or tbl7.red }):Play()
      tweenService2:Create(frame9, tweenInfo, { BackgroundColor3 = flag7 and tbl7.redDeep or tbl7.redDark }):Play()
      tweenService2:Create(frame10, tweenInfo, {
        Position = flag7 and UDim2.fromOffset(23, 3) or UDim2.fromOffset(3, 3),
        BackgroundColor3 = flag7 and tbl7.white or tbl7.dim,
      }):Play()
      tweenService2:Create(uIStroke2, tweenInfo, {
        Color = flag7 and tbl7.redBright or Color3.fromRGB(255, 205, 215),
        Transparency = flag7 and 0.04 or 0.52,
      }):Play()
    end

    function tbl8:Set(arg2, arg3)
      arg2 = arg2 == true
      if flag7 == arg2 then return true end
      if not arg3 and arg then
        local ok, result2 = pcall(arg, arg2)
        if not ok or result2 == false then return false end
      end
      flag7 = arg2
      fn69(false)
      return true
    end

    function tbl8:Get()
      return flag7
    end
    fn4(textButton2.Activated:Connect(function()
      tbl8:Set(not flag7, false)
    end))
    fn4(textButton2.MouseEnter:Connect(function()
      tweenService2:Create(textButton2, TweenInfo.new(0.1), { BackgroundColor3 = flag7 and tbl7.rowActive or tbl7.rowHover }):Play()
    end))
    fn4(textButton2.MouseLeave:Connect(function()
      fn69(false)
    end))
    fn69(true)
    return tbl8
  end
  local v
  local v2
  local v3
  local v4
  local v5
  local v6
  do
    local frame8 = Instance.new("Frame")
    frame8.Name = "BossHealthCard"
    frame8.LayoutOrder = 4
    frame8.Visible = false
    frame8.Parent = scrollingFrame
    local result = fn67(frame8, 72)
    frame8.BackgroundColor3 = Color3.fromRGB(35, 4, 13)
    local textLabel2 = Instance.new("TextLabel")
    textLabel2.BackgroundTransparency = 1
    textLabel2.Size = UDim2.new(1, -24, 0, 16)
    textLabel2.Position = UDim2.fromOffset(12, 5)
    textLabel2.Text = "VIDA DEL BOSS"
    textLabel2.TextColor3 = Color3.fromRGB(255, 78, 112)
    textLabel2.Font = Enum.Font.GothamBlack
    textLabel2.TextSize = touchEnabled2 and 9 or 10
    textLabel2.TextXAlignment = Enum.TextXAlignment.Center
    textLabel2.ZIndex = 8
    textLabel2.Parent = frame8
    local textLabel3 = Instance.new("TextLabel")
    textLabel3.BackgroundTransparency = 1
    textLabel3.Size = UDim2.new(1, -24, 0, 22)
    textLabel3.Position = UDim2.fromOffset(12, 19)
    textLabel3.Text = "ESPERANDO..."
    textLabel3.TextColor3 = Color3.fromRGB(255, 244, 247)
    textLabel3.TextStrokeColor3 = Color3.fromRGB(70, 0, 18)
    textLabel3.TextStrokeTransparency = 0.32
    textLabel3.Font = Enum.Font.GothamBlack
    textLabel3.TextSize = touchEnabled2 and 13 or 16
    textLabel3.TextXAlignment = Enum.TextXAlignment.Center
    textLabel3.ZIndex = 8
    textLabel3.Parent = frame8
    local textLabel4 = Instance.new("TextLabel")
    textLabel4.BackgroundTransparency = 1
    textLabel4.Size = UDim2.new(1, -24, 0, 14)
    textLabel4.Position = UDim2.fromOffset(12, 41)
    textLabel4.Text = "DAÑO: 0  •  GOLPES: 0"
    textLabel4.TextColor3 = Color3.fromRGB(255, 91, 125)
    textLabel4.Font = Enum.Font.GothamBold
    textLabel4.TextSize = touchEnabled2 and 9 or 11
    textLabel4.TextXAlignment = Enum.TextXAlignment.Center
    textLabel4.ZIndex = 8
    textLabel4.Parent = frame8
    local frame9 = Instance.new("Frame")
    frame9.Size = UDim2.new(1, -24, 0, 6)
    frame9.Position = UDim2.new(0, 12, 1, -10)
    frame9.BackgroundColor3 = Color3.fromRGB(18, 2, 7)
    frame9.BorderSizePixel = 0
    frame9.ClipsDescendants = true
    frame9.ZIndex = 8
    frame9.Parent = frame8
    Instance.new("UICorner", frame9).CornerRadius = UDim.new(1, 0)
    local frame10 = Instance.new("Frame")
    frame10.Size = UDim2.fromScale(1, 1)
    frame10.BackgroundColor3 = Color3.fromRGB(255, 30, 76)
    frame10.BorderSizePixel = 0
    frame10.ZIndex = 9
    frame10.Parent = frame9
    Instance.new("UICorner", frame10).CornerRadius = UDim.new(1, 0)
    local uIGradient6 = Instance.new("UIGradient")
    uIGradient6.Color = ColorSequence.new({
      ColorSequenceKeypoint.new(0, Color3.fromRGB(118, 0, 31)),
      ColorSequenceKeypoint.new(0.55, Color3.fromRGB(255, 31, 79)),
      ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 126, 151)),
    })
    uIGradient6.Parent = frame10

    function young0xAutoKill2.RefreshBossHealthCard()
      local visible = v6 and v6:Get() == true
      frame8.Visible = visible
      if not visible then return end
      if workspace:GetAttribute("BossActive") == true then
        textLabel2.Text = "ESTADÍSTICAS"
        textLabel4.Visible = true
        local num24 = math.max(0, tonumber(workspace:GetAttribute("BossHealth")) or 0)
        local num25 = math.max(0, tonumber(workspace:GetAttribute("BossMaxHealth")) or 0)
        textLabel3.Text = fn8(num24) .. " / " .. fn8(num25)
        textLabel4.Text = "DAÑO: " .. fn8(state.bossDamage) .. "  •  GOLPES: " .. fn8(state.bossHits)
        frame10.Size = UDim2.fromScale(num25 > 0 and math.clamp(num24 / num25, 0, 1) or 0, 1)
        result.Color = Color3.fromRGB(255, 36, 82)
        result.Transparency = 0.02
      else
        textLabel2.Text = "PRÓXIMO BOSS"
        textLabel4.Visible = false
        local num24 = tonumber(workspace:GetAttribute("BossSpawnNextTime")) or 0
        local num25 = math.max(0, math.ceil(num24 - workspace:GetServerTimeNow()))
        if num25 > 0 then
          textLabel3.Text = math.floor(num25 / 60) .. " MIN " .. (num25 % 60) .. " SEG"
        else
          textLabel3.Text = "ESPERANDO..."
        end
        frame10.Size = UDim2.fromScale(0, 1)
      end
    end
    fn4(workspace:GetAttributeChangedSignal("BossHealth"):Connect(young0xAutoKill2.RefreshBossHealthCard))
    fn4(workspace:GetAttributeChangedSignal("BossMaxHealth"):Connect(young0xAutoKill2.RefreshBossHealthCard))
    fn4(workspace:GetAttributeChangedSignal("BossActive"):Connect(young0xAutoKill2.RefreshBossHealthCard))
    fn6("bossHealthDisplay", function()
      while state.running do
        young0xAutoKill2.RefreshBossHealthCard()
        task.wait(1)
      end
    end)
  end
  v = fn68("Auto Kill", 2, function(arg)
    if arg and v5 and v5:Get() then v5:Set(false, false) end
    local result = fn53(arg)
    if result == false then
      fn66("Tu executor no soporta touch.")
      return false
    end
    return true
  end)
  v6 = fn68("KILL BOSS", 3, function(arg)
    local set = getSet(arg)
    task.defer(young0xAutoKill2.RefreshBossHealthCard)
    if set == false then
      fn66("Boss no disponible.")
      return false
    end
    return true
  end)
  v4 = fn68("Server Hop inteligente", 5, function(arg)
    local result = fn46(arg)
    if result == false then
      fn66("Tu executor no soporta queue_on_teleport.")
      return false
    end
    return true
  end)
  v2 = fn68("Auto Win Brawl", 6, function(arg)
    return fn65(arg)
  end)
  v3 = fn68("No matar a mis amigos", 7, function(arg)
    fn55(arg)
    return true
  end)

  local function fn69()
    local tbl8 = {}
    for index, item in ipairs(players2:GetPlayers()) do
      if item ~= localPlayer2 then
        tbl8[#tbl8 + 1] = { label = item.DisplayName, name = item.Name, userId = item.UserId }
      end
    end
    table.sort(tbl8, function(arg, arg2)
      return arg.label:lower() < arg2.label:lower()
    end)
    return tbl8
  end

  local function fn70(parent2, text, arg, arg2)
    local frame8 = Instance.new("Frame")
    frame8.LayoutOrder = 8
    frame8.Parent = parent2
    frame8.ClipsDescendants = true
    local result = fn67(frame8, 42)
    local textButton2 = Instance.new("TextButton")
    textButton2.Size = UDim2.new(1, 0, 0, 42)
    textButton2.BackgroundTransparency = 1
    textButton2.BorderSizePixel = 0
    textButton2.Text = ""
    textButton2.AutoButtonColor = false
    textButton2.ZIndex = 13
    textButton2.Parent = frame8
    local textLabel2 = Instance.new("TextLabel")
    textLabel2.Size = UDim2.new(0.42, -12, 1, 0)
    textLabel2.Position = UDim2.fromOffset(11, 0)
    textLabel2.BackgroundTransparency = 1
    textLabel2.Text = text
    textLabel2.TextColor3 = tbl7.white
    textLabel2.Font = Enum.Font.GothamBlack
    textLabel2.TextSize = touchEnabled2 and 12 or 13
    textLabel2.TextXAlignment = Enum.TextXAlignment.Left
    textLabel2.ZIndex = 14
    textLabel2.Parent = textButton2
    local textLabel3 = Instance.new("TextLabel")
    textLabel3.Size = UDim2.new(0.58, -34, 1, 0)
    textLabel3.Position = UDim2.new(0.42, 0, 0, 0)
    textLabel3.BackgroundTransparency = 1
    textLabel3.TextColor3 = tbl7.redBright
    textLabel3.Font = Enum.Font.GothamBlack
    textLabel3.TextSize = touchEnabled2 and 11 or 12
    textLabel3.TextWrapped = true
    textLabel3.TextXAlignment = Enum.TextXAlignment.Right
    textLabel3.ZIndex = 14
    textLabel3.Parent = textButton2
    local textLabel4 = Instance.new("TextLabel")
    textLabel4.Size = UDim2.fromOffset(24, 42)
    textLabel4.Position = UDim2.new(1, -28, 0, 0)
    textLabel4.BackgroundTransparency = 1
    textLabel4.Text = "⌄"
    textLabel4.TextColor3 = tbl7.redBright
    textLabel4.Font = Enum.Font.GothamBlack
    textLabel4.TextSize = 18
    textLabel4.ZIndex = 14
    textLabel4.Parent = textButton2
    textLabel4.Text = "v"
    local scrollingFrame2 = Instance.new("ScrollingFrame")
    scrollingFrame2.Size = UDim2.new(1, -12, 0, 0)
    scrollingFrame2.Position = UDim2.fromOffset(6, 42)
    scrollingFrame2.BackgroundColor3 = tbl7.base
    scrollingFrame2.BackgroundTransparency = 0.04
    scrollingFrame2.BorderSizePixel = 0
    scrollingFrame2.ScrollBarThickness = 2
    scrollingFrame2.ScrollBarImageColor3 = tbl7.redBright
    scrollingFrame2.CanvasSize = UDim2.new()
    scrollingFrame2.Visible = false
    scrollingFrame2.ZIndex = 14
    scrollingFrame2.Parent = frame8
    Instance.new("UICorner", scrollingFrame2).CornerRadius = UDim.new(0, 9)
    local uIListLayout2 = Instance.new("UIListLayout", scrollingFrame2)
    uIListLayout2.SortOrder = Enum.SortOrder.LayoutOrder
    uIListLayout2.Padding = UDim.new(0, 2)
    local uIPadding2 = Instance.new("UIPadding", scrollingFrame2)
    uIPadding2.PaddingTop = UDim.new(0, 3)
    uIPadding2.PaddingBottom = UDim.new(0, 3)
    uIPadding2.PaddingLeft = UDim.new(0, 3)
    uIPadding2.PaddingRight = UDim.new(0, 3)
    local tbl8 = { values = arg or {}, index = 1, open = false }

    local function fn71(arg3)
      if type(arg3) == "table" then return tostring(arg3.label or arg3.name or "Sin jugadores") end
      return arg3 and tostring(arg3) or "Sin jugadores"
    end

    local function fn72()
      return tbl8.values[tbl8.index]
    end

    local function fn73(arg3)
      local result2 = fn72()
      textLabel3.Text = fn71(result2)
      if arg3 and arg2 then pcall(arg2, result2) end
    end

    local function fn74(arg3)
      tbl8.open = arg3 == true and #tbl8.values > 0
      local num24 = math.min(#tbl8.values, 5) * 30 + 6
      scrollingFrame2.Visible = tbl8.open
      scrollingFrame2.Size = UDim2.new(1, -12, 0, tbl8.open and num24 or 0)
      frame8.Size = UDim2.new(1, 0, 0, 42 + (tbl8.open and num24 or 0))
      if not flag6 then
        local open = tbl8.open and num21 or num20
        local tweenInfo = TweenInfo.new(0.16, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
        tweenService2:Create(frame2, tweenInfo, { Size = UDim2.fromOffset(touchEnabled3, open) }):Play()
        tweenService2:Create(frame3, tweenInfo, { Size = UDim2.fromOffset(touchEnabled3, open) }):Play()
        tweenService2:Create(frame, tweenInfo, { Size = UDim2.fromOffset(touchEnabled3 + 12, open + 12) }):Play()
      end
      if tbl8.open then
        scrollingFrame2.CanvasPosition = Vector2.zero
        if parent2:IsA("ScrollingFrame") then
          task.defer(function()
            runService2.Heartbeat:Wait()
            local num25 = frame8.AbsolutePosition.Y - parent2.AbsolutePosition.Y + parent2.CanvasPosition.Y
            local num26 = math.max(0, parent2.AbsoluteCanvasSize.Y - parent2.AbsoluteWindowSize.Y)
            tweenService2:Create(
              parent2,
              TweenInfo.new(0.18, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
              { CanvasPosition = Vector2.new(0, math.min(num26, math.max(0, num25 - 2))) }
            ):Play()
          end)
        end
      elseif parent2:IsA("ScrollingFrame") then
        tweenService2:Create(parent2, TweenInfo.new(0.16, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), { CanvasPosition = Vector2.zero }):Play()
      end
      textLabel4.Visible = false
      task.defer(function()
        textLabel4.Text = tbl8.open and "^" or "v"
        textLabel4.Visible = true
      end)
      textLabel4.Text = tbl8.open and "⌃" or "⌄"
    end

    local function fn75()
      for index, item in ipairs(scrollingFrame2:GetChildren()) do
        if item:IsA("TextButton") then item:Destroy() end
      end
      for index, item in ipairs(tbl8.values) do
        local textButton3 = Instance.new("TextButton")
        textButton3.Size = UDim2.new(1, -6, 0, 28)
        textButton3.BackgroundColor3 = index == tbl8.index and tbl7.redDeep or tbl7.row
        textButton3.BackgroundTransparency = index == tbl8.index and 0.05 or 0.14
        textButton3.BorderSizePixel = 0
        textButton3.Text = fn71(item)
        textButton3.TextColor3 = tbl7.white
        textButton3.Font = Enum.Font.GothamBlack
        textButton3.TextSize = touchEnabled2 and 11 or 12
        textButton3.AutoButtonColor = false
        textButton3.LayoutOrder = index
        textButton3.ZIndex = 15
        textButton3.Parent = scrollingFrame2
        Instance.new("UICorner", textButton3).CornerRadius = UDim.new(0, 8)
        fn4(textButton3.Activated:Connect(function()
          tbl8.index = index
          fn73(true)
          fn74(false)
          fn75()
        end))
        fn4(textButton3.MouseEnter:Connect(function()
          tweenService2:Create(textButton3, TweenInfo.new(0.08), { BackgroundColor3 = tbl7.rowHover }):Play()
        end))
        fn4(textButton3.MouseLeave:Connect(function()
          tweenService2:Create(textButton3, TweenInfo.new(0.08), { BackgroundColor3 = index == tbl8.index and tbl7.redDeep or tbl7.row }):Play()
        end))
      end
      scrollingFrame2.CanvasSize = UDim2.fromOffset(0, #tbl8.values * 30 + 6)
    end

    function tbl8:Get()
      return fn72()
    end

    function tbl8:Close()
      fn74(false)
    end

    function tbl8:SetValues(arg3, arg4)
      local value7 = arg4 and fn72() or nil
      tbl8.values = arg3 or {}
      tbl8.index = 1
      if value7 then
        for index, item in ipairs(tbl8.values) do
          local flag7 = item == value7
          if type(item) == "table" and type(value7) == "table" then
            flag7 = (item.userId and item.userId == value7.userId) or (item.name and item.name == value7.name)
          end
          if flag7 then
            tbl8.index = index
            break
          end
        end
      end
      fn75()
      fn74(false)
      fn73(true)
    end

    function tbl8:SetByName(arg3)
      for index, item in ipairs(tbl8.values) do
        if type(item) == "table" and item.name == arg3 then
          tbl8.index = index
          fn75()
          fn74(false)
          fn73(true)
          return true
        end
      end
      return false
    end
    fn4(textButton2.Activated:Connect(function()
      fn74(not tbl8.open)
    end))
    fn4(textButton2.MouseEnter:Connect(function()
      tweenService2:Create(frame8, TweenInfo.new(0.1), { BackgroundColor3 = tbl7.rowHover }):Play()
      tweenService2:Create(result, TweenInfo.new(0.1), { Color = tbl7.redBright }):Play()
    end))
    fn4(textButton2.MouseLeave:Connect(function()
      tweenService2:Create(frame8, TweenInfo.new(0.1), { BackgroundColor3 = tbl7.row }):Play()
      tweenService2:Create(result, TweenInfo.new(0.1), { Color = tbl7.redDeep }):Play()
    end))
    fn75()
    fn73(true)
    return tbl8
  end
  local result = fn70(scrollingFrame, "Seleccionar jugador", fn69(), function(arg)
    state.target = type(arg) == "table" and arg.name or arg
  end)
  v5 = fn68("Matar jugador", 9, function(arg)
    if arg and v:Get() then v:Set(false, false) end
    local result2 = fn54(arg)
    if result2 == false then
      fn66(state.target and "Tu executor no soporta touch." or "No hay jugador seleccionado.")
      return false
    end
    return true
  end)
  local frame8 = Instance.new("Frame")
  frame8.LayoutOrder = 1
  frame8.Parent = scrollingFrame
  local result2 = fn67(frame8, 52)
  frame8.BackgroundColor3 = tbl7.panel2
  local uIGradient6 = Instance.new("UIGradient")
  uIGradient6.Color = ColorSequence.new({
    ColorSequenceKeypoint.new(0, Color3.fromRGB(60, 19, 31)),
    ColorSequenceKeypoint.new(0.5, tbl7.panel),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(43, 15, 24)),
  })
  uIGradient6.Rotation = 10
  uIGradient6.Parent = frame8
  local frame9 = Instance.new("Frame")
  frame9.Size = UDim2.new(0, 4, 1, -20)
  frame9.Position = UDim2.fromOffset(9, 10)
  frame9.BackgroundColor3 = tbl7.redBright
  frame9.BorderSizePixel = 0
  frame9.ZIndex = 7
  frame9.Parent = frame8
  Instance.new("UICorner", frame9).CornerRadius = UDim.new(1, 0)
  local uIGradient7 = Instance.new("UIGradient")
  uIGradient7.Color = ColorSequence.new({
    ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 202, 214)),
    ColorSequenceKeypoint.new(0.45, tbl7.redBright),
    ColorSequenceKeypoint.new(1, tbl7.redDeep),
  })
  uIGradient7.Rotation = 90
  uIGradient7.Parent = frame9
  local textLabel2 = Instance.new("TextLabel")
  textLabel2.Size = UDim2.new(0.42, -12, 1, 0)
  textLabel2.Position = UDim2.fromOffset(22, 0)
  textLabel2.BackgroundTransparency = 1
  textLabel2.Text = "KILLS"
  textLabel2.TextColor3 = tbl7.redBright
  textLabel2.TextStrokeColor3 = tbl7.black
  textLabel2.TextStrokeTransparency = 0.15
  textLabel2.Font = Enum.Font.GothamBlack
  textLabel2.TextSize = touchEnabled2 and 18 or 21
  textLabel2.TextXAlignment = Enum.TextXAlignment.Left
  textLabel2.ZIndex = 7
  textLabel2.Parent = frame8
  local textLabel3 = Instance.new("TextLabel")
  textLabel3.Size = UDim2.new(0.58, -16, 1, 0)
  textLabel3.Position = UDim2.new(0.42, 0, 0, 0)
  textLabel3.BackgroundTransparency = 1
  textLabel3.Text = "0"
  textLabel3.TextColor3 = tbl7.white
  textLabel3.TextStrokeColor3 = tbl7.red
  textLabel3.TextStrokeTransparency = 0.15
  textLabel3.Font = Enum.Font.GothamBlack
  textLabel3.TextScaled = true
  textLabel3.TextXAlignment = Enum.TextXAlignment.Right
  textLabel3.ZIndex = 7
  textLabel3.Parent = frame8
  local uITextSizeConstraint = Instance.new("UITextSizeConstraint")
  uITextSizeConstraint.MinTextSize = 18
  uITextSizeConstraint.MaxTextSize = touchEnabled2 and 28 or 33
  uITextSizeConstraint.Parent = textLabel3
  young0xAutoKill2.AntiLagToggle = fn68("Anti Lag", 10, function(arg)
    if not arg then
      bossFarm:SetAntiLag(false)
      bossFarm:SetAutoLag60(false)
    else
      bossFarm:SetAutoLag60(true)
      bossFarm:SetAntiLag(state.killBoss)
    end
    return true
  end)
  local textButton2 = Instance.new("TextButton")
  textButton2.LayoutOrder = 11
  textButton2.Text = "Cerrar Script"
  textButton2.TextColor3 = tbl7.white
  textButton2.Font = Enum.Font.GothamBlack
  textButton2.TextSize = touchEnabled2 and 13 or 14
  textButton2.AutoButtonColor = false
  textButton2.Parent = scrollingFrame
  local result3 = fn67(textButton2, 38)
  textButton2.BackgroundColor3 = tbl7.redDeep
  result3.Color = tbl7.redBright
  result3.Transparency = 0.08
  local uIGradient8 = Instance.new("UIGradient")
  uIGradient8.Color = ColorSequence.new({
    ColorSequenceKeypoint.new(0, Color3.fromRGB(120, 10, 40)),
    ColorSequenceKeypoint.new(0.5, tbl7.redDeep),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(80, 7, 28)),
  })
  uIGradient8.Rotation = 8
  uIGradient8.Parent = textButton2
  fn4(textButton2.MouseEnter:Connect(function()
    tweenService2:Create(textButton2, TweenInfo.new(0.1), { BackgroundColor3 = tbl7.red }):Play()
  end))
  fn4(textButton2.MouseLeave:Connect(function()
    tweenService2:Create(textButton2, TweenInfo.new(0.1), { BackgroundColor3 = tbl7.redDeep }):Play()
  end))
  local value7 = nil
  local num24 = 0
  value6 = function()
    num24 = num24 + 1
    local num25 = num24
    textLabel3.TextColor3 = tbl7.redBright
    result2.Color = tbl7.redBright
    result2.Transparency = 0
    task.delay(0.04, function()
      if num25 ~= num24 or not textLabel3.Parent then return end
      tweenService2:Create(textLabel3, TweenInfo.new(0.34), { TextColor3 = tbl7.white }):Play()
      tweenService2:Create(result2, TweenInfo.new(0.42), { Color = tbl7.redDeep, Transparency = 0.32 }):Play()
    end)
  end
  bossFarm.ShowDamagePopup = function(arg)
    arg = math.max(0, math.floor((tonumber(arg) or 0) + 0.5))
    if arg <= 0 or not screenGui.Parent then return end
    bossFarm.damagePopupSerial = bossFarm.damagePopupSerial + 1
    local damagePopupSerial = bossFarm.damagePopupSerial
    local num25 = ((damagePopupSerial - 1) % 3 - 1) * (touchEnabled2 and 92 or 150)
    local num26 = (math.floor((damagePopupSerial - 1) / 3) % 2) * (touchEnabled2 and 44 or 58)
    local textLabel4 = Instance.new("TextLabel")
    textLabel4.Name = "BossDamageNumber"
    textLabel4.AnchorPoint = Vector2.new(0.5, 0.5)
    textLabel4.Position = UDim2.new(0.5, num25, 0.30, num26)
    textLabel4.Size = UDim2.fromOffset(touchEnabled2 and 150 or 210, touchEnabled2 and 54 or 72)
    textLabel4.BackgroundTransparency = 1
    textLabel4.BorderSizePixel = 0
    textLabel4.Text = "-" .. fn8(arg)
    textLabel4.TextColor3 = Color3.fromRGB(255, 255, 255)
    textLabel4.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
    textLabel4.TextStrokeTransparency = 0
    textLabel4.Font = Enum.Font.GothamBlack
    textLabel4.TextSize = touchEnabled2 and 30 or 40
    textLabel4.ZIndex = 101
    textLabel4.Parent = screenGui
    local uIScale = Instance.new("UIScale")
    uIScale.Scale = 0.72
    uIScale.Parent = textLabel4
    tweenService2:Create(uIScale, TweenInfo.new(0.16, Enum.EasingStyle.Back, Enum.EasingDirection.Out), { Scale = 1.08 }):Play()
    task.delay(0.18, function()
      if textLabel4.Parent then
        tweenService2:Create(uIScale, TweenInfo.new(0.12, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), { Scale = 1 }):Play()
      end
    end)
    task.delay(1.02, function()
      if not textLabel4.Parent then return end
      local tweenInfo = TweenInfo.new(0.46, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
      tweenService2:Create(textLabel4, tweenInfo, {
        Position = textLabel4.Position - UDim2.fromOffset(0, touchEnabled2 and 34 or 48),
        TextTransparency = 1,
        TextStrokeTransparency = 1,
      }):Play()
    end)
    task.delay(1.52, function()
      if textLabel4.Parent then textLabel4:Destroy() end
    end)
  end
  do
    local rEvents = replicatedStorage2:FindFirstChild("rEvents")
    rEvents = rEvents and rEvents:FindFirstChild("guiDamageEvent")
    if rEvents and rEvents:IsA("RemoteEvent") then
      fn4(rEvents.OnClientEvent:Connect(function(arg, arg2, arg3, arg4)
        if not state.bossCombat or arg ~= "bossDamageShow" or typeof(arg3) ~= "number" then return end
        if typeof(arg2) == "Instance" and bossFarm.engagedBoss and arg2 ~= bossFarm.engagedBoss then return end
        if os.clock() - bossFarm.lastAttackAt > 0.55 then return end
        if bossFarm.lastAttackAt <= bossFarm.lastConfirmedAttackAt then return end
        if typeof(arg4) == "Vector3" then
          local humanoidRootPart = getHumanoidRootPart()
          local bossProfile = bossFarm:GetBossProfile(bossFarm.engagedBoss)
          local contactHeight = bossFarm.currentContactHeight or bossProfile.contactHeight or bossProfile.maxHitDistance * 0.5
          local num25 = math.max(45, math.abs(contactHeight) + 18)
          if not humanoidRootPart or (arg4 - humanoidRootPart.Position).Magnitude > num25 then return end
        end
        bossFarm.lastConfirmedAttackAt = bossFarm.lastAttackAt
        bossFarm.ownBossDamage = bossFarm.ownBossDamage + math.max(0, arg3)
        bossFarm.ownBossHits = bossFarm.ownBossHits + 1
        bossFarm.ShowDamagePopup(arg3)
      end))
    end
  end

  local function fn71(arg)
    local num25 = math.floor(tonumber(arg) or 0)
    textLabel3.Text = fn8(num25)
    fn10(num25)
    if value7 ~= nil and num25 > value7 then value6() end
    value7 = num25
  end
  fn6("killCounter", function()
    local leaderstats = localPlayer2:FindFirstChild("leaderstats") or localPlayer2:WaitForChild("leaderstats", 15)
    local kills = leaderstats and (leaderstats:FindFirstChild("Kills") or leaderstats:WaitForChild("Kills", 15))
    if not state.running then return end
    if kills then
      fn71(kills.Value)
      fn4(kills.Changed:Connect(fn71))
    else
      textLabel3.Text = "N/A"
    end
  end)

  local function fn72()
    if result then result:SetValues(fn69(), true) end
  end
  fn4(players2.PlayerAdded:Connect(function(arg)
    if state.protectFriends then
      task.spawn(function()
        local result4 = fn13(arg)
        tbl6[arg.UserId] = result4 == nil or result4 == true
      end)
    end
    task.defer(fn72)
  end))
  fn4(players2.PlayerRemoving:Connect(function(arg)
    state.targetRetryAt[arg.UserId] = nil
    state.targetRejectedCharacter[arg.UserId] = nil
    state.unsafeTargets[arg.UserId] = nil
    if state.activeKillTarget == arg then state.activeKillTarget = nil end
    if state.lastCombatTarget == arg then
      state.lastCombatTarget = nil
      state.lastCombatTargetAt = 0
    end
    if tbl6[arg.UserId] ~= true then tbl6[arg.UserId] = nil end
    local flag7 = state.target == arg.Name
    task.defer(function()
      if not state.running then return end
      fn72()
      if flag7 and state.targetMode then
        fn54(false)
        if v5 then v5:Set(false, true) end
      end
    end)
  end))
  local flag7 = false
  local value8 = nil
  local value9 = nil
  local num25 = 0

  local function fn73(position)
    frame2.Position = position
    frame3.Position = position
    frame.Position = UDim2.new(position.X.Scale, position.X.Offset, position.Y.Scale, position.Y.Offset - 6)
  end

  local function fn74(arg)
    if flag5 or flag6 == arg then return end
    flag6 = arg
    if flag6 and result then result:Close() end
    frame5.Visible = false
    if not flag6 then scrollingFrame.Visible = true end
    local num26 = flag6 and num23 or num20
    local tweenInfo = TweenInfo.new(0.22, Enum.EasingStyle.Quart, Enum.EasingDirection.Out)
    tweenService2:Create(frame2, tweenInfo, { Size = UDim2.fromOffset(touchEnabled3, num26) }):Play()
    tweenService2:Create(frame3, tweenInfo, { Size = UDim2.fromOffset(touchEnabled3, num26) }):Play()
    tweenService2:Create(frame, tweenInfo, { Size = UDim2.fromOffset(touchEnabled3 + 12, num26 + 12) }):Play()
    if flag6 then
      task.delay(0.18, function()
        if flag6 and state.running then scrollingFrame.Visible = false end
      end)
    end
  end
  fn4(textButton.InputBegan:Connect(function(arg)
    if arg.UserInputType == Enum.UserInputType.MouseButton1 or arg.UserInputType == Enum.UserInputType.Touch then
      flag7 = true
      value8 = arg.Position
      value9 = frame2.Position
      num25 = 0
    end
  end))
  fn4(userInputService2.InputChanged:Connect(function(arg)
    if not flag7 or not value8 or not value9 then return end
    if arg.UserInputType ~= Enum.UserInputType.MouseMovement and arg.UserInputType ~= Enum.UserInputType.Touch then
      return
    end
    local num26 = arg.Position - value8
    num25 = num26.Magnitude
    fn73(UDim2.new(value9.X.Scale, value9.X.Offset + num26.X, value9.Y.Scale, value9.Y.Offset + num26.Y))
  end))
  fn4(userInputService2.InputEnded:Connect(function(arg)
    if arg.UserInputType == Enum.UserInputType.MouseButton1 or arg.UserInputType == Enum.UserInputType.Touch then
      flag7 = false
    end
  end))
  fn4(textButton.Activated:Connect(function()
    if num25 < 8 then fn74(not flag6) end
  end))

  local function fn75()
    state.running = false
    state.autoKill = false
    state.autoWinBrawl = false
    state.brawlBusy = false
    state.brawlCombat = false
    state.targetMode = false
    state.serverHop = false
    state.killBoss = false
    state.protectFriends = false
    bossFarm.active = false
    bossFarm.generation = bossFarm.generation + 1
    fn5("bossFarm")
    bossFarm:RestoreBattle()
    bossFarm:SetAntiLag(false)
    bossFarm:SetAutoLag60(false)
    bossFarm:RestoreFG100BossOwnership()
    bossFarm:ReturnToSavedPosition()
    fn5("killFarm")
    fn5("killSizeOne")
    fn5("fastPunch")
    fn5("brawlRestore")
    fn51()
    fn5("serverHop")
    fn5("friendRefresh")
    fn11()
    fn7()
    if _G2.Young0xAutoKill == young0xAutoKill2 then _G2.Young0xAutoKill = nil end
  end
  shutdown = function(arg)
    if flag5 then return end
    flag5 = true
    if not arg then fn45() end
    fn75()
    if arg then
      if screenGui and screenGui.Parent then screenGui:Destroy() end
      return
    end
    local x = frame2.AbsoluteSize.X
    local y = frame2.AbsoluteSize.Y
    local num26 = math.floor(x * 0.86)
    local num27 = math.floor(y * 0.86)
    local tweenInfo = TweenInfo.new(0.28, Enum.EasingStyle.Quart, Enum.EasingDirection.In)
    tweenService2:Create(frame2, tweenInfo, { Size = UDim2.fromOffset(num26, num27), BackgroundTransparency = 1 }):Play()
    tweenService2:Create(frame3, tweenInfo, { Size = UDim2.fromOffset(num26, num27) }):Play()
    tweenService2:Create(frame, tweenInfo, { Size = UDim2.fromOffset(num26 + 12, num27 + 12), BackgroundTransparency = 1 }):Play()
    tweenService2:Create(uIStroke, tweenInfo, { Transparency = 1 }):Play()
    task.delay(0.3, function()
      if screenGui and screenGui.Parent then screenGui:Destroy() end
    end)
  end
  young0xAutoKill2.Shutdown = shutdown
  young0xAutoKill2.SetAutoKill = function(arg)
    return v:Set(arg, false)
  end
  young0xAutoKill2.SetAutoWinBrawl = function(arg)
    return v2:Set(arg, false)
  end
  young0xAutoKill2.SetProtectFriends = function(arg)
    return v3:Set(arg, false)
  end
  young0xAutoKill2.SetServerHop = function(arg)
    return v4:Set(arg, false)
  end
  young0xAutoKill2.SetKillBoss = function(arg)
    return v6:Set(arg, false)
  end
  young0xAutoKill2.SetAntiLag = function(arg)
    return young0xAutoKill2.AntiLagToggle:Set(arg, false)
  end
  young0xAutoKill2.BossFarm = bossFarm
  young0xAutoKill2.BossProfiles = bossFarm.bossProfiles
  young0xAutoKill2.SetBossProfile = function(arg, arg2)
    local item = bossFarm.bossProfiles[tostring(arg)]
    if not item or type(arg2) ~= "table" then return false end
    for key, value10 in pairs(arg2) do
      if item[key] ~= nil and (type(value10) == "number" or type(value10) == "table") then item[key] = value10 end
    end
    return true
  end
  young0xAutoKill2.SetTargetKill = function(arg)
    return v5:Set(arg, false)
  end
  young0xAutoKill2.SetTarget = function(arg)
    local findFirstChild = arg and players2:FindFirstChild(tostring(arg))
    if not findFirstChild or findFirstChild == localPlayer2 then return false end
    state.target = findFirstChild.Name
    if result then result:SetByName(findFirstChild.Name) end
    return true
  end
  young0xAutoKill2.State = state
  _G2.Young0xAutoKill = young0xAutoKill2
  fn6("workerWatchdog", function()
    while state.running do
      if not state.bossCombat and not young0xAutoKill2.BossPriorityPending() and (state.autoKill or state.targetMode or state.brawlCombat) then
        if not tbl5.killFarm then fn32() end
        if not tbl5.killSizeOne then fn50() end
      end
      if state.autoKill and not state.brawlBusy and not state.bossCombat and not young0xAutoKill2.BossPriorityPending() and not tbl5.killPositionLock then
        fn52()
      end
      if state.killBoss and not tbl5.bossFarm then getSet(true) end
      if state.serverHop and not tbl5.serverHop then fn46(true) end
      if state.protectFriends and not tbl5.friendRefresh then fn25() end
      task.wait(2)
    end
  end)
  fn4(textButton2.Activated:Connect(function()
    if shutdown then shutdown(false) end
  end))
  fn4(screenGui.AncestryChanged:Connect(function(arg, arg2)
    if not arg2 and not flag5 then shutdown(true) end
  end))
  local position = frame2.Position
  local num26 = math.floor(touchEnabled3 * 0.88)
  local num27 = math.floor(num20 * 0.88)
  frame2.Size = UDim2.fromOffset(num26, num27)
  frame3.Size = UDim2.fromOffset(num26, num27)
  frame.Size = UDim2.fromOffset(num26 + 12, num27 + 12)
  frame2.BackgroundTransparency = 0.18
  frame.BackgroundTransparency = 1
  uIStroke.Transparency = 0.7
  local tweenInfo = TweenInfo.new(0.34, Enum.EasingStyle.Back, Enum.EasingDirection.Out)
  tweenService2:Create(frame2, tweenInfo, { Size = UDim2.fromOffset(touchEnabled3, num20), BackgroundTransparency = 0 }):Play()
  tweenService2:Create(frame3, tweenInfo, { Size = UDim2.fromOffset(touchEnabled3, num20) }):Play()
  tweenService2:Create(frame, tweenInfo, {
    Size = UDim2.fromOffset(touchEnabled3 + 12, num20 + 12),
    Position = UDim2.new(position.X.Scale, position.X.Offset, position.Y.Scale, position.Y.Offset - 6),
    BackgroundTransparency = 0.48,
  }):Play()
  tweenService2:Create(uIStroke, TweenInfo.new(0.28), { Transparency = 0.04 }):Play()
  if young0xKillsResume then
    if young0xKillsResume.protectFriends then v3:Set(true, false) end
    if young0xKillsResume.autoKill then v:Set(true, false) end
    if young0xKillsResume.autoWinBrawl then v2:Set(true, false) end
    if young0xKillsResume.killBoss then v6:Set(true, false) end
  end
  if (young0xKillsResume and young0xKillsResume.serverHop) or flag3 or flag2 then v4:Set(true, false) end
end
bRG2.startExpiryAntiAfk = function()
  local _G2 = getgenv and getgenv() or _G
  local young0xPublicTrainingExpiryA = _G2.Young0xPublicTrainingExpiryAntiAfk
  if type(young0xPublicTrainingExpiryA) == "table" and young0xPublicTrainingExpiryA.running then
    return young0xPublicTrainingExpiryA
  end
  local young0xPublicTrainingExpiryA2 = { running = true, idled = nil, thread = nil }
  local virtualUser = game:GetService("VirtualUser")

  local function fn4()
    pcall(function()
      virtualUser:CaptureController()
      local currentCamera = workspace.CurrentCamera
      local cFrame = currentCamera and currentCamera.CFrame or CFrame.new()
      virtualUser:Button2Down(Vector2.zero, cFrame)
      task.wait(0.06)
      virtualUser:Button2Up(Vector2.zero, cFrame)
    end)
  end
  young0xPublicTrainingExpiryA2.idled = localPlayer.Idled:Connect(fn4)
  young0xPublicTrainingExpiryA2.thread = task.spawn(function()
    while young0xPublicTrainingExpiryA2.running and localPlayer.Parent do
      fn4()
      task.wait(45)
    end
  end)
  _G2.Young0xPublicTrainingExpiryAntiAfk = young0xPublicTrainingExpiryA2
  return young0xPublicTrainingExpiryA2
end
do
  bRG2.localFilesAvailable = function()
    return type(isfile) == "function" and type(readfile) == "function" and type(writefile) == "function" and type(isfolder) == "function" and type(makefolder) == "function"
  end
  bRG2.ensureLocalFolders = function(arg)
    if not bRG2.localFilesAvailable() then return false end
    return pcall(function()
      if not isfolder("Young0xHub") then makefolder("Young0xHub") end
      if not isfolder("Young0xHub/PublicTraining") then makefolder("Young0xHub/PublicTraining") end
      if arg then
        if not isfolder(bRG2.profileRoot) then makefolder(bRG2.profileRoot) end
        if not isfolder(bRG2.profileFolder) then makefolder(bRG2.profileFolder) end
      end
    end)
  end
  bRG2.readLocalJson = function(arg)
    if not bRG2.localFilesAvailable() then return nil end
    local ok, result = pcall(function()
      if not isfile(arg) then return nil end
      return game:GetService("HttpService"):JSONDecode(readfile(arg))
    end)
    return ok and type(result) == "table" and result or nil
  end
  bRG2.writeLocalJson = function(arg, arg2, arg3)
    if not bRG2.ensureLocalFolders(arg3) then return false end
    return pcall(function()
      writefile(arg, game:GetService("HttpService"):JSONEncode(arg2))
    end)
  end
  bRG2.clearResumeState = function()
    bRG2.lastResumeJson = nil
    if type(delfile) ~= "function" or type(isfile) ~= "function" then return end
    pcall(function()
      if isfile(bRG2.resumePath) then delfile(bRG2.resumePath) end
    end)
  end
  bRG2.readResumeOptions = function()
    local result = bRG2.readLocalJson(bRG2.resumePath)
    if type(result) ~= "table" or result.resume ~= true or tonumber(result.userId) ~= localPlayer.UserId or tonumber(result.placeId) ~= game.PlaceId or type(result.options) ~= "table" then
      return nil
    end
    return result.options
  end
  bRG2.saveResumeState = function()
    if not bRG2.antiAfk or type(bRG2.captureOptions) ~= "function" then return false end
    local options = bRG2.captureOptions()
    local ok, lastResumeJson = pcall(function()
      return game:GetService("HttpService"):JSONEncode(options)
    end)
    if not ok then return false end
    if lastResumeJson == bRG2.lastResumeJson then return true end
    local tbl3 = {
      version = 1,
      resume = true,
      userId = localPlayer.UserId,
      placeId = game.PlaceId,
      updatedAt = os.time(),
      options = options,
    }
    if bRG2.writeLocalJson(bRG2.resumePath, tbl3, false) then
      bRG2.lastResumeJson = lastResumeJson
      return true
    end
    return false
  end
  bRG2.queueResume = function()
    if bRG2.resumeQueued then return true end
    local _G2 = getgenv and getgenv() or _G
    local queueOnTeleport = _G2.queue_on_teleport or _G2.queueonteleport or queue_on_teleport or queueonteleport or (type(syn) == "table" and syn.queue_on_teleport) or (type(fluxus) == "table" and fluxus.queue_on_teleport)
    if type(queueOnTeleport) ~= "function" then return false end
    local text = "getgenv().Young0xPublicTrainingResume=true;loadstring(game:HttpGet(\"" .. bRG2.publicModuleUrl .. "\",true))()"
    local ok = pcall(queueOnTeleport, text)
    if ok then bRG2.resumeQueued = true end
    return ok
  end
  bRG2.requestReconnect = function(arg)
    if not bRG2.antiAfk or bRG2.reconnecting then return false end
    bRG2.reconnecting = true
    bRG2.lastReconnectReason = tostring(arg or "disconnect")
    bRG2.saveResumeState()
    bRG2.queueResume()
    task.spawn(function()
      local teleportService = game:GetService("TeleportService")
      for i = 1, 3 do
        if not bRG2.antiAfk or getgenv().BRG ~= bRG2 then break end
        if i == 1 and game.JobId ~= "" then
          pcall(teleportService.TeleportToPlaceInstance, teleportService, game.PlaceId, game.JobId, localPlayer)
        else
          pcall(teleportService.Teleport, teleportService, game.PlaceId, localPlayer)
        end
        task.wait(8)
      end
      bRG2.reconnecting = false
    end)
    return true
  end
  bRG2.stopReconnectWatch = function()
    if type(bRG2.reconnectConnections) == "table" then
      for index, item in ipairs(bRG2.reconnectConnections) do
        pcall(function()
          item:Disconnect()
        end)
      end
    end
    bRG2.reconnectConnections = nil
  end
  bRG2.startReconnectWatch = function()
    if bRG2.reconnectConnections then return end
    bRG2.reconnectConnections = {}

    local function fn4(arg, arg2)
      local ok, result = pcall(function()
        return arg:Connect(arg2)
      end)
      if ok and result then bRG2.reconnectConnections[#bRG2.reconnectConnections + 1] = result end
    end
    local guiService = game:GetService("GuiService")
    fn4(guiService.ErrorMessageChanged, function(arg)
      if bRG2.antiAfk and tostring(arg or "") ~= "" then bRG2.requestReconnect(arg) end
    end)
    local coreGui = game:GetService("CoreGui")

    local function fn5(arg)
      local promptOverlay = arg and arg:FindFirstChild("promptOverlay")
      if promptOverlay then
        fn4(promptOverlay.ChildAdded, function(arg2)
          if bRG2.antiAfk and arg2.Name == "ErrorPrompt" then bRG2.requestReconnect("error_prompt") end
        end)
      end
    end
    fn5(coreGui:FindFirstChild("RobloxPromptGui"))
    fn4(coreGui.ChildAdded, function(arg)
      if arg.Name == "RobloxPromptGui" then fn5(arg) end
    end)
  end
end
local rEvents = replicatedStorage:WaitForChild("rEvents")
local freeGiftClaimRemote = rEvents:FindFirstChild("freeGiftClaimRemote")
local questsEvent = rEvents:FindFirstChild("questsEvent")
local consumeBoostEvent = rEvents:FindFirstChild("consumeBoostEvent")
local giveCountdownRewardEvent = rEvents:FindFirstChild("giveCountdownRewardEvent")
bRG2.codeRemote = rEvents:FindFirstChild("codeRemote")
bRG2.openFortuneWheelRemote = rEvents:FindFirstChild("openFortuneWheelRemote")
bRG2.rebirthRemote = rEvents:FindFirstChild("rebirthRemote")
local value3 = nil
local value4 = nil
bRG2.gameConfig = nil
pcall(function()
  value3 = require(replicatedStorage.packages.ReplicatorClient).get("Data")
end)
pcall(function()
  value4 = require(replicatedStorage.shared.modules.GlobalFunctions)
end)
pcall(function()
  bRG2.gameConfig = require(replicatedStorage.shared.config.GameConfig)
end)
bRG2.eggRewardCodes = { "MLREVIVED", "Industrialgym500" }
bRG2.eggCodesUserId = localPlayer.UserId
bRG2.sessionRedeemedEggCodes = type(bRG) == "table" and bRG.eggCodesUserId == localPlayer.UserId and type(bRG.sessionRedeemedEggCodes) == "table" and bRG.sessionRedeemedEggCodes or {}
bRG2.getUsedCodesLookup = function()
  local value5 = nil
  if value3 then
    pcall(function()
      value5 = value3:TryIndex({ "usedCodes" })
    end)
  end
  local tbl3 = {}
  if type(value5) == "table" then
    for key, value6 in pairs(value5) do
      if type(value6) == "string" then
        tbl3[value6:lower()] = true
      elseif value6 == true and type(key) == "string" then
        tbl3[key:lower()] = true
      end
    end
  end
  for key in pairs(bRG2.sessionRedeemedEggCodes) do
    tbl3[key] = true
  end
  return tbl3
end
bRG2.getUnredeemedEggCodes = function()
  local result = bRG2.getUsedCodesLookup()
  local tbl3 = {}
  for index, item in ipairs(bRG2.eggRewardCodes) do
    if not result[item:lower()] then tbl3[#tbl3 + 1] = item end
  end
  return tbl3
end
bRG2.getFortuneSpinCount = function()
  if value3 then
    local ok, result = pcall(function()
      local num = tonumber(value3:TryIndex({ "freeWheelSpins" }))
      local num2 = tonumber(value3:TryIndex({ "purchasedSpins" }))
      if num == nil and num2 == nil then return nil end
      num, num2 = num or 0, num2 or 0
      if num ~= num or num2 ~= num2 or math.abs(num) == math.huge or math.abs(num2) == math.huge then return nil end
      return math.max(0, math.floor(num)) + math.max(0, math.floor(num2))
    end)
    if ok and result ~= nil then return result end
  end
  local playerGui = localPlayer:FindFirstChild("PlayerGui")
  playerGui = playerGui and playerGui:FindFirstChild("fortuneWheelMenuGui")
  playerGui = playerGui and playerGui:FindFirstChild("fortuneMenu")
  playerGui = playerGui and playerGui:FindFirstChild("youHaveLabel")
  local spinAmountLabel = playerGui and playerGui:FindFirstChild("spinAmountLabel")
  if spinAmountLabel and spinAmountLabel:IsA("TextLabel") then
    return tonumber(spinAmountLabel.Text:match("^%s*(%d+)%s"))
  end
  return nil
end

local function fn4(arg, arg2)
  if type(arg) ~= "table" then return false end
  return arg[tostring(arg2)] ~= nil or arg[arg2] ~= nil
end

local function fn5()
  local tbl3 = {}
  local freeGiftsRewardList = replicatedStorage.shared.catalogs:FindFirstChild("freeGiftsRewardList")
  if not freeGiftsRewardList then return tbl3 end
  local value5 = nil
  local value6 = nil
  if value3 then
    pcall(function()
      value5 = value3:TryIndex({ "freeGiftsTimer" })
      value6 = value3:TryIndex({ "freeGiftsClaimedFolder" })
    end)
  end
  if typeof(value5) == "number" then
    for index, item in ipairs(freeGiftsRewardList:GetChildren()) do
      local num = tonumber(item.Name:match("%d+"))
      local requiredPlaytime = item:FindFirstChild("requiredPlaytime")
      if num and requiredPlaytime and (requiredPlaytime:IsA("IntValue") or requiredPlaytime:IsA("NumberValue")) and value5 >= requiredPlaytime.Value * 60 and not fn4(value6, num) then
        tbl3[#tbl3 + 1] = num
      end
    end
  else
    local freeGiftsGui = localPlayer.PlayerGui:FindFirstChild("freeGiftsGui")
    local freeGiftsMenu = freeGiftsGui and freeGiftsGui:FindFirstChild("freeGiftsMenu")
    local giftsFrame = freeGiftsMenu and freeGiftsMenu:FindFirstChild("giftsFrame")
    if giftsFrame then
      for index, item in ipairs(giftsFrame:GetChildren()) do
        local giftNumber = item:FindFirstChild("giftNumber")
        local timerLabel = item:FindFirstChild("timerLabel")
        if giftNumber and giftNumber:IsA("IntValue") and timerLabel and timerLabel:IsA("TextLabel") and timerLabel.Text:upper():find("READY", 1, true) then
          tbl3[#tbl3 + 1] = giftNumber.Value
        end
      end
    end
  end
  table.sort(tbl3)
  return tbl3
end

local function fn6()
  local tbl3 = {}
  local quests = localPlayer:FindFirstChild("Quests")
  if not quests or not value4 or type(value4.checkForCompleteQuest) ~= "function" then return tbl3 end
  for index, item in ipairs(quests:GetChildren()) do
    if item:IsA("Folder") and item.Name ~= "completedQuests" then
      for index2, item2 in ipairs(item:GetChildren()) do
        if item2:IsA("Folder") and item2:FindFirstChild("requirements") then
          local ok, result = pcall(value4.checkForCompleteQuest, item2)
          if ok and result then tbl3[#tbl3 + 1] = item2 end
        end
      end
    end
  end
  return tbl3
end

local function fn7()
  local liveEvents = replicatedStorage.shared.state:FindFirstChild("LiveEvents")
  if not liveEvents or liveEvents:GetAttribute("UpdateCountdownDisabled") == true then return false end
  local attribute = liveEvents:GetAttribute("UpdateTargetTime")
  if typeof(attribute) ~= "number" then return false end
  local num = math.floor(attribute - workspace:GetServerTimeNow())
  local uPDATECOUNTDOWNREWARDWINDOW = (bRG2.gameConfig and bRG2.gameConfig.UPDATE_COUNTDOWN_REWARD_WINDOW) or 3600
  if num <= 0 or num > uPDATECOUNTDOWNREWARDWINDOW then return false end
  local value5 = nil
  if value3 then
    pcall(function()
      value5 = value3:TryIndex({ "updateCountdownRewardsReceived" })
    end)
  end
  if type(value5) == "table" then
    local str = tostring(attribute)
    for key, value6 in pairs(value5) do
      if tostring(key) == str or tostring(value6) == str then return false end
    end
  end
  return true
end

local function fn8()
  return #fn5() + #fn6() + (fn7() and 1 or 0)
end

local function fn9()
  local num = 0
  if freeGiftClaimRemote and freeGiftClaimRemote:IsA("RemoteFunction") then
    for index, item in ipairs(fn5()) do
      local ok, result = pcall(function()
        return freeGiftClaimRemote:InvokeServer("claimGift", item)
      end)
      if ok and result == true then
        num += 1
        if bRG2.refreshRewardCounters then bRG2.refreshRewardCounters() end
      end
      task.wait(0.1)
    end
  end
  if questsEvent and questsEvent:IsA("RemoteEvent") then
    for index, item in ipairs(fn6()) do
      if item.Parent then
        questsEvent:FireServer("collectQuest", item)
        num += 1
        if bRG2.refreshRewardCounters then bRG2.refreshRewardCounters() end
        task.wait(0.1)
      end
    end
  end
  if fn7() and giveCountdownRewardEvent and giveCountdownRewardEvent:IsA("RemoteEvent") then
    giveCountdownRewardEvent:FireServer("giveCountdownReward")
    num += 1
    if bRG2.refreshRewardCounters then bRG2.refreshRewardCounters() end
  end
  return num
end
bRG2.isEggConsumable = function(arg)
  if not arg then return false end
  local text = arg.Name:lower()
  return text:find("egg", 1, true) ~= nil or arg:GetAttribute("IsEgg") == true
end

local function fn10()
  local consumablesFolder = localPlayer:FindFirstChild("consumablesFolder")
  if not consumablesFolder then return nil end
  for index, item in ipairs(consumablesFolder:GetChildren()) do
    if item:IsA("StringValue") and item.Name ~= "Protein Egg" and item.Name ~= "Tropical Shake" then
      if not bRG2.isEggConsumable(item) then return item end
    end
  end
  return nil
end
bRG2.countUsableConsumables = function()
  local consumablesFolder = localPlayer:FindFirstChild("consumablesFolder")
  if not consumablesFolder then return 0 end
  local num = 0
  for index, item in ipairs(consumablesFolder:GetChildren()) do
    if item:IsA("StringValue") and item.Name ~= "Protein Egg" and item.Name ~= "Tropical Shake" then
      if not bRG2.isEggConsumable(item) then num += 1 end
    end
  end
  return num
end
bRG2.countConsumablesByName = function(arg)
  local consumablesFolder = localPlayer:FindFirstChild("consumablesFolder")
  if not consumablesFolder then return 0 end
  local num = 0
  for index, item in ipairs(consumablesFolder:GetChildren()) do
    if item:IsA("StringValue") and item.Name == arg then num += 1 end
  end
  return num
end
bRG2.consumeResultSerial = 0
bRG2.consumeResultName = nil
if consumeBoostEvent and consumeBoostEvent:IsA("RemoteEvent") then
  fn(consumeBoostEvent.OnClientEvent:Connect(function(arg, consumeResultName)
    if typeof(arg) == "number" and typeof(consumeResultName) == "string" then
      bRG2.consumeResultSerial += 1
      bRG2.consumeResultName = consumeResultName
    end
  end))
end
bRG2.consumeBatch = function(arg, arg2)
  if not arg or not arg.Parent or not consumeBoostEvent or not consumeBoostEvent:IsA("RemoteEvent") then
    return false, 0
  end
  local name = arg.Name
  local result = bRG2.countConsumablesByName(name)
  if result <= 0 then return false, 0 end
  arg2 = math.clamp(math.floor(tonumber(arg2) or 1), 1, math.min(10, result))
  local consumeResultSerial = bRG2.consumeResultSerial
  consumeBoostEvent:FireServer(arg, arg2)
  local num = os.clock() + 2
  repeat
    task.wait(0.05)
    local result2 = bRG2.countConsumablesByName(name)
    if result2 < result then return true, result - result2 end
    if bRG2.consumeResultSerial ~= consumeResultSerial and bRG2.consumeResultName == name then
      return true, math.min(arg2, result)
    end
  until os.clock() >= num
  return false, 0
end
bRG2.proteinEggTimeRemaining = function()
  local value5 = nil
  if value3 then
    pcall(function()
      value5 = value3:TryIndex({ "boostTimersFolder" })
    end)
  end
  if type(value5) == "table" and typeof(value5["Protein Egg"]) == "number" then
    return math.max(0, value5["Protein Egg"])
  end
  if type(value5) == "table" then return 0 end
  return nil
end
bRG2.findProteinEgg = function()
  local consumablesFolder = localPlayer:FindFirstChild("consumablesFolder")
  if not consumablesFolder then return nil end
  for index, item in ipairs(consumablesFolder:GetChildren()) do
    if item:IsA("StringValue") and item.Name == "Protein Egg" and not item:FindFirstChild("isGift") then
      return item
    end
  end
  return nil
end
bRG2.getGiftableItems = function(arg)
  local consumablesFolder = localPlayer:FindFirstChild("consumablesFolder")
  local tbl3 = {}
  if consumablesFolder then
    for index, item in ipairs(consumablesFolder:GetChildren()) do
      if item:IsA("StringValue") and item.Name == arg and item.Value ~= "" and not item:FindFirstChild("isGift") then
        tbl3[#tbl3 + 1] = item
      end
    end
  end
  return tbl3
end
bRG2.getGiftableEggs = function()
  return bRG2.getGiftableItems("Protein Egg")
end
bRG2.createEggGiftSender = function(arg)
  local tbl3 = { busy = false, closed = false, cancelled = false, sent = 0, total = 0, message = "" }

  local function fn11()
    if not tbl3.closed and arg then pcall(arg) end
  end

  function tbl3:Check(arg2, arg3, itemName)
    if self.closed or self.busy then return nil, "Envío en curso." end
    local player = type(arg2) == "number" and players:GetPlayerByUserId(arg2) or nil
    if not player or player == localPlayer or player.Parent ~= players then
      return nil, "Seleccioná un jugador del servidor."
    end
    local match = tostring(arg3 or ""):match("^%s*(.-)%s*$")
    local match2 = match:match("^%d+$") and tonumber(match) or nil
    if not match2 or match2 < 1 or match2 > 9999 or match2 ~= math.floor(match2) then
      return nil, "Escribí la cantidad que querés regalar"
    end
    itemName = itemName == "Tropical Shake" and "Tropical Shake" or "Protein Egg"
    local items = bRG2.getGiftableItems(itemName)
    if match2 > #items then
      local str = itemName == "Tropical Shake" and "shakes" or "eggs"
      return nil, #items == 0 and ("No tenés " .. str .. " para regalar.") or ("No tenés suficientes " .. str .. " para regalar.")
    end
    local rEvents2 = replicatedStorage:FindFirstChild("rEvents")
    local giftRemote = rEvents2 and rEvents2:FindFirstChild("giftRemote")
    if not giftRemote or not giftRemote:IsA("RemoteFunction") then
      return nil, "Esperando el sistema de gifts..."
    end
    return {
      target = player,
      items = items,
      itemName = itemName,
      amount = match2,
      remote = giftRemote,
    }
  end

  function tbl3:Start(arg2, arg3, arg4)
    local check, message = self:Check(arg2, arg3, arg4)
    if not check then
      if not self.busy then
        self.message = message
        fn11()
      end
      return false
    end
    self.busy, self.cancelled, self.sent, self.total = true, false, 0, check.amount
    self.message = "Enviando a @" .. check.target.Name .. "..."
    bRG2.giftEggBusy = true
    fn11()
    self.thread = task.spawn(function()
      local ok = pcall(function()
        for i = 1, check.amount do
          if self.closed or self.cancelled or not parent or not parent.Parent then break end
          if check.target.Parent ~= players or players:GetPlayerByUserId(arg2) ~= check.target then
            self.message = "El jugador salió del servidor."
            break
          end
          local item = check.items[i]
          if item.Parent ~= localPlayer:FindFirstChild("consumablesFolder") or not item:IsA("StringValue") or item.Name ~= check.itemName or item.Value == "" or item:FindFirstChild("isGift") then
            self.message = "El inventario cambió; envío detenido."
            break
          end
          self.timer = task.delay(8, function()
            self.message = "Esperando respuesta; no vuelvas a enviar."
            fn11()
          end)
          local ok, result = pcall(function()
            return check.remote:InvokeServer("giftRequest", check.target, item)
          end)
          pcall(task.cancel, self.timer)
          self.timer = nil
          if self.closed then return end
          if not ok or result ~= true then
            self.message = ok and "El servidor rechazó el regalo." or "No se confirmó el regalo; revisá el inventario."
            break
          end
          self.sent += 1
          self.message = ("Enviando a @%s: %d/%d"):format(check.target.Name, self.sent, self.total)
          fn11()
          if i < check.amount and not self.cancelled then task.wait(0.2) end
        end
      end)
      if self.timer then
        pcall(task.cancel, self.timer)
        self.timer = nil
      end
      bRG2.giftEggBusy = false
      self.busy, self.thread = false, nil
      if self.closed then return end
      if not ok then
        self.message = "Envío interrumpido; revisá el inventario."
      elseif self.sent == self.total then
        self.message = ("Regalaste %d %s a @%s."):format(self.sent, check.itemName == "Tropical Shake" and "shakes" or "eggs", check.target.Name)
      elseif self.cancelled then
        self.message = ("Cancelado: %d/%d enviados."):format(self.sent, self.total)
      else
        self.message ..= (" (%d/%d enviados)"):format(self.sent, self.total)
      end
      fn11()
    end)
    return true
  end

  function tbl3:Cancel()
    if self.busy then
      self.cancelled = true
      self.message = "Deteniendo el envío..."
      fn11()
    end
  end

  function tbl3:Destroy()
    self.closed, self.cancelled, self.busy = true, true, false
    bRG2.giftEggBusy = false
    if self.timer then
      pcall(task.cancel, self.timer)
      self.timer = nil
    end
    if self.thread then
      pcall(task.cancel, self.thread)
      self.thread = nil
    end
  end
  return tbl3
end
bRG2.getMuscleKingZone = function()
  local muscleKingParts = workspace:FindFirstChild("muscleKingParts")
  local muscleKingPart = muscleKingParts and muscleKingParts:FindFirstChild("muscleKingPart")
  return muscleKingPart and muscleKingPart:IsA("BasePart") and muscleKingPart or nil
end
bRG2.getMuscleKingCFrame = function()
  local result = bRG2.getMuscleKingZone()
  if not result then return nil end
  return result.CFrame * CFrame.new(16.861328125, 111.08430480957031, 0.26123046875)
end
bRG2.destroyAutoKingPlatform = function()
  if bRG2.autoKingPlatform then
    pcall(function()
      bRG2.autoKingPlatform:Destroy()
    end)
    bRG2.autoKingPlatform = nil
  end
end
bRG2.ensureAutoKingPlatform = function()
  if bRG2.autoKingPlatform and bRG2.autoKingPlatform.Parent then return bRG2.autoKingPlatform end
  local result = bRG2.getMuscleKingCFrame()
  if not result then return nil end
  local part = Instance.new("Part")
  part.Name = "Young0xAutoKingPlatform"
  part.Size = Vector3.new(14, 1, 14)
  part.CFrame = CFrame.new(result.Position - Vector3.new(0, 4.125, 0))
  part.Anchored = true
  part.CanCollide = true
  part.CanQuery = false
  part.CanTouch = false
  part.CastShadow = false
  part.Transparency = 1
  part.Parent = workspace
  bRG2.autoKingPlatform = part
  return part
end
bRG2.isInsideMuscleKingIsland = function(arg)
  local result = bRG2.getMuscleKingZone()
  if not result then return false end
  local pointToObjectSpace = result.CFrame:PointToObjectSpace(arg)
  local num = 8
  return math.abs(pointToObjectSpace.X) <= (result.Size.X * 0.5 - num) and math.abs(pointToObjectSpace.Z) <= (result.Size.Z * 0.5 - num) and pointToObjectSpace.Y >= -40
end
bRG2.sendCharacterToMuscleKing = function()
  local character = localPlayer.Character
  local humanoid = character and character:FindFirstChildWhichIsA("Humanoid")
  local humanoidRootPart = character and character:FindFirstChild("HumanoidRootPart")
  if not character or not humanoid or humanoid.Health <= 0 or not humanoidRootPart then return false end
  local lockPositionCFrame = bRG2.getMuscleKingCFrame()
  if not lockPositionCFrame then return false end
  bRG2.ensureAutoKingPlatform()
  local vector3 = Vector3.new(humanoidRootPart.CFrame.LookVector.X, 0, humanoidRootPart.CFrame.LookVector.Z)
  if vector3.Magnitude > 0.05 then
    lockPositionCFrame = CFrame.lookAt(lockPositionCFrame.Position, lockPositionCFrame.Position + vector3.Unit)
  end
  humanoidRootPart.AssemblyLinearVelocity = Vector3.zero
  humanoidRootPart.AssemblyAngularVelocity = Vector3.zero
  character:PivotTo(lockPositionCFrame)
  bRG2.autoKingCFrame = lockPositionCFrame
  if bRG2.lockPosition then bRG2.lockPositionCFrame = lockPositionCFrame end
  return true
end
bRG2.setAutoKingEnabled = function(autoKing)
  bRG2.autoKingRun += 1
  local autoKingRun = bRG2.autoKingRun
  bRG2.autoKing = autoKing
  if not autoKing then
    bRG2.destroyAutoKingPlatform()
    return true
  end
  if not bRG2.getMuscleKingZone() then
    bRG2.autoKing = false
    bRG2.destroyAutoKingPlatform()
    return false
  end
  task.spawn(function()
    local num = 0
    if bRG2.sendCharacterToMuscleKing() then num = os.clock() end
    while getgenv().BRG == bRG2 and bRG2.autoKing and bRG2.autoKingRun == autoKingRun and parent and parent.Parent do
      local character = localPlayer.Character
      local humanoid = character and character:FindFirstChildWhichIsA("Humanoid")
      local humanoidRootPart = character and character:FindFirstChild("HumanoidRootPart")
      if not bRG2.collectingMapChests and humanoid and humanoid.Health > 0 and humanoidRootPart and not bRG2.isInsideMuscleKingIsland(humanoidRootPart.Position) then
        if os.clock() - num >= 0.75 and bRG2.sendCharacterToMuscleKing() then num = os.clock() end
      end
      task.wait(0.2)
    end
  end)
  return true
end
bRG2.setLockPositionEnabled = function(lockPosition)
  bRG2.lockPositionRun += 1
  local lockPositionRun = bRG2.lockPositionRun
  bRG2.lockPosition = lockPosition
  if not lockPosition then
    bRG2.lockPositionCFrame = nil
    return true
  end
  local character = localPlayer.Character
  local humanoid = character and character:FindFirstChildWhichIsA("Humanoid")
  local humanoidRootPart = character and character:FindFirstChild("HumanoidRootPart")
  if not humanoid or humanoid.Health <= 0 or not humanoidRootPart then
    bRG2.lockPosition = false
    return false
  end
  if value2 then value2(false, true) end
  value()
  bRG2.lockPositionCFrame = humanoidRootPart.CFrame
  task.spawn(function()
    while getgenv().BRG == bRG2 and bRG2.lockPosition and bRG2.lockPositionRun == lockPositionRun and parent and parent.Parent do
      local character2 = localPlayer.Character
      local humanoid2 = character2 and character2:FindFirstChildWhichIsA("Humanoid")
      local humanoidRootPart2 = character2 and character2:FindFirstChild("HumanoidRootPart")
      local lockPositionCFrame = bRG2.lockPositionCFrame
      if not bRG2.collectingMapChests and humanoid2 and humanoid2.Health > 0 and humanoidRootPart2 and lockPositionCFrame then
        humanoidRootPart2.Anchored = false
        humanoidRootPart2.AssemblyLinearVelocity = Vector3.zero
        humanoidRootPart2.AssemblyAngularVelocity = Vector3.zero
        humanoidRootPart2.CFrame = lockPositionCFrame
      end
      runService.Heartbeat:Wait()
    end
  end)
  return true
end
local tbl3 = { enabled = false, threadA = nil, threadB = nil }

local function fn11()
  tbl3.threadA = task.spawn(function()
    while tbl3.enabled and getgenv().BRG == bRG2 and parent and parent.Parent do
      pcall(function()
        local punch = localPlayer.Backpack:FindFirstChild("Punch")
        if punch and localPlayer.Character and localPlayer.Character:FindFirstChild("Humanoid") then
          localPlayer.Character.Humanoid:EquipTool(punch)
        end
        local punch2 = localPlayer.Character and localPlayer.Character:FindFirstChild("Punch")
        if punch2 and punch2:FindFirstChild("attackTime") then punch2.attackTime.Value = 0 end
      end)
      task.wait(0.05)
    end
  end)
  tbl3.threadB = task.spawn(function()
    while tbl3.enabled and getgenv().BRG == bRG2 and parent and parent.Parent do
      if not bRG2.autoFarm then
        pcall(function()
          localPlayer.muscleEvent:FireServer("punch", "rightHand")
          localPlayer.muscleEvent:FireServer("punch", "leftHand")
          local punch = localPlayer.Character and localPlayer.Character:FindFirstChild("Punch")
          if punch then punch:Activate() end
        end)
      end
      task.wait(bRG2.autoFarm and 0.06 or 0.04)
    end
  end)
end

local function fn12()
  tbl3.enabled = false
  bRG2.fastPunch = false
  if tbl3.threadA then
    task.cancel(tbl3.threadA)
    tbl3.threadA = nil
  end
  if tbl3.threadB then
    task.cancel(tbl3.threadB)
    tbl3.threadB = nil
  end
  pcall(function()
    local character = localPlayer.Character
    if character then
      local punch = character:FindFirstChild("Punch")
      if punch then punch.Parent = localPlayer.Backpack end
    end
  end)
end

local function fn13()
  local character = localPlayer.Character
  local humanoid = character and character:FindFirstChildWhichIsA("Humanoid")
  local backpack = localPlayer:FindFirstChild("Backpack")
  local punch = character and character:FindFirstChild("Punch") or backpack and backpack:FindFirstChild("Punch")
  local muscleEvent = localPlayer:FindFirstChild("muscleEvent")
  if not humanoid or humanoid.Health <= 0 or not punch or not muscleEvent then return false end
  if punch.Parent ~= character then humanoid:EquipTool(punch) end
  return punch.Parent == character and punch or nil
end
bRG2.rockTouch = type(firetouchinterest) == "function" and firetouchinterest or type(firetouchtransmitter) == "function" and firetouchtransmitter or nil
bRG2.rockTouchBegin = 0
bRG2.rockCache = {}
bRG2.rockCacheTime = {}
do
  local getexecutorname2 = identifyexecutor or getexecutorname
  if type(getexecutorname2) == "function" then
    local ok, result = pcall(getexecutorname2)
    if ok and tostring(result):lower():find("real", 1, true) then bRG2.rockTouchBegin = 1 end
  end
end
bRG2.findRock = function(arg, arg2, arg3)
  local text = tostring(arg3 or "") .. "|" .. tostring(arg2 or "") .. "|" .. tostring(arg)
  local item = bRG2.rockCache[text]
  if item and item:IsDescendantOf(workspace) then return item end
  if os.clock() - (bRG2.rockCacheTime[text] or -math.huge) < 1 then return nil end
  bRG2.rockCacheTime[text] = os.clock()
  bRG2.rockCache[text] = nil
  local machinesFolder = workspace:FindFirstChild("machinesFolder")
  if not machinesFolder then return nil end
  for index, item2 in ipairs(machinesFolder:GetChildren()) do
    local neededDurability = item2:FindFirstChild("neededDurability")
    local rock = item2:FindFirstChild("Rock")
    local flag2 = not arg2 or item2.Name == arg2
    local flag3 = not arg3 or workspace:FindFirstChild(arg3) ~= nil
    if flag2 and flag3 and neededDurability and neededDurability:IsA("ValueBase") and neededDurability.Value == arg and rock and rock:IsA("BasePart") then
      bRG2.rockCache[text] = rock
      return rock
    end
  end
  return nil
end
bRG2.releaseRockTouches = function(arg)
  local contacts = arg.contacts
  arg.contacts = nil
  if contacts and bRG2.rockTouch then
    for index, item in ipairs(contacts) do
      if item[1].Parent and item[2].Parent then pcall(bRG2.rockTouch, item[1], item[2], 1 - bRG2.rockTouchBegin) end
    end
  end
end
bRG2.performRockStrike = function(arg, arg2, arg3, arg4, arg5, arg6)
  if not arg.enabled or localPlayer.Character ~= arg2 or not arg5.Parent or not arg6 or arg6.Parent ~= arg2 then
    return false
  end
  arg.contacts = { { arg4, arg5 }, { arg3, arg5 } }
  local num = 0
  for index, item in ipairs(arg.contacts) do
    local ok = pcall(bRG2.rockTouch, item[1], item[2], bRG2.rockTouchBegin)
    if ok then num += 1 end
  end
  if num == 0 then
    bRG2.releaseRockTouches(arg)
    return false
  end
  pcall(function()
    local attackTime = arg6:FindFirstChild("attackTime")
    if attackTime then attackTime.Value = 0 end
    arg6:Deactivate()
    arg6:Activate()
    local muscleEvent = localPlayer:FindFirstChild("muscleEvent")
    if muscleEvent then
      muscleEvent:FireServer("punch", "rightHand")
      muscleEvent:FireServer("punch", "leftHand")
    end
  end)
  task.wait(0.055)
  bRG2.releaseRockTouches(arg)
  return true
end

local function fn14(arg, arg2)
  return function()
    while arg.enabled and getgenv().BRG == bRG2 and parent and parent.Parent do
      local ok, result = pcall(function()
        local durability = localPlayer:FindFirstChild("Durability")
        if not durability or durability.Value < arg2.minDur or not bRG2.rockTouch then return end
        local character = localPlayer.Character
        local leftArm = character and (character:FindFirstChild("LeftHand") or character:FindFirstChild("Left Arm"))
        local rightArm = character and (character:FindFirstChild("RightHand") or character:FindFirstChild("Right Arm"))
        local result = bRG2.findRock(arg2.req, arg2.objectName, arg2.eventObject)
        local result2 = fn13()
        if not leftArm or not rightArm or not result or not result2 then return end
        bRG2.rockAttempts = (bRG2.rockAttempts or 0) + 1
        if bRG2.performRockStrike(arg, character, leftArm, rightArm, result, result2) then
          bRG2.rockStrikes = (bRG2.rockStrikes or 0) + 1
        end
      end)
      if not ok then
        bRG2.rockError = tostring(result)
        bRG2.releaseRockTouches(arg)
      end
      task.wait(0.065)
    end
    bRG2.releaseRockTouches(arg)
  end
end
local value5 = nil
local tbl4 = {}

local function fn15()
  if value5 then
    value5:Stop()
    value5 = nil
  end
  for index, item in ipairs(tbl4) do
    item(false, true)
  end
  bRG2.autoFarm = false
  bRG2.selectedRock = nil
  bRG2.selectedRockDefinition = nil
  bRG2.selectedRockRequirement = nil
end
local value6 = nil
local value7 = nil

local function fn16()
  if value6 and value7 then return end
  bRG2.startReconnectWatch()
  bRG2.queueResume()
  bRG2.saveResumeState()
  local virtualUser = game:GetService("VirtualUser")

  local function sendAntiAfkPulse()
    pcall(function()
      virtualUser:CaptureController()
      local currentCamera = workspace.CurrentCamera
      local cFrame = currentCamera and currentCamera.CFrame or CFrame.new()
      virtualUser:Button2Down(Vector2.new(0, 0), cFrame)
      task.wait(0.08)
      virtualUser:Button2Up(Vector2.new(0, 0), cFrame)
      bRG2.afkPulseCount = (bRG2.afkPulseCount or 0) + 1
      bRG2.afkLastPulseAt = tick()
    end)
  end
  bRG2.sendAntiAfkPulse = sendAntiAfkPulse
  pcall(function()
    value6 = localPlayer.Idled:Connect(function()
      sendAntiAfkPulse()
    end)
  end)
  value7 = task.spawn(function()
    while bRG2.antiAfk do
      sendAntiAfkPulse()
      task.wait(45)
    end
    value7 = nil
  end)
end

local function fn17()
  bRG2.antiAfk = false
  if value6 then
    value6:Disconnect()
    value6 = nil
  end
  if value7 then
    task.cancel(value7)
    value7 = nil
  end
  bRG2.stopReconnectWatch()
end
local value8 = nil
local value9 = nil
local value10 = nil
local value11 = nil
local value12 = nil
local tbl5 = setmetatable({}, { __mode = "k" })
local tbl6 = { normalCycle = 0.72, fastRepTime = 0.08, fastCycle = 0.28, fastAnimationSpeed = 5.5 }
do
  local tbl7 = {
    tier = "PUBLIC_FULL",
    profiles = {
      machine = { target = 300, minimum = 170, maximum = 1200, repBoostScale = 0.5 },
      exercise = { target = 520, minimum = 280, maximum = 1600, repBoostScale = 0.65 },
    },
    initialRate = 300,
    minimumRate = 170,
    maximumRate = 1600,
    maximumBurst = 24,
    controlInterval = 0.75,
  }
  local tbl8 = {
    active = false,
    generation = 0,
    worker = nil,
    rate = tbl7.initialRate,
    tokens = 0,
    sent = 0,
    acceptedSamples = 0,
    stalledSamples = 0,
    targetRate = tbl7.initialRate,
    activity = "idle",
    lastDelta = 0,
    pausedForPing = false,
    pauseUntil = 0,
    baselinePing = 0,
    currentPing = 0,
    peakPing = 0,
    backpressureCount = 0,
    momentumMultiplier = 1,
    petRepBoost = 0,
  }

  local function fn18()
    local leaderstats = localPlayer:FindFirstChild("leaderstats")
    local strength = leaderstats and leaderstats:FindFirstChild("Strength")
    local durability = localPlayer:FindFirstChild("Durability")
    return tonumber(strength and strength.Value) or 0, tonumber(durability and durability.Value) or 0
  end

  local function fn19()
    bRG2.fastRepPumpActive = tbl8.active
    bRG2.fastRepRate = tbl8.active and tbl8.rate or 0
    bRG2.fastRepSent = tbl8.sent
    bRG2.fastRepAcceptedSamples = tbl8.acceptedSamples
    bRG2.fastRepStalledSamples = tbl8.stalledSamples
    bRG2.fastRepActivity = tbl8.activity
    bRG2.fastRepTargetRate = tbl8.targetRate
    bRG2.fastRepMomentumMultiplier = tbl8.momentumMultiplier
    bRG2.fastRepPetBoost = tbl8.petRepBoost
  end
  local v, v2

  local function fn20()
    if v then return end
    v, v2 = {}, "MomentumSeconds"
    local shared = replicatedStorage:FindFirstChild("shared")
    local config = shared and shared:FindFirstChild("config")
    local petMomentumConfig = config and config:FindFirstChild("PetMomentumConfig")
    local ok, result = pcall(function()
      return petMomentumConfig and petMomentumConfig:IsA("ModuleScript") and require(petMomentumConfig)
    end)
    if ok and type(result) == "table" then
      v2 = type(result.ATTRIBUTE) == "string" and result.ATTRIBUTE or v2
      for index, item in ipairs(result.TIERS or {}) do
        local seconds, multiplier = tonumber(item.Seconds), tonumber(item.Multiplier)
        if seconds and multiplier then v[#v + 1] = { seconds = seconds, multiplier = multiplier } end
      end
      table.sort(v, function(arg, arg2)
        return arg.seconds < arg2.seconds
      end)
    end
  end

  local function fn21(arg)
    fn20()
    local num = 1
    for index, item in ipairs(v) do
      if arg >= item.seconds then num = item.multiplier end
    end
    return num
  end

  local function fn22()
    local equippedPets = localPlayer:FindFirstChild("equippedPets")
    local num, num2 = 1, 0
    if equippedPets then
      for index, item in ipairs(equippedPets:GetChildren()) do
        local petReference = item:FindFirstChild("petReference")
        local isA = petReference and petReference:IsA("ObjectValue") and petReference.Value
        if not isA and item:IsA("ObjectValue") then isA = item.Value end
        if isA then
          local result = fn21(tonumber(isA:GetAttribute(v2 or "MomentumSeconds")) or 0)
          num = math.max(num, result)
          local repTimeBoostPercent = isA:FindFirstChild("repTimeBoostPercent", true)
          num2 += math.max(0, tonumber(repTimeBoostPercent and repTimeBoostPercent.Value) or 0) * result
        end
      end
    end
    return num, num2
  end

  local function fn23()
    local ok, result = pcall(function()
      return (game:GetService("Stats")).Network.ServerStatsItem["Data Ping"]:GetValue()
    end)
    if not ok then
      ok, result = pcall(function()
        return localPlayer:GetNetworkPing() * 2000
      end)
    end
    return ok and math.max(0, tonumber(result) or 0) or 0
  end

  local function getTrainingMode()
    local machineInUse = localPlayer:FindFirstChild("machineInUse")
    if bRG2.machineDefinition or (machineInUse and machineInUse:IsA("ObjectValue") and machineInUse.Value) then
      return "machine"
    end
    return bRG2.trainingMode and "exercise" or nil
  end

  local function fn24(arg)
    if not arg then return tbl7.initialRate end
    local momentumMultiplier, petRepBoost = fn22()
    tbl8.momentumMultiplier = momentumMultiplier
    tbl8.petRepBoost = petRepBoost
    return math.clamp(arg.target + petRepBoost * arg.repBoostScale, arg.minimum, arg.maximum)
  end

  local function stopFastRepPump()
    tbl8.generation += 1
    tbl8.active = false
    tbl8.tokens = 0
    tbl8.pausedForPing = false
    if tbl8.worker then
      pcall(task.cancel, tbl8.worker)
      tbl8.worker = nil
    end
    fn19()
  end

  local function startFastRepPump()
    if tbl8.active then return true end
    local muscleEvent = localPlayer:FindFirstChild("muscleEvent") or replicatedStorage:FindFirstChild("muscleEvent")
    if not muscleEvent or not muscleEvent:IsA("RemoteEvent") then return false end
    tbl8.generation += 1
    local generation = tbl8.generation
    tbl8.active = true
    tbl8.rate = tbl7.initialRate
    tbl8.tokens = 0
    tbl8.sent = 0
    tbl8.acceptedSamples = 0
    tbl8.stalledSamples = 0
    tbl8.activity = "idle"
    tbl8.targetRate = tbl7.initialRate
    tbl8.lastDelta = 0
    tbl8.pausedForPing = false
    tbl8.pauseUntil = 0
    tbl8.baselinePing = fn23()
    tbl8.currentPing = tbl8.baselinePing
    tbl8.peakPing = tbl8.baselinePing
    tbl8.backpressureCount = 0
    tbl8.momentumMultiplier = 1
    tbl8.petRepBoost = 0
    local result, extra = fn18()
    local now = os.clock()
    local now2 = os.clock()
    local value13 = nil
    fn19()
    tbl8.worker = task.spawn(function()
      while tbl8.active and tbl8.generation == generation and bRG2.fastRep and (bRG2.trainingMode ~= nil or bRG2.machineDefinition ~= nil) and getgenv().BRG == bRG2 and parent and parent.Parent do
        local now3 = os.clock()
        local num = math.clamp(now3 - now2, 0, 0.1)
        now2 = now3
        local trainingMode = getTrainingMode()
        local trainingMode2 = trainingMode and tbl7.profiles[trainingMode] or nil
        tbl8.activity = trainingMode or "idle"
        if trainingMode ~= value13 then
          tbl8.tokens = 0
          tbl8.targetRate = fn24(trainingMode2)
          tbl8.rate = tbl8.targetRate
          tbl8.stalledSamples = 0
          tbl8.pausedForPing = false
          result, extra = fn18()
          now = now3
          value13 = trainingMode
        end
        if now3 - now >= tbl7.controlInterval then
          local result2, extra2 = fn18()
          local lastDelta = math.max(0, result2 - result) + math.max(0, extra2 - extra)
          tbl8.lastDelta = lastDelta
          if lastDelta > 0 then
            tbl8.acceptedSamples += 1
            tbl8.stalledSamples = 0
          else
            tbl8.stalledSamples += 1
          end
          tbl8.targetRate = fn24(trainingMode2)
          local baselinePing = fn23()
          tbl8.currentPing = baselinePing
          tbl8.peakPing = math.max(tbl8.peakPing, baselinePing)
          if baselinePing > 0 and tbl8.baselinePing <= 0 then tbl8.baselinePing = baselinePing end
          if bRG2.pingReducer and baselinePing > 0 and tbl8.baselinePing > 0 and baselinePing < tbl8.baselinePing then
            tbl8.baselinePing = tbl8.baselinePing * 0.9 + baselinePing * 0.1
          end
          local num2 = math.clamp(tbl8.baselinePing, 1, 250)
          local num3 = trainingMode == "exercise" and 65 or 45
          local minimumRate = bRG2.pingReducer and num3 or (trainingMode2 and trainingMode2.minimum or tbl7.minimumRate)
          local num4 = math.max(150, num2 * 1.15, num2 + 30)
          local pingReducer = bRG2.pingReducer and math.max(230, num2 * 1.4, num2 + 85) or math.max(900, num2 * 2.25, num2 + 550)
          if baselinePing > pingReducer then
            tbl8.rate = math.max(minimumRate, tbl8.rate * (bRG2.pingReducer and 0.42 or 0.65))
            tbl8.tokens = 0
            tbl8.pausedForPing = true
            tbl8.pauseUntil = now3 + (bRG2.pingReducer and 0.55 or 0.75)
            tbl8.backpressureCount += 1
          elseif bRG2.pingReducer and baselinePing > num4 then
            tbl8.rate = math.max(minimumRate, tbl8.rate * 0.78)
            tbl8.tokens = math.min(tbl8.tokens, 2)
            tbl8.backpressureCount += 1
          elseif not tbl8.pausedForPing and tbl8.rate < tbl8.targetRate then
            tbl8.rate = math.min(tbl8.targetRate, tbl8.rate + (bRG2.pingReducer and 14 or 40))
          elseif tbl8.rate > tbl8.targetRate then
            tbl8.rate = tbl8.targetRate
          end
          result = result2
          extra = extra2
          now = now3
          fn19()
        end
        if tbl8.pausedForPing and now3 >= tbl8.pauseUntil then
          local result2 = fn23()
          local num2 = math.clamp(tbl8.baselinePing, 1, 250)
          local pingReducer = bRG2.pingReducer and math.max(150, num2 * 1.12, num2 + 25) or math.max(600, num2 * 1.65, num2 + 300)
          if result2 <= 0 or result2 <= pingReducer then
            tbl8.pausedForPing = false
          else
            tbl8.pauseUntil = now3 + 0.5
          end
        end
        if tbl8.pausedForPing then
          tbl8.tokens = 0
        else
          local maximumBurst = bRG2.pingReducer and 6 or tbl7.maximumBurst
          tbl8.tokens = math.min(maximumBurst, tbl8.tokens + tbl8.rate * num)
        end
        local num2 = math.max(1, math.min(bRG2.pingReducer and 4 or tbl7.maximumBurst, math.ceil(tbl8.rate * 0.04)))
        local pausedForPing = tbl8.pausedForPing and 0 or math.min(math.floor(tbl8.tokens), num2)
        for i = 1, pausedForPing do
          if not tbl8.active or tbl8.generation ~= generation then break end
          pcall(muscleEvent.FireServer, muscleEvent, "rep", bRG2.machineSeat)
          tbl8.sent += 1
        end
        tbl8.tokens = math.max(0, tbl8.tokens - pausedForPing)
        runService.Heartbeat:Wait()
      end
      if tbl8.generation == generation then
        tbl8.active = false
        tbl8.tokens = 0
        tbl8.worker = nil
        fn19()
      end
    end)
    return true
  end
  bRG2.getFastRepStats = function()
    return {
      active = tbl8.active,
      tier = tbl7.tier,
      rate = tbl8.rate,
      minimumRate = tbl7.minimumRate,
      maximumRate = tbl7.maximumRate,
      maximumBurst = tbl7.maximumBurst,
      targetRate = tbl8.targetRate,
      activity = tbl8.activity,
      lastDelta = tbl8.lastDelta,
      pausedForPing = tbl8.pausedForPing,
      currentPing = tbl8.currentPing,
      peakPing = tbl8.peakPing,
      backpressureCount = tbl8.backpressureCount,
      momentumMultiplier = tbl8.momentumMultiplier,
      petRepBoost = tbl8.petRepBoost,
      sent = tbl8.sent,
      acceptedSamples = tbl8.acceptedSamples,
      stalledSamples = tbl8.stalledSamples,
    }
  end
  bRG2.startFastRepPump = startFastRepPump
  bRG2.stopFastRepPump = stopFastRepPump
end

local function fn18(arg)
  local tbl7 = {}
  for index, item in ipairs(arg) do
    tbl7[item:lower()] = true
  end
  for index, item in ipairs({ localPlayer.Character, localPlayer:FindFirstChild("Backpack") }) do
    if item then
      for index2, item2 in ipairs(item:GetChildren()) do
        if item2:IsA("Tool") and tbl7[item2.Name:lower()] then return item2 end
      end
    end
  end
  return nil
end

local function fn19()
  for key, value13 in pairs(tbl5) do
    if key and key.Parent then
      pcall(function()
        key.Value = value13
      end)
    end
    tbl5[key] = nil
  end
end

local function fn20(arg)
  if not arg then return false end
  for index, item in ipairs(arg:GetPlayingAnimationTracks()) do
    if tostring(item.Name):lower() == "rep" then
      pcall(item.AdjustSpeed, item, bRG2.fastRep and tbl6.fastAnimationSpeed or 1)
      return true
    end
  end
  return false
end
bRG2.captureTrainingMovement = function(arg, humanoid, arg2)
  local humanoidRootPart = arg:FindFirstChild("HumanoidRootPart")
  local lowerTorso = arg:FindFirstChild("LowerTorso")
  local root = lowerTorso and lowerTorso:FindFirstChild("Root")
  local rootRigAttachment = humanoidRootPart and humanoidRootPart:FindFirstChild("RootRigAttachment")
  local walkSpeed = humanoid.WalkSpeed
  if walkSpeed <= 0 then
    local agility = localPlayer:FindFirstChild("Agility")
    walkSpeed = math.clamp(16 + (agility and agility.Value or 0) / 75, 16, 500)
  end
  local jumpHeight = humanoid.UseJumpPower and humanoid.JumpPower or humanoid.JumpHeight
  if jumpHeight <= 0 then jumpHeight = humanoid.UseJumpPower and 50 or 7.2 end
  return {
    Humanoid = humanoid,
    WalkSpeed = walkSpeed,
    UsesJumpPower = humanoid.UseJumpPower,
    JumpValue = jumpHeight,
    RootJoint = arg2 and root and root:IsA("Motor6D") and root or nil,
    RootAttachment = rootRigAttachment,
    RootC0 = root and (rootRigAttachment and rootRigAttachment.CFrame or root.C0) or nil,
  }
end

local function fn21(arg)
  local character = localPlayer.Character
  local backpack = localPlayer:FindFirstChild("Backpack")
  if not character or not backpack or not arg then return end
  local tbl7 = {}
  for index, item in ipairs(arg) do
    tbl7[item:lower()] = true
  end
  for index, item in ipairs(character:GetChildren()) do
    if item:IsA("Tool") and tbl7[item.Name:lower()] then
      pcall(function()
        local text = item.Name:lower()
        local humanoid = character:FindFirstChildWhichIsA("Humanoid")
        if humanoid and (text == "pushups" or text == "pushup" or text == "situps" or text == "situp") then
          item:Deactivate()
          humanoid:UnequipTools()
        else
          item.Parent = backpack
        end
      end)
    end
  end
end

local function stopAutoTraining()
  local value13 = value11
  local value14 = value12
  bRG2.stopFastRepPump()
  bRG2.trainingMode = nil
  bRG2.autoWeight = false
  bRG2.autoHandstands = false
  bRG2.autoPushups = false
  bRG2.autoSitups = false
  localPlayer:SetAttribute("AutoLiftEnabled", false)
  if value8 then
    pcall(task.cancel, value8)
    value8 = nil
  end
  if value9 then
    value9:Disconnect()
    value9 = nil
  end
  if value10 then
    value10:Disconnect()
    value10 = nil
  end
  bRG2.requestTrainingJump = nil
  fn19()
  fn21(value14)
  value12 = nil
  value11 = nil
  local character = localPlayer.Character
  local humanoid = character and character:FindFirstChildWhichIsA("Humanoid")
  local humanoidRootPart = character and character:FindFirstChild("HumanoidRootPart")
  if humanoid and value13 and value13.Humanoid == humanoid then
    if value13.RootJoint and value13.RootJoint.Parent then
      local rootAttachment = value13.RootAttachment
      value13.RootJoint.C0 = rootAttachment and rootAttachment.Parent and rootAttachment.CFrame or value13.RootC0
    end
    if humanoidRootPart then humanoidRootPart.Anchored = false end
    humanoid.PlatformStand = false
    humanoid.Sit = false
    humanoid.WalkSpeed = value13.WalkSpeed
    if value13.UsesJumpPower then
      humanoid.JumpPower = value13.JumpValue
    else
      humanoid.JumpHeight = value13.JumpValue
    end
  end
end
bRG2.stopAutoTraining = stopAutoTraining
do
  local num = 0
  local value13 = nil

  local function fn22()
    local character = localPlayer.Character
    local humanoid = character and character:FindFirstChildWhichIsA("Humanoid")
    local humanoidRootPart = character and character:FindFirstChild("HumanoidRootPart")
    return character, humanoid, humanoidRootPart
  end
  local tbl7 = { humanoid = nil, tracks = {}, activeType = nil, activeMachine = nil }

  local function fn23(arg)
    for key, value14 in pairs(tbl7.tracks) do
      for key2, value15 in pairs(value14) do
        if value15 and value15.IsPlaying then pcall(value15.Stop, value15, arg or 0.1) end
      end
    end
    tbl7.activeType = nil
    tbl7.activeMachine = nil
  end

  local function destroyMachineAnimationTrack()
    fn23(0)
    for key, value14 in pairs(tbl7.tracks) do
      for key2, value15 in pairs(value14) do
        if value15 then pcall(value15.Destroy, value15) end
      end
    end
    tbl7.tracks = {}
    tbl7.humanoid = nil
  end

  local function fn24(arg)
    local result, humanoid = fn22()
    if not humanoid then return nil, nil end
    if tbl7.humanoid ~= humanoid then
      destroyMachineAnimationTrack()
      tbl7.humanoid = humanoid
    end
    local machineType = arg and arg:FindFirstChild("machineType")
    local machineType2 = machineType and tostring(machineType.Value) or nil
    if not machineType2 then return nil, nil end
    local item = tbl7.tracks[machineType2]
    if item then return item, machineType2 end
    local shared = replicatedStorage:FindFirstChild("shared")
    local assets = shared and shared:FindFirstChild("assets")
    local animations = assets and assets:FindFirstChild("animations")
    local gameAnims = animations and animations:FindFirstChild("gameAnims")
    local machines = gameAnims and gameAnims:FindFirstChild("Machines")
    local findFirstChild = machines and machines:FindFirstChild(machineType2)
    local animator = humanoid:FindFirstChildOfClass("Animator")
    local idle = findFirstChild and findFirstChild:FindFirstChild("idle")
    local rep = findFirstChild and findFirstChild:FindFirstChild("rep")
    if not animator or not idle or not rep then return nil, machineType2 end
    item = { idle = animator:LoadAnimation(idle), rep = animator:LoadAnimation(rep) }
    item.idle.Looped = true
    item.rep.Looped = false
    tbl7.tracks[machineType2] = item
    return item, machineType2
  end

  local function getIsPlaying(activeMachine)
    local result, activeType = fn24(activeMachine)
    if not result or not result.idle then return false end
    if tbl7.activeType ~= activeType then fn23(0.08) end
    tbl7.activeType = activeType
    tbl7.activeMachine = activeMachine
    if not result.idle.IsPlaying then pcall(result.idle.Play, result.idle, 0.1, 1, 1) end
    return result.idle.IsPlaying
  end

  local function getIsPlaying2(arg, arg2)
    local result = fn24(arg)
    if not result or not result.rep then return false end
    local num2 = tonumber(arg2) or 1
    if not arg2 then
      local ownedGamepasses = localPlayer:FindFirstChild("ownedGamepasses")
      if ownedGamepasses and ownedGamepasses:FindFirstChild("x2 Rep Time") then num2 = 2 end
    end
    num2 = math.clamp(num2, 0.25, 8)
    pcall(result.rep.Play, result.rep, 0.04, 1, num2)
    pcall(result.rep.AdjustSpeed, result.rep, num2)
    return result.rep.IsPlaying
  end
  bRG2.destroyMachineAnimationTracks = destroyMachineAnimationTrack

  local function fn25(arg)
    if not arg then return nil end
    local primaryPart = arg.PrimaryPart
    if not (primaryPart and primaryPart:IsA("Seat")) then
      primaryPart = arg:FindFirstChild("interactSeat", true)
    end
    return primaryPart and primaryPart:IsA("Seat") and primaryPart or nil
  end

  local function fn26(arg, arg2, arg3)
    if not arg or not arg.Parent or not arg2 or not arg2.Parent or not arg3 then return false end
    local machineInUse = localPlayer:FindFirstChild("machineInUse")
    return (machineInUse and machineInUse.Value == arg2) or arg3.SeatPart == arg2 or arg2.Occupant == arg3 or tonumber(arg:GetAttribute("InUseUserId")) == localPlayer.UserId
  end

  local function fn27(arg)
    local leaderstats = localPlayer:FindFirstChild("leaderstats")
    local findFirstChild = (leaderstats and leaderstats:FindFirstChild(arg)) or localPlayer:FindFirstChild(arg)
    if not findFirstChild then return nil end
    local ok, result = pcall(function()
      return findFirstChild.Value
    end)
    return ok and tonumber(result) or nil
  end

  local function fn28(arg)
    local machinesFolder = workspace:FindFirstChild("machinesFolder")
    local result, extra = fn22()
    local result2, extra2, extra3 = fn22()
    if not machinesFolder or type(arg) ~= "table" then return nil, nil end
    local position = arg.fallback and arg.fallback.Position
    local position2 = extra3 and extra3.Position or position
    local value14, value15, num2, num3, huge = nil, nil, -math.huge, -1, math.huge
    local children = arg.instance and { arg.instance } or machinesFolder:GetChildren()
    for index, item in ipairs(children) do
      if item:IsA("Model") and item.Name == arg.object then
        local result3 = fn25(item)
        local magnitude = result3 and position and (Vector3.new(result3.Position.X, 0, result3.Position.Z) - Vector3.new(position.X, 0, position.Z)).Magnitude or 0
        local num4 = tonumber(item:GetAttribute("InUseUserId"))
        local flag2 = result3 and magnitude <= 1400 and ((not result3.Occupant or result3.Occupant == extra) and (not num4 or num4 == localPlayer.UserId))
        if result3 and fn26(item, result3, extra) then return item, result3 end
        local num5 = 0
        local requirements = item:FindFirstChild("requirements")
        if flag2 and requirements then
          for index2, item2 in ipairs(requirements:GetChildren()) do
            if item2:IsA("ValueBase") then
              local result4 = fn27(item2.Name)
              local num6 = tonumber(item2.Value) or 0
              if result4 == nil or result4 < num6 then
                flag2 = false
                break
              end
              num5 = math.max(num5, num6)
            end
          end
        end
        if flag2 then
          local strengthGain = item:FindFirstChild("strengthGain")
          local num6 = tonumber(strengthGain and strengthGain.Value) or 0
          local magnitude2 = position2 and (result3.Position - position2).Magnitude or 0
          if num6 > num2 or (num6 == num2 and num5 > num3) or (num6 == num2 and num5 == num3 and magnitude2 < huge) then
            value14, value15 = item, result3
            num2, num3, huge = num6, num5, magnitude2
          end
        end
      end
    end
    return value14, value15
  end

  local function fn29(arg, arg2, arg3, arg4, arg5)
    if arg2 and arg2:IsA("BasePart") then
      local num2 = arg5 and arg5.Size.Y * 0.5 or 1
      local num3 = arg2.Size.Y * 0.5
      local num4 = arg4 and math.max(0.15, arg4.HipHeight * 0.12) or 0.25
      local num5 = math.clamp(num2 + num3 + num4, 1.8, 3.3)
      return arg2.CFrame * CFrame.new(0, num5, 0)
    end
    if arg then
      local ok, result = pcall(arg.GetPivot, arg)
      if ok then return result end
    end
    return arg3
  end

  local function fn30()
    fn23(0.1)
    local rEvents2 = replicatedStorage:FindFirstChild("rEvents")
    local machineInteractRemote = rEvents2 and rEvents2:FindFirstChild("machineInteractRemote")
    if machineInteractRemote and machineInteractRemote:IsA("RemoteFunction") then
      pcall(machineInteractRemote.InvokeServer, machineInteractRemote, "leaveMachine")
    end
    local result, extra = fn22()
    if extra then extra.Sit = false end
    bRG2.machineSeat = nil
    bRG2.machineModel = nil
  end

  local function fn31(arg)
    local result, extra, extra2 = fn22()
    local machineModel, machineSeat = fn28(arg)
    if not result or not extra or extra.Health <= 0 or not extra2 or not machineModel or not machineSeat then
      return false
    end
    if fn26(machineModel, machineSeat, extra) then
      bRG2.machineModel, bRG2.machineSeat = machineModel, machineSeat
      return true
    end
    local rEvents2 = replicatedStorage:FindFirstChild("rEvents")
    local machineInteractRemote = rEvents2 and rEvents2:FindFirstChild("machineInteractRemote")
    if not machineInteractRemote or not machineInteractRemote:IsA("RemoteFunction") then return false end
    for i = 1, 4 do
      if fn26(machineModel, machineSeat, extra) then
        bRG2.machineModel, bRG2.machineSeat = machineModel, machineSeat
        return true
      end
      if machineSeat.Occupant and machineSeat.Occupant ~= extra then break end
      local cFrame = fn29(machineModel, machineSeat, arg.fallback, extra, extra2)
      if not cFrame then break end
      extra2.Anchored = false
      pcall(result.PivotTo, result, cFrame)
      extra2.CFrame = cFrame
      extra2.AssemblyLinearVelocity = Vector3.zero
      extra2.AssemblyAngularVelocity = Vector3.zero
      runService.Heartbeat:Wait()
      task.wait(i == 1 and 0.1 or 0.06)
      local ok, result2 = pcall(machineInteractRemote.InvokeServer, machineInteractRemote, "useMachine", machineSeat)
      if not ok then break end
      if result2 == true then
        local num2 = os.clock() + math.clamp(0.35 + ((localPlayer:GetNetworkPing() or 0) * 1.5), 0.55, 1.4)
        repeat
          if fn26(machineModel, machineSeat, extra) then
            bRG2.machineModel, bRG2.machineSeat = machineModel, machineSeat
            return true
          end
          runService.Heartbeat:Wait()
        until os.clock() >= num2
      end
      machineModel, machineSeat = fn28(arg)
      if not machineModel or not machineSeat then break end
      if i < 4 then task.wait(0.22) end
    end
    return false
  end

  local function stopMachine(arg)
    num += 1
    if value13 then
      pcall(task.cancel, value13)
      value13 = nil
    end
    bRG2.stopFastRepPump()
    fn30()
    if arg ~= false then bRG2.machineDefinition = nil end
  end

  local function buildFullTrainDefinitions()
    local fullTrainDefinitions = {}
    for index, item in ipairs(tbl.Machines) do
      if not item.eventObject or workspace:FindFirstChild(item.eventObject) then
        fullTrainDefinitions[#fullTrainDefinitions + 1] = item
      end
    end
    local machinesFolder = workspace:FindFirstChild("machinesFolder")
    for index, item in ipairs(tbl.FullTrainAreas) do
      local tbl8 = {}
      for index2, item2 in ipairs(machinesFolder and machinesFolder:GetChildren() or {}) do
        if item2:IsA("Model") and item2:FindFirstChild("machineType") then
          local result = fn25(item2)
          local strengthGain = item2:FindFirstChild("strengthGain")
          local bestGain = tonumber(strengthGain and strengthGain.Value)
          local magnitude = result and (Vector3.new(result.Position.X, 0, result.Position.Z) - item.center).Magnitude
          if result and bestGain and magnitude <= 1400 then
            local item3 = tbl8[item2.Name]
            if not item3 or bestGain > item3.bestGain then
              tbl8[item2.Name] = {
                section = item.section,
                sectionOrder = index,
                label = item2.Name,
                object = item2.Name,
                bestGain = bestGain,
                fallback = result.CFrame,
              }
            end
          end
        end
      end
      local tbl9 = {}
      for key, value14 in pairs(tbl8) do
        tbl9[#tbl9 + 1] = value14
      end
      table.sort(tbl9, function(arg, arg2)
        if arg.bestGain ~= arg2.bestGain then return arg.bestGain > arg2.bestGain end
        return arg.label < arg2.label
      end)
      for index2, item2 in ipairs(tbl9) do
        fullTrainDefinitions[#fullTrainDefinitions + 1] = item2
      end
    end
    bRG2.fullTrainDefinitions = fullTrainDefinitions
    return fullTrainDefinitions
  end
  bRG2.stopMachine = stopMachine
  bRG2.buildFullTrainDefinitions = buildFullTrainDefinitions
  bRG2.setMachine = function(machineDefinition, arg)
    if not arg then
      if bRG2.machineDefinition == machineDefinition then stopMachine(true) end
      return true
    end
    stopAutoTraining()
    fn15()
    stopMachine(false)
    task.wait(0.12)
    bRG2.machineDefinition = machineDefinition
    num += 1
    local num2 = num
    value13 = task.spawn(function()
      local tbl8 = {}
      for key, value14 in pairs(machineDefinition) do
        tbl8[key] = value14
      end
      local instance = fn28(machineDefinition)
      if instance then tbl8.instance = instance end
      local num3 = 0
      local num4 = 0
      local num5 = 0
      while getgenv().BRG == bRG2 and parent and parent.Parent and bRG2.machineDefinition == machineDefinition and num == num2 do
        local result, extra = fn22()
        if not fn26(bRG2.machineModel, bRG2.machineSeat, extra) then
          if os.clock() >= num3 then
            if fn31(tbl8) then
              num3 = 0
            else
              num3 = os.clock() + 0.65
            end
          end
        else
          num3 = 0
          getIsPlaying(bRG2.machineModel)
          if bRG2.fastRep and not bRG2.fastRepPumpActive then bRG2.startFastRepPump() end
          if bRG2.fastRep and os.clock() - num5 >= 0.12 then
            getIsPlaying2(bRG2.machineModel, 8)
            num5 = os.clock()
          end
          if not bRG2.fastRep and os.clock() - num4 >= 0.65 then
            local muscleEvent = localPlayer:FindFirstChild("muscleEvent")
            if muscleEvent and muscleEvent:IsA("RemoteEvent") then
              pcall(muscleEvent.FireServer, muscleEvent, "rep", bRG2.machineSeat)
              getIsPlaying2(bRG2.machineModel)
              num4 = os.clock()
            end
          end
        end
        task.wait(0.03)
      end
      if num == num2 then value13 = nil end
    end)
    return true
  end
end

local function fn22(trainingMode, arg)
  if not fn18(arg) then return false end
  stopAutoTraining()
  if bRG2.fly then
    if value2 then value2(false, true) end
    value()
  end
  tbl3.enabled = false
  fn12()
  fn15()
  local character = localPlayer.Character
  local humanoid = character and character:FindFirstChildWhichIsA("Humanoid")
  if not humanoid then return false end
  local flag2 = trainingMode == "pushups" or trainingMode == "situps"
  value12 = trainingMode == "pushups" and { "Pushups", "Pushup", "Weight" } or arg
  bRG2.trainingMode = trainingMode
  bRG2.autoWeight = trainingMode == "weight"
  bRG2.autoHandstands = trainingMode == "handstands"
  bRG2.autoPushups = trainingMode == "pushups"
  bRG2.autoSitups = trainingMode == "situps"
  localPlayer:SetAttribute("AutoLiftEnabled", false)
  if bRG2.fastRep then bRG2.startFastRepPump() end
  value11 = bRG2.captureTrainingMovement(character, humanoid, flag2)
  local flag3 = false

  local function requestTrainingJump()
    if flag3 or getgenv().BRG ~= bRG2 or bRG2.trainingMode ~= trainingMode then return end
    flag3 = true
    task.defer(function()
      local character2 = localPlayer.Character
      local humanoid2 = character2 and character2:FindFirstChildWhichIsA("Humanoid")
      local humanoidRootPart = character2 and character2:FindFirstChild("HumanoidRootPart")
      if humanoid2 and humanoid2.Health > 0 and humanoidRootPart and humanoid2.FloorMaterial ~= Enum.Material.Air then
        local jumpPower = humanoid2.UseJumpPower and humanoid2.JumpPower or math.sqrt(2 * workspace.Gravity * math.max(humanoid2.JumpHeight, 0))
        local assemblyLinearVelocity = humanoidRootPart.AssemblyLinearVelocity
        humanoid2:ChangeState(Enum.HumanoidStateType.Jumping)
        humanoidRootPart.AssemblyLinearVelocity = Vector3.new(assemblyLinearVelocity.X, math.max(assemblyLinearVelocity.Y, jumpPower), assemblyLinearVelocity.Z)
      end
      task.defer(function()
        flag3 = false
      end)
    end)
  end
  bRG2.requestTrainingJump = requestTrainingJump
  value10 = userInputService.JumpRequest:Connect(requestTrainingJump)
  value9 = (flag2 and runService.PreSimulation or runService.Stepped):Connect(function()
    if getgenv().BRG ~= bRG2 or not parent or not parent.Parent then
      stopAutoTraining()
      return
    end
    if bRG2.trainingMode ~= trainingMode then return end
    local character2 = localPlayer.Character
    local humanoid2 = character2 and character2:FindFirstChildWhichIsA("Humanoid")
    local humanoidRootPart = character2 and character2:FindFirstChild("HumanoidRootPart")
    if not humanoid2 or humanoid2.Health <= 0 then return end
    if value11.Humanoid ~= humanoid2 then value11 = bRG2.captureTrainingMovement(character2, humanoid2, flag2) end
    local rootJoint = value11.RootJoint
    if rootJoint and rootJoint.Parent then
      local rootAttachment = value11.RootAttachment
      local rootC0 = rootAttachment and rootAttachment.Parent and rootAttachment.CFrame or value11.RootC0
      if rootJoint.C0 ~= rootC0 then rootJoint.C0 = rootC0 end
    end
    if humanoidRootPart and humanoidRootPart.Anchored then humanoidRootPart.Anchored = false end
    if humanoid2.PlatformStand then humanoid2.PlatformStand = false end
    if humanoid2.Sit then humanoid2.Sit = false end
    local walkSpeed = value11.WalkSpeed
    if walkSpeed and humanoid2.WalkSpeed < walkSpeed then humanoid2.WalkSpeed = walkSpeed end
    if value11.UsesJumpPower then
      if humanoid2.JumpPower < value11.JumpValue then humanoid2.JumpPower = value11.JumpValue end
    elseif humanoid2.JumpHeight < value11.JumpValue then
      humanoid2.JumpHeight = value11.JumpValue
    end
  end)
  value8 = task.spawn(function()
    local num = 0
    local value13 = nil
    while getgenv().BRG == bRG2 and bRG2.trainingMode == trainingMode and parent and parent.Parent do
      pcall(function()
        local result = fn18(arg)
        local flag4 = flag2
        if trainingMode == "pushups" then
          local requiredAmount = result and result:FindFirstChild("requiredAmount")
          local requiredType = requiredAmount and requiredAmount:FindFirstChild("requiredType")
          local requiredType2 = requiredType and tostring(requiredType.Value) or "Strength"
          local leaderstats = localPlayer:FindFirstChild("leaderstats")
          local findFirstChild = (leaderstats and leaderstats:FindFirstChild(requiredType2)) or localPlayer:FindFirstChild(requiredType2)
          local num2 = tonumber(requiredAmount and requiredAmount.Value) or 2000
          if not result or not findFirstChild or (tonumber(findFirstChild.Value) or 0) < num2 then
            result = fn18({ "Weight" })
            flag4 = false
          end
          if result ~= value13 then
            fn19()
            value13 = result
          end
        end
        if result then
          local character2 = localPlayer.Character
          local humanoid2 = character2 and character2:FindFirstChildWhichIsA("Humanoid")
          local humanoid3 = humanoid2 and humanoid2.Health > 0
          if flag4 then
            if not humanoid3 then return end
            if value11.Humanoid ~= humanoid2 then value11 = bRG2.captureTrainingMovement(character2, humanoid2, true) end
            if result.Parent ~= character2 then humanoid2:EquipTool(result) end
            local repTime = result:FindFirstChild("repTime", true)
            if bRG2.fastRep and repTime and repTime:IsA("ValueBase") then
              if tbl5[repTime] == nil then tbl5[repTime] = repTime.Value end
              repTime.Value = tbl6.fastRepTime
            end
            if os.clock() - num >= (bRG2.fastRep and tbl6.fastCycle or tbl6.normalCycle) then
              num = os.clock()
              result:Activate()
              result:Deactivate()
              if not fn20(humanoid2) then
                task.defer(function()
                  if bRG2.trainingMode == trainingMode then fn20(humanoid2) end
                end)
              end
            end
            return
          end
          if humanoid3 and result.Parent ~= character2 then humanoid2:EquipTool(result) end
          if humanoid3 and result.Parent == character2 then
            local repTime = result:FindFirstChild("repTime", true)
            if bRG2.fastRep and repTime and repTime:IsA("ValueBase") then
              if tbl5[repTime] == nil then tbl5[repTime] = repTime.Value end
              repTime.Value = tbl6.fastRepTime
            end
            if os.clock() - num >= (bRG2.fastRep and tbl6.fastCycle or tbl6.normalCycle) then
              num = os.clock()
              result:Activate()
              if not fn20(humanoid2) then
                task.defer(function()
                  if bRG2.trainingMode == trainingMode then fn20(humanoid2) end
                end)
              end
            end
          end
        end
      end)
      task.wait(0.03)
    end
  end)
  return true
end
local tbl7 = { ["rbxassetid://3638729053"] = true, ["rbxassetid://3638767427"] = true }

local function fn23(arg)
  if not arg or not arg.Animation then return false end
  local animationId = arg.Animation.AnimationId
  local text = tostring(arg.Name or ""):lower()
  return tbl7[animationId] or text:find("punch", 1, true) ~= nil or text:find("attack", 1, true) ~= nil
end

local function fn24(arg)
  if not arg or not arg:FindFirstChild("Humanoid") then return end
  for key, value13 in pairs(arg.Humanoid:GetPlayingAnimationTracks()) do
    if fn23(value13) then value13:Stop() end
  end
end
local flag2 = false
local value13 = nil
local value14 = nil
local value15 = nil
local value16 = nil
local tbl8 = {}

local function fn25()
  if not flag2 then return end
  local character = localPlayer.Character
  if not character or not character:FindFirstChild("Humanoid") then return end
  fn24(character)
  if value13 then value13:Disconnect() end
  value13 = character.Humanoid.AnimationPlayed:Connect(function(arg)
    if flag2 and fn23(arg) then arg:Stop() end
  end)
end

local function fn26(arg)
  if not flag2 or not arg or not (arg.Name == "Punch" or arg.Name:match("Attack")) then return end
  if tbl8[arg] then return end
  local connection = arg.Activated:Connect(function()
    task.wait(0.05)
    if flag2 then fn24(localPlayer.Character) end
  end)
  tbl8[arg] = connection
end

local function fn27()
  if flag2 then return end
  flag2 = true
  fn25()
  for key, value17 in pairs(localPlayer.Backpack:GetChildren()) do
    fn26(value17)
  end
  local character = localPlayer.Character
  if character then
    for key, value17 in pairs(character:GetChildren()) do
      if value17:IsA("Tool") then fn26(value17) end
    end
  end
  value15 = localPlayer.Backpack.ChildAdded:Connect(function(arg)
    if arg:IsA("Tool") then
      task.wait(0.1)
      fn26(arg)
    end
  end)
  local num = 0
  value14 = runService.Heartbeat:Connect(function()
    if flag2 then
      local now = os.clock()
      if now - num >= 0.5 then
        num = now
        fn24(localPlayer.Character)
      end
    end
  end)
  value16 = localPlayer.CharacterAdded:Connect(function(arg)
    if flag2 then
      task.wait(1)
      fn25()
      for key, value17 in pairs(arg:GetChildren()) do
        if value17:IsA("Tool") then fn26(value17) end
      end
    end
  end)
end

local function fn28()
  flag2 = false
  for key, value17 in pairs({ value13, value14, value15, value16 }) do
    if value17 then value17:Disconnect() end
  end
  value13 = nil
  value14 = nil
  value15 = nil
  value16 = nil
  for key, value17 in pairs(tbl8) do
    if value17 then value17:Disconnect() end
  end
  tbl8 = {}
end

local function fn29()
  local lighting = game:GetService("Lighting")
  pcall(function()
    lighting.GlobalShadows = false
    for index, item in ipairs(lighting:GetChildren()) do
      if item:IsA("BlurEffect") or item:IsA("DepthOfFieldEffect") or item:IsA("SunRaysEffect") then
        item.Enabled = false
      end
    end
    local young0xColorBoost = lighting:FindFirstChild("Young0xColorBoost")
    if not young0xColorBoost then
      young0xColorBoost = Instance.new("ColorCorrectionEffect")
      young0xColorBoost.Name = "Young0xColorBoost"
      young0xColorBoost.Parent = lighting
    end
    young0xColorBoost.Enabled = true
    young0xColorBoost.Saturation = 0.08
    young0xColorBoost.Contrast = 0.035
    young0xColorBoost.Brightness = 0.01
  end)

  local function fn30(arg)
    local parent2 = arg.Parent
    for i = 1, 7 do
      if not parent2 then break end
      local text = parent2.Name:lower()
      if text:find("pet", 1, true) or text:find("aura", 1, true) or text:find("pack", 1, true) or text:find("effect", 1, true) then
        return true
      end
      parent2 = parent2.Parent
    end
    return false
  end

  local function fn31(arg)
    if localPlayer.Character and arg:IsDescendantOf(localPlayer.Character) then return end
    pcall(function()
      if arg:IsA("ParticleEmitter") or arg:IsA("Trail") or arg:IsA("Beam") or arg:IsA("Fire") or arg:IsA("Smoke") or arg:IsA("Sparkles") then
        arg.Enabled = false
      elseif (arg:IsA("PointLight") or arg:IsA("SpotLight") or arg:IsA("SurfaceLight")) and fn30(arg) then
        arg.Enabled = false
      elseif arg:IsA("BasePart") then
        arg.CastShadow = false
      end
    end)
  end
  for index, item in ipairs(workspace:GetDescendants()) do
    fn31(item)
    if index % 180 == 0 then runService.Heartbeat:Wait() end
  end
  if bRG2.antiLagDescendantConnection then bRG2.antiLagDescendantConnection:Disconnect() end
  bRG2.antiLagDescendantConnection = workspace.DescendantAdded:Connect(function(arg)
    if bRG2.antiLagUsed then fn31(arg) end
  end)
  fn(bRG2.antiLagDescendantConnection)
end
local value17 = nil
local value18 = nil
local value19 = nil
value = function()
  bRG2.fly = false
  if value17 then
    value17:Disconnect()
    value17 = nil
  end
  if value18 then
    value18:Destroy()
    value18 = nil
  end
  if value19 then
    value19:Destroy()
    value19 = nil
  end
  pcall(function()
    local humanoid = localPlayer.Character and localPlayer.Character:FindFirstChildWhichIsA("Humanoid")
    if humanoid then
      humanoid.PlatformStand = false
      humanoid.AutoRotate = true
    end
  end)
end

local function fn30()
  value()
  bRG2.fly = true
  value17 = runService.Heartbeat:Connect(function()
    local character = localPlayer.Character
    local humanoid = character and character:FindFirstChildWhichIsA("Humanoid")
    local humanoidRootPart = character and character:FindFirstChild("HumanoidRootPart")
    local currentCamera = workspace.CurrentCamera
    if not bRG2.fly or not humanoid or not humanoidRootPart or not currentCamera then return end
    if not value18 or value18.Parent ~= humanoidRootPart then
      if value18 then value18:Destroy() end
      value18 = Instance.new("BodyGyro")
      value18.P = 9000
      value18.MaxTorque = Vector3.new(9e9, 9e9, 9e9)
      value18.Parent = humanoidRootPart
    end
    if not value19 or value19.Parent ~= humanoidRootPart then
      if value19 then value19:Destroy() end
      value19 = Instance.new("BodyVelocity")
      value19.MaxForce = Vector3.new(9e9, 9e9, 9e9)
      value19.Parent = humanoidRootPart
    end
    local num = 0
    if userInputService:IsKeyDown(Enum.KeyCode.Space) then
      num = 1
    elseif userInputService:IsKeyDown(Enum.KeyCode.LeftControl) then
      num = -1
    end
    if humanoid.Jump then num = 1 end
    local num2 = math.clamp(bRG2.flySpeed or 1, 1, 20)
    local num3 = 150 + (num2 - 1) * 7.5
    local zero = Vector3.zero
    if userInputService:IsKeyDown(Enum.KeyCode.W) then zero = zero + currentCamera.CFrame.LookVector end
    if userInputService:IsKeyDown(Enum.KeyCode.S) then zero = zero - currentCamera.CFrame.LookVector end
    if userInputService:IsKeyDown(Enum.KeyCode.D) then zero = zero + currentCamera.CFrame.RightVector end
    if userInputService:IsKeyDown(Enum.KeyCode.A) then zero = zero - currentCamera.CFrame.RightVector end
    if zero.Magnitude < 0.05 and humanoid.MoveDirection.Magnitude > 0.05 then zero = humanoid.MoveDirection end
    if zero.Magnitude > 0 then zero = zero.Unit end
    local velocity = (zero * num3) + Vector3.new(0, num * num3, 0)
    humanoid.PlatformStand = true
    humanoid.AutoRotate = false
    local vector3 = Vector3.new(zero.X, 0, zero.Z)
    if vector3.Magnitude < 0.05 then
      vector3 = Vector3.new(currentCamera.CFrame.LookVector.X, 0, currentCamera.CFrame.LookVector.Z)
    end
    if vector3.Magnitude > 0.05 then
      value18.CFrame = CFrame.lookAt(humanoidRootPart.Position, humanoidRootPart.Position + vector3.Unit, Vector3.new(0, 1, 0))
    end
    value19.Velocity = velocity
  end)
end
local parent2 = nil

local function fn31(stars)
  bRG2.stars = stars
  if not stars then
    pcall(function()
      runService:Set3dRenderingEnabled(true)
    end)
    if parent2 then
      parent2:Destroy()
      parent2 = nil
    end
    return
  end
  if parent2 then parent2:Destroy() end
  pcall(function()
    runService:Set3dRenderingEnabled(false)
  end)
  parent2 = Instance.new("ScreenGui")
  parent2.Name = "BRStarsMode"
  parent2.ResetOnSpawn = false
  parent2.IgnoreGuiInset = true
  parent2.DisplayOrder = 997
  parent2.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
  parent2.Parent = localPlayer.PlayerGui
  local frame = Instance.new("Frame")
  frame.Size = UDim2.new(1, 0, 1, 0)
  frame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
  frame.BorderSizePixel = 0
  frame.ZIndex = 1
  frame.Parent = parent2
  for i = 1, touchEnabled and 70 or 120 do
    local frame2 = Instance.new("Frame")
    local num = (i % 9 == 0) and 3 or ((i % 4 == 0) and 2 or 1)
    frame2.Size = UDim2.fromOffset(num, num)
    frame2.Position = UDim2.new(math.random(), 0, math.random(), 0)
    frame2.BackgroundColor3 = (i % 7 == 0) and colors.cyan or colors.white
    frame2.BackgroundTransparency = (i % 5 == 0) and 0.25 or 0
    frame2.BorderSizePixel = 0
    frame2.ZIndex = 2
    frame2.Parent = frame
    Instance.new("UICorner", frame2).CornerRadius = UDim.new(1, 0)
  end
end
local tbl9 = {}
local value20 = nil
bRG2.durabilityGuiConn = nil
bRG2.durabilityScanRun = 0

local function fn32(arg, arg2)
  if arg and arg:IsA("GuiObject") and arg.Name == "durabilityFrame" then
    if arg2 then
      if tbl9[arg] == nil then tbl9[arg] = arg.Visible end
      arg.Visible = false
    elseif tbl9[arg] ~= nil then
      arg.Visible = tbl9[arg]
      tbl9[arg] = nil
    end
  end
end
bRG2.hideFloatingDurabilityObject = function(arg)
  if not bRG2.hideDurability or not arg or not arg:IsA("GuiObject") or arg:IsDescendantOf(parent) then
    return
  end
  local str = ""
  if arg:IsA("TextLabel") or arg:IsA("TextButton") or arg:IsA("TextBox") then str = arg.Text or "" end
  local text = (arg.Name .. " " .. str):lower()
  local parent3 = arg.Parent
  while parent3 and parent3 ~= localPlayer.PlayerGui do
    text = text .. " " .. parent3.Name:lower()
    if parent3:IsA("TextLabel") or parent3:IsA("TextButton") or parent3:IsA("TextBox") then
      text = text .. " " .. (parent3.Text or ""):lower()
    end
    parent3 = parent3.Parent
  end
  local index = text:find("estad") or text:find("stats") or text:find("fuerza") or text:find("agilidad") or text:find("resistencia") or text:find("altura") or text:find("kos") or text:find("renacimientos") or text:find("peleas")
  local index2 = text:find("durabilidad") or text:find("durability")
  local flag3 = arg.AbsoluteSize.X <= 360 and arg.AbsoluteSize.Y <= 160
  if index2 and flag3 and not index then
    if tbl9[arg] == nil then tbl9[arg] = arg.Visible end
    arg.Visible = false
  end
end

local function fn33(hideDurability)
  hideDurability = hideDurability == true
  if bRG2.hideDurability == hideDurability then return end
  bRG2.durabilityScanRun += 1
  local durabilityScanRun = bRG2.durabilityScanRun
  bRG2.hideDurability = hideDurability
  if not hideDurability then
    for key, visible in pairs(tbl9) do
      if key and key.Parent then
        pcall(function()
          key.Visible = visible
        end)
      end
    end
    tbl9 = {}
    return
  end
  for index, item in ipairs(replicatedStorage:GetChildren()) do
    fn32(item, true)
  end
  if not value20 then
    value20 = replicatedStorage.ChildAdded:Connect(function(arg)
      if bRG2.hideDurability then
        task.defer(function()
          fn32(arg, true)
        end)
      end
    end)
  end
  if not bRG2.durabilityGuiConn then
    bRG2.durabilityGuiConn = localPlayer.PlayerGui.DescendantAdded:Connect(function(arg)
      if bRG2.hideDurability and arg:IsA("GuiObject") then task.defer(bRG2.hideFloatingDurabilityObject, arg) end
    end)
  end
  task.spawn(function()
    for index, item in ipairs(localPlayer.PlayerGui:GetDescendants()) do
      if not bRG2.hideDurability or bRG2.durabilityScanRun ~= durabilityScanRun then return end
      bRG2.hideFloatingDurabilityObject(item)
      if index % 60 == 0 then runService.Heartbeat:Wait() end
    end
  end)
end
local tbl10 = {}
local tbl11 = {}
bRG2.getPreferenceController = function()
  if bRG2.preferenceController then return bRG2.preferenceController end
  local client = replicatedStorage:FindFirstChild("client")
  local controllers = client and client:FindFirstChild("controllers")
  local playerPreferenceController = controllers and controllers:FindFirstChild("PlayerPreferenceController")
  if not playerPreferenceController or not playerPreferenceController:IsA("ModuleScript") then return nil end
  local ok, preferenceController = pcall(require, playerPreferenceController)
  if ok and type(preferenceController) == "table" then
    bRG2.preferenceController = preferenceController
    return preferenceController
  end
  return nil
end
bRG2.restoreManuallyHiddenOtherPets = function()
  for index, item in ipairs(tbl11) do
    pcall(function()
      item:Disconnect()
    end)
  end
  table.clear(tbl11)
  for key, parent3 in pairs(tbl10) do
    if key and parent3 and parent3.Parent then
      pcall(function()
        key.Parent = parent3
      end)
    end
    tbl10[key] = nil
  end
end

local function fn34(arg)
  if not bRG2.hideOtherPets or not arg or not arg:IsA("Model") then return end
  local parent3 = arg.Parent
  local player = parent3 and players:GetPlayerFromCharacter(parent3)
  if player and player ~= localPlayer and tbl10[arg] == nil then
    tbl10[arg] = parent3
    arg.Parent = nil
  end
end
bRG2.watchOtherPlayerPets = function(arg)
  if not bRG2.hideOtherPets or not arg or arg == localPlayer then return end

  local function fn35(arg2)
    if not bRG2.hideOtherPets or not arg2 then return end
    for index, item in ipairs(arg2:GetChildren()) do
      fn34(item)
    end
    tbl11[#tbl11 + 1] = arg2.ChildAdded:Connect(function(arg3)
      if bRG2.hideOtherPets and arg3:IsA("Model") then task.defer(fn34, arg3) end
    end)
  end
  if arg.Character then fn35(arg.Character) end
  tbl11[#tbl11 + 1] = arg.CharacterAdded:Connect(fn35)
end
bRG2.setOtherPetsHidden = function(arg)
  bRG2.hideOtherPets = arg == true
  local result = bRG2.getPreferenceController()
  local gameGui = localPlayer.PlayerGui:FindFirstChild("gameGui")
  gameGui = gameGui and gameGui:FindFirstChild("settingsMenu", true)
  gameGui = gameGui and gameGui:FindFirstChild("settingsFrame", true)
  local showOtherPetsSetting = gameGui and gameGui:FindFirstChild("showOtherPetsSetting")
  if result and showOtherPetsSetting and type(result.AreOtherPetsShown) == "function" and type(result.TogglePetSetting) == "function" then
    bRG2.restoreManuallyHiddenOtherPets()
    local ok, result2 = pcall(result.AreOtherPetsShown, result)
    local flag3 = not bRG2.hideOtherPets
    if ok and result2 ~= flag3 then
      local ok2 = pcall(result.TogglePetSetting, result, showOtherPetsSetting)
      if not ok2 then return false end
    end
    return true
  end
  if not bRG2.hideOtherPets then
    bRG2.restoreManuallyHiddenOtherPets()
    return true
  end
  bRG2.restoreManuallyHiddenOtherPets()
  for index, item in ipairs(players:GetPlayers()) do
    bRG2.watchOtherPlayerPets(item)
  end
  tbl11[#tbl11 + 1] = players.PlayerAdded:Connect(bRG2.watchOtherPlayerPets)
  return true
end
bRG2.setMyPetsHidden = function(arg)
  local showPetsEvent = rEvents and rEvents:FindFirstChild("showPetsEvent")
  if not showPetsEvent or not showPetsEvent:IsA("RemoteEvent") then return false end
  bRG2.hideMyPets = arg == true
  local flag3 = localPlayer:GetAttribute("PetsVisible") == true
  if flag3 == bRG2.hideMyPets then showPetsEvent:FireServer(bRG2.hideMyPets and "hidePets" or "showPets") end
  return true
end
bRG2.setFramesHidden = function(arg)
  local flag3 = arg == true
  fn33(flag3)
  local flag4 = localPlayer:GetAttribute("ShowPopups") ~= false
  local flag5 = not flag3
  if flag4 ~= flag5 then
    localPlayer:SetAttribute("ShowPopups", flag5)
    local savePlayerSizeEvent = rEvents and rEvents:FindFirstChild("savePlayerSizeEvent")
    if savePlayerSizeEvent and savePlayerSizeEvent:IsA("RemoteEvent") then
      savePlayerSizeEvent:FireServer("showPopupsOption")
    end
  end
  return true
end
do
  bRG2.shellUiRoot = localPlayer.PlayerGui
  pcall(function()
    local _G2 = getgenv and getgenv() or _G
    local getHiddenGui = _G2 and (_G2.gethui or _G2.get_hidden_gui)
    if type(getHiddenGui) == "function" then
      local hiddenGui = getHiddenGui()
      if typeof(hiddenGui) == "Instance" then bRG2.shellUiRoot = hiddenGui end
    end
  end)
  for index, item in ipairs(localPlayer.PlayerGui:GetChildren()) do
    if item:IsA("ScreenGui") then
      local text = item.Name:lower()
      if text:find("brhub") or text:find("brafk") or text:find("brstars") or text:find("bugeo") or text:find("fastglitch") then
        item:Destroy()
      end
    end
  end
  if bRG2.shellUiRoot ~= localPlayer.PlayerGui then
    pcall(function()
      local bRHub = bRG2.shellUiRoot:FindFirstChild("BRHub")
      if bRHub then bRHub:Destroy() end
    end)
  end
end
local hubW = uI.hubW
local hubH = uI.hubH
local titleH = uI.titleH
local tabH = uI.tabH
local tabY = uI.tabY
local num = 0
local num2 = tabY + tabH + 1
parent = Instance.new("ScreenGui")
parent.Name = "BRHub"
parent.ResetOnSpawn = false
parent.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
parent.DisplayOrder = 2147483647
parent.IgnoreGuiInset = true
parent:SetAttribute("Young0x", by)
parent.Parent = localPlayer.PlayerGui
bRG2.ScreenGui = parent
fn(parent.Destroying:Connect(function()
  stopAutoTraining()
  if bRG2.stopMachine then bRG2.stopMachine(true) end
  fn12()
  fn15()
  if bRG2.restorePerformance then bRG2.restorePerformance() end
  if bRG2.setOtherPetsHidden then bRG2.setOtherPetsHidden(false) end
  if bRG2.hideMyPets and bRG2.setMyPetsHidden then bRG2.setMyPetsHidden(false) end
end))
do
  local tbl12 = { "", "K", "M", "B", "T", "QA", "QI", "SX", "SP", "OC", "NO", "DC" }

  local function fn35(arg)
    local findFirstChild = localPlayer:FindFirstChild(arg)
    if not findFirstChild then
      local leaderstats = localPlayer:FindFirstChild("leaderstats")
      findFirstChild = leaderstats and leaderstats:FindFirstChild(arg)
    end
    return tonumber(findFirstChild and findFirstChild.Value) or 0
  end

  local function fn36(arg)
    arg = tonumber(arg) or 0
    local str = arg < 0 and "-" or ""
    arg = math.abs(arg)
    local num3 = 1
    while arg >= 1000 and num3 < #tbl12 do
      arg /= 1000
      num3 += 1
    end
    local v
    if num3 == 1 then
      v = tostring(math.floor(arg + 0.5))
    else
      v = string.format(arg >= 100 and "%.1f" or "%.2f", arg):gsub("%.?0+$", "")
    end
    return str .. v .. tbl12[num3]
  end

  local function fn37()
    if bRG2.machineDefinition and bRG2.machineDefinition.eventObject == "OverchargedMap" then return true end
    if bRG2.selectedRockDefinition and bRG2.selectedRockDefinition.eventObject == "OverchargedMap" then
      return true
    end
    local overchargedMap = workspace:FindFirstChild("OverchargedMap")
    local character = localPlayer.Character
    local humanoidRootPart = character and character:FindFirstChild("HumanoidRootPart")
    if not overchargedMap or not humanoidRootPart then return false end
    local ok, result, result2 = pcall(overchargedMap.GetBoundingBox, overchargedMap)
    if not ok then return false end
    local pointToObjectSpace = result:PointToObjectSpace(humanoidRootPart.Position)
    return math.abs(pointToObjectSpace.X) <= result2.X * 0.5 and math.abs(pointToObjectSpace.Y) <= result2.Y * 0.5 and math.abs(pointToObjectSpace.Z) <= result2.Z * 0.5
  end
  bRG2.updateOverchargedVisual = function()
    local playerGui = localPlayer:FindFirstChild("PlayerGui")
    local gameGui = playerGui and playerGui:FindFirstChild("gameGui")
    local hudNewMenu = gameGui and gameGui:FindFirstChild("hudNewMenu")
    local top = hudNewMenu and hudNewMenu:FindFirstChild("Top")
    local infoSlots = top and top:FindFirstChild("InfoSlots")
    local gemSlot = infoSlots and infoSlots:FindFirstChild("GemSlot")
    local icon = gemSlot and gemSlot:FindFirstChild("Icon")
    local amnt = gemSlot and gemSlot:FindFirstChild("Amnt")
    if not gemSlot or not icon or not amnt then return false end
    if fn37() then
      local color3 = Color3.fromRGB(196, 92, 255)
      local young0xCrystalTextLimit = amnt:FindFirstChild("Young0xCrystalTextLimit")
      if not young0xCrystalTextLimit then
        young0xCrystalTextLimit = Instance.new("UITextSizeConstraint")
        young0xCrystalTextLimit.Name = "Young0xCrystalTextLimit"
        young0xCrystalTextLimit.MinTextSize = 12
        young0xCrystalTextLimit.Parent = amnt
      end
      local currentCamera = workspace.CurrentCamera
      young0xCrystalTextLimit.MaxTextSize = currentCamera and currentCamera.ViewportSize.X < 760 and 30 or 52
      gemSlot.ImageColor3 = color3
      icon.Image = "rbxassetid://112165955937333"
      amnt.TextColor3 = color3
      amnt.TextScaled = true
      amnt.Text = fn36(fn35("OverchargedShards"))
      return true
    end
    local young0xCrystalTextLimit = amnt:FindFirstChild("Young0xCrystalTextLimit")
    if young0xCrystalTextLimit then young0xCrystalTextLimit:Destroy() end
    gemSlot.ImageColor3 = Color3.fromRGB(255, 255, 255)
    icon.Image = "rbxassetid://77187407973131"
    amnt.TextColor3 = Color3.fromRGB(0, 3, 66)
    amnt.TextScaled = true
    amnt.Text = fn36(fn35("Gems"))
    return false
  end
  pcall(runService.UnbindFromRenderStep, runService, "Young0xPTOverchargedVisual")
  runService:BindToRenderStep("Young0xPTOverchargedVisual", Enum.RenderPriority.Last.Value + 100, function()
    if getgenv().BRG == bRG2 and parent and parent.Parent then bRG2.updateOverchargedVisual() end
  end)
  fn(parent.Destroying:Connect(function()
    pcall(runService.UnbindFromRenderStep, runService, "Young0xPTOverchargedVisual")
  end))
end
local frame = Instance.new("Frame")
frame.Name = "Shadow"
frame.Size = UDim2.fromOffset(hubW + 10, hubH + 10)
frame.Position = UDim2.new(0.5, -(hubW / 2) - 5, 0.5, -(hubH / 2) - 5)
frame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
frame.BackgroundTransparency = 0.52
frame.BorderSizePixel = 0
frame.ZIndex = 1
frame.Parent = parent
frame.Visible = false
Instance.new("UICorner", frame).CornerRadius = UDim.new(0, 13)
local frame2 = Instance.new("Frame")
frame2.Name = "MainFrame"
frame2.Size = UDim2.fromOffset(hubW, hubH)
frame2.Position = UDim2.new(0.5, -hubW / 2, 0.5, -hubH / 2)
frame2.BackgroundColor3 = colors.bg
frame2.BackgroundTransparency = 0.02
frame2.BorderSizePixel = 0
frame2.ZIndex = 2
frame2.ClipsDescendants = true
frame2.Active = true
frame2.Draggable = false
frame2.Parent = parent
frame2:SetAttribute("Young0x", by)
frame2:SetAttribute("Young0xBuild", "PublicTraining-Overcharge")
Instance.new("UICorner", frame2).CornerRadius = UDim.new(0, 11)
do
  local imageLabel = Instance.new("ImageLabel")
  imageLabel.Name = "BackgroundArt"
  imageLabel.Size = UDim2.fromScale(1, 1)
  imageLabel.BackgroundTransparency = 1
  imageLabel.BorderSizePixel = 0
  imageLabel.Image = tbl.BackgroundAsset
  imageLabel.ImageColor3 = Color3.fromRGB(204, 211, 255)
  imageLabel.ImageTransparency = 0.48
  imageLabel.ScaleType = Enum.ScaleType.Crop
  imageLabel.ZIndex = 2
  imageLabel.Parent = frame2
  Instance.new("UICorner", imageLabel).CornerRadius = UDim.new(0, 11)
  local frame3 = Instance.new("Frame")
  frame3.Name = "BackgroundShade"
  frame3.Size = UDim2.fromScale(1, 1)
  frame3.BackgroundColor3 = Color3.fromRGB(4, 5, 13)
  frame3.BackgroundTransparency = 0.34
  frame3.BorderSizePixel = 0
  frame3.ZIndex = 2
  frame3.Parent = frame2
  Instance.new("UICorner", frame3).CornerRadius = UDim.new(0, 11)
end
local uIGradient = Instance.new("UIGradient", frame2)
uIGradient.Color = ColorSequence.new(colors.bg)
local frame3 = Instance.new("Frame")
frame3.Name = "BorderOverlay"
frame3.Size = UDim2.fromOffset(hubW, hubH)
frame3.Position = frame2.Position
frame3.BackgroundTransparency = 1
frame3.BorderSizePixel = 0
frame3.Active = false
frame3.Selectable = false
frame3.ZIndex = 100
frame3.Parent = parent
frame3.Visible = false
Instance.new("UICorner", frame3).CornerRadius = UDim.new(0, 11)
local uIStroke = Instance.new("UIStroke", frame3)
uIStroke.Parent = frame2
uIStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
uIStroke.Color = Color3.fromRGB(144, 126, 255)
uIStroke.Thickness = 1
uIStroke.Transparency = 0.12
uIStroke.LineJoinMode = Enum.LineJoinMode.Round
local position = frame2.Position
local position2 = frame.Position
local num3 = math.floor(hubW * 0.86)
local num4 = math.floor(hubH * 0.86)

local function fn35()
  frame2.Size = UDim2.fromOffset(num3, num4)
  frame2.Position = UDim2.new(position.X.Scale, position.X.Offset + (hubW - num3) / 2, position.Y.Scale, position.Y.Offset + (hubH - num4) / 2)
  frame2.BackgroundTransparency = 0.42
  frame3.Size = UDim2.fromOffset(num3, num4)
  frame3.Position = frame2.Position
  frame.Size = UDim2.fromOffset(num3 + 10, num4 + 10)
  frame.Position = UDim2.new(position2.X.Scale, position2.X.Offset + (hubW - num3) / 2, position2.Y.Scale, position2.Y.Offset + (hubH - num4) / 2)
  frame.BackgroundTransparency = 1
  uIStroke.Transparency = 0.65
  tweenService:Create(frame2, TweenInfo.new(0.36, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
    Size = UDim2.fromOffset(hubW, hubH),
    Position = position,
    BackgroundTransparency = 0.02,
  }):Play()
  tweenService:Create(
    frame3,
    TweenInfo.new(0.36, Enum.EasingStyle.Back, Enum.EasingDirection.Out),
    { Size = UDim2.fromOffset(hubW, hubH), Position = position }
  ):Play()
  tweenService:Create(frame, TweenInfo.new(0.36, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
    Size = UDim2.fromOffset(hubW + 10, hubH + 10),
    Position = position2,
    BackgroundTransparency = 0.72,
  }):Play()
  tweenService:Create(uIStroke, TweenInfo.new(0.28), { Transparency = 0 }):Play()
end
local frame4 = Instance.new("Frame")
frame4.Name = "TitleBar"
frame4.Size = UDim2.new(1, 0, 0, titleH)
frame4.BackgroundColor3 = Color3.fromRGB(11, 12, 13)
frame4.BackgroundTransparency = 1
frame4.BorderSizePixel = 0
frame4.ZIndex = 3
frame4.ClipsDescendants = true
frame4.Active = true
frame4.Parent = frame2
Instance.new("UICorner", frame4).CornerRadius = UDim.new(0, 11)
local frame5 = Instance.new("Frame")
frame5.Name = "HeaderBottomPatch"
frame5.Size = UDim2.new(1, 0, 0, 12)
frame5.Position = UDim2.new(0, 0, 0, tabY - 12)
frame5.BackgroundColor3 = Color3.fromRGB(11, 12, 13)
frame5.BackgroundTransparency = 1
frame5.BorderSizePixel = 0
frame5.ZIndex = 2
frame5.Parent = frame2
local textLabel = Instance.new("TextLabel")
textLabel.AnchorPoint = Vector2.new(0.5, 0)
textLabel.Size = UDim2.new(1, touchEnabled and -150 or -260, 0, touchEnabled and 24 or 27)
textLabel.Position = UDim2.new(0.5, 0, 0, 1)
textLabel.BackgroundTransparency = 1
textLabel.Text = tbl.Texts.title
textLabel.TextColor3 = colors.white
textLabel.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
textLabel.TextStrokeTransparency = 0.72
textLabel.Font = Enum.Font.GothamBlack
textLabel.TextSize = touchEnabled and 18 or 22
textLabel.TextXAlignment = Enum.TextXAlignment.Center
textLabel.TextYAlignment = Enum.TextYAlignment.Center
textLabel.ZIndex = 6
textLabel.Active = true
textLabel.Parent = frame4
local uIStroke2 = Instance.new("UIStroke", textLabel)
uIStroke2.Color = Color3.fromRGB(255, 255, 255)
uIStroke2.Thickness = 0.55
uIStroke2.Transparency = 0.58
bRG2.shellUI = bRG2.shellUI or {}
bRG2.shellUI.isCloseConfirmationOpen = function()
  return type(bRG2.shellUI.closeConfirmationOpen) == "function" and bRG2.shellUI.closeConfirmationOpen()
end
do
  local uIGradient2 = Instance.new("UIGradient")
  uIGradient2.Name = "GrayscaleSheen"
  uIGradient2.Color = ColorSequence.new({
    ColorSequenceKeypoint.new(0, Color3.fromRGB(142, 125, 232)),
    ColorSequenceKeypoint.new(0.20, Color3.fromRGB(191, 203, 255)),
    ColorSequenceKeypoint.new(0.38, Color3.fromRGB(242, 246, 255)),
    ColorSequenceKeypoint.new(0.50, Color3.fromRGB(249, 250, 252)),
    ColorSequenceKeypoint.new(0.62, Color3.fromRGB(211, 245, 255)),
    ColorSequenceKeypoint.new(0.80, Color3.fromRGB(137, 211, 255)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(123, 102, 224)),
  })
  uIGradient2.Offset = Vector2.new(-0.62, 0)
  uIGradient2.Rotation = 0
  uIGradient2.Parent = textLabel
  local tween = tweenService:Create(
    uIGradient2,
    TweenInfo.new(2.55, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut, -1, true),
    { Offset = Vector2.new(0.62, 0) }
  )
  tween:Play()
  tweenService:Create(
    uIStroke2,
    TweenInfo.new(1.7, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut, -1, true),
    { Transparency = 0.28, Color = Color3.fromRGB(144, 194, 255) }
  ):Play()
  bRG2.shellUI.titleSheen = uIGradient2
end
do
  local textLabel2 = Instance.new("TextLabel")
  textLabel2.Name = "Subtitle"
  textLabel2.AnchorPoint = Vector2.new(0.5, 0)
  textLabel2.Size = UDim2.new(1, touchEnabled and -150 or -260, 0, 23)
  textLabel2.Position = UDim2.new(0.5, 0, 0, touchEnabled and 23 or 25)
  textLabel2.BackgroundTransparency = 1
  textLabel2.Text = "Public Training"
  textLabel2.TextColor3 = Color3.fromRGB(151, 153, 158)
  textLabel2.Font = Enum.Font.GothamMedium
  textLabel2.TextSize = touchEnabled and 9 or 11
  textLabel2.TextXAlignment = Enum.TextXAlignment.Center
  textLabel2.ZIndex = 8
  textLabel2.Active = true
  textLabel2.Parent = frame4
  local uIGradient2 = Instance.new("UIGradient")
  uIGradient2.Name = "SubtitleAura"
  uIGradient2.Color = ColorSequence.new({
    ColorSequenceKeypoint.new(0, Color3.fromRGB(126, 106, 220)),
    ColorSequenceKeypoint.new(0.5, Color3.fromRGB(220, 229, 255)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(103, 201, 255)),
  })
  uIGradient2.Offset = Vector2.new(-0.8, 0)
  uIGradient2.Parent = textLabel2
  tweenService:Create(
    uIGradient2,
    TweenInfo.new(3.1, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut, -1, true),
    { Offset = Vector2.new(0.8, 0) }
  ):Play()
  bRG2.shellUI.subtitle = textLabel2
end
do
  local textLabel2 = Instance.new("TextLabel")
  textLabel2.Name = "CopyNotice"
  textLabel2.AnchorPoint = Vector2.new(0.5, 0)
  textLabel2.Size = UDim2.new(1, touchEnabled and -150 or -260, 0, 11)
  textLabel2.Position = UDim2.new(0.5, 0, 0, touchEnabled and 43 or 45)
  textLabel2.BackgroundTransparency = 1
  textLabel2.Text = "Link copiado"
  textLabel2.TextColor3 = Color3.fromRGB(62, 235, 111)
  textLabel2.TextTransparency = 1
  textLabel2.Font = Enum.Font.GothamMedium
  textLabel2.TextSize = touchEnabled and 7 or 8
  textLabel2.TextXAlignment = Enum.TextXAlignment.Center
  textLabel2.Visible = false
  textLabel2.ZIndex = 20
  textLabel2.Active = true
  textLabel2.Parent = frame2
  bRG2.shellUI.copyNotice = textLabel2
end
do
  local function fn36(parent3, scale, textColor3, textColor32)
    local uIScale = Instance.new("UIScale")
    uIScale.Scale = 1
    uIScale.Parent = parent3
    fn(parent3.MouseEnter:Connect(function()
      tweenService:Create(uIScale, timing.tween, { Scale = scale }):Play()
      if textColor3 then tweenService:Create(parent3, timing.tween, { TextColor3 = textColor3 }):Play() end
    end))
    fn(parent3.MouseLeave:Connect(function()
      tweenService:Create(uIScale, timing.tween, { Scale = 1 }):Play()
      if textColor32 then tweenService:Create(parent3, timing.tween, { TextColor3 = textColor32 }):Play() end
    end))
  end
  fn36(textLabel, 1.025, colors.white, colors.white)
  fn36(bRG2.shellUI.subtitle, 1.04, Color3.fromRGB(188, 190, 195), Color3.fromRGB(151, 153, 158))
  fn36(bRG2.shellUI.copyNotice, 1.04, Color3.fromRGB(91, 255, 139), Color3.fromRGB(62, 235, 111))
end
local textButton = Instance.new("TextButton")
textButton.Name = "HeaderHitbox"
textButton.Size = UDim2.new(1, touchEnabled and -91 or -105, 1, 0)
textButton.Position = UDim2.fromOffset(touchEnabled and 50 or 58, 0)
textButton.BackgroundTransparency = 1
textButton.Text = ""
textButton.AutoButtonColor = false
textButton.BorderSizePixel = 0
textButton.ZIndex = 5
textButton.Parent = frame4
do
  local function fn36(name, arg, arg2)
    local textButton2 = Instance.new("TextButton")
    textButton2.Name = name
    textButton2.AnchorPoint = Vector2.new(1, 0.5)
    textButton2.Size = UDim2.fromOffset(arg, touchEnabled and 32 or 36)
    textButton2.Position = UDim2.new(1, arg2, 0, titleH / 2)
    textButton2.BackgroundTransparency = 1
    textButton2.AutoButtonColor = false
    textButton2.TextColor3 = colors.white
    textButton2.Font = Enum.Font.GothamMedium
    textButton2.TextSize = touchEnabled and 19 or 22
    textButton2.BorderSizePixel = 0
    textButton2.ZIndex = 9
    textButton2.Parent = frame4
    local uIScale = Instance.new("UIScale", textButton2)
    fn(textButton2.MouseEnter:Connect(function()
      if name == "Close" and bRG2.shellUI.isCloseConfirmationOpen() then
        uIScale.Scale = 1
        return
      end
      tweenService:Create(uIScale, timing.tween, { Scale = 1.14 }):Play()
    end))
    fn(textButton2.MouseLeave:Connect(function()
      tweenService:Create(uIScale, timing.tween, { Scale = 1 }):Play()
    end))
    return textButton2, uIScale
  end
  local closeButton, extra = fn36("Close", touchEnabled and 34 or 38, touchEnabled and -7 or -9)
  closeButton.Size = UDim2.fromOffset(touchEnabled and 34 or 38, touchEnabled and 34 or 38)
  closeButton.Text = "X"
  closeButton.Font = Enum.Font.GothamBold
  closeButton.TextSize = touchEnabled and 38 or 44
  closeButton.TextScaled = true
  local imageLabel = Instance.new("ImageLabel")
  imageLabel.Name = "YouTubeIcon"
  imageLabel.AnchorPoint = Vector2.new(0.5, 0.5)
  imageLabel.Size = UDim2.fromScale(0.94, 0.94)
  imageLabel.Position = UDim2.fromScale(0.5, 0.5)
  imageLabel.BackgroundTransparency = 1
  imageLabel.Image = "rbxthumb://type=Asset&id=85469926655680&w=420&h=420"
  imageLabel.ImageColor3 = colors.white
  imageLabel.ImageTransparency = 1
  imageLabel.ScaleType = Enum.ScaleType.Fit
  imageLabel.ZIndex = closeButton.ZIndex + 1
  imageLabel.Parent = closeButton
  bRG2.shellUI.youtubeIcon = imageLabel
  bRG2.shellUI.closeHovering = false
  local value21 = nil
  local num5 = 0
  fn(closeButton.MouseEnter:Connect(function()
    if flag then
      bRG2.shellUI.closeHovering = false
      closeButton.Rotation = 0
      return
    end
    if bRG2.shellUI.isCloseConfirmationOpen() then
      bRG2.shellUI.closeHovering = false
      extra.Scale = 1
      return
    end
    bRG2.shellUI.closeHovering = true
    tweenService:Create(extra, timing.tween, { Scale = 1.12 }):Play()
    if value21 or os.clock() < num5 then return end
    num5 = os.clock() + 2
    if bRG2.shellUI.closeSpinConnection then
      bRG2.shellUI.closeSpinConnection:Disconnect()
      bRG2.shellUI.closeSpinConnection = nil
    end
    if value21 then value21:Cancel() end
    closeButton.Rotation = 0
    value21 = tweenService:Create(closeButton, TweenInfo.new(1.12, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), { Rotation = 360 })
    local value22 = value21
    bRG2.shellUI.closeSpinConnection = value22.Completed:Connect(function(arg)
      if value21 ~= value22 then return end
      value21 = nil
      if bRG2.shellUI.closeSpinConnection then
        bRG2.shellUI.closeSpinConnection:Disconnect()
        bRG2.shellUI.closeSpinConnection = nil
      end
      if arg == Enum.PlaybackState.Completed and closeButton.Parent then closeButton.Rotation = 0 end
    end)
    value21:Play()
  end))
  fn(closeButton.MouseLeave:Connect(function()
    bRG2.shellUI.closeHovering = false
    tweenService:Create(extra, timing.tween, { Scale = 1 }):Play()
    if bRG2.shellUI.isCloseConfirmationOpen() then extra.Scale = 1 end
  end))
  local imageButton = Instance.new("ImageButton")
  imageButton.Name = "Discord"
  imageButton.Size = UDim2.fromOffset(touchEnabled and 30 or 36, touchEnabled and 30 or 36)
  imageButton.Position = UDim2.fromOffset(touchEnabled and 16 or 18, math.floor((titleH - (touchEnabled and 30 or 36)) / 2))
  imageButton.BackgroundTransparency = 1
  imageButton.AutoButtonColor = false
  imageButton.Image = getgenv().Young0xResolveDiscordIcon()
  imageButton.ImageColor3 = colors.white
  imageButton.ScaleType = Enum.ScaleType.Fit
  imageButton.ZIndex = 20
  imageButton.Parent = frame4
  pcall(function()
    if type(isfile) == "function" and type(getcustomasset) == "function" and isfile("Young0xHub/discord-white.png") then
      imageButton.Image = getcustomasset("Young0xHub/discord-white.png")
    end
  end)
  local uIScale = Instance.new("UIScale", imageButton)
  fn(imageButton.MouseEnter:Connect(function()
    if bRG2.shellUI.isCloseConfirmationOpen() then
      uIScale.Scale = 1
      return
    end
    tweenService:Create(uIScale, timing.tween, { Scale = 1.12 }):Play()
  end))
  fn(imageButton.MouseLeave:Connect(function()
    tweenService:Create(uIScale, timing.tween, { Scale = 1 }):Play()
  end))
  fn(imageButton.Activated:Connect(function()
    if bRG2.shellUI.isCloseConfirmationOpen() then return end
    pcall(function()
      if setclipboard then setclipboard(tbl.Texts.discordInvite) end
    end)
    if bRG2.showDiscordCopied then bRG2.showDiscordCopied() end
  end))
  bRG2.shellUI.closeButton = closeButton
  bRG2.shellUI.discordButton = imageButton
  bRG2.shellUI.cancelCloseAnimation = function()
    bRG2.shellUI.closeHovering = false
    if bRG2.shellUI.closeSpinConnection then
      bRG2.shellUI.closeSpinConnection:Disconnect()
      bRG2.shellUI.closeSpinConnection = nil
    end
    if value21 then value21:Cancel() end
    value21 = nil
    closeButton.Rotation = 0
    extra.Scale = 1
  end
  bRG2.shellUI.setMinimizedHeader = function(arg)
    if bRG2.shellUI.closeSpinConnection then
      bRG2.shellUI.closeSpinConnection:Disconnect()
      bRG2.shellUI.closeSpinConnection = nil
    end
    if value21 then value21:Cancel() end
    value21 = nil
    closeButton.Rotation = 0
    tweenService:Create(
      closeButton,
      TweenInfo.new(0.18, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
      { TextTransparency = arg and 1 or 0 }
    ):Play()
    tweenService:Create(
      imageLabel,
      TweenInfo.new(0.18, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
      { ImageTransparency = arg and 0 or 1 }
    ):Play()
  end
end
local scrollingFrame = Instance.new("ScrollingFrame")
scrollingFrame.Name = "TabBar"
scrollingFrame.Size = UDim2.new(1, 0, 0, tabH)
scrollingFrame.Position = UDim2.new(0, 0, 0, tabY)
scrollingFrame.BackgroundColor3 = Color3.fromRGB(11, 12, 13)
scrollingFrame.BackgroundTransparency = 1
scrollingFrame.BorderSizePixel = 0
scrollingFrame.ZIndex = 3
scrollingFrame.ClipsDescendants = true
scrollingFrame.ScrollingDirection = Enum.ScrollingDirection.X
scrollingFrame.AutomaticCanvasSize = Enum.AutomaticSize.X
scrollingFrame.CanvasSize = UDim2.fromOffset(0, 0)
scrollingFrame.ScrollBarThickness = 0
scrollingFrame.ElasticBehavior = Enum.ElasticBehavior.WhenScrollable
scrollingFrame.ScrollingEnabled = true
scrollingFrame.Parent = frame2
local uIListLayout = Instance.new("UIListLayout", scrollingFrame)
uIListLayout.FillDirection = Enum.FillDirection.Horizontal
uIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Left
uIListLayout.VerticalAlignment = Enum.VerticalAlignment.Center
uIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
uIListLayout.Padding = UDim.new(0, touchEnabled and 3 or 5)
local uIPadding = Instance.new("UIPadding", scrollingFrame)
uIPadding.PaddingLeft = UDim.new(0, touchEnabled and 8 or 12)
uIPadding.PaddingRight = UDim.new(0, touchEnabled and 8 or 12)
local frame6 = Instance.new("Frame")
frame6.Size = UDim2.new(1, 0, 0, 1)
frame6.Position = UDim2.new(0, 0, 1, 0)
frame6.BackgroundColor3 = colors.border
frame6.BorderSizePixel = 0
frame6.ZIndex = 4
frame6.Position = UDim2.new(0, 0, 0, tabY + tabH)
frame6.Parent = frame2
frame6.Visible = false
local frame7 = Instance.new("Frame")
frame7.Name = "ContentArea"
frame7.Size = UDim2.new(1, 0, 1, -(num2 + num))
frame7.Position = UDim2.new(0, 0, 0, num2)
frame7.BackgroundTransparency = 1
frame7.ClipsDescendants = true
frame7.ZIndex = 3
frame7.Parent = frame2
local flag3 = false
do
  local frame8 = Instance.new("Frame")
  frame8.Name = "Footer"
  frame8.Size = UDim2.new(1, 0, 0, num)
  frame8.Position = UDim2.new(0, 0, 1, -num)
  frame8.BackgroundColor3 = colors.bg
  frame8.BackgroundTransparency = 1
  frame8.BorderSizePixel = 0
  frame8.ZIndex = 5
  frame8.Parent = frame2
  frame8.Visible = false
  local frame9 = Instance.new("Frame", frame8)
  frame9.Size = UDim2.new(1, 0, 0, 1)
  frame9.BackgroundColor3 = colors.border
  frame9.BackgroundTransparency = 0.25
  frame9.BorderSizePixel = 0
  frame9.ZIndex = 6
  frame9.Visible = false

  local function fn36(name, text, arg, arg2, arg3)
    local textLabel2 = Instance.new("TextLabel")
    textLabel2.Name = name
    textLabel2.Size = UDim2.new(arg2, -8, 1, 0)
    textLabel2.Position = UDim2.new(arg, 8, 0, 0)
    textLabel2.BackgroundTransparency = 1
    textLabel2.Text = text
    textLabel2.TextColor3 = colors.cyan
    textLabel2.Font = Enum.Font.GothamMedium
    textLabel2.TextSize = touchEnabled and 9 or 13
    textLabel2.TextXAlignment = arg3 or Enum.TextXAlignment.Left
    textLabel2.ZIndex = 7
    textLabel2.Parent = frame8
    return textLabel2
  end
  local result = fn36("StrengthRate", "Calculando fuerza/min", 0, 0.42, Enum.TextXAlignment.Left)
  result.Visible = false
  local result2 = fn36("Ping", "-- ms", 0, 1 / 3, Enum.TextXAlignment.Center)
  local keyTimerLabel = fn36("KeyCountdown", "●  24:00:00", 1 / 3, 1 / 3, Enum.TextXAlignment.Center)
  local result3 = fn36("FPS", "-- FPS", 2 / 3, 1 / 3, Enum.TextXAlignment.Center)
  keyTimerLabel.TextColor3 = colors.green
  keyTimerLabel.Active = true
  keyTimerLabel.AnchorPoint = Vector2.new(0.5, 0.5)
  keyTimerLabel.Position = UDim2.fromScale(0.5, 0.5)
  local uIScale = Instance.new("UIScale", keyTimerLabel)
  fn(keyTimerLabel.MouseEnter:Connect(function()
    tweenService:Create(uIScale, timing.tween, { Scale = 1.055 }):Play()
  end))
  fn(keyTimerLabel.MouseLeave:Connect(function()
    tweenService:Create(uIScale, timing.tween, { Scale = 1 }):Play()
  end))
  bRG2.shellUI.keyTimerLabel = keyTimerLabel
  bRG2.shellUI.FooterBar = frame8
  bRG2.shellUI.liveFps = 60
  bRG2.shellUI.fpsFrames = 0
  bRG2.shellUI.fpsSampleAt = os.clock()
  local strengthRate = 0
  local tbl12 = {}
  local now = os.clock()
  local value21 = nil
  local value22 = nil
  fn(runService.RenderStepped:Connect(function()
    bRG2.shellUI.fpsFrames += 1
  end))

  local function fn37(arg)
    arg = math.max(0, math.floor(tonumber(arg) or 0))
    return string.format("%02d:%02d:%02d", math.floor(arg / 3600), math.floor((arg % 3600) / 60), arg % 60)
  end

  local function fn38(arg)
    arg = math.max(0, tonumber(arg) or 0)
    if arg >= 1e12 then return string.format("%.1fT", arg / 1e12) end
    if arg >= 1000000000 then return string.format("%.1fB", arg / 1000000000) end
    if arg >= 1000000 then return string.format("%.1fM", arg / 1000000) end
    if arg >= 1000 then return string.format("%.1fK", arg / 1000) end
    return tostring(math.floor(arg + 0.5))
  end
  task.spawn(function()
    while getgenv().BRG == bRG2 and parent and parent.Parent do
      local now2 = os.clock()
      local leaderstats = localPlayer:FindFirstChild("leaderstats")
      local strength = (leaderstats and leaderstats:FindFirstChild("Strength")) or localPlayer:FindFirstChild("Strength")
      if strength and strength ~= value21 then
        if value22 then value22:Disconnect() end
        value21 = strength
        now = now2
        local num5 = tonumber(strength.Value) or 0
        value22 = strength:GetPropertyChangedSignal("Value"):Connect(function()
          local num6 = tonumber(strength.Value) or num5
          local amount = num6 - num5
          num5 = num6
          if amount > 0 then tbl12[#tbl12 + 1] = { time = os.clock(), amount = amount } end
        end)
        fn(value22)
      end
      local num5 = 0
      for i = #tbl12, 1, -1 do
        local item = tbl12[i]
        if now2 - item.time > 30 then
          table.remove(tbl12, i)
        else
          num5 += item.amount
        end
      end
      local num6 = math.min(30, math.max(5, now2 - now))
      strengthRate = num5 / num6 * 60
      local keyRemaining = math.max(0, bRG2.keyExpiresAt - os.time())
      keyTimerLabel.Text = "●  " .. fn37(keyRemaining)
      keyTimerLabel.TextColor3 = keyRemaining <= 1800 and Color3.fromRGB(255, 93, 99) or (keyRemaining <= 3600 and Color3.fromRGB(255, 198, 74) or colors.green)
      bRG2.shellUI.strengthRate = strengthRate
      local now3 = os.clock()
      local num7 = now3 - bRG2.shellUI.fpsSampleAt
      if num7 >= 0.25 then
        bRG2.shellUI.liveFps = math.floor(bRG2.shellUI.fpsFrames / num7 + 0.5)
        bRG2.shellUI.fpsFrames = 0
        bRG2.shellUI.fpsSampleAt = now3
      end
      local liveFps = bRG2.shellUI.liveFps
      bRG2.shellUI.liveFps = liveFps
      bRG2.shellUI.keyRemaining = keyRemaining
      result3.Text = tostring(liveFps) .. " FPS"
      local ok, result4 = pcall(function()
        return (game:GetService("Stats")).Network.ServerStatsItem["Data Ping"]:GetValue()
      end)
      if not ok then
        ok, result4 = pcall(function()
          return localPlayer:GetNetworkPing() * 2000
        end)
      end
      local ok2 = ok and math.floor(result4 + 0.5) or nil
      bRG2.shellUI.pingMs = ok2
      result2.Text = (ok2 and tostring(ok2) or "--") .. " ms"
      task.wait(0.5)
    end
  end)
end
do
  local touchEnabled2 = touchEnabled and 10 or 16
  local touchEnabled3 = touchEnabled and 28 or 30
  local touchEnabled4 = touchEnabled and 34 or 38
  local num5 = 272
  local num6 = math.min(334, hubH - 14)
  local flag4 = false
  local str = "right"
  local value21 = nil
  local num7 = 0
  local frame8 = Instance.new("Frame")
  frame8.Name = "InfoPanel"
  frame8.BackgroundColor3 = Color3.fromRGB(9, 10, 12)
  frame8.BackgroundTransparency = 0.02
  frame8.BorderSizePixel = 0
  frame8.ClipsDescendants = true
  frame8.Visible = false
  frame8.ZIndex = 950
  frame8.Parent = parent
  local uICorner = Instance.new("UICorner", frame8)
  uICorner.CornerRadius = UDim.new(0, touchEnabled and 10 or 12)
  do
    local imageLabel = Instance.new("ImageLabel")
    imageLabel.Name = "BackgroundArt"
    imageLabel.Size = UDim2.fromScale(1, 1)
    imageLabel.BackgroundTransparency = 1
    imageLabel.BorderSizePixel = 0
    imageLabel.Image = tbl.BackgroundAsset
    imageLabel.ImageColor3 = Color3.fromRGB(204, 211, 255)
    imageLabel.ImageTransparency = 0.46
    imageLabel.ScaleType = Enum.ScaleType.Crop
    imageLabel.ZIndex = 950
    imageLabel.Parent = frame8
    Instance.new("UICorner", imageLabel).CornerRadius = uICorner.CornerRadius
    local frame9 = Instance.new("Frame")
    frame9.Name = "BackgroundShade"
    frame9.Size = UDim2.fromScale(1, 1)
    frame9.BackgroundColor3 = Color3.fromRGB(5, 6, 15)
    frame9.BackgroundTransparency = 0.3
    frame9.BorderSizePixel = 0
    frame9.ZIndex = 950
    frame9.Parent = frame8
    Instance.new("UICorner", frame9).CornerRadius = uICorner.CornerRadius
  end
  local uIStroke3 = Instance.new("UIStroke", frame8)
  uIStroke3.Color = Color3.fromRGB(144, 126, 255)
  uIStroke3.Transparency = 0.12
  uIStroke3.Thickness = 1
  local textButton2 = Instance.new("TextButton")
  textButton2.Name = "InfoHandle"
  textButton2.AnchorPoint = Vector2.new(0, 0.5)
  textButton2.Size = UDim2.fromOffset(touchEnabled3, touchEnabled4)
  textButton2.BackgroundColor3 = Color3.fromRGB(16, 18, 21)
  textButton2.AutoButtonColor = false
  textButton2.Text = ""
  textButton2.TextColor3 = colors.white
  textButton2.Font = Enum.Font.GothamBold
  textButton2.TextSize = 1
  textButton2.BorderSizePixel = 0
  textButton2.ZIndex = 958
  textButton2.Parent = parent
  local uICorner2 = Instance.new("UICorner", textButton2)
  uICorner2.CornerRadius = UDim.new(0, touchEnabled and 7 or 8)
  local uIStroke4 = Instance.new("UIStroke", textButton2)
  uIStroke4.Color = Color3.fromRGB(69, 73, 82)
  uIStroke4.Transparency = 0.15
  uIStroke4.Thickness = 1
  local uIScale = Instance.new("UIScale", textButton2)
  local textLabel2 = Instance.new("TextLabel", textButton2)
  textLabel2.Name = "Arrow"
  textLabel2.Size = UDim2.fromScale(1, 1)
  textLabel2.BackgroundTransparency = 1
  textLabel2.Text = "›"
  textLabel2.TextColor3 = colors.white
  textLabel2.Font = Enum.Font.GothamMedium
  textLabel2.TextSize = touchEnabled and 24 or 27
  textLabel2.TextXAlignment = Enum.TextXAlignment.Center
  textLabel2.TextYAlignment = Enum.TextYAlignment.Center
  textLabel2.ZIndex = 959
  bRG2.shellUI.sideHandleReserve = touchEnabled and 0 or (touchEnabled3 + 8)
  local imageLabel = Instance.new("ImageLabel")
  imageLabel.Name = "Avatar"
  imageLabel.Size = UDim2.fromOffset(touchEnabled and 44 or 52, touchEnabled and 44 or 52)
  imageLabel.Position = UDim2.fromOffset(touchEnabled and 10 or 12, touchEnabled and 10 or 12)
  imageLabel.BackgroundColor3 = Color3.fromRGB(25, 27, 31)
  imageLabel.BorderSizePixel = 0
  imageLabel.Image = ""
  imageLabel.ScaleType = Enum.ScaleType.Crop
  imageLabel.ZIndex = 952
  imageLabel.Parent = frame8
  local uICorner3 = Instance.new("UICorner", imageLabel)
  uICorner3.CornerRadius = UDim.new(1, 0)
  local uIStroke5 = Instance.new("UIStroke", imageLabel)
  uIStroke5.Color = Color3.fromRGB(94, 99, 109)
  uIStroke5.Transparency = 0.3
  local touchEnabled5 = touchEnabled and 64 or 76
  local textLabel3 = Instance.new("TextLabel")
  textLabel3.Name = "DisplayName"
  textLabel3.Size = UDim2.new(1, -(touchEnabled5 + 42), 0, touchEnabled and 18 or 21)
  textLabel3.Position = UDim2.fromOffset(touchEnabled5, touchEnabled and 9 or 11)
  textLabel3.BackgroundTransparency = 1
  textLabel3.Text = localPlayer.DisplayName
  textLabel3.TextColor3 = colors.white
  textLabel3.Font = Enum.Font.GothamBold
  textLabel3.TextSize = touchEnabled and 14 or 16
  textLabel3.TextTruncate = Enum.TextTruncate.AtEnd
  textLabel3.TextXAlignment = Enum.TextXAlignment.Left
  textLabel3.ZIndex = 952
  textLabel3.Parent = frame8
  local textLabel4 = Instance.new("TextLabel")
  textLabel4.Name = "Username"
  textLabel4.Size = UDim2.new(1, -(touchEnabled5 + 42), 0, touchEnabled and 16 or 18)
  textLabel4.Position = UDim2.fromOffset(touchEnabled5, touchEnabled and 27 or 32)
  textLabel4.BackgroundTransparency = 1
  textLabel4.Text = "@" .. localPlayer.Name
  textLabel4.TextColor3 = Color3.fromRGB(168, 173, 183)
  textLabel4.Font = Enum.Font.GothamMedium
  textLabel4.TextSize = touchEnabled and 10 or 11
  textLabel4.TextTruncate = Enum.TextTruncate.AtEnd
  textLabel4.TextXAlignment = Enum.TextXAlignment.Left
  textLabel4.ZIndex = 952
  textLabel4.Parent = frame8
  local textLabel5 = Instance.new("TextLabel")
  textLabel5.Name = "UserId"
  textLabel5.Size = UDim2.new(1, -(touchEnabled5 + 42), 0, 15)
  textLabel5.Position = UDim2.fromOffset(touchEnabled5, touchEnabled and 42 or 49)
  textLabel5.BackgroundTransparency = 1
  textLabel5.Text = "ID: " .. tostring(localPlayer.UserId)
  textLabel5.TextColor3 = Color3.fromRGB(112, 117, 127)
  textLabel5.Font = Enum.Font.Gotham
  textLabel5.TextSize = touchEnabled and 9 or 10
  textLabel5.TextXAlignment = Enum.TextXAlignment.Left
  textLabel5.ZIndex = 952
  textLabel5.Parent = frame8
  local textButton3 = Instance.new("TextButton")
  textButton3.Name = "InfoDragSurface"
  textButton3.Size = UDim2.new(1, -(touchEnabled and 38 or 44), 0, touchEnabled and 62 or 70)
  textButton3.BackgroundTransparency = 1
  textButton3.BorderSizePixel = 0
  textButton3.AutoButtonColor = false
  textButton3.Text = ""
  textButton3.Active = true
  textButton3.ZIndex = 958
  textButton3.Parent = frame8
  bRG2.shellUI.infoDragSurface = textButton3
  local textButton4 = Instance.new("TextButton")
  textButton4.Name = "PanelClose"
  textButton4.Size = UDim2.fromOffset(touchEnabled and 30 or 32, touchEnabled and 30 or 32)
  textButton4.Position = UDim2.new(1, touchEnabled and -36 or -40, 0, touchEnabled and 6 or 8)
  textButton4.BackgroundTransparency = 1
  textButton4.AutoButtonColor = false
  textButton4.Text = "×"
  textButton4.TextColor3 = Color3.fromRGB(169, 174, 184)
  textButton4.Font = Enum.Font.GothamMedium
  textButton4.TextSize = touchEnabled and 20 or 22
  textButton4.ZIndex = 959
  textButton4.Parent = frame8
  local uIScale2 = Instance.new("UIScale", textButton4)
  local value22 = nil
  local num8 = 0
  fn(textButton4.MouseEnter:Connect(function()
    if bRG2.shellUI.isCloseConfirmationOpen() then
      if value22 then value22:Cancel() end
      textButton4.Rotation = 0
      uIScale2.Scale = 1
      return
    end
    tweenService:Create(uIScale2, TweenInfo.new(0.16, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), { Scale = 1.1 }):Play()
    if value22 or os.clock() < num8 then return end
    num8 = os.clock() + 2
    textButton4.Rotation = 0
    value22 = tweenService:Create(textButton4, TweenInfo.new(1.04, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), { Rotation = 360 })
    local value23 = value22
    fn(value23.Completed:Connect(function(arg)
      if value22 == value23 then
        value22 = nil
        if arg == Enum.PlaybackState.Completed and textButton4.Parent then textButton4.Rotation = 0 end
      end
    end))
    value22:Play()
  end))
  fn(textButton4.MouseLeave:Connect(function()
    tweenService:Create(uIScale2, TweenInfo.new(0.18, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), { Scale = 1 }):Play()
  end))
  local tbl12 = {}
  local touchEnabled6 = touchEnabled and 64 or 76
  local touchEnabled7 = touchEnabled and 48 or 54
  local touchEnabled8 = touchEnabled and 10 or 12
  local touchEnabled9 = touchEnabled and 5 or 6
  local frame9 = Instance.new("Frame")
  frame9.Name = "MetricRow"
  frame9.Size = UDim2.new(1, -(touchEnabled8 * 2), 0, touchEnabled7)
  frame9.Position = UDim2.fromOffset(touchEnabled8, touchEnabled6)
  frame9.BackgroundTransparency = 1
  frame9.ZIndex = 951
  frame9.Parent = frame8
  local uIListLayout2 = Instance.new("UIListLayout", frame9)
  uIListLayout2.FillDirection = Enum.FillDirection.Horizontal
  uIListLayout2.HorizontalAlignment = Enum.HorizontalAlignment.Left
  uIListLayout2.Padding = UDim.new(0, touchEnabled9)
  uIListLayout2.SortOrder = Enum.SortOrder.LayoutOrder
  for index, item in ipairs({ { "La key expira en:", "--:--:--" }, { "FPS", "--" }, { "MS", "--" } }) do
    local frame10 = Instance.new("Frame")
    frame10.Name = item[1] .. "Card"
    frame10.Size = index == 1 and UDim2.new(0.44, -touchEnabled9 * 0.88, 1, 0) or UDim2.new(0.28, -touchEnabled9 * 0.56, 1, 0)
    frame10.LayoutOrder = index
    frame10.BackgroundColor3 = Color3.fromRGB(24, 17, 49)
    frame10.BackgroundTransparency = 0.22
    frame10.BorderSizePixel = 0
    frame10.ZIndex = 951
    frame10.Parent = frame9
    local uICorner4 = Instance.new("UICorner", frame10)
    uICorner4.CornerRadius = UDim.new(0, 8)
    local uIStroke6 = Instance.new("UIStroke", frame10)
    uIStroke6.Color = Color3.fromRGB(144, 126, 255)
    uIStroke6.Transparency = 0.68
    uIStroke6.Thickness = 1
    local textLabel6 = Instance.new("TextLabel", frame10)
    textLabel6.Size = UDim2.new(1, -6, 0, touchEnabled and 18 or 20)
    textLabel6.Position = UDim2.fromOffset(3, touchEnabled and 4 or 5)
    textLabel6.BackgroundTransparency = 1
    textLabel6.Text = item[1]
    textLabel6.TextColor3 = Color3.fromRGB(190, 184, 216)
    textLabel6.Font = Enum.Font.GothamBold
    textLabel6.TextSize = touchEnabled and 8 or 10
    textLabel6.TextScaled = false
    textLabel6.ZIndex = 952
    local textLabel7 = Instance.new("TextLabel", frame10)
    textLabel7.Name = "Value"
    textLabel7.Size = UDim2.new(1, -6, 0, touchEnabled and 22 or 25)
    textLabel7.Position = UDim2.fromOffset(3, touchEnabled and 21 or 24)
    textLabel7.BackgroundTransparency = 1
    textLabel7.Text = item[2]
    textLabel7.TextColor3 = colors.white
    textLabel7.Font = Enum.Font.GothamBold
    textLabel7.TextSize = item[1] == "La key expira en:" and (touchEnabled and 11 or 13) or (touchEnabled and 13 or 15)
    textLabel7.TextScaled = false
    textLabel7.TextTruncate = Enum.TextTruncate.AtEnd
    textLabel7.ZIndex = 952
    tbl12[item[1]] = textLabel7
  end
  local num9 = touchEnabled6 + touchEnabled7 + (touchEnabled and 5 or 9)
  local touchEnabled10 = touchEnabled and 22 or 27
  local tbl13 = {}
  local tbl14 = {
    { key = "Game", label = "Juego:", value = "Muscle Legends" },
    { key = "Script", label = "Script:", value = "Public Training" },
    { key = "Author", label = "Autor:", value = "Young0x" },
    { key = "AccountAge", label = "Edad de la cuenta:", value = "--", small = true },
    { key = "AccountDays", label = "Días en total:", value = "--" },
    { key = "Server", label = "Servidor:", value = "--" },
    { key = "GameVersion", label = "Versión del juego:", value = "--" },
  }
  local num10 = num9
  for index, item in ipairs(tbl14) do
    local touchEnabled11 = touchEnabled10
    local frame10 = Instance.new("Frame")
    frame10.Name = item.key .. "Row"
    frame10.Size = UDim2.new(1, -(touchEnabled8 * 2), 0, touchEnabled11)
    frame10.Position = UDim2.fromOffset(touchEnabled8, num10)
    frame10.BackgroundTransparency = 1
    frame10.ZIndex = 951
    frame10.Parent = frame8
    num10 += touchEnabled11
    local textLabel6 = Instance.new("TextLabel", frame10)
    local touchEnabled12 = touchEnabled and 91 or 104
    local small = item.small and 6 or 2
    textLabel6.Size = UDim2.new(0, touchEnabled12, 1, 0)
    textLabel6.Position = UDim2.fromOffset(0, 0)
    textLabel6.BackgroundTransparency = 1
    textLabel6.Text = item.label
    textLabel6.TextColor3 = Color3.fromRGB(109, 114, 125)
    textLabel6.Font = Enum.Font.GothamMedium
    textLabel6.TextSize = item.small and (touchEnabled and 8 or 9) or (touchEnabled and 9 or 10)
    textLabel6.TextXAlignment = Enum.TextXAlignment.Left
    textLabel6.ZIndex = 952
    local textLabel7 = Instance.new("TextLabel", frame10)
    textLabel7.Name = "Value"
    textLabel7.Size = UDim2.new(1, -(touchEnabled12 + small), 1, 0)
    textLabel7.Position = UDim2.fromOffset(touchEnabled12 + small, 0)
    textLabel7.BackgroundTransparency = 1
    textLabel7.Text = item.value
    textLabel7.TextColor3 = item.small and Color3.fromRGB(238, 240, 244) or Color3.fromRGB(220, 223, 229)
    textLabel7.Font = Enum.Font.GothamMedium
    textLabel7.TextSize = item.small and (touchEnabled and 7 or 8) or (touchEnabled and 9 or 10)
    textLabel7.TextTruncate = Enum.TextTruncate.AtEnd
    textLabel7.TextWrapped = false
    textLabel7.TextXAlignment = Enum.TextXAlignment.Right
    textLabel7.TextYAlignment = Enum.TextYAlignment.Center
    textLabel7.ZIndex = 952
    tbl13[item.key] = textLabel7
  end

  local function fn36()
    local currentCamera = workspace.CurrentCamera
    local vector22 = currentCamera and currentCamera.ViewportSize or Vector2.new(1920, 1080)
    local position3 = frame2.Position
    return vector22, Vector2.new(vector22.X * position3.X.Scale + position3.X.Offset, vector22.Y * position3.Y.Scale + position3.Y.Offset)
  end

  local function fn37()
    local result, extra = fn36()
    local hubW2 = frame2.AbsoluteSize.X > 1 and frame2.AbsoluteSize.X or hubW
    local hubH2 = frame2.AbsoluteSize.Y > 1 and frame2.AbsoluteSize.Y or hubH
    local touchEnabled11 = touchEnabled or result.X < hubW + num5 + 70
    local touchEnabled12 = touchEnabled11 and math.max(236, hubW2 - 20) or num5
    local touchEnabled13 = touchEnabled11 and math.max(252, hubH2 - 20) or num6
    local num11 = frame2.Position.Y.Offset + hubH2 / 2
    local v
    local v2
    local v3
    if touchEnabled11 then
      str = "overlay"
      if touchEnabled then
        v = UDim2.new(frame2.Position.X.Scale, frame2.Position.X.Offset + hubW2 - touchEnabled3 / 2, frame2.Position.Y.Scale, num11)
      else
        v = UDim2.new(frame2.Position.X.Scale, frame2.Position.X.Offset + hubW2 + 8, frame2.Position.Y.Scale, num11)
      end
      v2 = UDim2.new(frame2.Position.X.Scale, frame2.Position.X.Offset + 10, frame2.Position.Y.Scale, frame2.Position.Y.Offset + 10)
      v3 = UDim2.new(frame2.Position.X.Scale, frame2.Position.X.Offset + hubW2 - 10, frame2.Position.Y.Scale, frame2.Position.Y.Offset + 10)
    else
      local num12 = result.X - (extra.X + hubW2)
      str = num12 >= num5 + touchEnabled2 + 8 and "right" or "left"
      local num13 = frame2.Position.Y.Offset + math.floor((hubH2 - touchEnabled13) / 2)
      if str == "right" then
        v = UDim2.new(frame2.Position.X.Scale, frame2.Position.X.Offset + hubW2 + 8, frame2.Position.Y.Scale, num11)
        v2 = UDim2.new(frame2.Position.X.Scale, frame2.Position.X.Offset + hubW2 + touchEnabled2, frame2.Position.Y.Scale, num13)
        v3 = UDim2.new(frame2.Position.X.Scale, frame2.Position.X.Offset + hubW2 + touchEnabled2, frame2.Position.Y.Scale, num13)
      else
        v = UDim2.new(frame2.Position.X.Scale, frame2.Position.X.Offset + hubW2 + 8, frame2.Position.Y.Scale, num11)
        v2 = UDim2.new(frame2.Position.X.Scale, frame2.Position.X.Offset - num5 - touchEnabled2, frame2.Position.Y.Scale, num13)
        v3 = UDim2.new(frame2.Position.X.Scale, frame2.Position.X.Offset - touchEnabled2, frame2.Position.Y.Scale, num13)
      end
    end
    textLabel2.Text = (str == "left" or (str == "overlay" and touchEnabled)) and "‹" or "›"
    return v, v2, v3, UDim2.fromOffset(touchEnabled12, touchEnabled13)
  end

  local function updateInfoLayout(arg)
    local position3, position4, position5, size = fn37()
    textButton2.Position = position3
    if flag4 then
      local tbl15 = { Position = position4, Size = size, BackgroundTransparency = 0.02 }
      if arg then
        frame8.Position = position4
        frame8.Size = size
        frame8.BackgroundTransparency = 0.02
      else
        if value21 then value21:Cancel() end
        value21 = tweenService:Create(frame8, TweenInfo.new(0.24, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), tbl15)
        value21:Play()
      end
    elseif arg then
      frame8.Position = position5
      frame8.Size = str == "left" and UDim2.fromOffset(0, size.Y.Offset) or UDim2.fromOffset(0, size.Y.Offset)
    end
  end

  local function setInfoHandleShown(arg, arg2, arg3)
    if arg3 and arg3 ~= num7 then return end
    if arg and (flag4 or flag or flag3) then return end
    if arg then
      textButton2.Visible = true
      if arg2 then
        uIScale.Scale = 1
        textButton2.BackgroundTransparency = 0
        textLabel2.TextTransparency = 0
        uIStroke4.Transparency = 0.15
      else
        uIScale.Scale = 0.86
        textButton2.BackgroundTransparency = 1
        textLabel2.TextTransparency = 1
        uIStroke4.Transparency = 1
        tweenService:Create(uIScale, TweenInfo.new(0.18, Enum.EasingStyle.Back, Enum.EasingDirection.Out), { Scale = 1 }):Play()
        tweenService:Create(textButton2, TweenInfo.new(0.14, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), { BackgroundTransparency = 0 }):Play()
        tweenService:Create(textLabel2, TweenInfo.new(0.14, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), { TextTransparency = 0 }):Play()
        tweenService:Create(uIStroke4, TweenInfo.new(0.14, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), { Transparency = 0.15 }):Play()
      end
    elseif arg2 then
      textButton2.Visible = false
    else
      tweenService:Create(uIScale, TweenInfo.new(0.12, Enum.EasingStyle.Quad, Enum.EasingDirection.In), { Scale = 0.84 }):Play()
      tweenService:Create(textButton2, TweenInfo.new(0.12, Enum.EasingStyle.Quad, Enum.EasingDirection.In), { BackgroundTransparency = 1 }):Play()
      tweenService:Create(textLabel2, TweenInfo.new(0.12, Enum.EasingStyle.Quad, Enum.EasingDirection.In), { TextTransparency = 1 }):Play()
      tweenService:Create(uIStroke4, TweenInfo.new(0.12, Enum.EasingStyle.Quad, Enum.EasingDirection.In), { Transparency = 1 }):Play()
      task.delay(0.13, function()
        if (not arg3 or arg3 == num7) and (flag4 or flag) and textButton2.Parent then textButton2.Visible = false end
      end)
    end
  end
  bRG2.shellUI.setInfoPanelOpen = function(arg, arg2)
    if bRG2.shellUI.isCloseConfirmationOpen() then return end
    arg = arg == true and not flag
    if flag4 == arg and not arg2 then return end
    flag4 = arg
    num7 += 1
    local num11 = num7
    local result, position3, position4, size = fn37()
    if value21 then value21:Cancel() end
    if arg then
      setInfoHandleShown(false, arg2, num11)
      frame8.Visible = true
      textButton4.Rotation = 0
      uIScale2.Scale = 0.78
      tweenService:Create(uIScale2, TweenInfo.new(0.24, Enum.EasingStyle.Back, Enum.EasingDirection.Out), { Scale = 1 }):Play()
      frame8.Position = position4
      frame8.Size = UDim2.fromOffset(0, size.Y.Offset)
      frame8.BackgroundTransparency = 0.18
      if arg2 then
        frame8.Position = position3
        frame8.Size = size
        frame8.BackgroundTransparency = 0.02
      else
        value21 = tweenService:Create(
          frame8,
          TweenInfo.new(0.26, Enum.EasingStyle.Quart, Enum.EasingDirection.Out),
          { Position = position3, Size = size, BackgroundTransparency = 0.02 }
        )
        value21:Play()
      end
    else
      if arg2 then
        frame8.Position = position4
        frame8.Size = UDim2.fromOffset(0, size.Y.Offset)
        frame8.Visible = false
      else
        value21 = tweenService:Create(frame8, TweenInfo.new(0.18, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {
          Position = position4,
          Size = UDim2.fromOffset(0, size.Y.Offset),
          BackgroundTransparency = 0.2,
        })
        value21:Play()
        task.delay(0.19, function()
          if num11 == num7 and not flag4 and frame8.Parent then frame8.Visible = false end
        end)
      end
      if arg2 then
        setInfoHandleShown(true, true, num11)
      else
        task.delay(0.2, function()
          setInfoHandleShown(true, false, num11)
        end)
      end
    end
  end
  bRG2.shellUI.setInfoHandleShown = setInfoHandleShown
  fn(textButton2.MouseEnter:Connect(function()
    if bRG2.shellUI.isCloseConfirmationOpen() then return end
    if not flag4 then
      tweenService:Create(uIScale, timing.tween, { Scale = 1.035 }):Play()
      tweenService:Create(textButton2, timing.tween, { BackgroundColor3 = Color3.fromRGB(22, 24, 28) }):Play()
      tweenService:Create(uIStroke4, timing.tween, { Color = Color3.fromRGB(91, 95, 104) }):Play()
    end
  end))
  fn(textButton2.MouseLeave:Connect(function()
    if not flag4 then
      tweenService:Create(uIScale, timing.tween, { Scale = 1 }):Play()
      tweenService:Create(textButton2, timing.tween, { BackgroundColor3 = Color3.fromRGB(16, 18, 21) }):Play()
      tweenService:Create(uIStroke4, timing.tween, { Color = Color3.fromRGB(69, 73, 82) }):Play()
    end
  end))
  fn(textButton2.Activated:Connect(function()
    if bRG2.shellUI.isCloseConfirmationOpen() then return end
    bRG2.shellUI.setInfoPanelOpen(not flag4)
  end))
  fn(textButton4.Activated:Connect(function()
    if bRG2.shellUI.isCloseConfirmationOpen() then return end
    if value22 then value22:Cancel() end
    tweenService:Create(uIScale2, TweenInfo.new(0.14, Enum.EasingStyle.Quad, Enum.EasingDirection.In), { Scale = 0.72 }):Play()
    bRG2.shellUI.setInfoPanelOpen(false)
    task.delay(0.2, function()
      if textButton4.Parent and not flag4 then
        textButton4.Rotation = 0
        uIScale2.Scale = 1
      end
    end)
  end))
  local num11 = math.max(0, math.floor(tonumber(localPlayer.AccountAge) or 0))
  local num12 = math.floor(num11 / 365)
  local num13 = num11 % 365
  local num14 = math.floor(num13 / 30)
  local num15 = num13 % 30

  local function fn38(arg, arg2, arg3)
    return tostring(arg) .. " " .. (arg == 1 and arg2 or arg3)
  end

  local function fn39(arg)
    local text = tostring(math.floor(arg)):reverse():gsub("(%d%d%d)", "%1.")
    return text:reverse():gsub("^%.", "")
  end
  local tbl15 = {}
  if num12 > 0 then tbl15[#tbl15 + 1] = fn38(num12, "año", "años") end
  if num14 > 0 then tbl15[#tbl15 + 1] = fn38(num14, "mes", "meses") end
  if num15 > 0 or #tbl15 == 0 then tbl15[#tbl15 + 1] = fn38(num15, "día", "días") end
  tbl13.AccountAge.Text = table.concat(tbl15, ", "):gsub(", ([^,]+)$", " y %1")
  tbl13.AccountDays.Text = fn39(num11)

  local function fn40()
    local num16 = tonumber(bRG2.shellUI.keyRemaining) or math.max(0, bRG2.keyExpiresAt - os.time())
    local num17 = math.floor(num16 / 3600)
    local num18 = math.floor((num16 % 3600) / 60)
    local num19 = math.floor(num16 % 60)
    tbl12["La key expira en:"].Text = string.format("%02d:%02d:%02d", num17, num18, num19)
    tbl12["La key expira en:"].TextColor3 = num16 <= 1800 and Color3.fromRGB(255, 93, 99) or (num16 <= 3600 and Color3.fromRGB(255, 198, 74) or colors.green)
    local num20 = tonumber(bRG2.shellUI.liveFps)
    local num21 = tonumber(bRG2.shellUI.pingMs)
    tbl12.FPS.Text = num20 and tostring(num20) or "--"
    tbl12.FPS.TextColor3 = not num20 and Color3.fromRGB(220, 223, 229) or (num20 >= 60 and colors.green or (num20 >= 30 and Color3.fromRGB(255, 198, 74) or Color3.fromRGB(255, 93, 99)))
    tbl12.MS.Text = num21 and tostring(num21) or "--"
    tbl12.MS.TextColor3 = not num21 and Color3.fromRGB(220, 223, 229) or (num21 < 200 and colors.green or (num21 < 300 and Color3.fromRGB(255, 198, 74) or Color3.fromRGB(255, 93, 99)))
    tbl13.Server.Text = tostring(#players:GetPlayers()) .. "/" .. tostring(players.MaxPlayers) .. " jugadores"
    tbl13.GameVersion.Text = "Build " .. tostring(game.PlaceVersion)
  end
  bRG2.shellUI.InfoPanel = frame8
  bRG2.shellUI.InfoHandle = textButton2
  bRG2.shellUI.cancelPanelCloseAnimation = function()
    if value22 then value22:Cancel() end
    textButton4.Rotation = 0
    uIScale2.Scale = 1
  end
  bRG2.shellUI.updateInfoLayout = updateInfoLayout
  bRG2.shellUI.infoPanelIsOpen = function()
    return flag4
  end
  updateInfoLayout(true)
  fn40()
  task.spawn(function()
    local ok, image = pcall(function()
      return players:GetUserThumbnailAsync(localPlayer.UserId, Enum.ThumbnailType.HeadShot, Enum.ThumbnailSize.Size180x180)
    end)
    if ok and image and getgenv().BRG == bRG2 then
      bRG2.cachedAvatarThumbnail = image
      pcall(function()
        local env = getgenv and getgenv() or nil
        local setidentity = env and (env.setthreadidentity or env.setidentity)
        if type(setidentity) == "function" then setidentity(8) end
        if imageLabel.Parent then imageLabel.Image = image end
        if bRG2.statsAvatar and bRG2.statsAvatar.Parent then bRG2.statsAvatar.Image = image end
        if not bRG2.avatarPreloader or not bRG2.avatarPreloader.Parent then
          bRG2.avatarPreloader = Instance.new("ImageLabel")
          bRG2.avatarPreloader.Name = "AvatarPreloader"
          bRG2.avatarPreloader.Size = UDim2.fromOffset(1, 1)
          bRG2.avatarPreloader.Position = UDim2.fromOffset(-4, -4)
          bRG2.avatarPreloader.BackgroundTransparency = 1
          bRG2.avatarPreloader.ImageTransparency = 0.99
          bRG2.avatarPreloader.Visible = true
          bRG2.avatarPreloader.Parent = parent
        end
        bRG2.avatarPreloader.Image = image
        game:GetService("ContentProvider"):PreloadAsync({ image, imageLabel, bRG2.avatarPreloader })
      end)
    end
  end)
  task.spawn(function()
    while getgenv().BRG == bRG2 and parent and parent.Parent do
      fn40()
      task.wait(0.5)
    end
  end)
end
local tbl12 = {}
local tbl13 = {}
local num5 = 0
local tbl14 = {
  Inicio = 1,
  Entrenar = 2,
  ["Full Train"] = 3,
  Rebirths = 4,
  Rocks = 5,
  Kills = 6,
  Boss = 7,
  ["Pet Shop"] = 8,
  Recompensas = 9,
  Ruleta = 10,
  Regalos = 11,
  ["Estadísticas"] = 12,
  Perfiles = 13,
  Rendimiento = 14,
  Ajustes = 15,
}
local tbl15 = {
  Inicio = 72,
  Entrenar = 84,
  ["Estadísticas"] = 104,
  ["Pet Shop"] = 92,
  Regalos = 78,
  Perfiles = 84,
  ["Full Train"] = 96,
  Rocks = 70,
  Kills = 68,
  Boss = 68,
  Rebirths = 90,
  Recompensas = 112,
  Ruleta = 76,
  Rendimiento = 112,
  Ajustes = 82,
}
bRG2.drawTabIcon = function(parent3, arg)
  local frame8 = Instance.new("Frame")
  frame8.Name = "Icon"
  frame8.Size = UDim2.fromOffset(touchEnabled and 22 or 28, touchEnabled and 22 or 28)
  frame8.Position = UDim2.new(0, touchEnabled and 8 or 13, 0.5, touchEnabled and -11 or -14)
  frame8.BackgroundTransparency = 1
  frame8.ZIndex = parent3.ZIndex + 1
  frame8.Parent = parent3

  local function fn36(size, position3, arg2, arg3)
    local frame9 = Instance.new("Frame")
    frame9.Size, frame9.Position = size, position3
    frame9.BackgroundColor3, frame9.BorderSizePixel = colors.white, 0
    frame9.Rotation, frame9.ZIndex, frame9.Parent = arg2 or 0, frame8.ZIndex + 1, frame8
    if arg3 then Instance.new("UICorner", frame9).CornerRadius = UDim.new(arg3, 0) end
    return frame9
  end

  local function fn37(text)
    local textLabel2 = Instance.new("TextLabel")
    textLabel2.Size, textLabel2.BackgroundTransparency = UDim2.fromScale(1, 1), 1
    textLabel2.Text, textLabel2.TextColor3, textLabel2.TextStrokeTransparency = text, colors.white, 1
    textLabel2.Font, textLabel2.TextSize = Enum.Font.GothamBold, touchEnabled and 17 or 23
    textLabel2.ZIndex, textLabel2.Parent = frame8.ZIndex + 2, frame8
  end
  if arg == "Entrenar" then
    fn36(UDim2.new(0.64, 0, 0, 3), UDim2.new(0.18, 0, 0.5, -1), 0, 1)
    for index, item in ipairs({ 0.08, 0.22, 0.68, 0.82 }) do
      fn36(UDim2.new(0, 3, 0.56, 0), UDim2.new(item, 0, 0.22, 0), 0, 1)
    end
  elseif arg == "Estadísticas" or arg == "Rendimiento" then
    fn36(UDim2.new(0.18, 0, 0.38, 0), UDim2.new(0.12, 0, 0.54, 0), 0, 0.2)
    fn36(UDim2.new(0.18, 0, 0.64, 0), UDim2.new(0.41, 0, 0.28, 0), 0, 0.2)
    fn36(UDim2.new(0.18, 0, 0.86, 0), UDim2.new(0.70, 0, 0.06, 0), 0, 0.2)
  elseif arg == "Pet Shop" then
    fn36(UDim2.new(0.48, 0, 0.43, 0), UDim2.new(0.26, 0, 0.48, 0), 0, 0.5)
    for index, item in ipairs({ { 0.08, 0.26 }, { 0.28, 0.05 }, { 0.55, 0.04 }, { 0.76, 0.25 } }) do
      fn36(UDim2.new(0.22, 0, 0.25, 0), UDim2.new(item[1], 0, item[2], 0), 0, 0.5)
    end
  elseif arg == "Regalos" or arg == "Recompensas" then
    fn36(UDim2.new(0.82, 0, 0.62, 0), UDim2.new(0.09, 0, 0.31, 0), 0, 0.08)
    fn36(UDim2.new(0.12, 0, 0.90, 0), UDim2.new(0.44, 0, 0.06, 0), 0, 0.08)
    fn36(UDim2.new(0.92, 0, 0.12, 0), UDim2.new(0.04, 0, 0.35, 0), 0, 0.08)
  elseif arg == "Perfiles" then
    fn36(UDim2.new(0.38, 0, 0.38, 0), UDim2.new(0.31, 0, 0.05, 0), 0, 0.5)
    fn36(UDim2.new(0.72, 0, 0.46, 0), UDim2.new(0.14, 0, 0.49, 0), 0, 0.5)
  elseif arg == "Ruleta" then
    for index, item in ipairs({ { 0.14, 0.14 }, { 0.52, 0.14 }, { 0.14, 0.52 }, { 0.52, 0.52 } }) do
      fn36(UDim2.new(0.35, 0, 0.35, 0), UDim2.new(item[1], 0, item[2], 0), 45, 0.5)
    end
  elseif arg == "Rebirths" then
    local frame9 = Instance.new("Frame")
    frame9.Size, frame9.Position, frame9.BackgroundTransparency = UDim2.new(0.74, 0, 0.74, 0), UDim2.new(0.13, 0, 0.13, 0), 1
    frame9.ZIndex, frame9.Parent = frame8.ZIndex + 1, frame8
    Instance.new("UICorner", frame9).CornerRadius = UDim.new(1, 0)
    local uIStroke3 = Instance.new("UIStroke", frame9)
    uIStroke3.Color, uIStroke3.Thickness = colors.white, touchEnabled and 2 or 3
    fn36(UDim2.new(0.22, 0, 0.22, 0), UDim2.new(0.68, 0, 0.02, 0), 45, 0.1)
  elseif arg == "Rocks" then
    fn37("▲")
  elseif arg == "Ajustes" then
    fn37("⚙")
  else
    fn37("⌂")
  end
end

local function fn36()
  local scrollingFrame2 = Instance.new("ScrollingFrame")
  scrollingFrame2.Size = UDim2.new(1, 0, 1, 0)
  scrollingFrame2.BackgroundTransparency = 1
  scrollingFrame2.ScrollBarThickness = 2
  scrollingFrame2.ScrollBarImageColor3 = colors.white
  scrollingFrame2.ScrollBarImageTransparency = 0.28
  scrollingFrame2.ScrollingDirection = Enum.ScrollingDirection.Y
  scrollingFrame2.ElasticBehavior = Enum.ElasticBehavior.WhenScrollable
  scrollingFrame2.CanvasSize = UDim2.new(0, 0, 0, 0)
  scrollingFrame2.AutomaticCanvasSize = Enum.AutomaticSize.Y
  scrollingFrame2.BorderSizePixel = 0
  scrollingFrame2.Visible = false
  scrollingFrame2.ZIndex = 2
  scrollingFrame2.Parent = frame7
  local uIListLayout2 = Instance.new("UIListLayout", scrollingFrame2)
  uIListLayout2.SortOrder = Enum.SortOrder.LayoutOrder
  uIListLayout2.Padding = UDim.new(0, 4)
  local uIPadding2 = Instance.new("UIPadding", scrollingFrame2)
  uIPadding2.PaddingLeft = UDim.new(0, touchEnabled and 8 or 14)
  uIPadding2.PaddingRight = UDim.new(0, touchEnabled and 8 or 14)
  uIPadding2.PaddingTop = UDim.new(0, 8)
  uIPadding2.PaddingBottom = UDim.new(0, 8)
  return scrollingFrame2
end

local function fn37(arg, arg2, arg3)
  local function fn38(arg4)
    if arg4 then arg.CanvasPosition = Vector2.new(0, 0) end
    task.defer(function()
      if not arg.Parent or not arg2.Parent then return end
      local num6 = math.max(0, math.ceil(arg2.AbsoluteContentSize.Y))
      local num7 = math.min(num6, arg3)
      arg.Size = UDim2.new(1, 0, 0, num7)
      arg.ScrollingEnabled = num6 > arg3
      arg.ScrollBarThickness = num6 > arg3 and 3 or 0
      if num6 <= arg3 then arg.CanvasPosition = Vector2.new(0, 0) end
    end)
  end
  fn(arg2:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(fn38))
  fn38(true)
  return fn38
end
bRG2.activeTabName = nil
bRG2.tabTransitionRun = 0
local tbl16 = {
  Inicio = true,
  Rebirths = true,
  Kills = true,
  Boss = true,
  ["Pet Shop"] = true,
  ["Estadísticas"] = true,
  Ruleta = true,
  Recompensas = true,
  Regalos = true,
  Perfiles = true,
  Rendimiento = true,
}

local function fn38(activeTabName)
  local flag4 = bRG2.activeTabName ~= activeTabName
  local readyTabs = bRG2.shellUI.readyTabs and bRG2.shellUI.readyTabs[activeTabName] == true
  bRG2.activeTabName = activeTabName
  bRG2.tabTransitionRun += 1
  local tabTransitionRun = bRG2.tabTransitionRun
  for key, value21 in pairs(tbl12) do
    local visible = (key == activeTabName)
    value21.BackgroundColor3 = visible and Color3.fromRGB(39, 40, 44) or Color3.fromRGB(11, 12, 13)
    value21.BackgroundTransparency = visible and 0.46 or 1
    value21.TextColor3 = visible and colors.white or Color3.fromRGB(166, 168, 173)
    value21.Font = Enum.Font.Garamond
    local uL = value21:FindFirstChild("UL")
    if uL then
      uL.BackgroundColor3 = Color3.fromRGB(235, 236, 239)
      uL.Size = UDim2.fromOffset(visible and (touchEnabled and 22 or 28) or 0, 2)
      uL.Visible = visible
    end
  end
  for key, value21 in pairs(tbl13) do
    local visible = (key == activeTabName)
    local flag5 = not tbl16[key]
    value21.Visible = visible
    value21.ScrollingEnabled = visible and readyTabs and flag5
    value21.ScrollBarThickness = visible and readyTabs and flag5 and 2 or 0
    if visible and readyTabs and flag5 then value21.ScrollBarImageColor3 = Color3.fromRGB(125, 130, 139) end
    value21.Position = UDim2.fromOffset(0, 0)
    if visible then
      value21.CanvasPosition = Vector2.new(0, 0)
      if flag4 then
        value21.Position = UDim2.fromOffset(touchEnabled and 7 or 10, 0)
        local tween = tweenService:Create(value21, TweenInfo.new(0.16, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), { Position = UDim2.fromOffset(0, 0) })
        tween:Play()
        task.delay(0.17, function()
          if getgenv().BRG ~= bRG2 then return end
          pcall(function()
            local env = getgenv and getgenv() or nil
            local setidentity = env and (env.setthreadidentity or env.setidentity)
            if type(setidentity) == "function" then setidentity(8) end
            if tabTransitionRun == bRG2.tabTransitionRun and value21.Parent then
              value21.Position = UDim2.fromOffset(0, 0)
            end
          end)
        end)
      end
    end
  end
  if bRG2.shellUI.blankContentMask then bRG2.shellUI.blankContentMask.Visible = not readyTabs end
  if bRG2.shellUI.blankContentBottomMask then bRG2.shellUI.blankContentBottomMask.Visible = not readyTabs end
end

local function fn39(text)
  local num6 = num5
  num5 = num5 + 1
  local textButton2 = Instance.new("TextButton")
  textButton2.Name = text
  local num7 = tbl15[text] or 80
  textButton2.Size = UDim2.fromOffset(touchEnabled and math.max(62, num7 - 8) or num7, touchEnabled and 34 or 36)
  textButton2.LayoutOrder = tbl14[text] or (num6 + 20)
  textButton2.BackgroundColor3 = Color3.fromRGB(11, 12, 13)
  textButton2.BackgroundTransparency = 1
  textButton2.Text = text
  textButton2.TextColor3 = Color3.fromRGB(166, 168, 173)
  textButton2.TextStrokeTransparency = 1
  textButton2.Font = Enum.Font.Garamond
  textButton2.TextSize = touchEnabled and 10 or 13
  textButton2.TextScaled = false
  textButton2.BorderSizePixel = 0
  textButton2.ZIndex = 4
  textButton2.Parent = scrollingFrame
  textButton2:SetAttribute("Young0x", by)
  textButton2.TextXAlignment = Enum.TextXAlignment.Center
  Instance.new("UICorner", textButton2).CornerRadius = UDim.new(0, 7)
  local frame8 = Instance.new("Frame")
  frame8.Name = "UL"
  frame8.AnchorPoint = Vector2.new(0.5, 0.5)
  frame8.Size = UDim2.fromOffset(0, 2)
  frame8.Position = UDim2.new(0.5, 0, 1, -5)
  frame8.BackgroundColor3 = Color3.fromRGB(235, 236, 239)
  frame8.BorderSizePixel = 0
  frame8.Visible = false
  frame8.ZIndex = 6
  frame8.Parent = textButton2
  local result = fn36()
  result.Name = text .. "Page"
  result:SetAttribute("Young0x", by)
  tbl12[text] = textButton2
  tbl13[text] = result
  textButton2.MouseButton1Click:Connect(function()
    if bRG2.shellUI.isCloseConfirmationOpen() then return end
    fn38(text)
    local tabOpenHandlers = bRG2.shellUI.readyTabs and bRG2.shellUI.readyTabs[text] == true and bRG2.tabOpenHandlers and bRG2.tabOpenHandlers[text]
    if type(tabOpenHandlers) == "function" then task.spawn(tabOpenHandlers) end
  end)
  textButton2.MouseEnter:Connect(function()
    if bRG2.shellUI.isCloseConfirmationOpen() then return end
    if not tbl13[text].Visible then
      tweenService:Create(textButton2, timing.tween, {
        BackgroundColor3 = Color3.fromRGB(45, 47, 52),
        BackgroundTransparency = 0.58,
        TextColor3 = colors.white,
      }):Play()
    end
  end)
  textButton2.MouseLeave:Connect(function()
    local visible = tbl13[text] and tbl13[text].Visible
    tweenService:Create(textButton2, timing.tween, {
      BackgroundColor3 = visible and Color3.fromRGB(39, 40, 44) or Color3.fromRGB(11, 12, 13),
      BackgroundTransparency = visible and 0.46 or 1,
      TextColor3 = visible and colors.white or Color3.fromRGB(166, 168, 173),
    }):Play()
  end)
  return result
end

local function fn40(parent3, arg, layoutOrder)
  local textLabel2 = Instance.new("TextLabel")
  textLabel2.Size = UDim2.new(1, 0, 0, 20)
  textLabel2.BackgroundTransparency = 1
  textLabel2.Text = tostring(arg):gsub("—", ""):match("^%s*(.-)%s*$")
  textLabel2.TextColor3 = colors.textDim
  textLabel2.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
  textLabel2.TextStrokeTransparency = 0.42
  textLabel2.Font = Enum.Font.FredokaOne
  textLabel2.TextSize = touchEnabled and 13 or 14
  textLabel2.TextXAlignment = Enum.TextXAlignment.Center
  textLabel2.LayoutOrder = layoutOrder
  textLabel2.ZIndex = 2
  textLabel2.Parent = parent3
  local uIStroke3 = Instance.new("UIStroke", textLabel2)
  uIStroke3.Color = Color3.fromRGB(10, 10, 10)
  uIStroke3.Thickness = 1
  uIStroke3.Transparency = 0.5
  return textLabel2
end

local function fn41(parent3, label, layoutOrder, arg)
  bRG2.toggleRegistry = bRG2.toggleRegistry or {}
  local frame8 = Instance.new("Frame")
  frame8.Name = "T" .. layoutOrder
  frame8.Size = UDim2.new(1, 0, 0, 46)
  frame8.BackgroundColor3 = Color3.fromRGB(20, 21, 23)
  frame8.BackgroundTransparency = 0.06
  frame8.BorderSizePixel = 0
  frame8.LayoutOrder = layoutOrder
  frame8.ZIndex = 2
  frame8.Parent = parent3
  Instance.new("UICorner", frame8).CornerRadius = UDim.new(0, 7)
  local uIStroke3 = Instance.new("UIStroke", frame8)
  uIStroke3.Color = colors.white
  uIStroke3.Thickness = 1
  uIStroke3.Transparency = 0.55
  local textLabel2 = Instance.new("TextLabel")
  textLabel2.Size = UDim2.new(1, -120, 1, 0)
  textLabel2.Position = UDim2.new(0, 14, 0, 0)
  textLabel2.BackgroundTransparency = 1
  textLabel2.Text = label
  textLabel2.TextColor3 = colors.text
  textLabel2.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
  textLabel2.TextStrokeTransparency = 0.32
  textLabel2.Font = Enum.Font.GothamMedium
  textLabel2.TextSize = touchEnabled and 11 or 14
  textLabel2.TextXAlignment = Enum.TextXAlignment.Left
  textLabel2.TextWrapped = true
  textLabel2.AutoLocalize = false
  textLabel2.ZIndex = 3
  textLabel2.Parent = frame8
  local frame9 = Instance.new("Frame")
  frame9.Size = UDim2.fromOffset(touchEnabled and 46 or 54, touchEnabled and 22 or 26)
  frame9.Position = UDim2.new(1, touchEnabled and -76 or -86, 0.5, touchEnabled and -11 or -13)
  frame9.BackgroundColor3 = colors.pillOff
  frame9.BorderSizePixel = 0
  frame9.ZIndex = 3
  frame9.Parent = frame8
  Instance.new("UICorner", frame9).CornerRadius = UDim.new(1, 0)
  local frame10 = Instance.new("Frame")
  frame10.Size = UDim2.fromOffset(touchEnabled and 18 or 22, touchEnabled and 18 or 22)
  frame10.Position = UDim2.fromOffset(2, 2)
  frame10.BackgroundColor3 = colors.white
  frame10.BorderSizePixel = 0
  frame10.ZIndex = 4
  frame10.Parent = frame9
  Instance.new("UICorner", frame10).CornerRadius = UDim.new(1, 0)
  local frame11 = Instance.new("Frame")
  frame11.Name = "Availability"
  frame11.Size = UDim2.fromOffset(touchEnabled and 9 or 11, touchEnabled and 9 or 11)
  frame11.Position = UDim2.new(1, touchEnabled and -18 or -21, 0.5, touchEnabled and -4 or -5)
  frame11.BackgroundColor3 = colors.red
  frame11.BorderSizePixel = 0
  frame11.ZIndex = 4
  frame11.Parent = frame8
  Instance.new("UICorner", frame11).CornerRadius = UDim.new(1, 0)
  local flag4 = false
  local selectable = true
  local num6 = 0
  local num7 = 0.22

  local function set(arg2, arg3)
    if arg2 and not selectable then return false end
    if flag4 == arg2 then return true end
    if not arg3 and arg then
      local result = arg(arg2)
      if result == false then return false end
    end
    flag4 = arg2
    frame8:SetAttribute("Enabled", flag4)
    tweenService:Create(uIStroke3, timing.tween, { Color = colors.white, Transparency = arg2 and 0.34 or 0.55 }):Play()
    tweenService:Create(frame9, timing.tween, { BackgroundColor3 = arg2 and Color3.fromRGB(45, 47, 51) or colors.pillOff }):Play()
    tweenService:Create(frame10, timing.tween, {
      Position = arg2 and UDim2.new(1, -(touchEnabled and 20 or 24), 0, 2) or UDim2.fromOffset(2, 2),
    }):Play()
    tweenService:Create(frame11, timing.tween, { BackgroundColor3 = arg2 and colors.green or colors.red }):Play()
    return true
  end
  local textButton2 = Instance.new("TextButton")
  textButton2.Name = "ToggleHitbox"
  textButton2.Size = UDim2.new(1, 0, 1, 0)
  textButton2.BackgroundTransparency = 1
  textButton2.Text = ""
  textButton2.AutoButtonColor = false
  textButton2.BorderSizePixel = 0
  textButton2.ZIndex = 5
  textButton2.Parent = frame8
  frame8:SetAttribute("Available", true)
  frame8:SetAttribute("Enabled", false)

  local function fn42(arg2)
    local flag5 = arg2 == true
    if selectable == flag5 then return end
    if not flag5 and flag4 then set(false) end
    selectable = flag5
    frame8:SetAttribute("Available", selectable)
    textButton2.Active = selectable
    textButton2.Selectable = selectable
    if selectable then
      frame8.BackgroundColor3 = Color3.fromRGB(20, 21, 23)
      frame8.BackgroundTransparency = 0.06
      textLabel2.TextColor3 = colors.text
      uIStroke3.Color = colors.white
      uIStroke3.Transparency = flag4 and 0.34 or 0.55
      frame9.BackgroundColor3 = flag4 and Color3.fromRGB(45, 47, 51) or colors.pillOff
      frame10.BackgroundColor3 = colors.white
      frame11.BackgroundColor3 = flag4 and colors.green or colors.red
    else
      frame8.BackgroundColor3 = Color3.fromRGB(14, 14, 14)
      frame8.BackgroundTransparency = 0.3
      textLabel2.TextColor3 = Color3.fromRGB(105, 105, 105)
      uIStroke3.Color = Color3.fromRGB(62, 62, 62)
      uIStroke3.Transparency = 0.58
      frame9.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
      frame10.BackgroundColor3 = Color3.fromRGB(88, 88, 88)
      frame11.BackgroundColor3 = Color3.fromRGB(84, 86, 90)
    end
  end
  textButton2.Activated:Connect(function()
    if not selectable then return end
    local now = os.clock()
    if now - num6 < num7 then return end
    num6 = now
    set(not flag4)
  end)
  textButton2.MouseEnter:Connect(function()
    if selectable then
      tweenService:Create(frame8, timing.tween, { BackgroundColor3 = Color3.fromRGB(24, 28, 45) }):Play()
    end
  end)
  textButton2.MouseLeave:Connect(function()
    if selectable then
      tweenService:Create(frame8, timing.tween, { BackgroundColor3 = Color3.fromRGB(20, 21, 23) }):Play()
    end
  end)
  bRG2.toggleRegistry[#bRG2.toggleRegistry + 1] = { row = frame8, set = set, label = label }
  return frame8, set, fn42
end

local function fn42(parent3, text, layoutOrder, arg)
  local textButton2 = Instance.new("TextButton")
  textButton2.Name = "B" .. layoutOrder
  textButton2.Size = UDim2.new(1, 0, 0, 46)
  textButton2.BackgroundColor3 = Color3.fromRGB(20, 21, 23)
  textButton2.BackgroundTransparency = 0.06
  textButton2.AutoButtonColor = false
  textButton2.Text = text
  textButton2.TextColor3 = Color3.fromRGB(245, 245, 245)
  textButton2.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
  textButton2.TextStrokeTransparency = 0.26
  textButton2.TextTransparency = 0
  textButton2.Font = Enum.Font.GothamMedium
  textButton2.TextSize = touchEnabled and 11 or 14
  textButton2.BorderSizePixel = 0
  textButton2.LayoutOrder = layoutOrder
  textButton2.TextWrapped = true
  textButton2.AutoLocalize = false
  textButton2.ZIndex = 2
  textButton2.Parent = parent3
  textButton2:SetAttribute("Disabled", false)
  Instance.new("UICorner", textButton2).CornerRadius = UDim.new(0, 7)
  local frame8 = Instance.new("Frame")
  frame8.Size = UDim2.new(0, 4, 1, -12)
  frame8.Position = UDim2.new(0, 8, 0, 6)
  frame8.BackgroundColor3 = colors.red
  frame8.BorderSizePixel = 0
  frame8.ZIndex = 3
  frame8.Parent = textButton2
  frame8.Visible = false
  Instance.new("UICorner", frame8).CornerRadius = UDim.new(1, 0)
  local uIStroke3 = Instance.new("UIStroke", textButton2)
  uIStroke3.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
  uIStroke3.Color = colors.white
  uIStroke3.Thickness = 1
  uIStroke3.Transparency = 0.62
  textButton2.MouseEnter:Connect(function()
    if textButton2:GetAttribute("Disabled") then return end
    local attribute = textButton2:GetAttribute("ActiveStyle")
    local attribute2 = textButton2:GetAttribute("Young0xHoverColor")
    local attribute3 = textButton2:GetAttribute("Young0xHoverStrokeColor")
    local attribute4 = textButton2:GetAttribute("Young0xHoverStrokeTransparency")
    tweenService:Create(textButton2, timing.tween, {
      BackgroundColor3 = typeof(attribute2) == "Color3" and attribute2 or (attribute and Color3.fromRGB(58, 58, 58) or Color3.fromRGB(34, 34, 34)),
    }):Play()
    tweenService:Create(uIStroke3, timing.tween, {
      Color = typeof(attribute3) == "Color3" and attribute3 or colors.white,
      Transparency = typeof(attribute4) == "number" and attribute4 or 0.08,
    }):Play()
    tweenService:Create(frame8, timing.tween, { BackgroundColor3 = typeof(attribute3) == "Color3" and attribute3 or colors.white }):Play()
  end)
  textButton2.MouseLeave:Connect(function()
    if textButton2:GetAttribute("Disabled") then return end
    local attribute = textButton2:GetAttribute("ActiveStyle")
    local attribute2 = textButton2:GetAttribute("Young0xIdleColor")
    local attribute3 = textButton2:GetAttribute("Young0xIdleStrokeColor")
    local attribute4 = textButton2:GetAttribute("Young0xIdleStrokeTransparency")
    tweenService:Create(textButton2, timing.tween, {
      BackgroundColor3 = typeof(attribute2) == "Color3" and attribute2 or (attribute and Color3.fromRGB(42, 42, 42) or Color3.fromRGB(20, 21, 23)),
    }):Play()
    tweenService:Create(uIStroke3, timing.tween, {
      Color = typeof(attribute3) == "Color3" and attribute3 or colors.white,
      Transparency = typeof(attribute4) == "number" and attribute4 or (attribute and 0.28 or 0.62),
    }):Play()
    tweenService:Create(frame8, timing.tween, { BackgroundColor3 = typeof(attribute3) == "Color3" and attribute3 or colors.white }):Play()
  end)
  local flag4 = false
  textButton2.MouseButton1Click:Connect(function()
    if flag4 or textButton2:GetAttribute("Disabled") then return end
    flag4 = true
    if arg then arg() end
    task.delay(0.25, function()
      flag4 = false
    end)
  end)
  return textButton2
end
bRG2.disableActionButton = function(arg, arg2)
  if not arg then return end
  arg.Text = arg2 or arg.Text
  arg:SetAttribute("Disabled", true)
  arg:SetAttribute("ActiveStyle", false)
  arg.Active = false
  arg.Selectable = false
  arg.BackgroundColor3 = Color3.fromRGB(14, 14, 14)
  arg.BackgroundTransparency = 0.34
  arg.TextColor3 = Color3.fromRGB(105, 105, 105)
  arg.TextTransparency = 0.15
  arg.TextStrokeTransparency = 0.65
  local frame8 = arg:FindFirstChildWhichIsA("Frame")
  if frame8 then
    frame8.BackgroundColor3 = Color3.fromRGB(72, 72, 72)
    frame8.BackgroundTransparency = 0.25
  end
  local uIStroke3 = arg:FindFirstChildWhichIsA("UIStroke")
  if uIStroke3 then
    uIStroke3.Color = Color3.fromRGB(62, 62, 62)
    uIStroke3.Transparency = 0.58
  end
end
bRG2.createEggCodesButton = function(arg)
  local value21, flag4, flag5 = nil, false, false

  local function fn43()
    if not value21 or not value21.Parent then return end
    local result = bRG2.getUnredeemedEggCodes()
    flag5 = #result == 0
    value21.Visible = not flag5
    value21.Size = UDim2.new(1, 0, 0, flag5 and 0 or 40)
    if arg.Name == "ConsumableGifts" then
      arg.Size = UDim2.new(1, 0, 0, flag5 and (touchEnabled and 226 or 232) or (touchEnabled and 270 or 276))
    end
    if flag5 then return end
    local rEvents2 = replicatedStorage:FindFirstChild("rEvents")
    bRG2.codeRemote = rEvents2 and rEvents2:FindFirstChild("codeRemote")
    if flag5 or flag4 or not bRG2.codeRemote or not bRG2.codeRemote:IsA("RemoteFunction") then
      bRG2.disableActionButton(value21, flag4 and "Canjeando..." or ("Canjear " .. tostring(#result * 5) .. " Protein Eggs"))
    else
      value21:SetAttribute("Disabled", false)
      value21.Active, value21.Selectable = true, true
      value21.Text = "Canjear " .. tostring(#result * 5) .. " Protein Eggs"
      value21.BackgroundColor3, value21.BackgroundTransparency = colors.surface2, 0.16
      value21.TextColor3, value21.TextTransparency = colors.white, 0
      value21.TextStrokeTransparency = 0.26
      local frame8 = value21:FindFirstChildWhichIsA("Frame")
      if frame8 then frame8.BackgroundColor3, frame8.BackgroundTransparency = colors.red, 0 end
      local uIStroke3 = value21:FindFirstChildWhichIsA("UIStroke")
      if uIStroke3 then uIStroke3.Color, uIStroke3.Transparency = colors.border, 0.08 end
    end
  end
  value21 = fn42(arg, "Canjear 10 Protein Eggs", 0, function()
    if flag4 or flag5 then return end
    flag4 = true
    fn43()
    for index, item in ipairs(bRG2.getUnredeemedEggCodes()) do
      if not value21.Parent or not parent or not parent.Parent then break end
      local rEvents2 = replicatedStorage:FindFirstChild("rEvents")
      local codeRemote = rEvents2 and rEvents2:FindFirstChild("codeRemote")
      if not codeRemote or not codeRemote:IsA("RemoteFunction") then break end
      local ok, result, result2 = pcall(function()
        return codeRemote:InvokeServer(item)
      end)
      if ok and result == true then
        bRG2.sessionRedeemedEggCodes[item:lower()] = true
      elseif ok and type(result2) == "string" then
        local text = result2:lower()
        if text:find("already", 1, true) and text:find("redeem", 1, true) then
          bRG2.sessionRedeemedEggCodes[item:lower()] = true
        end
      end
      task.wait(0.65)
    end
    flag4 = false
    fn43()
  end)
  value21.Name = "ClaimEggCodesButton"
  value21.AutoLocalize = false
  fn43()
  return fn43
end

local function fn43(arg, arg2, arg3)
  arg.TextXAlignment = Enum.TextXAlignment.Center
  arg.TextSize = touchEnabled and 15 or 16
  arg.TextColor3 = colors.white
  arg.BackgroundColor3 = colors.surface2
  local frame8 = arg:FindFirstChildWhichIsA("Frame")
  if frame8 then
    frame8.Visible = false
    frame8.Size = UDim2.new(0, 5, 1, -14)
    frame8.Position = UDim2.new(0, 9, 0, 7)
    frame8.BackgroundColor3 = colors.red
  end
  local uIStroke3 = arg:FindFirstChildWhichIsA("UIStroke")
  if uIStroke3 then
    uIStroke3.ApplyStrokeMode = Enum.ApplyStrokeMode.Contextual
    uIStroke3.Color = colors.border
    uIStroke3.Transparency = 0.84
  end
  return arg
end
bRG2.makeStatusCard = function(parent3, text, text2, layoutOrder, arg)
  local frame8 = Instance.new("Frame")
  frame8.Size = UDim2.new(1, 0, 0, 70)
  frame8.BackgroundColor3 = colors.surface2
  frame8.BackgroundTransparency = 0.12
  frame8.BorderSizePixel = 0
  frame8.LayoutOrder = layoutOrder
  frame8.ZIndex = 2
  frame8.Parent = parent3
  Instance.new("UICorner", frame8).CornerRadius = UDim.new(0, 7)
  local uIStroke3 = Instance.new("UIStroke", frame8)
  uIStroke3.Color = arg or colors.border
  uIStroke3.Transparency = 0.88
  local textLabel2 = Instance.new("TextLabel")
  textLabel2.Name = "Title"
  textLabel2.Size = UDim2.new(1, -24, 0, 24)
  textLabel2.Position = UDim2.fromOffset(12, 7)
  textLabel2.BackgroundTransparency = 1
  textLabel2.Text = text
  textLabel2.TextColor3 = colors.textDim
  textLabel2.Font = Enum.Font.FredokaOne
  textLabel2.TextSize = touchEnabled and 11 or 13
  textLabel2.TextXAlignment = Enum.TextXAlignment.Left
  textLabel2.ZIndex = 3
  textLabel2.Parent = frame8
  local textLabel3 = Instance.new("TextLabel")
  textLabel3.Name = "Value"
  textLabel3.Size = UDim2.new(1, -24, 0, 29)
  textLabel3.Position = UDim2.fromOffset(12, 32)
  textLabel3.BackgroundTransparency = 1
  textLabel3.Text = text2
  textLabel3.TextColor3 = arg or colors.white
  textLabel3.Font = Enum.Font.FredokaOne
  textLabel3.TextSize = touchEnabled and 13 or 16
  textLabel3.TextXAlignment = Enum.TextXAlignment.Left
  textLabel3.TextTruncate = Enum.TextTruncate.AtEnd
  textLabel3.ZIndex = 3
  textLabel3.Parent = frame8
  return textLabel3, frame8
end

local function fn44(parent3, arg, layoutOrder, arg2, arg3, arg4, arg5)
  local frame8 = Instance.new("Frame")
  frame8.Name = "S" .. layoutOrder
  frame8.Size = UDim2.new(1, 0, 0, 62)
  frame8.BackgroundColor3 = colors.surface2
  frame8.BackgroundTransparency = 0.16
  frame8.BorderSizePixel = 0
  frame8.LayoutOrder = layoutOrder
  frame8.ZIndex = 2
  frame8.Parent = parent3
  Instance.new("UICorner", frame8).CornerRadius = UDim.new(0, 6)
  local uIStroke3 = Instance.new("UIStroke", frame8)
  uIStroke3.Color = colors.border
  uIStroke3.Thickness = 1
  uIStroke3.Transparency = 0.62
  local textLabel2 = Instance.new("TextLabel")
  textLabel2.Size = UDim2.new(1, -24, 0, 24)
  textLabel2.Position = UDim2.new(0, 12, 0, 6)
  textLabel2.BackgroundTransparency = 1
  textLabel2.TextColor3 = colors.white
  textLabel2.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
  textLabel2.TextStrokeTransparency = 0.22
  textLabel2.Font = Enum.Font.FredokaOne
  textLabel2.TextSize = 15
  textLabel2.TextXAlignment = Enum.TextXAlignment.Left
  textLabel2.ZIndex = 3
  textLabel2.Parent = frame8
  local frame9 = Instance.new("Frame")
  frame9.Size = UDim2.new(1, -28, 0, 8)
  frame9.Position = UDim2.new(0, 14, 1, -22)
  frame9.BackgroundColor3 = Color3.fromRGB(48, 48, 48)
  frame9.BorderSizePixel = 0
  frame9.ZIndex = 3
  frame9.Parent = frame8
  Instance.new("UICorner", frame9).CornerRadius = UDim.new(1, 0)
  local frame10 = Instance.new("Frame")
  frame10.Size = UDim2.new(0, 0, 1, 0)
  frame10.BackgroundColor3 = colors.red
  frame10.BorderSizePixel = 0
  frame10.ZIndex = 4
  frame10.Parent = frame9
  Instance.new("UICorner", frame10).CornerRadius = UDim.new(1, 0)
  local uIGradient2 = Instance.new("UIGradient", frame10)
  uIGradient2.Color = ColorSequence.new({ ColorSequenceKeypoint.new(0, colors.blue), ColorSequenceKeypoint.new(1, colors.cyan) })
  local frame11 = Instance.new("Frame")
  frame11.Size = UDim2.fromOffset(18, 18)
  frame11.Position = UDim2.new(0, -9, 0.5, -9)
  frame11.BackgroundColor3 = colors.white
  frame11.BorderSizePixel = 0
  frame11.ZIndex = 5
  frame11.Parent = frame9
  Instance.new("UICorner", frame11).CornerRadius = UDim.new(1, 0)
  local uIStroke4 = Instance.new("UIStroke", frame11)
  uIStroke4.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
  uIStroke4.Color = colors.red
  uIStroke4.Thickness = 1.5
  uIStroke4.Transparency = 0.08
  local num6 = math.clamp(arg4, arg2, arg3)
  local flag4 = false

  local function fn45()
    local num7 = (num6 - arg2) / (arg3 - arg2)
    textLabel2.Text = string.format("%s: %d", arg, num6)
    frame10.Size = UDim2.new(num7, 0, 1, 0)
    frame11.Position = UDim2.new(num7, -9, 0.5, -9)
  end

  local function fn46(arg6)
    local x = frame9.AbsolutePosition.X
    local num7 = math.max(frame9.AbsoluteSize.X, 1)
    local num8 = math.clamp((arg6 - x) / num7, 0, 1)
    num6 = math.floor(arg2 + (arg3 - arg2) * num8 + 0.5)
    fn45()
    if arg5 then arg5(num6) end
  end

  local function fn47(arg6)
    flag4 = true
    fn46(arg6.Position.X)
  end
  frame9.InputBegan:Connect(function(arg6)
    if arg6.UserInputType == Enum.UserInputType.MouseButton1 or arg6.UserInputType == Enum.UserInputType.Touch then
      fn47(arg6)
    end
  end)
  frame11.InputBegan:Connect(function(arg6)
    if arg6.UserInputType == Enum.UserInputType.MouseButton1 or arg6.UserInputType == Enum.UserInputType.Touch then
      fn47(arg6)
    end
  end)
  fn(userInputService.InputChanged:Connect(function(arg6)
    if flag4 and (arg6.UserInputType == Enum.UserInputType.MouseMovement or arg6.UserInputType == Enum.UserInputType.Touch) then
      fn46(arg6.Position.X)
    end
  end))
  fn(userInputService.InputEnded:Connect(function(arg6)
    if arg6.UserInputType == Enum.UserInputType.MouseButton1 or arg6.UserInputType == Enum.UserInputType.Touch then
      flag4 = false
    end
  end))
  fn45()
  if arg5 then arg5(num6) end
  return frame8, function(arg6)
    num6 = math.clamp(arg6, arg2, arg3)
    fn45()
    if arg5 then arg5(num6) end
    return true
  end, function()
    return num6
  end
end
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "BRAfkGui"
screenGui.ResetOnSpawn = false
screenGui.DisplayOrder = 1001
screenGui.IgnoreGuiInset = false
screenGui.Parent = localPlayer.PlayerGui
local frame8 = Instance.new("Frame")
frame8.Name = "AfkOverlay"
local touchEnabled2 = touchEnabled and 310 or 360
local touchEnabled3 = touchEnabled and 102 or 112
frame8.Size = UDim2.fromOffset(touchEnabled2, touchEnabled3)
frame8.AnchorPoint = Vector2.new(1, 0)
frame8.Position = UDim2.new(1, -14, 0, 12)
frame8.BackgroundColor3 = Color3.fromRGB(238, 238, 238)
frame8.BackgroundTransparency = 0.06
frame8.BorderSizePixel = 0
frame8.Visible = false
frame8.Active = false
frame8.ClipsDescendants = true
frame8.Parent = screenGui
Instance.new("UICorner", frame8).CornerRadius = UDim.new(0, 16)
local uIStroke3 = Instance.new("UIStroke", frame8)
uIStroke3.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
uIStroke3.Color = Color3.fromRGB(24, 24, 24)
uIStroke3.Thickness = 0
uIStroke3.Transparency = 1
local uIGradient2 = Instance.new("UIGradient", frame8)
uIGradient2.Color = ColorSequence.new({
  ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 255, 255)),
  ColorSequenceKeypoint.new(0.58, Color3.fromRGB(229, 229, 229)),
  ColorSequenceKeypoint.new(1, Color3.fromRGB(194, 194, 194)),
})
uIGradient2.Rotation = 112
local frame9 = Instance.new("Frame")
frame9.Name = "ActiveDot"
frame9.Size = UDim2.fromOffset(11, 11)
frame9.Position = UDim2.new(0, 17, 0, touchEnabled and 77 or 85)
frame9.BackgroundColor3 = Color3.fromRGB(0, 235, 82)
frame9.BorderSizePixel = 0
frame9.ZIndex = 4
frame9.Active = false
frame9.Parent = frame8
Instance.new("UICorner", frame9).CornerRadius = UDim.new(1, 0)
do
  local uIStroke4 = Instance.new("UIStroke", frame9)
  uIStroke4.Color = Color3.fromRGB(0, 255, 98)
  uIStroke4.Thickness = 2
  uIStroke4.Transparency = 0.34
end
local textLabel2 = Instance.new("TextLabel")
textLabel2.Name = "Title"
textLabel2.Size = UDim2.new(1, -112, 0, 28)
textLabel2.Position = UDim2.new(0, 16, 0, 8)
textLabel2.BackgroundTransparency = 1
textLabel2.Text = "Young0x Hub | Anti AFK"
textLabel2.TextColor3 = Color3.fromRGB(14, 14, 14)
textLabel2.TextStrokeTransparency = 1
textLabel2.Font = Enum.Font.FredokaOne
textLabel2.TextSize = touchEnabled and 15 or 17
textLabel2.TextXAlignment = Enum.TextXAlignment.Left
textLabel2.ZIndex = 4
textLabel2.Active = false
textLabel2.Parent = frame8
local frame10 = Instance.new("Frame")
frame10.Name = "Divider"
frame10.Size = UDim2.new(1, -124, 0, 1)
frame10.Position = UDim2.new(0, 16, 0, 39)
frame10.BackgroundColor3 = Color3.fromRGB(75, 75, 75)
frame10.BackgroundTransparency = 0.6
frame10.BorderSizePixel = 0
frame10.ZIndex = 3
frame10.Active = false
frame10.Parent = frame8
local textLabel3 = Instance.new("TextLabel")
textLabel3.Name = "ActiveLabel"
textLabel3.Size = UDim2.fromOffset(72, 22)
textLabel3.Position = UDim2.new(0, 34, 0, touchEnabled and 71 or 79)
textLabel3.BackgroundTransparency = 1
textLabel3.Text = "Activo"
textLabel3.TextColor3 = Color3.fromRGB(0, 150, 58)
textLabel3.TextStrokeTransparency = 1
textLabel3.Font = Enum.Font.FredokaOne
textLabel3.TextSize = touchEnabled and 13 or 14
textLabel3.TextXAlignment = Enum.TextXAlignment.Left
textLabel3.ZIndex = 4
textLabel3.Active = false
textLabel3.Parent = frame8
local textLabel4 = Instance.new("TextLabel")
textLabel4.Name = "SessionTimer"
textLabel4.Size = UDim2.new(1, -120, 0, 33)
textLabel4.Position = UDim2.new(0, 16, 0, 41)
textLabel4.BackgroundTransparency = 1
textLabel4.RichText = true
textLabel4.Text = "00d 00h 00m 00s <font size=\"12\" color=\"#777777\">000ms</font>"
textLabel4.TextColor3 = Color3.fromRGB(18, 18, 18)
textLabel4.TextStrokeTransparency = 1
textLabel4.Font = Enum.Font.FredokaOne
textLabel4.TextSize = touchEnabled and 15 or 17
textLabel4.TextXAlignment = Enum.TextXAlignment.Left
textLabel4.ZIndex = 4
textLabel4.Active = false
textLabel4.Parent = frame8
local value21 = nil
do

end
do
  local function fn45()
    local tbl17 = {}
    local young0xPortalBrandingConnect = nil
    local young0xPortalBrandingConnect2 = getgenv().Young0xPortalBrandingConnection
    if young0xPortalBrandingConnect2 then
      pcall(function()
        young0xPortalBrandingConnect2:Disconnect()
      end)
      getgenv().Young0xPortalBrandingConnection = nil
    end

    local function clearPortalBranding()
      if young0xPortalBrandingConnect then
        pcall(function()
          young0xPortalBrandingConnect:Disconnect()
        end)
        if getgenv().Young0xPortalBrandingConnection == young0xPortalBrandingConnect then
          getgenv().Young0xPortalBrandingConnection = nil
        end
        young0xPortalBrandingConnect = nil
      end
      for index, item in ipairs(tbl17) do
        if item and item.Parent then item:Destroy() end
      end
      tbl17 = {}
    end

    local function fn46(parent3, face, arg, arg2)
      local name = "Young0xPortalBrand" .. arg
      local name2 = "Young0xPortalSticker" .. arg
      local findFirstChild = parent3:FindFirstChild(name2)
      if findFirstChild then findFirstChild:Destroy() end
      local v
      local size
      local v2
      if face == Enum.NormalId.Left then
        v = Vector3.new(-1, 0, 0)
        size = Vector3.new(0.04, parent3.Size.Y, parent3.Size.Z)
        v2 = parent3.Size.X
      elseif face == Enum.NormalId.Right then
        v = Vector3.new(1, 0, 0)
        size = Vector3.new(0.04, parent3.Size.Y, parent3.Size.Z)
        v2 = parent3.Size.X
      elseif face == Enum.NormalId.Top then
        v = Vector3.new(0, 1, 0)
        size = Vector3.new(parent3.Size.X, 0.04, parent3.Size.Z)
        v2 = parent3.Size.Y
      elseif face == Enum.NormalId.Bottom then
        v = Vector3.new(0, -1, 0)
        size = Vector3.new(parent3.Size.X, 0.04, parent3.Size.Z)
        v2 = parent3.Size.Y
      elseif face == Enum.NormalId.Back then
        v = Vector3.new(0, 0, 1)
        size = Vector3.new(parent3.Size.X, parent3.Size.Y, 0.04)
        v2 = parent3.Size.Z
      else
        v = Vector3.new(0, 0, -1)
        size = Vector3.new(parent3.Size.X, parent3.Size.Y, 0.04)
        v2 = parent3.Size.Z
      end
      local part = Instance.new("Part")
      part.Name = name2
      part.Size = size
      part.CFrame = parent3.CFrame * CFrame.new(v * (v2 * 0.5 + 0.045))
      part.Anchored = true
      part.CanCollide = false
      part.CanTouch = false
      part.CanQuery = false
      part.CastShadow = false
      part.Color = Color3.fromRGB(0, 0, 0)
      part.Material = Enum.Material.SmoothPlastic
      part.Transparency = arg2 and 0 or 1
      part.Parent = parent3
      tbl17[#tbl17 + 1] = part
      local surfaceGui = Instance.new("SurfaceGui")
      surfaceGui.Name = name
      surfaceGui.Adornee = part
      surfaceGui.Face = face
      surfaceGui.AlwaysOnTop = false
      surfaceGui.LightInfluence = 0
      surfaceGui.Brightness = 1
      surfaceGui.MaxDistance = 0
      surfaceGui.SizingMode = Enum.SurfaceGuiSizingMode.PixelsPerStud
      surfaceGui.PixelsPerStud = 12
      surfaceGui.ZOffset = 0
      surfaceGui.Parent = part
      local frame11 = Instance.new("Frame")
      frame11.Name = "Sticker"
      frame11.Size = UDim2.fromScale(1, 1)
      frame11.BackgroundTransparency = 1
      frame11.BorderSizePixel = 0
      frame11.ClipsDescendants = true
      frame11.Parent = surfaceGui
      local imageLabel = Instance.new("ImageLabel")
      imageLabel.Name = "TrollFace"
      imageLabel.AnchorPoint = Vector2.new(0.5, 0.5)
      imageLabel.Size = arg2 and UDim2.fromScale(0.52, 0.7) or UDim2.fromScale(0.5, 0.46)
      imageLabel.Position = arg2 and UDim2.fromScale(0.5, 0.43) or UDim2.fromScale(0.5, 0.46)
      imageLabel.BackgroundTransparency = 1
      imageLabel.Image = "rbxassetid://6862780932"
      imageLabel.ImageColor3 = Color3.fromRGB(255, 255, 255)
      imageLabel.ScaleType = Enum.ScaleType.Fit
      imageLabel.ZIndex = 2
      imageLabel.Parent = frame11
      local textLabel5 = Instance.new("TextLabel")
      textLabel5.Name = "Young0xTitle"
      textLabel5.AnchorPoint = Vector2.new(0.5, 0.5)
      textLabel5.Size = arg2 and UDim2.fromScale(0.92, 0.18) or UDim2.fromScale(0.92, 0.12)
      textLabel5.Position = arg2 and UDim2.fromScale(0.5, 0.86) or UDim2.fromScale(0.5, 0.72)
      textLabel5.BackgroundTransparency = 1
      textLabel5.Text = "Young0x Hub"
      textLabel5.TextColor3 = Color3.fromRGB(255, 255, 255)
      textLabel5.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
      textLabel5.TextStrokeTransparency = 0
      textLabel5.Font = Enum.Font.FredokaOne
      textLabel5.TextScaled = true
      textLabel5.ZIndex = 3
      textLabel5.Parent = frame11
      local uITextSizeConstraint = Instance.new("UITextSizeConstraint")
      uITextSizeConstraint.MinTextSize = 16
      uITextSizeConstraint.MaxTextSize = 64
      uITextSizeConstraint.Parent = textLabel5
      local uIStroke4 = Instance.new("UIStroke")
      uIStroke4.Color = Color3.fromRGB(0, 0, 0)
      uIStroke4.Thickness = arg2 and 2 or 3
      uIStroke4.Transparency = 0
      uIStroke4.ApplyStrokeMode = Enum.ApplyStrokeMode.Contextual
      uIStroke4.Parent = textLabel5
    end

    local function fn47(arg)
      local arg2 = arg
      while arg2 and arg2 ~= workspace do
        if arg2.Name == "RobloxForwardPortals" or arg2.Name == "GameTeleportPortals" then return true end
        arg2 = arg2.Parent
      end
      return false
    end

    local function fn48(arg)
      if not fn47(arg) then return nil end
      if arg:IsA("BasePart") and arg.Name == "AdGuiAdornee" then return arg end
      if arg.ClassName == "AdPortal" then
        local basePortal = arg:FindFirstAncestor("BasePortal")
        local adGuiAdornee = basePortal and basePortal:FindFirstChild("AdGuiAdornee")
        if adGuiAdornee and adGuiAdornee:IsA("BasePart") then return adGuiAdornee end
        if arg.Parent and arg.Parent:IsA("BasePart") then return arg.Parent end
      end
      return nil
    end

    local function fn49(arg)
      local size = arg.Size
      if size.X <= size.Y and size.X <= size.Z then
        return Enum.NormalId.Left, Enum.NormalId.Right, "Left", "Right"
      elseif size.Y <= size.X and size.Y <= size.Z then
        return Enum.NormalId.Top, Enum.NormalId.Bottom, "Top", "Bottom"
      end
      return Enum.NormalId.Front, Enum.NormalId.Back, "Front", "Back"
    end

    local function fn50(arg)
      local value22 = nil
      local num6 = -math.huge
      local text = string.lower(arg.Name)
      for index, item in ipairs(arg:GetDescendants()) do
        if item:IsA("BasePart") and item.Transparency < 1 and item.Name:find("Young0xPortalSticker", 1, true) ~= 1 then
          local tbl18 = { item.Size.X, item.Size.Y, item.Size.Z }
          table.sort(tbl18)
          local item2, item3, item4 = tbl18[1], tbl18[2], tbl18[3]
          local isA = item:IsA("MeshPart") and (item.MeshId == "rbxassetid://15827687249" or item.Name == "Meshes/JunglePortal_Plane.006")
          if item3 >= 12 and item4 >= 20 and (isA or item2 / math.max(item4, 0.001) <= 0.18) then
            local num7 = item3 * item4
            local num8 = num7 / math.max(item2, 0.05)
            if isA then num8 += 1000000000 end
            if string.lower(item.Name) == text then num8 = num8 * 1.45 end
            num8 = num8 * (1.15 - math.clamp(item.Transparency, 0, 0.95) * 0.25)
            if num8 > num6 then
              num6 = num8
              value22 = item
            end
          end
        end
      end
      return value22
    end

    local function getLookVector(arg, arg2)
      if arg2 == Enum.NormalId.Left then
        return -arg.CFrame.RightVector
      elseif arg2 == Enum.NormalId.Right then
        return arg.CFrame.RightVector
      elseif arg2 == Enum.NormalId.Top then
        return arg.CFrame.UpVector
      elseif arg2 == Enum.NormalId.Bottom then
        return -arg.CFrame.UpVector
      elseif arg2 == Enum.NormalId.Back then
        return -arg.CFrame.LookVector
      end
      return arg.CFrame.LookVector
    end

    local function fn51(arg)
      local result, extra = fn49(arg)
      local vector3 = Vector3.new(-arg.Position.X, 0, -arg.Position.Z)
      if vector3.Magnitude < 0.001 then return result end
      if getLookVector(arg, result):Dot(vector3.Unit) >= 0 then return result end
      return extra
    end

    local function fn52(arg, arg2)
      if not arg then return end
      local result, extra = fn49(arg)
      local result2 = fn51(arg)
      local result3 = result2 == result and extra or result
      if not arg:FindFirstChild("Young0xPortalStickerPrimary") then fn46(arg, result2, "Primary", arg2) end
      local young0xPortalStickerSecondar = arg:FindFirstChild("Young0xPortalStickerSecondary")
      if arg2 and young0xPortalStickerSecondar then
        young0xPortalStickerSecondar:Destroy()
      elseif not arg2 and not young0xPortalStickerSecondar then
        fn46(arg, result3, "Secondary", arg2)
      end
    end

    local function fn53(arg)
      if not arg:IsA("Model") or fn47(arg) then return false end
      local text = string.lower(arg.Name)
      return text == "portal" or text == "jungleportal"
    end

    local function fn54(arg)
      return arg:IsA("MeshPart") and arg.MeshId == "rbxassetid://3677621824" and arg.Size.Y >= 24
    end

    local function fn55(arg)
      local arg2 = arg
      while arg2 and arg2 ~= workspace do
        if fn53(arg2) then return arg2 end
        arg2 = arg2.Parent
      end
      return nil
    end

    local function fn56(arg)
      local result = fn48(arg)
      if result then
        fn52(result, true)
        return
      end
      if fn54(arg) then
        fn52(arg, false)
        return
      end
      local result2 = fn55(arg)
      if result2 then
        fn52(fn50(result2), false)
      elseif arg:IsA("BasePart") and not fn47(arg) then
        local text = string.lower(arg.Name)
        if (text == "portal" or text == "jungleportal") and arg.Parent == workspace then fn52(arg, false) end
      end
    end
    local tbl18 = {
      strengthLeaderboard = true,
      rebirthsLeaderboard = true,
      killsLeaderboard = true,
      brawlsLeaderboard = true,
      muscleKingLeaderboard = true,
    }

    local function fn57(arg)
      local arg2 = arg
      while arg2 and arg2 ~= workspace do
        if arg2.Parent == workspace and tbl18[arg2.Name] then return arg2 end
        arg2 = arg2.Parent
      end
      return nil
    end

    local function fn58(arg)
      if arg:IsA("GuiObject") and arg.Name ~= "Young0xLeaderboardTag" then
        arg.ZIndex = math.max(arg.ZIndex, 2)
        if arg:IsA("Frame") and arg.Name == "playerEntry" then
          arg.BackgroundTransparency = math.max(arg.BackgroundTransparency, 0.3)
        end
      end
    end

    local function fn59(arg)
      local result = fn57(arg)
      if not result then return end
      local leaderboardImage = result:FindFirstChild("leaderboardImage", true)
      if not leaderboardImage or not leaderboardImage:IsA("ImageLabel") then return end
      leaderboardImage.Image = "rbxassetid://6862780932"
      leaderboardImage.ImageColor3 = Color3.fromRGB(255, 255, 255)
      leaderboardImage.AnchorPoint = Vector2.new(0.5, 0.5)
      leaderboardImage.Size = UDim2.fromScale(0.72, 0.64)
      leaderboardImage.Position = UDim2.fromScale(0.5, 0.42)
      leaderboardImage.ImageTransparency = 0.72
      leaderboardImage.BackgroundTransparency = 1
      leaderboardImage.ScaleType = Enum.ScaleType.Fit
      leaderboardImage.ZIndex = 1
      local leaderboardPart = result:FindFirstChild("leaderboardPart")
      local leaderboardGui = leaderboardPart and leaderboardPart:FindFirstChild("leaderboardGui")
      if not leaderboardGui or not leaderboardGui:IsA("SurfaceGui") then return end
      for index, item in ipairs(leaderboardGui:GetDescendants()) do
        fn58(item)
      end
      if leaderboardGui:FindFirstChild("Young0xLeaderboardTag") then return end
      local textLabel5 = Instance.new("TextLabel")
      textLabel5.Name = "Young0xLeaderboardTag"
      textLabel5.AnchorPoint = Vector2.new(0.5, 0.5)
      textLabel5.Size = UDim2.fromScale(0.62, 0.07)
      textLabel5.Position = UDim2.fromScale(0.39, 0.76)
      textLabel5.BackgroundTransparency = 1
      textLabel5.Text = "Young0x Hub"
      textLabel5.TextColor3 = Color3.fromRGB(230, 230, 230)
      textLabel5.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
      textLabel5.TextTransparency = 0.12
      textLabel5.TextStrokeTransparency = 0.35
      textLabel5.Font = Enum.Font.FredokaOne
      textLabel5.TextScaled = true
      textLabel5.Rotation = 12
      textLabel5.ZIndex = 1
      textLabel5.Parent = leaderboardGui
      tbl17[#tbl17 + 1] = textLabel5
    end

    local function fn60(arg)
      local arg2 = arg
      local robloxAdBoards = workspace:FindFirstChild("RobloxAdBoards")
      while arg2 and arg2 ~= workspace do
        if robloxAdBoards and arg2.Parent == robloxAdBoards then return arg2:FindFirstChild("AdPart", true) end
        arg2 = arg2.Parent
      end
      return nil
    end

    local function fn61(arg)
      local result = fn60(arg)
      if not result or not result:IsA("BasePart") then return end
      local front = Enum.NormalId.Front
      for index, item in ipairs(result:GetDescendants()) do
        if item:IsA("AdGui") then
          front = item.Face
          item.Enabled = false
        end
      end
      if not result:FindFirstChild("Young0xPortalStickerPrimary") then fn46(result, front, "Primary", true) end
    end

    local function fn62()
      local updateTimerPart = workspace:FindFirstChild("updateTimerPart")
      if not updateTimerPart or not updateTimerPart:IsA("BasePart") then return end
      local young0xCountdownBrand = updateTimerPart:FindFirstChild("Young0xCountdownBrand")
      if young0xCountdownBrand then young0xCountdownBrand:Destroy() end
      local billboardGui = Instance.new("BillboardGui")
      billboardGui.Name = "Young0xCountdownBrand"
      billboardGui.Adornee = updateTimerPart
      billboardGui.Size = UDim2.fromScale(30, 36)
      billboardGui.StudsOffsetWorldSpace = Vector3.new(0, 31, 0)
      billboardGui.AlwaysOnTop = false
      billboardGui.LightInfluence = 0
      billboardGui.MaxDistance = 0
      billboardGui.Parent = updateTimerPart
      tbl17[#tbl17 + 1] = billboardGui
      local textLabel5 = Instance.new("TextLabel")
      textLabel5.Name = "Young0xTitle"
      textLabel5.Size = UDim2.fromScale(1, 0.18)
      textLabel5.Position = UDim2.fromScale(0, 0)
      textLabel5.BackgroundTransparency = 1
      textLabel5.Text = "Young0x Hub"
      textLabel5.TextColor3 = Color3.fromRGB(255, 255, 255)
      textLabel5.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
      textLabel5.TextStrokeTransparency = 0.48
      textLabel5.Font = Enum.Font.FredokaOne
      textLabel5.TextScaled = true
      textLabel5.Parent = billboardGui
      local uIStroke4 = Instance.new("UIStroke")
      uIStroke4.Color = Color3.fromRGB(0, 0, 0)
      uIStroke4.Thickness = 1
      uIStroke4.Transparency = 0.22
      uIStroke4.ApplyStrokeMode = Enum.ApplyStrokeMode.Contextual
      uIStroke4.Parent = textLabel5
      local imageLabel = Instance.new("ImageLabel")
      imageLabel.Name = "TrollFace"
      imageLabel.AnchorPoint = Vector2.new(0.5, 0.5)
      imageLabel.Size = UDim2.fromScale(0.92, 0.8)
      imageLabel.Position = UDim2.fromScale(0.5, 0.6)
      imageLabel.BackgroundTransparency = 1
      imageLabel.Image = "rbxassetid://6862780932"
      imageLabel.ImageColor3 = Color3.fromRGB(255, 255, 255)
      imageLabel.ScaleType = Enum.ScaleType.Fit
      imageLabel.Parent = billboardGui
    end
    local descendants = workspace:GetDescendants()
    for index, item in ipairs(descendants) do
      if (item:IsA("SurfaceGui") and item.Name:find("Young0xPortalBrand", 1, true) == 1) or (item:IsA("BasePart") and item.Name:find("Young0xPortalSticker", 1, true) == 1) or (item:IsA("BillboardGui") and item.Name == "Young0xCountdownBrand") or (item:IsA("TextLabel") and item.Name == "Young0xLeaderboardTag") or (item:IsA("ImageLabel") and item.Name == "Young0xLeaderboardFace") then
        item:Destroy()
      end
      if index % 600 == 0 then runService.Heartbeat:Wait() end
    end
    descendants = nil
    local descendants2 = workspace:GetDescendants()
    for index, item in ipairs(descendants2) do
      local isA = item.ClassName == "AdPortal" or (item:IsA("Model") and fn53(item)) or (item:IsA("BasePart") and (item.Name == "AdGuiAdornee" or fn54(item) or (item.Parent == workspace and (string.lower(item.Name) == "portal" or string.lower(item.Name) == "jungleportal"))))
      if isA then fn56(item) end
      if index % 600 == 0 then runService.Heartbeat:Wait() end
    end
    descendants2 = nil
    local robloxAdBoards = workspace:FindFirstChild("RobloxAdBoards")
    if robloxAdBoards then
      for index, item in ipairs(robloxAdBoards:GetChildren()) do
        fn61(item)
      end
    end
    for key in pairs(tbl18) do
      local findFirstChild = workspace:FindFirstChild(key)
      if findFirstChild then fn59(findFirstChild) end
    end
    fn62()
    young0xPortalBrandingConnect = workspace.DescendantAdded:Connect(function(arg)
      task.defer(function()
        if arg:IsA("BasePart") or arg:IsA("Model") or arg.ClassName == "AdPortal" then fn56(arg) end
        local result = fn57(arg)
        if result then
          fn58(arg)
          local leaderboardPart = result:FindFirstChild("leaderboardPart")
          local leaderboardGui = leaderboardPart and leaderboardPart:FindFirstChild("leaderboardGui")
          if arg.Name == "leaderboardImage" or not leaderboardGui or not leaderboardGui:FindFirstChild("Young0xLeaderboardTag") then
            fn59(result)
          end
        end
        local robloxAdBoards2 = workspace:FindFirstChild("RobloxAdBoards")
        if robloxAdBoards2 and (arg == robloxAdBoards2 or arg:IsDescendantOf(robloxAdBoards2)) then fn61(arg) end
        if arg.Name == "updateTimerPart" then fn62() end
      end)
    end)
    getgenv().Young0xPortalBrandingConnection = young0xPortalBrandingConnect
    fn(young0xPortalBrandingConnect)
    bRG2.clearPortalBranding = clearPortalBranding
  end
  task.defer(function()
    local young0xPortalBrandingConnect = getgenv().Young0xPortalBrandingConnection
    if young0xPortalBrandingConnect then
      pcall(function()
        young0xPortalBrandingConnect:Disconnect()
      end)
      getgenv().Young0xPortalBrandingConnection = nil
    end
    for index, item in ipairs(workspace:GetDescendants()) do
      if (item:IsA("SurfaceGui") and item.Name:find("Young0xPortalBrand", 1, true) == 1) or (item:IsA("BasePart") and item.Name:find("Young0xPortalSticker", 1, true) == 1) or (item:IsA("BillboardGui") and item.Name == "Young0xCountdownBrand") or (item:IsA("TextLabel") and item.Name == "Young0xLeaderboardTag") or (item:IsA("ImageLabel") and item.Name == "Young0xLeaderboardFace") then
        item:Destroy()
      end
      if index % 600 == 0 then runService.Heartbeat:Wait() end
    end
  end)
end
task.spawn(function()
  while getgenv().BRG == bRG2 and screenGui and screenGui.Parent do
    if bRG2.antiAfk and frame8.Visible then
      tweenService:Create(
        frame9,
        TweenInfo.new(timing.dotPulse, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut),
        { BackgroundTransparency = 0.38 }
      ):Play()
      task.wait(timing.dotPulse)
      tweenService:Create(
        frame9,
        TweenInfo.new(timing.dotPulse, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut),
        { BackgroundTransparency = 0 }
      ):Play()
      task.wait(timing.dotPulse)
    else
      task.wait(0.5)
    end
  end
end)
task.spawn(function()
  while getgenv().BRG == bRG2 and screenGui and screenGui.Parent do
    if bRG2.antiAfk and frame8.Visible then
      tweenService:Create(uIStroke3, TweenInfo.new(timing.borderGlow, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), { Transparency = 0.5 }):Play()
      task.wait(timing.borderGlow)
      tweenService:Create(
        uIStroke3,
        TweenInfo.new(timing.borderGlow, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut),
        { Transparency = 0.05 }
      ):Play()
      task.wait(timing.borderGlow)
    else
      task.wait(0.5)
    end
  end
end)
fn(runService.Heartbeat:Connect(function()
  if bRG2.antiAfk and bRG2.afkStartTime then
    local num6 = math.max(0, tick() - bRG2.afkStartTime)
    local num7 = math.floor(num6)
    local text = string.format(
      "%02dd %02dh %02dm %02ds",
      math.floor(num7 / 86400),
      math.floor((num7 % 86400) / 3600),
      math.floor((num7 % 3600) / 60),
      num7 % 60
    )
    textLabel4.Text = text
    if value21 then value21.Text = text end
  end
end))
local tbl17 = {}
tbl17.Home = fn39("Inicio")
tbl17.Training = fn39("Entrenar")
tbl17.FullTrain = fn39("Full Train")
tbl17.Rocks = fn39("Rocks")
tbl17.Rebirths = fn39("Rebirths")
tbl17.PetShop = fn39("Pet Shop")
tbl17.Stats = fn39("Estadísticas")
tbl17.Kills = fn39("Kills")
tbl17.Boss = fn39("Boss")
tbl17.Rewards = fn39("Recompensas")
tbl17.Fortune = fn39("Ruleta")
tbl17.Gifts = fn39("Regalos")
bRG2.profilePage = fn39("Perfiles")
tbl17.Performance = fn39("Rendimiento")
tbl17.Settings = fn39("Ajustes")
for index, item in ipairs({ tbl17.PetShop, tbl17.Gifts }) do
  item.ScrollBarThickness = 0
  item.ScrollingEnabled = false
  item.AutomaticCanvasSize = Enum.AutomaticSize.None
  item.CanvasSize = UDim2.fromOffset(0, 0)
end
do
  local result = bRG2.buildFullTrainDefinitions()
  local tbl18 = {}
  local num6 = 0
  local value22 = nil
  for index, item in ipairs(result) do
    local item2 = item
    if item2.section ~= value22 then
      value22 = item2.section
      num6 += 1
      fn40(tbl17.FullTrain, "— " .. string.upper(value22) .. " —", num6)
    end
    num6 += 1
    local v
    local result2, extra = fn41(tbl17.FullTrain, item2.label, num6, function(arg)
      if arg then
        for index2, item3 in ipairs(tbl18) do
          if item3 ~= v then item3(false, true) end
        end
      end
      return bRG2.setMachine(item2, arg)
    end)
    v = extra
    tbl18[#tbl18 + 1] = v
    bRG2.machineSetters = bRG2.machineSetters or {}
    bRG2.machineSetters[item2.section .. "|" .. item2.label] = v
  end
  tbl17.FullTrain.ScrollingEnabled = true
  tbl17.FullTrain.ScrollBarThickness = touchEnabled and 2 or 3
  tbl17.FullTrain.AutomaticCanvasSize = Enum.AutomaticSize.Y
end
local value22 = nil
local value23 = nil
local value24 = nil
local value25 = nil
local value26 = nil
do
  tbl17.Stats.ScrollingEnabled = false
  local touchEnabled4 = touchEnabled and 252 or 263
  local frame11 = Instance.new("Frame")
  frame11.Name = "ExactStats"
  frame11.Size = UDim2.new(1, 0, 0, touchEnabled4)
  frame11.BackgroundTransparency = 1
  frame11.LayoutOrder = 1
  frame11.Parent = tbl17.Stats
  local frame12 = Instance.new("Frame")
  frame12.Name = "UnifiedStatsBoard"
  frame12.Size = UDim2.new(1, 0, 0, touchEnabled4)
  frame12.Position = UDim2.fromOffset(0, 0)
  frame12.BackgroundColor3 = Color3.fromRGB(14, 15, 20)
  frame12.BackgroundTransparency = 0.08
  frame12.BorderSizePixel = 0
  frame12.ClipsDescendants = true
  frame12.Parent = frame11
  Instance.new("UICorner", frame12).CornerRadius = UDim.new(0, 10)
  local uIStroke4 = Instance.new("UIStroke", frame12)
  uIStroke4.Color = Color3.fromRGB(144, 126, 255)
  uIStroke4.Transparency = 0.3
  local uIGradient3 = Instance.new("UIGradient", frame12)
  uIGradient3.Color = ColorSequence.new({
    ColorSequenceKeypoint.new(0, Color3.fromRGB(27, 23, 39)),
    ColorSequenceKeypoint.new(0.46, Color3.fromRGB(16, 17, 23)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(11, 12, 17)),
  })
  uIGradient3.Rotation = 12
  local frame13 = Instance.new("Frame")
  frame13.Name = "PlayerSummary"
  frame13.BackgroundTransparency = 1
  frame13.BorderSizePixel = 0
  frame13.Parent = frame12
  local frame14 = Instance.new("Frame")
  frame14.BackgroundColor3 = Color3.fromRGB(105, 96, 148)
  frame14.BackgroundTransparency = 0.58
  frame14.BorderSizePixel = 0
  frame14.Parent = frame13
  local imageLabel = Instance.new("ImageLabel")
  imageLabel.Name = "Avatar"
  imageLabel.BackgroundColor3 = Color3.fromRGB(12, 13, 18)
  imageLabel.BackgroundTransparency = 0.08
  imageLabel.BorderSizePixel = 0
  imageLabel.ScaleType = Enum.ScaleType.Crop
  imageLabel.Image = bRG2.cachedAvatarThumbnail or ("rbxthumb://type=AvatarHeadShot&id=" .. tostring(localPlayer.UserId) .. "&w=420&h=420")
  imageLabel.Parent = frame13
  bRG2.statsAvatar = imageLabel
  Instance.new("UICorner", imageLabel).CornerRadius = UDim.new(1, 0)
  local uIStroke5 = Instance.new("UIStroke", imageLabel)
  uIStroke5.Color, uIStroke5.Transparency = Color3.fromRGB(167, 143, 255), 0.2

  local function fn45(name, text, textSize, textColor3)
    local textLabel5 = Instance.new("TextLabel")
    textLabel5.Name = name
    textLabel5.BackgroundTransparency = 1
    textLabel5.Text = text
    textLabel5.TextColor3 = textColor3
    textLabel5.Font = Enum.Font.Garamond
    textLabel5.TextSize = textSize
    textLabel5.TextXAlignment = Enum.TextXAlignment.Left
    textLabel5.TextTruncate = Enum.TextTruncate.AtEnd
    textLabel5.Parent = frame13
    return textLabel5
  end
  local result = fn45("DisplayName", localPlayer.DisplayName, touchEnabled and 15 or 19, colors.white)
  local result2 = fn45("Username", "@" .. localPlayer.Name, touchEnabled and 11 or 13, Color3.fromRGB(187, 188, 198))
  local result3 = fn45("UserId", "ID: " .. tostring(localPlayer.UserId), touchEnabled and 10 or 12, Color3.fromRGB(150, 152, 164))
  local frame15 = Instance.new("Frame")
  frame15.Name = "StatsGrid"
  frame15.BackgroundTransparency = 1
  frame15.BorderSizePixel = 0
  frame15.Parent = frame12
  if touchEnabled then
    frame13.Size, frame13.Position = UDim2.new(1, -12, 0, 70), UDim2.fromOffset(6, 6)
    frame14.Size, frame14.Position = UDim2.new(1, -12, 0, 1), UDim2.new(0, 6, 1, -1)
    imageLabel.Size, imageLabel.Position = UDim2.fromOffset(52, 52), UDim2.fromOffset(10, 9)
    result.Size, result.Position = UDim2.new(1, -86, 0, 20), UDim2.fromOffset(74, 7)
    result2.Size, result2.Position = UDim2.new(1, -86, 0, 17), UDim2.fromOffset(74, 27)
    result3.Size, result3.Position = UDim2.new(1, -86, 0, 16), UDim2.fromOffset(74, 44)
    frame15.Size, frame15.Position = UDim2.new(1, -12, 0, touchEnabled4 - 84), UDim2.fromOffset(6, 80)
  else
    frame13.Size, frame13.Position = UDim2.new(0.3, -5, 1, -12), UDim2.fromOffset(6, 6)
    frame14.Size, frame14.Position = UDim2.new(0, 1, 1, -12), UDim2.new(1, -1, 0, 6)
    imageLabel.AnchorPoint = Vector2.new(0.5, 0)
    imageLabel.Size, imageLabel.Position = UDim2.new(0.82, 0, 0, 124), UDim2.new(0.5, 0, 0, 12)
    local uIAspectRatioConstraint = Instance.new("UIAspectRatioConstraint", imageLabel)
    uIAspectRatioConstraint.AspectRatio, uIAspectRatioConstraint.DominantAxis = 1, Enum.DominantAxis.Width
    local uISizeConstraint = Instance.new("UISizeConstraint", imageLabel)
    uISizeConstraint.MinSize, uISizeConstraint.MaxSize = Vector2.new(80, 80), Vector2.new(124, 124)
    result.Size, result.Position = UDim2.new(1, -20, 0, 26), UDim2.new(0, 10, 0.55, 0)
    result.TextXAlignment = Enum.TextXAlignment.Center
    result2.Size, result2.Position = UDim2.new(1, -20, 0, 22), UDim2.new(0, 10, 0.69, 0)
    result2.TextXAlignment = Enum.TextXAlignment.Center
    result3.Size, result3.Position = UDim2.new(1, -20, 0, 20), UDim2.new(0, 10, 0.81, 0)
    result3.TextXAlignment = Enum.TextXAlignment.Center
    frame15.Size, frame15.Position = UDim2.new(0.7, -7, 1, -12), UDim2.new(0.3, 1, 0, 6)
  end
  task.spawn(function()
    if not bRG2.cachedAvatarThumbnail then
      local ok, cachedAvatarThumbnail = pcall(
        players.GetUserThumbnailAsync,
        players,
        localPlayer.UserId,
        Enum.ThumbnailType.HeadShot,
        Enum.ThumbnailSize.Size180x180
      )
      if ok and cachedAvatarThumbnail then bRG2.cachedAvatarThumbnail = cachedAvatarThumbnail end
    end
    if imageLabel.Parent and bRG2.cachedAvatarThumbnail then imageLabel.Image = bRG2.cachedAvatarThumbnail end
    pcall(function()
      game:GetService("ContentProvider"):PreloadAsync({ imageLabel })
    end)
  end)
  local tbl18 = {
    { "Fuerza", { "Strength" } },
    { "Durabilidad", { "Durability" } },
    { "Agilidad", { "Agility" } },
    { "Rebirths", { "Rebirths" } },
    { "Kills", { "Kills", "Kill Streak" } },
    { "Brawls", { "Brawls", "brawlKills" } },
    { "Gemas", { "Gems" } },
    { "Cristales", { "OverchargedShards" } },
    { "Giros", { "__spins" } },
  }
  local tbl19 = {}
  local num6, num7 = 3, 3
  local num8 = 1 / num7
  for index, item in ipairs(tbl18) do
    local num9, num10 = (index - 1) % num6, math.floor((index - 1) / num6)
    local frame16 = Instance.new("Frame")
    frame16.Name = item[1]
    frame16.Size = UDim2.new(1 / num6, 0, num8, 0)
    frame16.Position = UDim2.new(num9 / num6, 0, num10 * num8, 0)
    frame16.BackgroundTransparency = 1
    frame16.BorderSizePixel = 0
    frame16.Parent = frame15
    if num9 > 0 then
      local frame17 = Instance.new("Frame")
      frame17.Size = UDim2.new(0, 1, 1, -12)
      frame17.Position = UDim2.fromOffset(0, 6)
      frame17.BackgroundColor3 = Color3.fromRGB(105, 96, 148)
      frame17.BackgroundTransparency = 0.58
      frame17.BorderSizePixel = 0
      frame17.Parent = frame16
    end
    if num10 > 0 then
      local frame17 = Instance.new("Frame")
      frame17.Size = UDim2.new(1, -12, 0, 1)
      frame17.Position = UDim2.fromOffset(6, 0)
      frame17.BackgroundColor3 = Color3.fromRGB(105, 96, 148)
      frame17.BackgroundTransparency = 0.58
      frame17.BorderSizePixel = 0
      frame17.Parent = frame16
    end
    local textLabel5 = Instance.new("TextLabel")
    textLabel5.Size = UDim2.new(1, -16, 0, 18)
    textLabel5.Position = UDim2.fromOffset(8, touchEnabled and 5 or 7)
    textLabel5.BackgroundTransparency, textLabel5.Text = 1, item[1]
    textLabel5.TextColor3, textLabel5.Font, textLabel5.TextSize = Color3.fromRGB(156, 158, 170), Enum.Font.Garamond, touchEnabled and 10 or 11
    textLabel5.TextXAlignment, textLabel5.Parent = Enum.TextXAlignment.Center, frame16
    local textLabel6 = Instance.new("TextLabel")
    textLabel6.Size = UDim2.new(1, -16, 0, touchEnabled and 26 or 30)
    textLabel6.Position = UDim2.fromOffset(8, touchEnabled and 22 or 27)
    textLabel6.BackgroundTransparency, textLabel6.Text = 1, "0"
    textLabel6.TextColor3, textLabel6.Font, textLabel6.TextSize = colors.white, Enum.Font.Garamond, touchEnabled and 14 or 16
    textLabel6.TextXAlignment, textLabel6.TextTruncate, textLabel6.Parent = Enum.TextXAlignment.Center, Enum.TextTruncate.AtEnd, frame16
    textLabel6.TextScaled = true
    local uITextSizeConstraint = Instance.new("UITextSizeConstraint", textLabel6)
    uITextSizeConstraint.MinTextSize = touchEnabled and 8 or 9
    uITextSizeConstraint.MaxTextSize = touchEnabled and 14 or 16
    tbl19[index] = textLabel6
  end

  local function fn46(arg)
    local str = tostring(math.floor(tonumber(arg) or 0))
    repeat
      local v
      str, v = str:gsub("^(-?%d+)(%d%d%d)", "%1.%2")
    until v == 0
    return str
  end
  task.spawn(function()
    while getgenv().BRG == bRG2 and parent and parent.Parent do
      local leaderstats = localPlayer:FindFirstChild("leaderstats")
      for index, item in ipairs(tbl18) do
        local num9 = 0
        if item[2][1] == "__spins" then
          num9 = bRG2.getFortuneSpinCount and bRG2.getFortuneSpinCount() or 0
        else
          for index2, item2 in ipairs(item[2]) do
            local findFirstChild = (leaderstats and leaderstats:FindFirstChild(item2)) or localPlayer:FindFirstChild(item2)
            if findFirstChild and findFirstChild:IsA("ValueBase") then
              num9 = findFirstChild.Value
              break
            end
          end
        end
        tbl19[index].Text = fn46(num9)
      end
      task.wait(0.5)
    end
  end)
end
if false then
  local function fn45(parent3, name, text, size, position3, font, textSize, textColor3, arg)
    local textLabel5 = Instance.new("TextLabel")
    textLabel5.Name = name
    textLabel5.Size = size
    textLabel5.Position = position3
    textLabel5.BackgroundTransparency = 1
    textLabel5.Text = text
    textLabel5.TextColor3 = textColor3
    textLabel5.Font = font
    textLabel5.TextSize = textSize
    textLabel5.TextXAlignment = arg or Enum.TextXAlignment.Left
    textLabel5.TextYAlignment = Enum.TextYAlignment.Center
    textLabel5.TextTruncate = Enum.TextTruncate.AtEnd
    textLabel5.ZIndex = 4
    textLabel5.Parent = parent3
    return textLabel5
  end

  local function fn46(arg, arg2, arg3)
    Instance.new("UICorner", arg).CornerRadius = UDim.new(0, arg2 or 8)
    local uIStroke4 = Instance.new("UIStroke", arg)
    uIStroke4.Color = Color3.fromRGB(58, 61, 67)
    uIStroke4.Thickness = 1
    uIStroke4.Transparency = arg3 or 0.34
    return uIStroke4
  end

  local function fn47(arg, layoutOrder)
    local frame11 = Instance.new("Frame")
    frame11.Name = arg:gsub("%s+", "") .. "Section"
    frame11.Size = UDim2.new(1, 0, 0, 22)
    frame11.BackgroundTransparency = 1
    frame11.LayoutOrder = layoutOrder
    frame11.ZIndex = 2
    frame11.Parent = tbl17.Home
    local result = fn45(
      frame11,
      "Title",
      arg,
      UDim2.new(0, touchEnabled and 132 or 158, 1, 0),
      UDim2.new(),
      Enum.Font.GothamBold,
      touchEnabled and 9 or 10,
      Color3.fromRGB(150, 154, 163)
    )
    result.TextYAlignment = Enum.TextYAlignment.Bottom
    local frame12 = Instance.new("Frame")
    frame12.Size = UDim2.new(1, touchEnabled and -140 or -168, 0, 1)
    frame12.Position = UDim2.new(0, touchEnabled and 140 or 168, 1, -4)
    frame12.BackgroundColor3 = Color3.fromRGB(45, 48, 53)
    frame12.BackgroundTransparency = 0.28
    frame12.BorderSizePixel = 0
    frame12.ZIndex = 3
    frame12.Parent = frame11
  end
  local frame11 = Instance.new("Frame")
  frame11.Name = "Welcome"
  frame11.Size = UDim2.new(1, 0, 0, touchEnabled and 112 or 104)
  frame11.BackgroundColor3 = Color3.fromRGB(15, 16, 18)
  frame11.BorderSizePixel = 0
  frame11.LayoutOrder = 1
  frame11.ZIndex = 2
  frame11.Parent = tbl17.Home
  fn46(frame11, 9, 0.24)
  local uIGradient3 = Instance.new("UIGradient", frame11)
  uIGradient3.Color = ColorSequence.new(Color3.fromRGB(20, 22, 25), Color3.fromRGB(11, 12, 14))
  uIGradient3.Rotation = 12
  local frame12 = Instance.new("Frame")
  frame12.Size = UDim2.new(0, 3, 1, -24)
  frame12.Position = UDim2.fromOffset(0, 12)
  frame12.BackgroundColor3 = Color3.fromRGB(224, 227, 233)
  frame12.BackgroundTransparency = 0.16
  frame12.BorderSizePixel = 0
  frame12.ZIndex = 4
  frame12.Parent = frame11
  Instance.new("UICorner", frame12).CornerRadius = UDim.new(1, 0)
  fn45(
    frame11,
    "Eyebrow",
    "BIENVENIDO A PUBLIC TRAINING",
    UDim2.new(1, -32, 0, 16),
    UDim2.fromOffset(16, 8),
    Enum.Font.GothamBold,
    touchEnabled and 8 or 9,
    Color3.fromRGB(137, 142, 152)
  )
  local result = fn45(
    frame11,
    "Greeting",
    "Hola, " .. localPlayer.DisplayName .. ".",
    UDim2.new(1, touchEnabled and -32 or -178, 0, 27),
    UDim2.fromOffset(16, 24),
    Enum.Font.GothamBold,
    touchEnabled and 16 or 18,
    colors.white
  )
  result.TextTruncate = Enum.TextTruncate.AtEnd
  local result2 = fn45(
    frame11,
    "Thanks",
    "Gracias por elegir Young0x Hub.",
    UDim2.new(1, -32, 0, 20),
    UDim2.fromOffset(16, touchEnabled and 50 or 49),
    Enum.Font.GothamMedium,
    touchEnabled and 10 or 11,
    Color3.fromRGB(221, 224, 230)
  )
  result2.TextTruncate = Enum.TextTruncate.None
  local result3 = fn45(
    frame11,
    "Intro",
    "Entrená, progresá y dejá tu cuenta trabajando mientras estás AFK.",
    UDim2.new(1, -32, 0, touchEnabled and 35 or 24),
    UDim2.fromOffset(16, touchEnabled and 69 or 69),
    Enum.Font.Gotham,
    touchEnabled and 9 or 10,
    Color3.fromRGB(157, 162, 171)
  )
  result3.TextWrapped = true
  result3.TextTruncate = Enum.TextTruncate.None
  result3.TextYAlignment = Enum.TextYAlignment.Top
  if not touchEnabled then
    local frame13 = Instance.new("Frame")
    frame13.Name = "ReadyBadge"
    frame13.AnchorPoint = Vector2.new(1, 0)
    frame13.Size = UDim2.fromOffset(148, 28)
    frame13.Position = UDim2.new(1, -14, 0, 18)
    frame13.BackgroundColor3 = Color3.fromRGB(24, 26, 29)
    frame13.BorderSizePixel = 0
    frame13.ZIndex = 4
    frame13.Parent = frame11
    fn46(frame13, 7, 0.42)
    local frame14 = Instance.new("Frame")
    frame14.Size = UDim2.fromOffset(6, 6)
    frame14.Position = UDim2.fromOffset(12, 11)
    frame14.BackgroundColor3 = colors.green
    frame14.BorderSizePixel = 0
    frame14.ZIndex = 5
    frame14.Parent = frame13
    Instance.new("UICorner", frame14).CornerRadius = UDim.new(1, 0)
    fn45(
      frame13,
      "Text",
      "SCRIPT LISTO",
      UDim2.new(1, -28, 1, 0),
      UDim2.fromOffset(26, 0),
      Enum.Font.GothamBold,
      9,
      Color3.fromRGB(211, 214, 220)
    )
  end
  fn47("ACCESOS RÁPIDOS", 2)
  local frame13 = Instance.new("Frame")
  frame13.Name = "QuickActions"
  frame13.Size = UDim2.new(1, 0, 0, touchEnabled and 132 or 122)
  frame13.BackgroundTransparency = 1
  frame13.LayoutOrder = 3
  frame13.ZIndex = 2
  frame13.Parent = tbl17.Home
  local tbl18 = {
    { tab = "Entrenar", title = "Entrenar", detail = "Ganás fuerza incluso AFK" },
    { tab = "Rebirths", title = "Rebirths", detail = "Automatizá tu progreso" },
    { tab = "Pet Shop", title = "Pet Shop", detail = "Gestioná pets y auras" },
    { tab = "Kills", title = "Kills", detail = "Objetivos, King y Brawl" },
  }
  for index, item in ipairs(tbl18) do
    local item2 = item
    local num6 = (index - 1) % 2
    local num7 = math.floor((index - 1) / 2)
    local textButton2 = Instance.new("TextButton")
    textButton2.Name = "GoTo" .. item2.tab:gsub("%s+", "")
    textButton2.Size = UDim2.new(0.5, -3, 0, touchEnabled and 63 or 58)
    textButton2.Position = UDim2.new(num6 * 0.5, num6 == 0 and 0 or 3, 0, num7 * (touchEnabled and 69 or 64))
    textButton2.BackgroundColor3 = Color3.fromRGB(18, 20, 23)
    textButton2.BackgroundTransparency = 0.05
    textButton2.AutoButtonColor = false
    textButton2.Text = ""
    textButton2.BorderSizePixel = 0
    textButton2.ZIndex = 3
    textButton2.Parent = frame13
    local result4 = fn46(textButton2, 8, 0.34)
    local result5 = fn45(
      textButton2,
      "Index",
      string.format("%02d", index),
      UDim2.fromOffset(touchEnabled and 30 or 34, touchEnabled and 28 or 32),
      UDim2.fromOffset(9, touchEnabled and 17 or 13),
      Enum.Font.GothamBold,
      touchEnabled and 9 or 10,
      Color3.fromRGB(131, 136, 146),
      Enum.TextXAlignment.Center
    )
    result5.BackgroundColor3 = Color3.fromRGB(27, 29, 33)
    result5.BackgroundTransparency = 0
    Instance.new("UICorner", result5).CornerRadius = UDim.new(0, 6)
    fn45(
      textButton2,
      "Title",
      item2.title,
      UDim2.new(1, touchEnabled and -77 or -86, 0, 20),
      UDim2.fromOffset(touchEnabled and 47 or 52, touchEnabled and 9 or 8),
      Enum.Font.GothamBold,
      touchEnabled and 11 or 12,
      colors.white
    )
    fn45(
      textButton2,
      "Detail",
      item2.detail,
      UDim2.new(1, touchEnabled and -77 or -86, 0, 18),
      UDim2.fromOffset(touchEnabled and 47 or 52, touchEnabled and 29 or 28),
      Enum.Font.Gotham,
      touchEnabled and 8 or 9,
      Color3.fromRGB(145, 150, 160)
    )
    fn45(
      textButton2,
      "Arrow",
      "›",
      UDim2.fromOffset(20, 30),
      UDim2.new(1, -28, 0.5, -15),
      Enum.Font.GothamBold,
      touchEnabled and 17 or 19,
      Color3.fromRGB(180, 184, 192),
      Enum.TextXAlignment.Center
    )
    fn(textButton2.MouseEnter:Connect(function()
      tweenService:Create(textButton2, timing.tween, { BackgroundColor3 = Color3.fromRGB(25, 27, 31) }):Play()
      tweenService:Create(result4, timing.tween, { Color = Color3.fromRGB(104, 108, 116), Transparency = 0.16 }):Play()
    end))
    fn(textButton2.MouseLeave:Connect(function()
      tweenService:Create(textButton2, timing.tween, { BackgroundColor3 = Color3.fromRGB(18, 20, 23) }):Play()
      tweenService:Create(result4, timing.tween, { Color = Color3.fromRGB(58, 61, 67), Transparency = 0.34 }):Play()
    end))
    fn(textButton2.Activated:Connect(function()
      if bRG2.shellUI.isCloseConfirmationOpen() then return end
      fn38(item2.tab)
      local item3 = tbl12[item2.tab]
      if item3 then
        local num8 = item3.AbsolutePosition.X - scrollingFrame.AbsolutePosition.X + scrollingFrame.CanvasPosition.X
        local num9 = math.max(0, scrollingFrame.AbsoluteCanvasSize.X - scrollingFrame.AbsoluteSize.X)
        tweenService:Create(scrollingFrame, TweenInfo.new(0.28, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {
          CanvasPosition = Vector2.new(math.clamp(num8 - (scrollingFrame.AbsoluteSize.X - item3.AbsoluteSize.X) / 2, 0, num9), 0),
        }):Play()
      end
    end))
  end
  fn47("TU PROGRESO", 4)
  local frame14 = Instance.new("Frame")
  frame14.Name = "AccountProgress"
  frame14.Size = UDim2.new(1, 0, 0, touchEnabled and 78 or 82)
  frame14.BackgroundColor3 = Color3.fromRGB(15, 16, 18)
  frame14.BackgroundTransparency = 0.04
  frame14.BorderSizePixel = 0
  frame14.LayoutOrder = 5
  frame14.ZIndex = 2
  frame14.Parent = tbl17.Home
  fn46(frame14, 8, 0.34)
  local tbl19 = {}
  for index, item in ipairs({ "FUERZA", "DURABILIDAD", "REBIRTHS" }) do
    local frame15 = Instance.new("Frame")
    frame15.Size = UDim2.new(1 / 3, 0, 1, 0)
    frame15.Position = UDim2.new((index - 1) / 3, 0, 0, 0)
    frame15.BackgroundTransparency = 1
    frame15.ZIndex = 3
    frame15.Parent = frame14
    if index > 1 then
      local frame16 = Instance.new("Frame")
      frame16.Size = UDim2.new(0, 1, 1, -26)
      frame16.Position = UDim2.fromOffset(0, 13)
      frame16.BackgroundColor3 = Color3.fromRGB(47, 50, 55)
      frame16.BackgroundTransparency = 0.22
      frame16.BorderSizePixel = 0
      frame16.ZIndex = 3
      frame16.Parent = frame15
    end
    fn45(
      frame15,
      "Caption",
      item,
      UDim2.new(1, -12, 0, 22),
      UDim2.fromOffset(6, 7),
      Enum.Font.GothamBold,
      touchEnabled and 8 or 9,
      Color3.fromRGB(123, 128, 138),
      Enum.TextXAlignment.Center
    )
    local result4 = fn45(
      frame15,
      "Value",
      "0",
      UDim2.new(1, -16, 0, 34),
      UDim2.fromOffset(8, 30),
      Enum.Font.GothamBold,
      touchEnabled and 15 or 17,
      colors.white,
      Enum.TextXAlignment.Center
    )
    result4.TextScaled = true
    local uITextSizeConstraint = Instance.new("UITextSizeConstraint", result4)
    uITextSizeConstraint.MinTextSize = touchEnabled and 10 or 11
    uITextSizeConstraint.MaxTextSize = touchEnabled and 15 or 17
    tbl19[index] = result4
  end

  local function fn48(arg)
    local str = tostring(math.floor(tonumber(arg) or 0))
    while true do
      local text, extra = str:gsub("^(-?%d+)(%d%d%d)", "%1.%2")
      str = text
      if extra == 0 then return str end
    end
  end
  task.spawn(function()
    while getgenv().BRG == bRG2 and parent and parent.Parent do
      local leaderstats = localPlayer:FindFirstChild("leaderstats")
      local strength = (leaderstats and leaderstats:FindFirstChild("Strength")) or localPlayer:FindFirstChild("Strength")
      local durability = (leaderstats and leaderstats:FindFirstChild("Durability")) or localPlayer:FindFirstChild("Durability")
      local rebirths = (leaderstats and leaderstats:FindFirstChild("Rebirths")) or localPlayer:FindFirstChild("Rebirths")
      tbl19[1].Text = fn48(strength and strength.Value or 0)
      tbl19[2].Text = fn48(durability and durability.Value or 0)
      tbl19[3].Text = fn48(rebirths and rebirths.Value or 0)
      task.wait(0.5)
    end
  end)
  fn47("QUÉ PODÉS HACER", 6)
  local frame15 = Instance.new("Frame")
  frame15.Name = "FeatureGuide"
  frame15.Size = UDim2.new(1, 0, 0, touchEnabled and 188 or 176)
  frame15.BackgroundColor3 = Color3.fromRGB(14, 15, 17)
  frame15.BackgroundTransparency = 0.04
  frame15.BorderSizePixel = 0
  frame15.LayoutOrder = 7
  frame15.ZIndex = 2
  frame15.Parent = tbl17.Home
  fn46(frame15, 8, 0.34)
  local tbl20 = {
    { "01", "Dejá tu cuenta trabajando", "Entrenamiento automático, Auto King y Anti-AFK." },
    { "02", "Subí sin vigilar el juego", "Rebirths, rocas y recompensas automáticas." },
    { "03", "Mejorá tu inventario", "Pets, auras, Fortune Wheel y regalos." },
    { "04", "Controlá cada detalle", "Kills, estadísticas, perfiles y rendimiento." },
  }
  for index, item in ipairs(tbl20) do
    local touchEnabled4 = touchEnabled and 46 or 43
    local frame16 = Instance.new("Frame")
    frame16.Size = UDim2.new(1, -20, 0, touchEnabled4)
    frame16.Position = UDim2.fromOffset(10, 2 + (index - 1) * touchEnabled4)
    frame16.BackgroundTransparency = 1
    frame16.ZIndex = 3
    frame16.Parent = frame15
    if index > 1 then
      local frame17 = Instance.new("Frame")
      frame17.Size = UDim2.new(1, -42, 0, 1)
      frame17.Position = UDim2.fromOffset(42, 0)
      frame17.BackgroundColor3 = Color3.fromRGB(39, 42, 47)
      frame17.BackgroundTransparency = 0.26
      frame17.BorderSizePixel = 0
      frame17.ZIndex = 3
      frame17.Parent = frame16
    end
    local result4 = fn45(
      frame16,
      "Number",
      item[1],
      UDim2.fromOffset(30, 26),
      UDim2.fromOffset(0, math.floor((touchEnabled4 - 26) / 2)),
      Enum.Font.GothamBold,
      touchEnabled and 9 or 10,
      Color3.fromRGB(157, 162, 172),
      Enum.TextXAlignment.Center
    )
    result4.BackgroundColor3 = Color3.fromRGB(24, 26, 29)
    result4.BackgroundTransparency = 0
    Instance.new("UICorner", result4).CornerRadius = UDim.new(0, 6)
    fn45(
      frame16,
      "Title",
      item[2],
      UDim2.new(1, -48, 0, 19),
      UDim2.fromOffset(42, touchEnabled and 4 or 3),
      Enum.Font.GothamBold,
      touchEnabled and 10 or 11,
      Color3.fromRGB(231, 233, 237)
    )
    fn45(
      frame16,
      "Detail",
      item[3],
      UDim2.new(1, -48, 0, 17),
      UDim2.fromOffset(42, touchEnabled and 23 or 21),
      Enum.Font.Gotham,
      touchEnabled and 8 or 9,
      Color3.fromRGB(137, 142, 152)
    )
  end
end
do
  tbl17.Home.ScrollBarThickness = 0
  tbl17.Home.ScrollingEnabled = false
  tbl17.Home.AutomaticCanvasSize = Enum.AutomaticSize.None
  tbl17.Home.CanvasSize = UDim2.fromOffset(0, 0)
  tbl17.Home.BackgroundColor3 = colors.bg
  tbl17.Home.BackgroundTransparency = 1
  local uIPadding2 = tbl17.Home:FindFirstChildOfClass("UIPadding")
  if uIPadding2 then
    uIPadding2.PaddingTop = UDim.new(0, 0)
    uIPadding2.PaddingBottom = UDim.new(0, 0)
  end
  local touchEnabled4 = touchEnabled and 34 or 37
  local touchEnabled5 = touchEnabled and 3 or 4
  local num6 = touchEnabled4 * 6 + touchEnabled5 * 5
  bRG2.homeRowHeight, bRG2.homeRowGap = touchEnabled4, touchEnabled5
  local frame11 = Instance.new("Frame")
  frame11.Name = "HomeMinimal"
  frame11.Size = UDim2.new(1, 0, 0, hubH - num2)
  frame11.BackgroundTransparency = 1
  frame11.BorderSizePixel = 0
  frame11.LayoutOrder = 1
  frame11.ZIndex = 2
  frame11.Parent = tbl17.Home
  local textLabel5 = Instance.new("TextLabel")
  textLabel5.Name = "Greeting"
  textLabel5.Size = UDim2.new(1, 0, 0, touchEnabled and 26 or 29)
  textLabel5.Position = UDim2.fromOffset(0, 0)
  textLabel5.BackgroundTransparency = 1
  textLabel5.Text = "Hola " .. localPlayer.DisplayName .. ", Disfruta del Script."
  bRG2.greetingLabel = textLabel5
  textLabel5.TextColor3 = colors.white
  textLabel5.Font = Enum.Font.GothamBold
  textLabel5.TextSize = touchEnabled and 18 or 21
  textLabel5.TextXAlignment = Enum.TextXAlignment.Center
  textLabel5.TextTruncate = Enum.TextTruncate.AtEnd
  textLabel5.ZIndex = 3
  textLabel5.Parent = frame11
  local frame12 = Instance.new("Frame")
  frame12.Name = "QuickSettings"
  frame12.Size = UDim2.new(1, 0, 0, num6)
  frame12.Position = UDim2.fromOffset(0, touchEnabled and 27 or 31)
  frame12.BackgroundTransparency = 1
  frame12.BorderSizePixel = 0
  frame12.ZIndex = 3
  frame12.Parent = frame11
  bRG2.homeControls = frame12
end
bRG2.weightRow, value22, bRG2.setWeightAvailable = fn41(tbl17.Training, "Auto Strength", 2, function(arg)
  if arg then
    if value23 then value23(false, true) end
    if value24 then value24(false, true) end
    if value25 then value25(false, true) end
    if value26 then value26(false, true) end
    return fn22("weight", { "Weight" })
  elseif bRG2.trainingMode == "weight" then
    stopAutoTraining()
  end
  return true
end)
bRG2.setAutoWeight = function(arg)
  return value22(arg == true)
end
bRG2.handstandsRow, value23, bRG2.setHandstandsAvailable = fn41(tbl17.Training, "Auto Handstands", 3, function(arg)
  if arg then
    if value22 then value22(false, true) end
    if value24 then value24(false, true) end
    if value25 then value25(false, true) end
    if value26 then value26(false, true) end
    return fn22("handstands", { "Handstands", "Handstand" })
  elseif bRG2.trainingMode == "handstands" then
    stopAutoTraining()
  end
  return true
end)
bRG2.setAutoHandstands = function(arg)
  return value23(arg == true)
end
bRG2.pushupsRow, value24, bRG2.setPushupsAvailable = fn41(tbl17.Training, "Auto Pushups", 4, function(arg)
  if arg then
    if value22 then value22(false, true) end
    if value23 then value23(false, true) end
    if value25 then value25(false, true) end
    if value26 then value26(false, true) end
    return fn22("pushups", { "Pushups", "Pushup" })
  elseif bRG2.trainingMode == "pushups" then
    stopAutoTraining()
  end
  return true
end)
bRG2.setAutoPushups = function(arg)
  return value24(arg == true)
end
bRG2.situpsRow, value25, bRG2.setSitupsAvailable = fn41(tbl17.Training, "Auto Situps", 5, function(arg)
  if arg then
    if value22 then value22(false, true) end
    if value23 then value23(false, true) end
    if value24 then value24(false, true) end
    if value26 then value26(false, true) end
    return fn22("situps", { "Situps", "Situp" })
  elseif bRG2.trainingMode == "situps" then
    stopAutoTraining()
  end
  return true
end)
bRG2.setAutoSitups = function(arg)
  return value25(arg == true)
end
bRG2.fastRepRow, bRG2.fastRepToggleSetter = fn41(bRG2.homeControls, "Fast Rep", 1, function(arg)
  bRG2.fastRep = arg == true
  if bRG2.fastRep then
    if bRG2.trainingMode or bRG2.machineDefinition then bRG2.startFastRepPump() end
  else
    bRG2.stopFastRepPump()
    fn19()
    local character = localPlayer.Character
    local humanoid = character and character:FindFirstChildWhichIsA("Humanoid")
    if humanoid then
      for index, item in ipairs(humanoid:GetPlayingAnimationTracks()) do
        if tostring(item.Name):lower() == "rep" then pcall(item.AdjustSpeed, item, 1) end
      end
    end
  end
  return true
end)
bRG2.fastRepRow.Size = UDim2.new(1, 0, 0, bRG2.homeRowHeight)
bRG2.fastRepRow.Position = UDim2.fromOffset(0, 0)
bRG2.setFastRep = function(arg)
  return bRG2.fastRepToggleSetter(arg == true)
end
bRG2.autoEggRow, bRG2.autoEggToggleSetter, bRG2.setAutoEggAvailable = fn41(bRG2.homeControls, "Auto Egg · 30 min", 2, function(autoEgg)
  bRG2.autoEggRun += 1
  local autoEggRun = bRG2.autoEggRun
  bRG2.autoEgg = autoEgg
  if not autoEgg then return true end
  if not value3 or not consumeBoostEvent or not consumeBoostEvent:IsA("RemoteEvent") or not bRG2.findProteinEgg() then
    bRG2.autoEgg = false
    return false
  end
  task.spawn(function()
    local flag4 = false
    local num6 = 0
    while getgenv().BRG == bRG2 and bRG2.autoEgg and bRG2.autoEggRun == autoEggRun and parent and parent.Parent do
      local result = bRG2.proteinEggTimeRemaining()
      if bRG2.giftEggBusy then
        task.wait(0.25)
      elseif result == nil then
        task.wait(1)
      elseif result > 10 then
        if flag4 then
          num6 += 1
          if num6 >= 2 then
            flag4 = false
            num6 = 0
          end
        end
        task.wait(flag4 and 0.5 or math.clamp(result - 1, 1, 15))
      elseif result <= 1 and not flag4 then
        flag4 = true
        num6 = 0
        local result2 = bRG2.findProteinEgg()
        if result2 then
          bRG2.consumeBatch(result2, 1)
          task.wait(0.5)
        else
          task.wait(3)
        end
      else
        task.wait(0.25)
      end
    end
  end)
  return true
end)
bRG2.setAutoEgg = function(arg)
  return bRG2.autoEggToggleSetter(arg == true)
end
bRG2.autoEggRow.Size = UDim2.new(1, 0, 0, bRG2.homeRowHeight)
bRG2.autoEggRow.Position = UDim2.fromOffset(0, bRG2.homeRowHeight + bRG2.homeRowGap)
bRG2.hideFramesRow, bRG2.hideFramesToggleSetter = fn41(bRG2.homeControls, "Ocultar frames", 4, function(arg)
  return bRG2.setFramesHidden(arg)
end)
bRG2.hideFramesRow.Size = UDim2.new(1, 0, 0, bRG2.homeRowHeight)
bRG2.hideFramesRow.Position = UDim2.fromOffset(0, (bRG2.homeRowHeight + bRG2.homeRowGap) * 3)
bRG2.hideMyPetsRow, bRG2.hideMyPetsToggleSetter = fn41(bRG2.homeControls, "Ocultar mis pets", 5, function(arg)
  return bRG2.setMyPetsHidden(arg)
end)
bRG2.hideMyPetsRow.Size = UDim2.new(1, 0, 0, bRG2.homeRowHeight)
bRG2.hideMyPetsRow.Position = UDim2.fromOffset(0, (bRG2.homeRowHeight + bRG2.homeRowGap) * 4)
bRG2.hideOtherPetsRow, bRG2.hideOtherPetsToggleSetter = fn41(bRG2.homeControls, "Ocultar otras pets", 6, function(arg)
  return bRG2.setOtherPetsHidden(arg)
end)
bRG2.hideOtherPetsRow.Size = UDim2.new(1, 0, 0, bRG2.homeRowHeight)
bRG2.hideOtherPetsRow.Position = UDim2.fromOffset(0, (bRG2.homeRowHeight + bRG2.homeRowGap) * 5)
bRG2.lockPositionRow, bRG2.lockPositionToggleSetter = fn41(bRG2.homeControls, "Lock Position", 3, function(arg)
  return bRG2.setLockPositionEnabled(arg)
end)
bRG2.lockPositionRow.Size = UDim2.new(1, 0, 0, bRG2.homeRowHeight)
bRG2.lockPositionRow.Position = UDim2.fromOffset(0, (bRG2.homeRowHeight + bRG2.homeRowGap) * 2)
bRG2.setLockPosition = function(arg)
  return bRG2.lockPositionToggleSetter(arg == true)
end
bRG2.syncQuickSettingsFromGame = function()
  local flag4 = localPlayer:GetAttribute("ShowPopups") == false
  fn33(flag4)
  if bRG2.hideFramesToggleSetter and bRG2.hideFramesRow:GetAttribute("Enabled") ~= flag4 then
    bRG2.hideFramesToggleSetter(flag4, true)
  end
  local hideMyPets = localPlayer:GetAttribute("PetsVisible") ~= true
  bRG2.hideMyPets = hideMyPets
  if bRG2.hideMyPetsToggleSetter and bRG2.hideMyPetsRow:GetAttribute("Enabled") ~= hideMyPets then
    bRG2.hideMyPetsToggleSetter(hideMyPets, true)
  end
  local result = bRG2.getPreferenceController()
  if result and type(result.AreOtherPetsShown) == "function" then
    local ok, result2 = pcall(result.AreOtherPetsShown, result)
    if ok then
      local hideOtherPets = result2 ~= true
      bRG2.hideOtherPets = hideOtherPets
      if bRG2.hideOtherPetsToggleSetter and bRG2.hideOtherPetsRow:GetAttribute("Enabled") ~= hideOtherPets then
        bRG2.hideOtherPetsToggleSetter(hideOtherPets, true)
      end
    end
  end
end
fn(localPlayer:GetAttributeChangedSignal("ShowPopups"):Connect(bRG2.syncQuickSettingsFromGame))
fn(localPlayer:GetAttributeChangedSignal("PetsVisible"):Connect(bRG2.syncQuickSettingsFromGame))
bRG2.syncQuickSettingsFromGame()
task.spawn(function()
  while getgenv().BRG == bRG2 and parent and parent.Parent do
    bRG2.syncQuickSettingsFromGame()
    task.wait(2)
  end
end)
do
  local function get__l00Il(arg)
    if type(arg) ~= "number" or arg < 0 or arg ~= arg or arg == math.huge then return nil end
    if type(value4) == "table" and type(value4.calculateRequiredRebirthStrength) == "function" then
      local ok, result = pcall(value4.calculateRequiredRebirthStrength, arg, localPlayer)
      pcall(function()
        local env = getgenv and getgenv() or nil
        local setidentity = env and (env.setthreadidentity or env.setidentity)
        if type(setidentity) == "function" then setidentity(8) end
      end)
      if ok and type(result) == "number" and result > 0 and result < math.huge then return result end
    end
    local gameConfig = type(bRG2.gameConfig) == "table" and bRG2.gameConfig or {}
    local num6 = tonumber(gameConfig.BASE_REBIRTH_STRENGTH) or 10000
    local num7 = tonumber(gameConfig.REBIRTH_STRENGTH_INCREMENT) or 5000
    local num8 = num6 + arg * num7
    local equippedPets = localPlayer:FindFirstChild("equippedPets")
    if equippedPets then
      local num9 = 0
      for index, item in ipairs(equippedPets:GetChildren()) do
        local petReference = item:FindFirstChild("petReference")
        if item:IsA("ObjectValue") and item.Value and petReference and petReference.Value and item.Value.Name == "Speedy Sally" then
          num9 += 10
        end
      end
      local attribute = localPlayer:GetAttribute("UltimateGoldenRebirth")
      if type(attribute) == "number" and attribute == attribute then num9 += math.max(0, attribute) * 10 end
      num8 *= math.max(0.1, 1 - num9 / 100)
    end
    return num8 > 0 and num8 < math.huge and num8 or nil
  end
  bRG2.getRequiredRebirthStrength = get__l00Il
  local frame11 = Instance.new("Frame")
  frame11.Name = "RebirthDashboard"
  frame11.Size = UDim2.new(1, 0, 0, uI.hubH - num2 - num - 4)
  frame11.BackgroundTransparency = 1
  frame11.BorderSizePixel = 0
  frame11.LayoutOrder = 1
  frame11.ZIndex = 2
  frame11.Parent = tbl17.Rebirths
  bRG2.rebirthUI = { segments = {} }
  tbl17.Rebirths.ScrollBarThickness = 0
  tbl17.Rebirths.ScrollingEnabled = false
  tbl17.Rebirths.AutomaticCanvasSize = Enum.AutomaticSize.None
  tbl17.Rebirths.CanvasSize = UDim2.fromOffset(0, 0)
  local uIPadding2 = tbl17.Rebirths:FindFirstChildOfClass("UIPadding")
  if uIPadding2 then
    uIPadding2.PaddingTop = UDim.new(0, 0)
    uIPadding2.PaddingBottom = UDim.new(0, 0)
  end
  local frame12 = Instance.new("Frame")
  frame12.Size = UDim2.new(0, 1, 1, -28)
  frame12.Position = UDim2.new(0.5, 0, 0, 14)
  frame12.BackgroundColor3 = colors.border
  frame12.BackgroundTransparency = 0.25
  frame12.BorderSizePixel = 0
  frame12.ZIndex = 3
  frame12.Parent = frame11
  frame12.Visible = true
  local frame13 = Instance.new("Frame")
  frame13.Size, frame13.BackgroundTransparency, frame13.Parent = UDim2.fromScale(1, 1), 1, frame11
  local num6 = math.floor(hubW * 0.25)
  local num7 = math.floor(frame11.Size.Y.Offset / 2)
  local touchEnabled4 = touchEnabled and math.min(70, num7 - 12) or math.min(88, num7 - 12)
  local frame14 = Instance.new("Frame")
  frame14.Name = "PerfectRing"
  frame14.Size = UDim2.fromOffset(touchEnabled4 * 2, touchEnabled4 * 2)
  frame14.Position = UDim2.fromOffset(num6 - touchEnabled4, num7 - touchEnabled4)
  frame14.BackgroundTransparency = 1
  frame14.ZIndex, frame14.Parent = 3, frame13
  Instance.new("UICorner", frame14).CornerRadius = UDim.new(1, 0)
  local uIStroke4 = Instance.new("UIStroke", frame14)
  uIStroke4.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
  uIStroke4.Color = Color3.fromRGB(49, 52, 58)
  uIStroke4.Thickness = touchEnabled and 3 or 4
  local frame15 = Instance.new("Frame")
  frame15.Name = "ProgressRing"
  frame15.Size = frame14.Size
  frame15.Position = frame14.Position
  frame15.BackgroundTransparency = 1
  frame15.ZIndex = 4
  frame15.Parent = frame13
  Instance.new("UICorner", frame15).CornerRadius = UDim.new(1, 0)
  local num8 = math.ceil(uIStroke4.Thickness * 0.5)
  local num9 = math.ceil(uIStroke4.Thickness) + 1

  local function fn45(name, arg, arg2, arg3)
    local frame16 = Instance.new("Frame")
    frame16.Name = name
    frame16.Size = UDim2.fromOffset(arg2, touchEnabled4 * 2 + num9 * 2)
    frame16.Position = UDim2.fromOffset(arg, -num9)
    frame16.BackgroundTransparency = 1
    frame16.BorderSizePixel = 0
    frame16.ClipsDescendants = true
    frame16.Visible = false
    frame16.ZIndex = 4
    frame16.Parent = frame15
    local frame17 = Instance.new("Frame")
    frame17.Name = "NativeCircle"
    frame17.Size = UDim2.fromOffset(touchEnabled4 * 2, touchEnabled4 * 2)
    frame17.Position = UDim2.fromOffset(arg3, num9)
    frame17.BackgroundTransparency = 1
    frame17.BorderSizePixel = 0
    frame17.ZIndex = 4
    frame17.Parent = frame16
    Instance.new("UICorner", frame17).CornerRadius = UDim.new(1, 0)
    local uIStroke5 = Instance.new("UIStroke", frame17)
    uIStroke5.Name = "NativeArcStroke"
    uIStroke5.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
    uIStroke5.Color = Color3.fromRGB(244, 36, 52)
    uIStroke5.Thickness = uIStroke4.Thickness
    local uIGradient3 = Instance.new("UIGradient", uIStroke5)
    uIGradient3.Name = "HalfPlaneMask"
    uIGradient3.Type = Enum.GradientType.Linear
    uIGradient3.Offset = Vector2.zero
    uIGradient3.Transparency = NumberSequence.new({
      NumberSequenceKeypoint.new(0, 0),
      NumberSequenceKeypoint.new(0.499, 0),
      NumberSequenceKeypoint.new(0.501, 1),
      NumberSequenceKeypoint.new(1, 1),
    })
    return frame16, uIGradient3
  end
  bRG2.rebirthUI.rightArc, bRG2.rebirthUI.rightArcMask = fn45("RightArcClip", touchEnabled4 - num8, touchEnabled4 + num9 + num8, -touchEnabled4 + num8)
  bRG2.rebirthUI.leftArc, bRG2.rebirthUI.leftArcMask = fn45("LeftArcClip", -num9, touchEnabled4 + num9 + num8, num9)
  bRG2.rebirthUI.ringRadius = touchEnabled4
  bRG2.rebirthUI.renderProgressArc = function(arg)
    local num10 = math.clamp(tonumber(arg) or 0, 0, 1)
    local num11 = num10 * 360
    local visible = num11 > 0
    bRG2.rebirthUI.rightArc.Visible = visible
    bRG2.rebirthUI.leftArc.Visible = num11 > 180
    bRG2.rebirthUI.rightArcMask.Rotation = math.clamp(num11, 0, 180)
    bRG2.rebirthUI.leftArcMask.Rotation = math.clamp(num11, 180, 360)
  end

  local function fn46(name, text, arg, arg2, textSize, arg3)
    local textLabel5 = Instance.new("TextLabel")
    textLabel5.Name = name
    textLabel5.Size = UDim2.fromOffset(touchEnabled and 124 or 156, arg2)
    textLabel5.Position = UDim2.fromOffset(num6 - (touchEnabled and 62 or 78), arg)
    textLabel5.BackgroundTransparency = 1
    textLabel5.Text, textLabel5.TextColor3 = text, arg3 or colors.white
    textLabel5.Font, textLabel5.TextSize = Enum.Font.GothamBold, textSize
    textLabel5.TextXAlignment = Enum.TextXAlignment.Center
    textLabel5.ZIndex, textLabel5.Parent = 5, frame13
    return textLabel5
  end
  bRG2.rebirthUI.progressNumbers = fn46("ProgressNumbers", "0 / 0", num7 - (touchEnabled and 41 or 58), 28, touchEnabled and 11 or 14, colors.white)
  bRG2.rebirthUI.progressPercent = fn46(
    "ProgressPercent",
    "0%",
    num7 - (touchEnabled and 11 or 20),
    touchEnabled and 40 or 58,
    touchEnabled and 27 or 43,
    colors.white
  )
  bRG2.rebirthUI.progressRemaining = fn46(
    "ProgressRemaining",
    "Calculando",
    num7 + (touchEnabled and 33 or 43),
    24,
    touchEnabled and 8 or 10,
    Color3.fromRGB(150, 152, 158)
  )
  bRG2.rebirthUI.exactCount = fn46(
    "ExactRebirthCount",
    "Rebirths: 0",
    num7 + touchEnabled4 + (touchEnabled and 12 or 16),
    32,
    touchEnabled and 16 or 19,
    colors.white
  )
  bRG2.rebirthUI.exactCount.Size = UDim2.fromOffset(touchEnabled and 170 or 210, 32)
  bRG2.rebirthUI.exactCount.Position = UDim2.fromOffset(num6 - (touchEnabled and 85 or 105), num7 + touchEnabled4 + (touchEnabled and 12 or 16))
  local frame16 = Instance.new("Frame")
  frame16.AnchorPoint = Vector2.new(0, 0.5)
  frame16.Size, frame16.Position = UDim2.new(0.5, -18, 0, (touchEnabled and 40 or 43) * 4 + 12), UDim2.new(0.5, 18, 0.5, 0)
  frame16.BackgroundTransparency, frame16.Parent = 1, frame11
  frame16.Visible = true
  local frame17 = Instance.new("Frame")
  frame17.Name = "Controls"
  frame17.Size, frame17.Position = UDim2.fromScale(1, 1), UDim2.fromOffset(0, 0)
  frame17.BackgroundTransparency, frame17.Parent = 1, frame16
  local uIListLayout2 = Instance.new("UIListLayout", frame17)
  uIListLayout2.Padding, uIListLayout2.SortOrder = UDim.new(0, 4), Enum.SortOrder.LayoutOrder
  bRG2.rebirthUI.controls = frame17

  local function fn47(arg, arg2, arg3)
    local result, extra, extra2 = fn41(frame17, arg, arg2, arg3)
    result.Size = UDim2.new(1, 0, 0, touchEnabled and 40 or 43)
    for index, item in ipairs(result:GetChildren()) do
      if item:IsA("TextLabel") then item.TextSize = touchEnabled and 9 or 11 end
    end
    return result, extra, extra2
  end

  local function fn48()
    local frame18 = Instance.new("Frame")
    frame18.Name, frame18.Size = "RebirthTargetInput", UDim2.new(1, 0, 0, touchEnabled and 40 or 43)
    frame18.BackgroundColor3, frame18.BackgroundTransparency = Color3.fromRGB(20, 21, 23), 0.06
    frame18.BorderSizePixel, frame18.LayoutOrder, frame18.ZIndex, frame18.Parent = 0, 2, 4, frame17
    Instance.new("UICorner", frame18).CornerRadius = UDim.new(0, 7)
    local uIStroke5 = Instance.new("UIStroke", frame18)
    uIStroke5.Color, uIStroke5.Thickness, uIStroke5.Transparency = colors.white, 1, 0.55
    local textLabel5 = Instance.new("TextLabel")
    textLabel5.Size, textLabel5.Position = UDim2.new(0.36, -8, 1, 0), UDim2.fromOffset(12, 0)
    textLabel5.BackgroundTransparency, textLabel5.Text = 1, "Objetivo"
    textLabel5.TextColor3, textLabel5.Font, textLabel5.TextSize = colors.text, Enum.Font.GothamSemibold, touchEnabled and 10 or 12
    textLabel5.TextXAlignment, textLabel5.ZIndex, textLabel5.Parent = Enum.TextXAlignment.Left, 5, frame18
    local textBox = Instance.new("TextBox")
    textBox.Name = "TargetInput"
    textBox.Size, textBox.Position = UDim2.new(0.64, -18, 0, touchEnabled and 29 or 31), UDim2.new(0.36, 4, 0.5, touchEnabled and -14 or -15)
    textBox.BackgroundColor3, textBox.BackgroundTransparency = Color3.fromRGB(20, 21, 23), 1
    textBox.BorderSizePixel, textBox.ClearTextOnFocus = 0, false
    textBox.Text, textBox.PlaceholderText = "", "Ejemplo: 18,980"
    textBox.TextColor3, textBox.PlaceholderColor3 = colors.white, Color3.fromRGB(154, 156, 162)
    textBox.Font, textBox.TextSize = Enum.Font.Gotham, touchEnabled and 10 or 12
    textBox.TextStrokeTransparency = 1
    textBox.TextXAlignment, textBox.ZIndex, textBox.Parent = Enum.TextXAlignment.Center, 6, frame18
    Instance.new("UICorner", textBox).CornerRadius = UDim.new(0, 6)
    local uIStroke6 = Instance.new("UIStroke", textBox)
    uIStroke6.Color, uIStroke6.Transparency = colors.border, 1
    return frame18, textBox, uIStroke6
  end
  local result, targetInput, extra = fn48()
  bRG2.rebirthUI.targetInput = targetInput
  local color3 = Color3.fromRGB(198, 78, 88)
  local v

  local function fn49()
    local leaderstats = localPlayer:FindFirstChild("leaderstats")
    local rebirths = (leaderstats and leaderstats:FindFirstChild("Rebirths")) or localPlayer:FindFirstChild("Rebirths")
    return math.max(0, math.floor(tonumber(rebirths and rebirths.Value) or 0))
  end
  local result2 = fn49()
  task.spawn(function()
    while getgenv().BRG == bRG2 and parent and parent.Parent do
      local result3 = fn49()
      if result3 ~= result2 then
        result2 = result3
        local character = localPlayer.Character
        local humanoid = character and character:FindFirstChildWhichIsA("Humanoid")
        if humanoid then
          for index, item in ipairs(humanoid:GetPlayingAnimationTracks()) do
            local text = tostring(item.Name):lower()
            if text:find("rep", 1, true) or text:find("push", 1, true) or text:find("situp", 1, true) or text:find("handstand", 1, true) or text:find("lift", 1, true) then
              pcall(item.Stop, item, 0.08)
            end
          end
        end
      end
      task.wait(0.2)
    end
  end)

  local function fn50(arg)
    local text = tostring(arg or ""):upper():gsub("%s+", "")
    if text == "" then return nil end
    local match = text:match("([KMBT])$")
    if match then
      local num10 = tonumber(text:sub(1, -2):gsub(",", "."))
      local item = ({ K = 1000, M = 1000000, B = 1000000000, T = 1e12 })[match]
      return num10 and math.floor(num10 * item) or nil
    end
    local text2 = text:gsub("[^%d]", "")
    return text2 ~= "" and tonumber(text2) or nil
  end

  local function fn51(rebirthTarget, arg)
    rebirthTarget = tonumber(rebirthTarget)
    if rebirthTarget then rebirthTarget = math.max(0, math.floor(rebirthTarget)) end
    bRG2.rebirthTarget = rebirthTarget
    if arg then targetInput.Text = rebirthTarget and tostring(rebirthTarget) or "" end
    local flag4 = rebirthTarget ~= nil and rebirthTarget > fn49()
    targetInput.TextColor3 = (flag4 or targetInput.Text == "") and colors.white or color3
    extra.Color = (flag4 or targetInput.Text == "") and colors.border or color3
    if v then v(flag4) end
    return flag4
  end
  targetInput.FocusLost:Connect(function()
    fn51(fn50(targetInput.Text), true)
  end)
  bRG2.setRebirthTargetValue = function(arg)
    return fn51(arg, true)
  end
  local flag4 = false
  local tbl18 = {
    samples = {},
    lastValue = nil,
    burstGain = 0,
    burstStartedAt = nil,
    lastPositiveAt = nil,
    previousBurstAt = nil,
    smoothedEta = nil,
    lastEtaUpdate = 0,
  }

  local function fn52(lastValue)
    table.clear(tbl18.samples)
    tbl18.lastValue = lastValue
    tbl18.burstGain = 0
    tbl18.burstStartedAt = nil
    tbl18.lastPositiveAt = nil
    tbl18.previousBurstAt = nil
    tbl18.smoothedEta = nil
    tbl18.lastEtaUpdate = 0
  end

  local function fn53()
    if tbl18.burstGain <= 0 or not tbl18.burstStartedAt then return end
    if tbl18.previousBurstAt then
      local interval = tbl18.burstStartedAt - tbl18.previousBurstAt
      if interval >= 0.08 and interval <= 3600 then
        tbl18.samples[#tbl18.samples + 1] = { interval = interval, gain = tbl18.burstGain }
        while #tbl18.samples > 20 do
          table.remove(tbl18.samples, 1)
        end
      end
    end
    tbl18.previousBurstAt = tbl18.burstStartedAt
    tbl18.burstGain = 0
    tbl18.burstStartedAt = nil
    tbl18.lastPositiveAt = nil
  end

  local function fn54(lastValue, lastPositiveAt)
    if tbl18.lastValue == nil then
      tbl18.lastValue = lastValue
      return
    end
    local num10 = lastValue - tbl18.lastValue
    tbl18.lastValue = lastValue
    if num10 > 0 then
      if tbl18.burstGain == 0 then tbl18.burstStartedAt = lastPositiveAt end
      tbl18.burstGain += num10
      tbl18.lastPositiveAt = lastPositiveAt
    elseif num10 < 0 then
      tbl18.burstGain = 0
      tbl18.burstStartedAt = nil
      tbl18.lastPositiveAt = nil
      tbl18.previousBurstAt = nil
    end
    if tbl18.lastPositiveAt and lastPositiveAt - tbl18.lastPositiveAt >= 0.85 then fn53() end
  end

  local function fn55(arg)
    table.sort(arg)
    local count = #arg
    if count == 0 then return nil end
    if count % 2 == 1 then return arg[math.ceil(count / 2)] end
    return (arg[count / 2] + arg[count / 2 + 1]) * 0.5
  end

  local function fn56()
    if #tbl18.samples < 3 then return nil end
    local tbl19, tbl20 = {}, {}
    for index, item in ipairs(tbl18.samples) do
      tbl19[#tbl19 + 1] = item.interval
      tbl20[#tbl20 + 1] = item.gain
    end
    local result3, result4 = fn55(tbl19), fn55(tbl20)
    local num10, num11, num12 = 0, 0, 0
    for index, item in ipairs(tbl18.samples) do
      if item.interval >= result3 * 0.45 and item.interval <= result3 * 2.2 and item.gain >= result4 * 0.4 and item.gain <= result4 * 2.5 then
        local num13 = 0.45 + index / #tbl18.samples
        num10 += item.gain * num13
        num11 += item.interval * num13
        num12 += 1
      end
    end
    return num12 >= 3 and num11 > 0 and num10 / num11 or nil
  end

  local function fn57(arg)
    if arg then
      if bRG2.autoRebirth then return true end
      bRG2.autoRebirthRun += 1
      local autoRebirthRun = bRG2.autoRebirthRun
      bRG2.autoRebirth = true
      task.spawn(function()
        while getgenv().BRG == bRG2 and bRG2.autoRebirth and bRG2.autoRebirthRun == autoRebirthRun and parent and parent.Parent do
          local num10 = 0.08
          local ok = pcall(function()
            local rEvents2 = replicatedStorage:FindFirstChild("rEvents")
            local rebirthRemote = rEvents2 and rEvents2:FindFirstChild("rebirthRemote")
            bRG2.rebirthRemote = rebirthRemote
            local leaderstats = localPlayer:FindFirstChild("leaderstats")
            local strength = leaderstats and leaderstats:FindFirstChild("Strength")
            local rebirths = leaderstats and leaderstats:FindFirstChild("Rebirths")
            if not rebirthRemote or not rebirthRemote:IsA("RemoteFunction") or not strength or not rebirths then
              num10 = 0.5
              return
            end
            if bRG2.rebirthTargetMode and bRG2.rebirthTarget and rebirths.Value >= bRG2.rebirthTarget then
              bRG2.rebirthTargetMode = false
              bRG2.autoRebirth = false
              bRG2.autoRebirthRun += 1
              task.defer(function()
                if bRG2.rebirthTargetToggleSetter then bRG2.rebirthTargetToggleSetter(false, true) end
              end)
              return
            end
            if flag4 then return end
            local result3 = get__l00Il(rebirths.Value)
            if not flag4 and result3 and strength.Value >= result3 and getgenv().BRG == bRG2 and bRG2.autoRebirth and bRG2.autoRebirthRun == autoRebirthRun and parent and parent.Parent then
              flag4 = true
              local ok, result4 = pcall(function()
                return rebirthRemote:InvokeServer("rebirthRequest")
              end)
              flag4 = false
              num10 = not ok and 0.5 or (result4 == true and 0.25 or 0.15)
            end
          end)
          task.wait(ok and num10 or 0.5)
        end
      end)
    else
      bRG2.autoRebirth = false
      bRG2.autoRebirthRun += 1
    end
    return true
  end
  bRG2.autoRebirthRow, bRG2.autoRebirthToggleSetter = fn47("Auto Rebirth", 1, function(arg)
    if arg then
      bRG2.rebirthTargetMode = false
      if bRG2.rebirthTargetToggleSetter then bRG2.rebirthTargetToggleSetter(false, true) end
    end
    return fn57(arg)
  end)
  bRG2.setAutoRebirth = function(arg)
    local state = bRG2.embeddedKills and bRG2.embeddedKills.State
    local flag5 = type(state) == "table" and state.bossCombat == true
    if arg ~= true and bRG2.rebirthTargetMode and flag5 and bRG2.rebirthTargetToggleSetter then
      bRG2.young0xBossRebirthTarget = bRG2.rebirthTarget
      return bRG2.rebirthTargetToggleSetter(false)
    elseif arg == true and bRG2.young0xBossRebirthTarget and bRG2.rebirthTargetToggleSetter then
      local young0xBossRebirthTarget = bRG2.young0xBossRebirthTarget
      bRG2.young0xBossRebirthTarget = nil
      if bRG2.setRebirthTargetValue then bRG2.setRebirthTargetValue(young0xBossRebirthTarget) end
      return bRG2.rebirthTargetToggleSetter(true)
    end
    return bRG2.autoRebirthToggleSetter(arg == true)
  end
  bRG2.rebirthTargetRow, bRG2.rebirthTargetToggleSetter, v = fn47("Renacer hasta el objetivo", 3, function(arg)
    if arg then
      if not fn51(fn50(targetInput.Text), true) then return false end
      bRG2.rebirthTargetMode = true
      fn52(fn49())
      if bRG2.autoRebirthToggleSetter then bRG2.autoRebirthToggleSetter(false, true) end
      return fn57(true)
    end
    bRG2.rebirthTargetMode = false
    return fn57(false)
  end)
  bRG2.setTargetRebirth = function(arg)
    return bRG2.rebirthTargetToggleSetter(arg == true)
  end
  fn(targetInput:GetPropertyChangedSignal("Text"):Connect(function()
    local result3 = fn51(fn50(targetInput.Text), false)
    if bRG2.rebirthTargetMode and not result3 then
      bRG2.rebirthTargetMode = false
      fn57(false)
      bRG2.rebirthTargetToggleSetter(false, true)
    end
  end))
  bRG2.rebirthAutoKingRow, bRG2.rebirthAutoKingSetter = fn47("Auto King", 4, function(arg)
    return bRG2.setAutoKingEnabled(arg)
  end)
  bRG2.setAutoKing = function(arg)
    return bRG2.rebirthAutoKingSetter(arg == true)
  end
  local textLabel5 = Instance.new("TextLabel")
  textLabel5.Name = "TargetEta"
  textLabel5.Size, textLabel5.Position = UDim2.fromOffset(touchEnabled and 220 or 260, 16), UDim2.fromOffset(num6 - (touchEnabled and 110 or 130), 2)
  textLabel5.BackgroundTransparency, textLabel5.Text = 1, ""
  textLabel5.TextColor3, textLabel5.Font, textLabel5.TextSize = Color3.fromRGB(165, 167, 172), Enum.Font.GothamMedium, touchEnabled and 9 or 11
  textLabel5.TextXAlignment, textLabel5.Visible, textLabel5.ZIndex, textLabel5.Parent = Enum.TextXAlignment.Center, false, 5, frame13
  bRG2.rebirthUI.eta = textLabel5
  fn51(nil, true)

  local function fn58(arg)
    arg = math.max(0, tonumber(arg) or 0)
    if arg >= 1e12 then return string.format("%.1fT", arg / 1e12) end
    if arg >= 1000000000 then return string.format("%.1fB", arg / 1000000000) end
    if arg >= 1000000 then return string.format("%.1fM", arg / 1000000) end
    if arg >= 1000 then return string.format("%.1fK", arg / 1000) end
    return tostring(math.floor(arg + 0.5))
  end

  local function fn59(arg)
    if not arg or arg ~= arg or arg == math.huge or arg < 0 or arg > 315360000 then return "--" end
    arg = math.floor(arg)
    if arg >= 3600 then
      return string.format("%02dh %02dm", math.floor(arg / 3600), math.floor((arg % 3600) / 60))
    end
    return string.format("%02dm %02ds", math.floor(arg / 60), arg % 60)
  end
  task.spawn(function()
    while getgenv().BRG == bRG2 and parent and parent.Parent do
      local now = os.clock()
      local leaderstats = localPlayer:FindFirstChild("leaderstats")
      local strength = (leaderstats and leaderstats:FindFirstChild("Strength")) or localPlayer:FindFirstChild("Strength")
      local rebirths = (leaderstats and leaderstats:FindFirstChild("Rebirths")) or localPlayer:FindFirstChild("Rebirths")
      local strength2 = strength and tonumber(strength.Value) or 0
      local rebirths2 = rebirths and tonumber(rebirths.Value) or 0
      local num10 = get__l00Il(rebirths2) or 0
      pcall(function()
        local env = getgenv and getgenv() or nil
        local setidentity = env and (env.setthreadidentity or env.setidentity)
        if type(setidentity) == "function" then setidentity(8) end
      end)
      local num11 = num10 > 0 and math.clamp(strength2 / num10, 0, 1) or 0
      local num12 = math.max(0, num10 - strength2)
      local flag5 = num11 >= 1
      bRG2.rebirthUI.progressNumbers.Text = flag5 and "" or (fn58(strength2) .. " / " .. fn58(num10))
      bRG2.rebirthUI.progressPercent.Text = tostring(math.floor(num11 * 100 + 0.5)) .. "%"
      bRG2.rebirthUI.progressRemaining.Text = flag5 and "" or (fn58(num12) .. " restantes")
      local text = tostring(math.floor(rebirths2)):reverse():gsub("(%d%d%d)", "%1."):reverse():gsub("^%.", "")
      bRG2.rebirthUI.exactCount.Text = "Rebirths: " .. text
      bRG2.rebirthUI.renderProgressArc(num11)
      local rebirthTargetMode = bRG2.rebirthTargetMode and bRG2.rebirthTarget ~= nil
      if rebirthTargetMode then
        fn54(rebirths2, now)
        if tbl18.lastPositiveAt and now - tbl18.lastPositiveAt >= 0.85 then fn53() end
        local num13 = math.max(0, bRG2.rebirthTarget - rebirths2)
        local result3 = fn56()
        local text2 = "Calculando ciclos " .. #tbl18.samples .. "/3"
        if num13 <= 0 then
          text2 = "Objetivo alcanzado"
        elseif result3 then
          local smoothedEta = num13 / result3
          if not tbl18.smoothedEta then
            tbl18.smoothedEta = smoothedEta
            tbl18.lastEtaUpdate = now
          elseif now - tbl18.lastEtaUpdate >= 2 then
            local num14 = math.abs(smoothedEta - tbl18.smoothedEta) / math.max(1, tbl18.smoothedEta)
            local num15 = num14 > 0.3 and 0.35 or 0.18
            tbl18.smoothedEta = tbl18.smoothedEta * (1 - num15) + smoothedEta * num15
            tbl18.lastEtaUpdate = now
          end
          text2 = fn59(tbl18.smoothedEta)
        end
        textLabel5.Text = "Tiempo aprox: " .. text2
        textLabel5.Visible = true
      else
        tbl18.lastValue = rebirths2
        tbl18.burstGain = 0
        tbl18.burstStartedAt = nil
        tbl18.lastPositiveAt = nil
        textLabel5.Text = ""
        textLabel5.Visible = false
      end
      fn51(bRG2.rebirthTarget, false)
      if bRG2.rebirthAutoKingRow:GetAttribute("Enabled") ~= (bRG2.autoKing == true) then
        bRG2.rebirthAutoKingSetter(bRG2.autoKing == true, true)
      end
      task.wait(0.35)
    end
  end)
end
do
  local value27 = nil
  local flag4 = false

  local function fn45()
    local rEvents2 = replicatedStorage:FindFirstChild("rEvents")
    bRG2.openFortuneWheelRemote = rEvents2 and rEvents2:FindFirstChild("openFortuneWheelRemote")
    value27 = replicatedStorage:FindFirstChild("shared")
    value27 = value27 and value27:FindFirstChild("catalogs")
    value27 = value27 and value27:FindFirstChild("fortuneWheelChances")
    value27 = value27 and value27:FindFirstChild("Fortune Wheel")
    return bRG2.openFortuneWheelRemote and bRG2.openFortuneWheelRemote:IsA("RemoteFunction") and value27 ~= nil
  end
  bRG2.canSpinFortune = function()
    return fn45() and (bRG2.getFortuneSpinCount() or 0) > 0
  end
  bRG2.isFortuneRequestBusy = function()
    return flag4
  end
  bRG2.spinFortuneOnce = function()
    if flag4 then return false, nil, "busy" end
    if not bRG2.canSpinFortune() then return false, nil, "unavailable" end
    local result = bRG2.getFortuneSpinCount()
    flag4 = true
    if type(bRG2.beginFortuneSpinVisual) == "function" then bRG2.beginFortuneSpinVisual() end
    local ok, result2 = pcall(function()
      return bRG2.openFortuneWheelRemote:InvokeServer("openFortuneWheel", value27)
    end)
    if ok and type(result2) == "table" and type(bRG2.recordFortuneReward) == "function" then
      bRG2.recordFortuneReward(result2, false)
    end
    if ok and type(result2) == "table" then
      local num6 = os.clock() + 3.6
      local num7 = os.clock() + 5
      repeat
        task.wait(0.1)
        local result3 = bRG2.getFortuneSpinCount()
        if os.clock() >= num6 and result3 and result and result3 < result then break end
      until os.clock() >= num7
    end
    flag4 = false
    if type(bRG2.finishFortuneSpinVisual) == "function" then
      bRG2.finishFortuneSpinVisual(ok and type(result2) == "table")
    end
    local value28 = nil
    if not ok then value28 = "request" end
    return ok and type(result2) == "table", result2, value28
  end

  local function fn46(arg)
    if bRG2.autoSpinFortuneRun ~= arg then return end
    bRG2.autoSpinFortune = false
    bRG2.autoSpinFortuneRun += 1
    if parent and parent.Parent then
      bRG2.autoSpinToggleSetter(false, true)
      bRG2.setAutoSpinAvailable(bRG2.canSpinFortune())
    end
  end
  bRG2.autoSpinRow, bRG2.autoSpinToggleSetter, bRG2.setAutoSpinAvailable = fn41(tbl17.Fortune, "Girar automáticamente", 12, function(autoSpinFortune)
    if autoSpinFortune and bRG2.autoSpinFortune then return true end
    bRG2.autoSpinFortuneRun += 1
    local autoSpinFortuneRun = bRG2.autoSpinFortuneRun
    bRG2.autoSpinFortune = autoSpinFortune
    if not autoSpinFortune then return true end
    if not bRG2.canSpinFortune() then
      bRG2.autoSpinFortune = false
      return false
    end
    task.spawn(function()
      local function getParent()
        return bRG2.autoSpinFortune and bRG2.autoSpinFortuneRun == autoSpinFortuneRun and parent and parent.Parent
      end
      while getParent() do
        local result = bRG2.getFortuneSpinCount()
        if result == 0 then
          fn46(autoSpinFortuneRun)
          break
        elseif result and not flag4 and fn45() then
          local result2, extra = bRG2.spinFortuneOnce()
          if not getParent() then break end
          if result2 and type(extra) == "table" then
            local num6 = os.clock() + 3
            repeat
              local result3 = bRG2.getFortuneSpinCount()
              if result3 and result3 < result then break end
              task.wait(0.1)
            until not getParent() or os.clock() >= num6
            if getParent() then task.wait(0.1) end
          else
            task.wait(0.4)
          end
        else
          task.wait(0.25)
        end
      end
    end)
    return true
  end)
  bRG2.setAutoSpinFortune = function(arg)
    return bRG2.autoSpinToggleSetter(arg == true)
  end
end
bRG2.refreshTrainingAvailability = function()
  if bRG2.setWeightAvailable then bRG2.setWeightAvailable(fn18({ "Weight" }) ~= nil) end
  if bRG2.setHandstandsAvailable then
    bRG2.setHandstandsAvailable(fn18({ "Handstands", "Handstand" }) ~= nil)
  end
  if bRG2.setPushupsAvailable then
    bRG2.setPushupsAvailable(bRG2.trainingMode == "pushups" or fn18({ "Pushups", "Pushup" }) ~= nil)
  end
  if bRG2.setSitupsAvailable then bRG2.setSitupsAvailable(fn18({ "Situps", "Situp" }) ~= nil) end
  if bRG2.setAutoEggAvailable then
    bRG2.setAutoEggAvailable(value3 ~= nil and consumeBoostEvent ~= nil and consumeBoostEvent:IsA("RemoteEvent") and bRG2.findProteinEgg() ~= nil)
  end
  if bRG2.setAutoSpinAvailable then bRG2.setAutoSpinAvailable(bRG2.autoSpinFortune or bRG2.canSpinFortune()) end
end
bRG2.refreshTrainingAvailability()
task.spawn(function()
  while getgenv().BRG == bRG2 and parent and parent.Parent do
    bRG2.refreshTrainingAvailability()
    task.wait(0.5)
  end
end)
local value27 = nil
local parent3 = nil
local value28 = nil

local function fn45()
  if parent3 then parent3.Visible = true end
  if value28 then
    task.cancel(value28)
    value28 = nil
  end
  value28 = task.delay(timing.alertAutohide, function()
    if parent3 then parent3.Visible = false end
    value28 = nil
  end)
end

local function fn46(arg)
  if not value27 then return end
  local textTransparency = arg and 0.65 or 0
  for key, value29 in pairs(value27:GetDescendants()) do
    if value29:IsA("TextLabel") or value29:IsA("TextButton") then
      tweenService:Create(value29, TweenInfo.new(0.2, Enum.EasingStyle.Quad), { TextTransparency = textTransparency }):Play()
    end
  end
end
local v
v, value26 = fn41(tbl17.Rocks, "Fast Punch", 1, function(enabled)
  bRG2.fastPunch = enabled
  tbl3.enabled = enabled
  if enabled then
    stopAutoTraining()
    if value22 then value22(false, true) end
    if value23 then value23(false, true) end
    if value24 then value24(false, true) end
    if value25 then value25(false, true) end
    fn11()
    fn46(false)
    if parent3 then parent3.Visible = false end
  else
    fn12()
    fn15()
    for index, item in ipairs(tbl4) do
      item(false, true)
    end
    fn46(true)
  end
end)
bRG2.setFastPunch = function(arg)
  return value26(arg == true)
end
fn40(tbl17.Rocks, "— SELECCIONÁ UNA ROCA —", 2)
parent3 = Instance.new("TextLabel")
parent3.Name = "FastPunchAlert"
parent3.Size = UDim2.new(1, 0, 0, 38)
parent3.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
parent3.BackgroundTransparency = 0.06
parent3.Text = "Activa Fast Punch primero"
parent3.TextColor3 = colors.white
parent3.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
parent3.TextStrokeTransparency = 0.15
parent3.Font = Enum.Font.FredokaOne
parent3.TextSize = 15
parent3.TextXAlignment = Enum.TextXAlignment.Center
parent3.BorderSizePixel = 0
parent3.LayoutOrder = 3
parent3.Visible = false
parent3.ZIndex = 3
parent3.Parent = tbl17.Rocks
Instance.new("UICorner", parent3).CornerRadius = UDim.new(0, 7)
local uIStroke4 = Instance.new("UIStroke", parent3)
uIStroke4.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
uIStroke4.Color = colors.red
uIStroke4.Thickness = 1.5
uIStroke4.Transparency = 0.05
local uIGradient3 = Instance.new("UIGradient", parent3)
uIGradient3.Color = ColorSequence.new({
  ColorSequenceKeypoint.new(0, Color3.fromRGB(18, 18, 18)),
  ColorSequenceKeypoint.new(0.5, Color3.fromRGB(55, 55, 55)),
  ColorSequenceKeypoint.new(1, Color3.fromRGB(12, 12, 12)),
})
uIGradient3.Rotation = 90
local frame11 = Instance.new("Frame")
frame11.Size = UDim2.new(0.6, 0, 0, 1)
frame11.Position = UDim2.new(0.2, 0, 0, 0)
frame11.BackgroundColor3 = colors.red
frame11.BackgroundTransparency = 0.15
frame11.BorderSizePixel = 0
frame11.ZIndex = 5
frame11.Parent = parent3
Instance.new("UICorner", frame11).CornerRadius = UDim.new(1, 0)
task.spawn(function()
  while getgenv().BRG == bRG2 and parent and parent.Parent do
    if parent3 and parent3.Visible then
      tweenService:Create(
        parent3,
        TweenInfo.new(timing.alertBlink, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut),
        { BackgroundColor3 = Color3.fromRGB(58, 58, 58) }
      ):Play()
      tweenService:Create(
        uIStroke4,
        TweenInfo.new(timing.alertBlink, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut),
        { Transparency = 0.02 }
      ):Play()
      task.wait(timing.alertBlink)
      tweenService:Create(
        parent3,
        TweenInfo.new(timing.alertBlink, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut),
        { BackgroundColor3 = Color3.fromRGB(30, 30, 30) }
      ):Play()
      tweenService:Create(
        uIStroke4,
        TweenInfo.new(timing.alertBlink, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut),
        { Transparency = 0.05 }
      ):Play()
      task.wait(timing.alertBlink)
    else
      task.wait(0.4)
    end
  end
end)
value27 = Instance.new("Frame")
value27.Name = "RocksSection"
value27.Size = UDim2.new(1, 0, 0, 0)
value27.AutomaticSize = Enum.AutomaticSize.Y
value27.BackgroundTransparency = 1
value27.BorderSizePixel = 0
value27.LayoutOrder = 4
value27.ZIndex = 2
value27.Parent = tbl17.Rocks
local uIListLayout2 = Instance.new("UIListLayout", value27)
uIListLayout2.SortOrder = Enum.SortOrder.LayoutOrder
uIListLayout2.Padding = UDim.new(0, 4)
for index, item in ipairs(tbl.Rocks) do
  local selectedRockDefinition = item
  local tbl18 = { enabled = false, thread = nil }

  function tbl18:Start()
    if self.thread then
      task.cancel(self.thread)
      self.thread = nil
    end
    self.enabled = true
    self.thread = task.spawn(fn14(self, selectedRockDefinition))
  end

  function tbl18:Stop()
    self.enabled = false
    bRG2.releaseRockTouches(self)
    if self.thread then
      task.cancel(self.thread)
      self.thread = nil
    end
  end
  local result, extra = fn41(value27, selectedRockDefinition.label, index, function(arg)
    if arg then
      local durability = localPlayer:FindFirstChild("Durability")
      if not bRG2.rockTouch or not durability or durability.Value < selectedRockDefinition.minDur then
        return false
      end
    end
    if arg and not tbl3.enabled then
      tbl17.Rocks.CanvasPosition = Vector2.new(0, 0)
      fn45()
      return false
    end
    if arg then
      if value5 and value5 ~= tbl18 then
        local value29 = value5
        value29:Stop()
        for index2, item2 in ipairs(tbl4) do
          if index2 ~= index then item2(false, true) end
        end
        value5 = nil
      end
      value5 = tbl18
      bRG2.selectedRock = selectedRockDefinition.label
      bRG2.selectedRockDefinition = selectedRockDefinition
      bRG2.selectedRockRequirement = selectedRockDefinition.req
      bRG2.autoFarm = true
      tbl18:Start()
    else
      if value5 == tbl18 then value5 = nil end
      tbl18:Stop()
      bRG2.autoFarm = false
      bRG2.selectedRock = nil
      bRG2.selectedRockDefinition = nil
      bRG2.selectedRockRequirement = nil
    end
    return true
  end)
  tbl4[index] = extra
end
bRG2.setRock = function(arg, arg2)
  for index, item in ipairs(tbl.Rocks) do
    if item.req == arg then return tbl4[index](arg2 == true) end
  end
  return false
end
fn46(true)
do
  local frame12 = Instance.new("Frame")
  frame12.Name = "FortuneDashboard"
  frame12.Size = UDim2.new(1, 0, 0, touchEnabled and 132 or 136)
  frame12.BackgroundTransparency = 1
  frame12.LayoutOrder = 1
  frame12.Parent = tbl17.Fortune
  local frame13 = Instance.new("Frame")
  frame13.Size, frame13.Position = UDim2.new(0.34, -3, 0, 82), UDim2.fromOffset(0, 0)
  frame13.BackgroundColor3, frame13.BackgroundTransparency = Color3.fromRGB(20, 21, 23), 0.06
  frame13.BorderSizePixel, frame13.Parent = 0, frame12
  Instance.new("UICorner", frame13).CornerRadius = UDim.new(0, 7)
  local uIStroke5 = Instance.new("UIStroke", frame13)
  uIStroke5.Color, uIStroke5.Transparency = colors.white, 0.55
  local textLabel5 = Instance.new("TextLabel")
  textLabel5.Size, textLabel5.Position = UDim2.new(1, -16, 0, 20), UDim2.fromOffset(8, 7)
  textLabel5.BackgroundTransparency, textLabel5.Text = 1, "GIROS"
  textLabel5.TextColor3, textLabel5.Font, textLabel5.TextSize = Color3.fromRGB(145, 148, 155), Enum.Font.GothamBold, touchEnabled and 9 or 10
  textLabel5.TextXAlignment, textLabel5.Parent = Enum.TextXAlignment.Center, frame13
  local textLabel6 = Instance.new("TextLabel")
  textLabel6.Size, textLabel6.Position = UDim2.new(1, -16, 0, 36), UDim2.fromOffset(8, 30)
  textLabel6.BackgroundTransparency, textLabel6.Text = 1, "0"
  textLabel6.TextColor3, textLabel6.Font, textLabel6.TextSize = colors.white, Enum.Font.GothamBold, touchEnabled and 21 or 26
  textLabel6.TextXAlignment, textLabel6.Parent = Enum.TextXAlignment.Center, frame13
  local frame14 = Instance.new("Frame")
  frame14.Size, frame14.Position = UDim2.new(0.66, -3, 0, 82), UDim2.new(0.34, 3, 0, 0)
  frame14.BackgroundColor3, frame14.BackgroundTransparency = Color3.fromRGB(20, 21, 23), 0.06
  frame14.BorderSizePixel, frame14.Parent = 0, frame12
  Instance.new("UICorner", frame14).CornerRadius = UDim.new(0, 7)
  local uIStroke6 = Instance.new("UIStroke", frame14)
  uIStroke6.Color, uIStroke6.Transparency = colors.white, 0.55
  local imageLabel = Instance.new("ImageLabel")
  imageLabel.Size, imageLabel.Position = UDim2.fromOffset(touchEnabled and 46 or 52, touchEnabled and 46 or 52), UDim2.fromOffset(10, touchEnabled and 18 or 15)
  imageLabel.BackgroundColor3, imageLabel.BackgroundTransparency = Color3.fromRGB(9, 10, 11), 0.08
  imageLabel.BorderSizePixel, imageLabel.ScaleType = 0, Enum.ScaleType.Fit
  imageLabel.Image, imageLabel.Visible, imageLabel.Parent = "", false, frame14
  Instance.new("UICorner", imageLabel).CornerRadius = UDim.new(0, 7)
  local uIStroke7 = Instance.new("UIStroke", imageLabel)
  uIStroke7.Color, uIStroke7.Transparency = colors.white, 0.68
  local textLabel7 = Instance.new("TextLabel")
  textLabel7.Size, textLabel7.Position = UDim2.new(1, -20, 0, 26), UDim2.fromOffset(10, 18)
  textLabel7.BackgroundTransparency, textLabel7.Text = 1, "Esperando giro..."
  textLabel7.TextColor3, textLabel7.Font, textLabel7.TextSize = colors.white, Enum.Font.GothamBold, touchEnabled and 10 or 12
  textLabel7.TextXAlignment, textLabel7.TextTruncate, textLabel7.Parent = Enum.TextXAlignment.Center, Enum.TextTruncate.AtEnd, frame14
  local textLabel8 = Instance.new("TextLabel")
  textLabel8.Size, textLabel8.Position = UDim2.new(1, -20, 0, 20), UDim2.fromOffset(10, 43)
  textLabel8.BackgroundTransparency, textLabel8.Text = 1, ""
  textLabel8.TextColor3, textLabel8.Font, textLabel8.TextSize = Color3.fromRGB(156, 159, 166), Enum.Font.GothamMedium, touchEnabled and 8 or 9
  textLabel8.TextXAlignment, textLabel8.TextTruncate, textLabel8.Parent = Enum.TextXAlignment.Center, Enum.TextTruncate.AtEnd, frame14
  local v2
  local str = "idle"
  local flag4 = true
  local num6 = 0
  local num7 = 0

  local function getIndex(arg)
    return type(arg) == "string" and arg ~= "" and (arg:find("rbx", 1, true) or arg:find("http", 1, true))
  end

  local function fn47(arg)
    if typeof(arg) ~= "Instance" then return nil end
    if arg:IsA("StringValue") and getIndex(arg.Value) then return arg.Value end
    for index, item in ipairs(arg:GetDescendants()) do
      if item:IsA("StringValue") and getIndex(item.Value) then return item.Value end
      if item:IsA("ImageLabel") or item:IsA("ImageButton") then
        if getIndex(item.Image) then return item.Image end
      end
    end
    return nil
  end

  local function fn48(arg)
    for index, item in ipairs({ "image", "Image", "icon", "Icon", "texture", "Texture" }) do
      if getIndex(arg[item]) then return arg[item] end
    end
    for index, item in ipairs({ "item", "Item", "reward", "Reward" }) do
      local result = fn47(arg[item])
      if result then return result end
    end
    local str2 = tostring(arg.name or arg.Name or "")
    if str2 ~= "" then
      for index, item in ipairs({
        localPlayer:FindFirstChild("consumablesFolder"),
        localPlayer:FindFirstChild("petsFolder"),
        localPlayer:FindFirstChild("powerUpsFolder"),
        replicatedStorage:FindFirstChild("cPetShopFolder"),
      }) do
        local findFirstChild = item and item:FindFirstChild(str2, true)
        local result = fn47(findFirstChild)
        if result then return result end
      end
    end
    return nil
  end

  local function fn49(visible, arg)
    imageLabel.Visible = visible
    textLabel8.Visible = not arg
    textLabel7.Size = arg and UDim2.new(1, -20, 1, 0) or UDim2.new(1, visible and -(touchEnabled and 74 or 80) or -20, 0, 26)
    textLabel7.Position = arg and UDim2.fromOffset(10, 0) or UDim2.fromOffset(visible and (touchEnabled and 64 or 70) or 10, 18)
    textLabel7.TextYAlignment = Enum.TextYAlignment.Center
    textLabel7.TextXAlignment = visible and Enum.TextXAlignment.Left or Enum.TextXAlignment.Center
    textLabel8.Size = UDim2.new(1, visible and -(touchEnabled and 74 or 80) or -20, 0, 20)
    textLabel8.Position = UDim2.fromOffset(visible and (touchEnabled and 64 or 70) or 10, 43)
    textLabel8.TextXAlignment = visible and Enum.TextXAlignment.Left or Enum.TextXAlignment.Center
  end

  local function fn50()
    str, flag4 = "idle", true
    textLabel7.Text, textLabel8.Text, imageLabel.Image = "Esperando giro...", "", ""
    fn49(false, true)
    if v2 and v2.Parent then v2:SetAttribute("Busy", false) end
  end
  bRG2.beginFortuneSpinVisual = function()
    num7 += 1
    str, flag4, num6 = "spinning", false, 0
    textLabel7.Text, textLabel8.Text, imageLabel.Image = "Girando...", "", ""
    fn49(false, true)
    if v2 and v2.Parent then v2:SetAttribute("Busy", true) end
    return true
  end
  bRG2.recordFortuneReward = function(arg)
    if type(arg) ~= "table" then return end
    if str == "idle" then num7 += 1 end
    local num8 = num7
    str, num6 = "reward", os.clock()
    textLabel7.Text = tostring(arg.name or arg.Name or "Premio obtenido")
    textLabel8.Text = tostring(arg.rarity or arg.Rarity or "Premio obtenido")
    local result = fn48(arg)
    imageLabel.Image = result or ""
    imageLabel.ImageColor3 = colors.white
    fn49(result ~= nil, false)
    task.delay(2, function()
      if getgenv().BRG ~= bRG2 or not textLabel7.Parent or num7 ~= num8 then return end
      if flag4 then fn50() end
    end)
  end
  bRG2.finishFortuneSpinVisual = function(arg)
    flag4 = true
    if not arg or str == "spinning" then
      fn50()
    elseif str == "reward" then
      local num8 = math.max(0, 2 - (os.clock() - num6))
      if num8 <= 0 then
        fn50()
      else
        local num9 = num7
        task.delay(num8, function()
          if getgenv().BRG == bRG2 and textLabel7.Parent and num7 == num9 and flag4 then fn50() end
        end)
      end
    end
  end
  fn50()
  v2 = fn42(frame12, "Girar ruleta", 1, function()
    if v2:GetAttribute("Busy") then return end
    v2:SetAttribute("Busy", true)
    task.spawn(function()
      local spinFortuneOnce = bRG2.spinFortuneOnce and bRG2.spinFortuneOnce()
      if not spinFortuneOnce and str == "idle" and v2.Parent then v2:SetAttribute("Busy", false) end
    end)
  end)
  v2.Name = "SpinFortune"
  v2.Size, v2.Position = UDim2.new(1, 0, 0, touchEnabled and 40 or 42), UDim2.fromOffset(0, 90)

  local function fn51(active, text)
    v2:SetAttribute("Disabled", not active)
    v2.Active, v2.Selectable = active, active
    v2.Text = text
    v2.TextColor3 = active and colors.white or Color3.fromRGB(112, 114, 119)
    v2.BackgroundTransparency = active and 0.06 or 0.34
    local uIStroke8 = v2:FindFirstChildWhichIsA("UIStroke")
    if uIStroke8 then
      uIStroke8.Color, uIStroke8.Transparency = active and colors.white or colors.border, active and 0.3 or 0.62
    end
  end
  task.spawn(function()
    while getgenv().BRG == bRG2 and parent and parent.Parent do
      local num8 = math.max(0, tonumber(bRG2.getFortuneSpinCount and bRG2.getFortuneSpinCount()) or 0)
      local flag5 = str ~= "idle"
      textLabel6.Text = tostring(math.floor(num8))
      if num8 <= 0 then
        if bRG2.autoSpinFortune and bRG2.autoSpinToggleSetter then bRG2.autoSpinToggleSetter(false) end
        if bRG2.setAutoSpinAvailable then bRG2.setAutoSpinAvailable(false) end
        if not flag5 then
          textLabel7.Text, textLabel8.Text, imageLabel.Image = "Sin giros disponibles", "", ""
          fn49(false, true)
        end
        fn51(false, "No tienes giros disponibles")
      else
        if bRG2.setAutoSpinAvailable then bRG2.setAutoSpinAvailable(true) end
        if str == "idle" and textLabel7.Text ~= "Esperando giro..." then fn50() end
        fn51(not flag5, flag5 and "Girando..." or "Girar ruleta")
      end
      task.wait(0.12)
    end
  end)
end
if false then
  fn40(tbl17.PetShop, "— PET SHOP —", 1)
  local result = bRG2.makeStatusCard(tbl17.PetShop, "MÓDULO", "Se conecta al abrir esta pestaña", 2, colors.red)
  local tbl18 = {
    "Neon Guardian",
    "Cybernetic Showdown Dragon",
    "Darkstar Hunter",
    "Muscle Sensei",
    "Infernal Dragon",
    "Aether Spirit Bunny",
    "Magic Butterfly",
    "Ultra Birdie",
  }
  local tbl19 = { "Muscle King", "Entropic Blast" }
  local num6, num7 = 1, 1
  local flag4 = false
  local flag5 = false
  local v2, v3
  bRG2.petShopAutoPet, bRG2.petShopAutoAura = false, false

  local function fn47()
    local young0xPetShopGui = localPlayer.PlayerGui:FindFirstChild("Young0xPetShopGui")
    if young0xPetShopGui then young0xPetShopGui.Enabled = false end
  end

  local function fn48()
    local young0xPetShop = getgenv().Young0xPetShop
    if type(young0xPetShop) == "table" and type(young0xPetShop.BuyPet) == "function" then
      bRG2.embeddedPetShop = young0xPetShop
      fn47()
      result.Text = "Pet Shop conectado"
      return young0xPetShop
    end
    if flag4 then return nil end
    flag4 = true
    result.Text = "Conectando Pet Shop..."
    local ok, result2 = pcall(function()
      local httpGet = game:HttpGet(bRG2.petShopModuleUrl)
      local result2 = loadstring(httpGet)
      if type(result2) ~= "function" then error("módulo inválido") end
      result2()
    end)
    flag4 = false
    young0xPetShop = getgenv().Young0xPetShop
    if ok and type(young0xPetShop) == "table" then
      bRG2.embeddedPetShop = young0xPetShop
      fn47()
      result.Text = "Pet Shop conectado"
      local state = young0xPetShop.State
      if type(state) == "table" then
        if v2 then v2(state.autoPet == true, true) end
        if v3 then v3(state.autoAura == true, true) end
      end
      return young0xPetShop
    end
    result.Text = "No se pudo conectar"
    bRG2.petShopLoadError = tostring(result2)
    return nil
  end
  local result2 = fn42(tbl17.PetShop, "Pet: " .. tbl18[num6], 3, function()
    num6 = num6 % #tbl18 + 1
    local result2 = fn48()
    if result2 and result2.SelectPet then pcall(result2.SelectPet, tbl18[num6]) end
  end)
  result2.MouseButton1Click:Connect(function()
    result2.Text = "Pet: " .. tbl18[num6]
  end)
  fn42(tbl17.PetShop, "Comprar pet seleccionado", 4, function()
    local result3 = fn48()
    if result3 and result3.SelectPet and result3.BuyPet then
      pcall(result3.SelectPet, tbl18[num6])
      local ok = pcall(result3.BuyPet)
      result.Text = ok and "Compra de pet enviada" or "No se pudo comprar"
    end
  end)
  local v4
  v4, v2 = fn41(tbl17.PetShop, "Compra automática de pets", 5, function(petShopAutoPet)
    local result3 = fn48()
    if not result3 or type(result3.SetAutoPet) ~= "function" then return false end
    result3.SetAutoPet(petShopAutoPet)
    bRG2.petShopAutoPet = petShopAutoPet
    return true
  end)
  local result3 = fn42(tbl17.PetShop, "Aura: " .. tbl19[num7], 7, function()
    num7 = num7 % #tbl19 + 1
    local result3 = fn48()
    if result3 and result3.SelectAura then pcall(result3.SelectAura, tbl19[num7]) end
  end)
  result3.MouseButton1Click:Connect(function()
    result3.Text = "Aura: " .. tbl19[num7]
  end)
  fn42(tbl17.PetShop, "Comprar aura seleccionada", 8, function()
    local result4 = fn48()
    if result4 and result4.SelectAura and result4.BuyAura then
      pcall(result4.SelectAura, tbl19[num7])
      local ok = pcall(result4.BuyAura)
      result.Text = ok and "Compra de aura enviada" or "No se pudo comprar"
    end
  end)
  local v5
  v5, v3 = fn41(tbl17.PetShop, "Compra automática de auras", 9, function(petShopAutoAura)
    local result4 = fn48()
    if not result4 or type(result4.SetAutoAura) ~= "function" then return false end
    result4.SetAutoAura(petShopAutoAura)
    bRG2.petShopAutoAura = petShopAutoAura
    return true
  end)
  bRG2.setPetShopAutoPet = function(arg)
    return v2(arg == true)
  end
  bRG2.setPetShopAutoAura = function(arg)
    return v3(arg == true)
  end
  bRG2.tabOpenHandlers["Pet Shop"] = fn48
end
if false then
  fn40(tbl17.PetShop, "— PET SHOP —", 1)
  local tbl18 = {}
  local tbl19 = {
    category = "Pet",
    petIndex = 1,
    auraIndex = 1,
    pets = { { name = "Apex Overlord", price = "750M Gems" } },
    auras = { { name = "Dark Lightning", price = "300K Gems" } },
  }
  local flag4 = false
  local young0xPetShopEmbeddedState = getgenv().Young0xPetShopEmbeddedState
  if type(young0xPetShopEmbeddedState) ~= "table" then
    young0xPetShopEmbeddedState = { autoPet = false, autoAura = false, autoEvolve = false }
    getgenv().Young0xPetShopEmbeddedState = young0xPetShopEmbeddedState
  end

  local function fn47(arg)
    arg = math.max(0, tonumber(arg) or 0)
    if arg >= 1e12 then return string.format("%.1fT", arg / 1e12) end
    if arg >= 1000000000 then return string.format("%.1fB", arg / 1000000000) end
    if arg >= 1000000 then return string.format("%.1fM", arg / 1000000) end
    if arg >= 1000 then return string.format("%.1fK", arg / 1000) end
    return tostring(math.floor(arg + 0.5))
  end
  tbl18.card = Instance.new("Frame")
  tbl18.card.Name = "CatalogCard"
  tbl18.card.Size = UDim2.new(1, 0, 0, touchEnabled and 154 or 166)
  tbl18.card.BackgroundColor3 = Color3.fromRGB(19, 20, 22)
  tbl18.card.BackgroundTransparency = 0.04
  tbl18.card.BorderSizePixel = 0
  tbl18.card.LayoutOrder = 2
  tbl18.card.ZIndex = 2
  tbl18.card.Parent = tbl17.PetShop
  Instance.new("UICorner", tbl18.card).CornerRadius = UDim.new(0, 8)
  tbl18.cardStroke = Instance.new("UIStroke", tbl18.card)
  tbl18.cardStroke.Color = colors.white
  tbl18.cardStroke.Thickness = 1
  tbl18.cardStroke.Transparency = 0.58
  tbl18.petTab = Instance.new("TextButton")
  tbl18.petTab.Name = "Pets"
  tbl18.petTab.Size = UDim2.fromOffset(touchEnabled and 72 or 84, 28)
  tbl18.petTab.Position = UDim2.fromOffset(8, 8)
  tbl18.petTab.BackgroundColor3 = Color3.fromRGB(43, 45, 49)
  tbl18.petTab.AutoButtonColor = false
  tbl18.petTab.BorderSizePixel = 0
  tbl18.petTab.Text = "PETS"
  tbl18.petTab.TextColor3 = colors.white
  tbl18.petTab.Font = Enum.Font.GothamBold
  tbl18.petTab.TextSize = touchEnabled and 9 or 10
  tbl18.petTab.ZIndex = 4
  tbl18.petTab.Parent = tbl18.card
  Instance.new("UICorner", tbl18.petTab).CornerRadius = UDim.new(0, 6)
  tbl18.auraTab = tbl18.petTab:Clone()
  tbl18.auraTab.Name = "Auras"
  tbl18.auraTab.Position = UDim2.fromOffset(touchEnabled and 84 or 96, 8)
  tbl18.auraTab.BackgroundTransparency = 1
  tbl18.auraTab.Text = "AURAS"
  tbl18.auraTab.TextColor3 = Color3.fromRGB(145, 148, 155)
  tbl18.auraTab.Parent = tbl18.card
  tbl18.balance = Instance.new("TextLabel")
  tbl18.balance.Name = "Balance"
  tbl18.balance.AnchorPoint = Vector2.new(1, 0)
  tbl18.balance.Size = UDim2.new(1, touchEnabled and -176 or -202, 0, 28)
  tbl18.balance.Position = UDim2.new(1, -10, 0, 8)
  tbl18.balance.BackgroundTransparency = 1
  tbl18.balance.Text = "GEMAS  --"
  tbl18.balance.TextColor3 = Color3.fromRGB(151, 154, 161)
  tbl18.balance.Font = Enum.Font.GothamBold
  tbl18.balance.TextSize = touchEnabled and 8 or 9
  tbl18.balance.TextXAlignment = Enum.TextXAlignment.Right
  tbl18.balance.TextTruncate = Enum.TextTruncate.AtEnd
  tbl18.balance.ZIndex = 4
  tbl18.balance.Parent = tbl18.card
  tbl18.preview = Instance.new("ViewportFrame")
  tbl18.preview.Name = "PetPreview"
  tbl18.preview.Size = UDim2.fromOffset(touchEnabled and 96 or 108, touchEnabled and 102 or 112)
  tbl18.preview.Position = UDim2.fromOffset(8, 42)
  tbl18.preview.BackgroundColor3 = Color3.fromRGB(12, 13, 14)
  tbl18.preview.BackgroundTransparency = 0.08
  tbl18.preview.BorderSizePixel = 0
  tbl18.preview.Ambient = Color3.fromRGB(210, 212, 218)
  tbl18.preview.LightColor = Color3.fromRGB(255, 255, 255)
  tbl18.preview.LightDirection = Vector3.new(-1, -1, -1)
  tbl18.preview.ZIndex = 3
  tbl18.preview.Parent = tbl18.card
  Instance.new("UICorner", tbl18.preview).CornerRadius = UDim.new(0, 7)
  tbl18.previewStroke = Instance.new("UIStroke", tbl18.preview)
  tbl18.previewStroke.Color = colors.white
  tbl18.previewStroke.Thickness = 1
  tbl18.previewStroke.Transparency = 0.72
  tbl18.world = Instance.new("WorldModel")
  tbl18.world.Parent = tbl18.preview
  tbl18.camera = Instance.new("Camera")
  tbl18.camera.FieldOfView = 30
  tbl18.camera.Parent = tbl18.preview
  tbl18.preview.CurrentCamera = tbl18.camera
  tbl18.auraImage = Instance.new("ImageLabel")
  tbl18.auraImage.Name = "AuraPreview"
  tbl18.auraImage.Size = UDim2.fromScale(0.7, 0.7)
  tbl18.auraImage.Position = UDim2.fromScale(0.15, 0.15)
  tbl18.auraImage.BackgroundTransparency = 1
  tbl18.auraImage.ScaleType = Enum.ScaleType.Fit
  tbl18.auraImage.Visible = false
  tbl18.auraImage.ZIndex = 5
  tbl18.auraImage.Parent = tbl18.preview
  tbl18.auraGlyph = Instance.new("TextLabel")
  tbl18.auraGlyph.Size = UDim2.fromScale(1, 1)
  tbl18.auraGlyph.BackgroundTransparency = 1
  tbl18.auraGlyph.Text = "✦"
  tbl18.auraGlyph.TextColor3 = Color3.fromRGB(218, 220, 225)
  tbl18.auraGlyph.Font = Enum.Font.GothamBold
  tbl18.auraGlyph.TextSize = touchEnabled and 38 or 44
  tbl18.auraGlyph.Visible = false
  tbl18.auraGlyph.ZIndex = 4
  tbl18.auraGlyph.Parent = tbl18.preview
  tbl18.itemName = Instance.new("TextLabel")
  tbl18.itemName.Name = "ItemName"
  tbl18.itemName.Size = UDim2.new(1, touchEnabled and -126 or -142, 0, touchEnabled and 42 or 48)
  tbl18.itemName.Position = UDim2.fromOffset(touchEnabled and 116 or 128, 43)
  tbl18.itemName.BackgroundTransparency = 1
  tbl18.itemName.Text = "Apex Overlord"
  tbl18.itemName.TextColor3 = colors.white
  tbl18.itemName.Font = Enum.Font.GothamBold
  tbl18.itemName.TextSize = touchEnabled and 13 or 15
  tbl18.itemName.TextWrapped = true
  tbl18.itemName.TextXAlignment = Enum.TextXAlignment.Left
  tbl18.itemName.TextYAlignment = Enum.TextYAlignment.Top
  tbl18.itemName.ZIndex = 4
  tbl18.itemName.Parent = tbl18.card
  tbl18.price = Instance.new("TextLabel")
  tbl18.price.Name = "Price"
  tbl18.price.Size = UDim2.new(1, touchEnabled and -126 or -142, 0, 20)
  tbl18.price.Position = UDim2.fromOffset(touchEnabled and 116 or 128, touchEnabled and 86 or 94)
  tbl18.price.BackgroundTransparency = 1
  tbl18.price.Text = "750M Gems"
  tbl18.price.TextColor3 = Color3.fromRGB(188, 191, 198)
  tbl18.price.Font = Enum.Font.GothamMedium
  tbl18.price.TextSize = touchEnabled and 10 or 11
  tbl18.price.TextXAlignment = Enum.TextXAlignment.Left
  tbl18.price.ZIndex = 4
  tbl18.price.Parent = tbl18.card
  tbl18.counter = Instance.new("TextLabel")
  tbl18.counter.Name = "Counter"
  tbl18.counter.Size = UDim2.new(1, touchEnabled and -220 or -248, 0, 24)
  tbl18.counter.Position = UDim2.fromOffset(touchEnabled and 160 or 180, touchEnabled and 120 or 132)
  tbl18.counter.BackgroundTransparency = 1
  tbl18.counter.Text = "1 / 1"
  tbl18.counter.TextColor3 = Color3.fromRGB(133, 136, 144)
  tbl18.counter.Font = Enum.Font.GothamBold
  tbl18.counter.TextSize = touchEnabled and 9 or 10
  tbl18.counter.TextXAlignment = Enum.TextXAlignment.Center
  tbl18.counter.ZIndex = 4
  tbl18.counter.Parent = tbl18.card

  local function fn48(name, text, arg, arg2)
    local textButton2 = Instance.new("TextButton")
    textButton2.Name = name
    textButton2.AnchorPoint = Vector2.new(arg == 1 and 1 or 0, 1)
    textButton2.Size = UDim2.fromOffset(touchEnabled and 36 or 40, 28)
    textButton2.Position = UDim2.new(arg, arg2, 1, -8)
    textButton2.BackgroundColor3 = Color3.fromRGB(31, 33, 36)
    textButton2.AutoButtonColor = false
    textButton2.BorderSizePixel = 0
    textButton2.Text = text
    textButton2.TextColor3 = colors.white
    textButton2.Font = Enum.Font.GothamBold
    textButton2.TextSize = touchEnabled and 16 or 18
    textButton2.ZIndex = 4
    textButton2.Parent = tbl18.card
    Instance.new("UICorner", textButton2).CornerRadius = UDim.new(0, 6)
    return textButton2
  end
  tbl18.previous = fn48("Previous", "‹", 0, touchEnabled and 116 or 128)
  tbl18.next = fn48("Next", "›", 1, -10)

  local function fn49()
    local young0xPetShopGui = localPlayer.PlayerGui:FindFirstChild("Young0xPetShopGui")
    if young0xPetShopGui then young0xPetShopGui.Enabled = false end
  end

  local function fn50(arg)
    local tbl20, tbl21 = {}, {}
    for index, item in ipairs(arg:GetChildren()) do
      if item:IsA("TextButton") and item.Text ~= "" then
        local match, price = item.Text:match("^(.-)%s+·%s+(.+)$")
        if match and price and not tbl21[match] then
          tbl21[match] = true
          table.insert(tbl20, { name = match, price = price })
        end
      end
    end
    return tbl20
  end

  local function fn51()
    local young0xPetShopGui = localPlayer.PlayerGui:FindFirstChild("Young0xPetShopGui")
    local shopPage = young0xPetShopGui and young0xPetShopGui:FindFirstChild("ShopPage", true)
    if not shopPage then return end
    local tbl20 = {}
    for index, item in ipairs(shopPage:GetDescendants()) do
      if item:IsA("ScrollingFrame") then table.insert(tbl20, item) end
    end
    if tbl20[1] then
      local pets = fn50(tbl20[1])
      if #pets > 0 then tbl19.pets = pets end
    end
    if tbl20[2] then
      local auras = fn50(tbl20[2])
      if #auras > 0 then tbl19.auras = auras end
    end
    bRG2.petShopCatalog = { pets = tbl19.pets, auras = tbl19.auras }
  end

  local function fn52()
    local young0xPetShop = getgenv().Young0xPetShop
    if type(young0xPetShop) == "table" and type(young0xPetShop.BuyPet) == "function" then
      bRG2.embeddedPetShop = young0xPetShop
      fn49()
      fn51()
      return young0xPetShop
    end
    if flag4 then return nil end
    flag4 = true
    local ok, result = pcall(function()
      local httpGet = game:HttpGet(bRG2.petShopModuleUrl)
      local result = loadstring(httpGet)
      if type(result) ~= "function" then error("módulo inválido") end
      result()
    end)
    flag4 = false
    young0xPetShop = getgenv().Young0xPetShop
    if ok and type(young0xPetShop) == "table" and type(young0xPetShop.BuyPet) == "function" then
      bRG2.embeddedPetShop = young0xPetShop
      fn49()
      fn51()
      return young0xPetShop
    end
    bRG2.petShopLoadError = tostring(result)
    return nil
  end

  local function getTexture(arg)
    local powerUpsFolder = localPlayer:FindFirstChild("powerUpsFolder")
    local findFirstChild = powerUpsFolder and powerUpsFolder:FindFirstChild(arg, true)
    if not findFirstChild then return "" end
    local imageLabel = findFirstChild:FindFirstChildWhichIsA("ImageLabel", true)
    if imageLabel and imageLabel.Image ~= "" then return imageLabel.Image end
    if findFirstChild:IsA("ParticleEmitter") and findFirstChild.Texture ~= "" then
      return findFirstChild.Texture
    end
    local particleEmitter = findFirstChild:FindFirstChildWhichIsA("ParticleEmitter", true)
    return particleEmitter and particleEmitter.Texture or ""
  end

  local function fn53(arg)
    tbl18.world:ClearAllChildren()
    tbl18.preview.Visible = true
    tbl18.auraImage.Visible = false
    tbl18.auraGlyph.Visible = false
    local shared = replicatedStorage:FindFirstChild("shared")
    shared = shared and shared:FindFirstChild("runtime")
    shared = shared and shared:FindFirstChild("petPreviews")
    local findFirstChild = shared and shared:FindFirstChild(arg)
    if not findFirstChild and arg == "Cyber" then
      findFirstChild = shared and shared:FindFirstChild("Cybernetic Showdown Dragon")
    end
    if not findFirstChild then
      tbl18.auraGlyph.Text = "◇"
      tbl18.auraGlyph.Visible = true
      return
    end
    local clone = findFirstChild:Clone()
    for index, item in ipairs(clone:GetDescendants()) do
      if item:IsA("BasePart") then
        item.Anchored = true
        item.CanCollide = false
      end
    end
    clone.Parent = tbl18.world
    local boundingBox, extra = clone:GetBoundingBox()
    local num6 = math.max(extra.X, extra.Y, extra.Z, 1)
    local num7 = boundingBox.Position + Vector3.new(0, extra.Y * 0.06, 0)
    tbl18.camera.CFrame = CFrame.lookAt(num7 + Vector3.new(num6 * 0.7, num6 * 0.28, num6 * 1.65), num7)
  end

  local function fn54(arg)
    tbl18.world:ClearAllChildren()
    tbl18.preview.Visible = true
    local texture = getTexture(arg)
    tbl18.auraImage.Image = texture
    tbl18.auraImage.Visible = texture ~= ""
    tbl18.auraGlyph.Text = "✦"
    tbl18.auraGlyph.Visible = texture == ""
  end

  local function fn55()
    local auras = tbl19.category == "Pet" and tbl19.pets or tbl19.auras
    local auraIndex = tbl19.category == "Pet" and tbl19.petIndex or tbl19.auraIndex
    if #auras == 0 then return nil, 0, auras end
    auraIndex = math.clamp(auraIndex, 1, #auras)
    if tbl19.category == "Pet" then
      tbl19.petIndex = auraIndex
    else
      tbl19.auraIndex = auraIndex
    end
    return auras[auraIndex], auraIndex, auras
  end
  local result, extra = fn41(tbl17.PetShop, "Auto comprar pets", 4, function(autoPet)
    local result = fn52()
    if not result or type(result.SetAutoPet) ~= "function" then return false end
    result.SetAutoPet(autoPet)
    young0xPetShopEmbeddedState.autoPet = autoPet
    return true
  end)
  local result2, extra2 = fn41(tbl17.PetShop, "Auto comprar auras", 4, function(autoAura)
    local result2 = fn52()
    if not result2 or type(result2.SetAutoAura) ~= "function" then return false end
    result2.SetAutoAura(autoAura)
    young0xPetShopEmbeddedState.autoAura = autoAura
    return true
  end)
  local result3, extra3 = fn41(tbl17.PetShop, "Auto evolucionar pets", 5, function(autoEvolve)
    local result3 = fn52()
    if not result3 or type(result3.SetAutoEvolve) ~= "function" then return false end
    result3.SetAutoEvolve(autoEvolve)
    young0xPetShopEmbeddedState.autoEvolve = autoEvolve
    return true
  end)
  local v2

  local function fn56(arg)
    local result4, extra4, extra5 = fn55()
    if not result4 then return end
    tbl18.petTab.BackgroundTransparency = tbl19.category == "Pet" and 0 or 1
    tbl18.petTab.TextColor3 = tbl19.category == "Pet" and colors.white or Color3.fromRGB(145, 148, 155)
    tbl18.auraTab.BackgroundTransparency = tbl19.category == "Aura" and 0 or 1
    tbl18.auraTab.BackgroundColor3 = Color3.fromRGB(43, 45, 49)
    tbl18.auraTab.TextColor3 = tbl19.category == "Aura" and colors.white or Color3.fromRGB(145, 148, 155)
    tbl18.itemName.Text = result4.name
    tbl18.price.Text = result4.price
    tbl18.counter.Text = tostring(extra4) .. " / " .. tostring(#extra5)
    result.Visible = tbl19.category == "Pet"
    result2.Visible = tbl19.category == "Aura"
    result3.Visible = tbl19.category == "Pet"
    if v2 then v2.Text = "Comprar " .. tbl19.category .. "  ·  " .. result4.price end
    if tbl19.category == "Pet" then
      fn53(result4.name)
    else
      fn54(result4.name)
    end
    if arg then
      local result5 = fn52()
      if result5 then
        if tbl19.category == "Pet" and type(result5.SelectPet) == "function" then
          pcall(result5.SelectPet, result4.name)
        elseif tbl19.category == "Aura" and type(result5.SelectAura) == "function" then
          pcall(result5.SelectAura, result4.name)
        end
      end
    end
  end
  v2 = fn42(tbl17.PetShop, "Comprar Pet", 3, function()
    local result4 = fn55()
    local result5 = fn52()
    if not result4 or not result5 then return end
    if tbl19.category == "Pet" and type(result5.BuyPet) == "function" then
      pcall(result5.SelectPet, result4.name)
      pcall(result5.BuyPet)
    elseif tbl19.category == "Aura" and type(result5.BuyAura) == "function" then
      pcall(result5.SelectAura, result4.name)
      pcall(result5.BuyAura)
    end
  end)
  fn(tbl18.petTab.Activated:Connect(function()
    tbl19.category = "Pet"
    fn56(true)
  end))
  fn(tbl18.auraTab.Activated:Connect(function()
    tbl19.category = "Aura"
    fn56(true)
  end))
  fn(tbl18.previous.Activated:Connect(function()
    local result4, extra4, extra5 = fn55()
    local auraIndex = ((extra4 - 2) % #extra5) + 1
    if tbl19.category == "Pet" then
      tbl19.petIndex = auraIndex
    else
      tbl19.auraIndex = auraIndex
    end
    fn56(true)
  end))
  fn(tbl18.next.Activated:Connect(function()
    local result4, extra4, extra5 = fn55()
    local auraIndex = (extra4 % #extra5) + 1
    if tbl19.category == "Pet" then
      tbl19.petIndex = auraIndex
    else
      tbl19.auraIndex = auraIndex
    end
    fn56(true)
  end))
  bRG2.setPetShopAutoPet = function(arg)
    return extra(arg == true)
  end
  bRG2.setPetShopAutoAura = function(arg)
    return extra2(arg == true)
  end
  bRG2.setPetShopAutoEvolve = function(arg)
    return extra3(arg == true)
  end
  bRG2.tabOpenHandlers["Pet Shop"] = function()
    fn52()
    fn56(true)
  end
  task.spawn(function()
    while getgenv().BRG == bRG2 and parent and parent.Parent do
      local gems = localPlayer:FindFirstChild("Gems")
      tbl18.balance.Text = "GEMAS  " .. fn47(gems and gems.Value or 0)
      task.wait(0.75)
    end
  end)
  extra(young0xPetShopEmbeddedState.autoPet == true, true)
  extra2(young0xPetShopEmbeddedState.autoAura == true, true)
  extra3(young0xPetShopEmbeddedState.autoEvolve == true, true)
  fn56(false)
end
do
  local tbl18 = {}
  local flag4 = false
  local v2
  local tbl19 = {
    petIndex = 1,
    eventPetIndex = 1,
    petMode = "Normal",
    auraIndex = 1,
    eventAutoGeneration = 0,
    auraEvolveGeneration = 0,
    pets = {
      { name = "Apex Overlord", price = "750M Gems" },
      { name = "Neon Guardian", price = "-" },
      { name = "Cybernetic Showdown Dragon", price = "-" },
      { name = "Darkstar Hunter", price = "-" },
      { name = "Muscle Sensei", price = "-" },
      { name = "Infernal Dragon", price = "-" },
      { name = "Aether Spirit Bunny", price = "-" },
      { name = "Magic Butterfly", price = "-" },
      { name = "Ultra Birdie", price = "-" },
    },
    eventPets = {},
    auras = {
      { name = "Dark Lightning", price = "300K Gems" },
      { name = "Muscle King", price = "-" },
      { name = "Entropic Blast", price = "-" },
    },
  }
  local flag5 = false
  local young0xPetShopEmbeddedState = getgenv().Young0xPetShopEmbeddedState
  if type(young0xPetShopEmbeddedState) ~= "table" then
    young0xPetShopEmbeddedState = { autoPet = false, autoAura = false, autoEvolve = false }
    getgenv().Young0xPetShopEmbeddedState = young0xPetShopEmbeddedState
  end
  young0xPetShopEmbeddedState.autoAuraEvolve = young0xPetShopEmbeddedState.autoAuraEvolve == true
  tbl18.holder = Instance.new("Frame")
  tbl18.holder.Name = "SplitCatalog"
  tbl18.holder.Size = UDim2.new(1, 0, 0, touchEnabled and 226 or 234)
  tbl18.holder.BackgroundTransparency = 1
  tbl18.holder.BorderSizePixel = 0
  tbl18.holder.LayoutOrder = 1
  tbl18.holder.ZIndex = 2
  tbl18.holder.Parent = tbl17.PetShop

  local function fn47(kind, position3)
    local tbl20 = {}
    tbl20.kind = kind
    tbl20.frame = Instance.new("Frame")
    tbl20.frame.Name = kind .. "Card"
    tbl20.frame.Size = UDim2.new(0.5, -3, 1, 0)
    tbl20.frame.Position = position3
    tbl20.frame.BackgroundColor3 = Color3.fromRGB(11, 12, 13)
    tbl20.frame.BackgroundTransparency = 0.08
    tbl20.frame.BorderSizePixel = 0
    tbl20.frame.ClipsDescendants = true
    tbl20.frame.ZIndex = 2
    tbl20.frame.Parent = tbl18.holder
    Instance.new("UICorner", tbl20.frame).CornerRadius = UDim.new(0, 8)
    local uIStroke5 = Instance.new("UIStroke", tbl20.frame)
    uIStroke5.Color = colors.white
    uIStroke5.Thickness = 1
    uIStroke5.Transparency = 0.62
    tbl20.title = Instance.new("TextLabel")
    tbl20.title.Name = "Title"
    tbl20.title.Size = UDim2.new(0.65, 0, 0, 24)
    tbl20.title.Position = UDim2.fromOffset(10, 6)
    tbl20.title.BackgroundTransparency = 1
    tbl20.title.Text = kind == "Pet" and "PETS" or "AURAS"
    tbl20.title.TextColor3 = colors.white
    tbl20.title.Font = Enum.Font.GothamBold
    tbl20.title.TextSize = touchEnabled and 9 or 10
    tbl20.title.TextXAlignment = Enum.TextXAlignment.Left
    tbl20.title.ZIndex = 4
    tbl20.title.Parent = tbl20.frame
    tbl20.counter = Instance.new("TextLabel")
    tbl20.counter.Name = "Counter"
    tbl20.counter.AnchorPoint = Vector2.new(1, 0)
    tbl20.counter.Size = UDim2.new(0.35, -8, 0, 24)
    tbl20.counter.Position = UDim2.new(1, -10, 0, 6)
    tbl20.counter.BackgroundTransparency = 1
    tbl20.counter.Text = "1 / 1"
    tbl20.counter.TextColor3 = Color3.fromRGB(135, 138, 145)
    tbl20.counter.Font = Enum.Font.GothamBold
    tbl20.counter.TextSize = touchEnabled and 8 or 9
    tbl20.counter.TextXAlignment = Enum.TextXAlignment.Right
    tbl20.counter.ZIndex = 4
    tbl20.counter.Parent = tbl20.frame
    tbl20.previewShell = Instance.new("Frame")
    tbl20.previewShell.Name = "Preview"
    tbl20.previewShell.AnchorPoint = Vector2.new(0.5, 0)
    tbl20.previewShell.Size = UDim2.fromOffset(touchEnabled and 66 or 70, touchEnabled and 66 or 70)
    tbl20.previewShell.Position = UDim2.new(0.5, 0, 0, 24)
    tbl20.previewShell.BackgroundColor3 = kind == "Pet" and Color3.fromRGB(255, 196, 0) or Color3.fromRGB(12, 13, 14)
    tbl20.previewShell.BackgroundTransparency = kind == "Pet" and 0 or 0.08
    tbl20.previewShell.BorderSizePixel = 0
    tbl20.previewShell.ClipsDescendants = true
    tbl20.previewShell.ZIndex = 3
    tbl20.previewShell.Parent = tbl20.frame
    Instance.new("UICorner", tbl20.previewShell).CornerRadius = UDim.new(0, 7)
    tbl20.previewStroke = Instance.new("UIStroke", tbl20.previewShell)
    tbl20.previewStroke.Color = kind == "Pet" and Color3.fromRGB(126, 80, 0) or colors.white
    tbl20.previewStroke.Thickness = 1
    tbl20.previewStroke.Transparency = kind == "Pet" and 0.12 or 0.74
    tbl20.inventoryGradient = Instance.new("UIGradient")
    tbl20.inventoryGradient.Color = ColorSequence.new({
      ColorSequenceKeypoint.new(0, kind == "Pet" and Color3.fromRGB(255, 218, 0) or Color3.fromRGB(48, 49, 52)),
      ColorSequenceKeypoint.new(1, kind == "Pet" and Color3.fromRGB(255, 166, 0) or Color3.fromRGB(24, 25, 27)),
    })
    tbl20.inventoryGradient.Rotation = 90
    tbl20.inventoryGradient.Parent = tbl20.previewShell
    tbl20.viewport = Instance.new("ViewportFrame")
    tbl20.viewport.Name = "Model"
    tbl20.viewport.Size = UDim2.fromScale(1, 1)
    tbl20.viewport.BackgroundTransparency = 1
    tbl20.viewport.BorderSizePixel = 0
    tbl20.viewport.Ambient = Color3.fromRGB(215, 217, 222)
    tbl20.viewport.LightColor = Color3.fromRGB(255, 255, 255)
    tbl20.viewport.LightDirection = Vector3.new(0, -0.4, -1)
    tbl20.viewport.ZIndex = 4
    tbl20.viewport.Visible = false
    tbl20.viewport.Parent = tbl20.previewShell
    tbl20.world = Instance.new("WorldModel")
    tbl20.world.Parent = tbl20.viewport
    tbl20.camera = Instance.new("Camera")
    tbl20.camera.FieldOfView = 30
    tbl20.camera.Parent = tbl20.viewport
    tbl20.viewport.CurrentCamera = tbl20.camera
    tbl20.image = Instance.new("ImageLabel")
    tbl20.image.Name = kind == "Pet" and "PetIcon" or "AuraImage"
    tbl20.image.Size = UDim2.fromScale(kind == "Pet" and 0.9 or 0.78, kind == "Pet" and 0.9 or 0.78)
    tbl20.image.Position = UDim2.fromScale(kind == "Pet" and 0.05 or 0.11, kind == "Pet" and 0.05 or 0.11)
    tbl20.image.BackgroundTransparency = 1
    tbl20.image.ScaleType = Enum.ScaleType.Fit
    tbl20.image.Visible = false
    tbl20.image.ZIndex = 6
    tbl20.image.Parent = tbl20.previewShell
    tbl20.glyph = Instance.new("TextLabel")
    tbl20.glyph.Name = "Fallback"
    tbl20.glyph.Size = UDim2.fromScale(1, 1)
    tbl20.glyph.BackgroundTransparency = 1
    tbl20.glyph.Text = kind == "Pet" and "◇" or "✦"
    tbl20.glyph.TextColor3 = Color3.fromRGB(218, 220, 225)
    tbl20.glyph.Font = Enum.Font.GothamBold
    tbl20.glyph.TextSize = touchEnabled and 28 or 34
    tbl20.glyph.Visible = false
    tbl20.glyph.ZIndex = 5
    tbl20.glyph.Parent = tbl20.previewShell
    tbl20.itemName = Instance.new("TextLabel")
    tbl20.itemName.Name = "ItemName"
    tbl20.itemName.Size = UDim2.new(1, -16, 0, 24)
    tbl20.itemName.Position = UDim2.fromOffset(8, touchEnabled and 91 or 95)
    tbl20.itemName.BackgroundTransparency = 1
    tbl20.itemName.Text = kind == "Pet" and "Apex Overlord" or "Dark Lightning"
    tbl20.itemName.TextColor3 = colors.white
    tbl20.itemName.Font = Enum.Font.GothamBold
    tbl20.itemName.TextSize = touchEnabled and 10 or 11
    tbl20.itemName.TextWrapped = true
    tbl20.itemName.TextXAlignment = Enum.TextXAlignment.Center
    tbl20.itemName.TextYAlignment = Enum.TextYAlignment.Center
    tbl20.itemName.ZIndex = 4
    tbl20.itemName.Parent = tbl20.frame
    tbl20.price = Instance.new("TextLabel")
    tbl20.price.Name = "Price"
    tbl20.price.Size = UDim2.new(1, -16, 0, 16)
    tbl20.price.Position = UDim2.fromOffset(8, touchEnabled and 111 or 116)
    tbl20.price.BackgroundTransparency = 1
    tbl20.price.Text = kind == "Pet" and "750M Gems" or "300K Gems"
    tbl20.price.TextColor3 = Color3.fromRGB(181, 184, 191)
    tbl20.price.Font = Enum.Font.GothamMedium
    tbl20.price.TextSize = touchEnabled and 8 or 9
    tbl20.price.TextXAlignment = Enum.TextXAlignment.Center
    tbl20.price.ZIndex = 4
    tbl20.price.Parent = tbl20.frame

    local function fn48(name, text)
      local textButton2 = Instance.new("TextButton")
      textButton2.Name = name
      textButton2.BackgroundColor3 = Color3.fromRGB(18, 19, 21)
      textButton2.AutoButtonColor = false
      textButton2.BorderSizePixel = 0
      textButton2.Text = text
      textButton2.TextColor3 = colors.white
      textButton2.Font = Enum.Font.GothamBold
      textButton2.TextSize = touchEnabled and 11 or 12
      textButton2.ZIndex = 4
      textButton2.Parent = tbl20.frame
      Instance.new("UICorner", textButton2).CornerRadius = UDim.new(0, 6)
      return textButton2
    end
    tbl20.previous = fn48("Previous", "‹")
    tbl20.previous.AnchorPoint = Vector2.new(0, 0)
    tbl20.previous.Size = UDim2.fromOffset(touchEnabled and 27 or 30, 27)
    tbl20.previous.Position = UDim2.new(0, 8, 0, touchEnabled and 129 or 133)
    tbl20.buy = fn48("Buy", "COMPRAR")
    tbl20.buy.AnchorPoint = Vector2.new(0.5, 0)
    tbl20.buy.Size = UDim2.new(1, touchEnabled and -78 or -86, 0, 27)
    tbl20.buy.Position = UDim2.new(0.5, 0, 0, touchEnabled and 129 or 133)
    tbl20.buy.TextSize = touchEnabled and 8 or 9
    tbl20.next = fn48("Next", "›")
    tbl20.next.AnchorPoint = Vector2.new(1, 0)
    tbl20.next.Size = UDim2.fromOffset(touchEnabled and 27 or 30, 27)
    tbl20.next.Position = UDim2.new(1, -8, 0, touchEnabled and 129 or 133)
    tbl20.divider = Instance.new("Frame")
    tbl20.divider.Name = "Divider"
    tbl20.divider.Size = UDim2.new(1, -16, 0, 1)
    tbl20.divider.Position = UDim2.fromOffset(8, touchEnabled and 161 or 165)
    tbl20.divider.BackgroundColor3 = Color3.fromRGB(58, 60, 65)
    tbl20.divider.BackgroundTransparency = 0.35
    tbl20.divider.BorderSizePixel = 0
    tbl20.divider.ZIndex = 4
    tbl20.divider.Parent = tbl20.frame
    return tbl20
  end
  tbl18.pet = fn47("Pet", UDim2.fromScale(0, 0))
  tbl18.aura = fn47("Aura", UDim2.new(0.5, 3, 0, 0))
  tbl18.pet.title.Size = UDim2.new(0.38, 0, 0, 24)
  tbl18.pet.counter.Size = UDim2.new(0.24, -8, 0, 24)
  tbl18.pet.mode = Instance.new("TextButton")
  tbl18.pet.mode.Name = "CatalogMode"
  tbl18.pet.mode.AnchorPoint = Vector2.new(0.5, 0)
  tbl18.pet.mode.Size = UDim2.fromOffset(touchEnabled and 60 or 66, 18)
  tbl18.pet.mode.Position = UDim2.new(0.55, 0, 0, 9)
  tbl18.pet.mode.BackgroundColor3 = Color3.fromRGB(48, 37, 76)
  tbl18.pet.mode.AutoButtonColor = false
  tbl18.pet.mode.BorderSizePixel = 0
  tbl18.pet.mode.Text = "NORMAL"
  tbl18.pet.mode.TextColor3 = Color3.fromRGB(212, 198, 255)
  tbl18.pet.mode.Font = Enum.Font.GothamBold
  tbl18.pet.mode.TextSize = touchEnabled and 7 or 8
  tbl18.pet.mode.ZIndex = 5
  tbl18.pet.mode.Parent = tbl18.pet.frame
  Instance.new("UICorner", tbl18.pet.mode).CornerRadius = UDim.new(0, 5)

  local function fn48()
    local young0xPetShopGui = localPlayer.PlayerGui:FindFirstChild("Young0xPetShopGui")
    if young0xPetShopGui then young0xPetShopGui.Enabled = false end
  end

  local function fn49(arg)
    local tbl20, tbl21 = {}, {}
    for index, item in ipairs(arg:GetChildren()) do
      if item:IsA("TextButton") and item.Text ~= "" then
        local match, price = item.Text:match("^(.-)%s+·%s+(.+)$")
        if match and price and not tbl21[match] then
          tbl21[match] = true
          table.insert(tbl20, { name = match, price = price })
        end
      end
    end
    return tbl20
  end

  local function fn50()
    local young0xPetShopGui = localPlayer.PlayerGui:FindFirstChild("Young0xPetShopGui")
    local shopPage = young0xPetShopGui and young0xPetShopGui:FindFirstChild("ShopPage", true)
    if not shopPage then return end
    local tbl20 = {}
    for index, item in ipairs(shopPage:GetDescendants()) do
      if item:IsA("ScrollingFrame") then table.insert(tbl20, item) end
    end
    if tbl20[1] then
      local pets = fn49(tbl20[1])
      if #pets > 0 then tbl19.pets = pets end
    end
    if tbl20[2] then
      local auras = fn49(tbl20[2])
      if #auras > 0 then tbl19.auras = auras end
    end
    bRG2.petShopCatalog = { pets = tbl19.pets, auras = tbl19.auras }
  end

  local function fn51()
    local young0xPetShop = getgenv().Young0xPetShop
    if type(young0xPetShop) == "table" and type(young0xPetShop.BuyPet) == "function" then
      bRG2.embeddedPetShop = young0xPetShop
      fn48()
      fn50()
      return young0xPetShop
    end
    if flag5 then return nil end
    flag5 = true
    local ok, result = pcall(function()
      local name = tbl19.pets[1] and tbl19.pets[1].name
      local name2 = tbl19.auras[1] and tbl19.auras[1].name
      local flag6 = false
      local flag7 = false
      local num6 = 0
      local num7 = 0
      local young0xPetShop2 = {}

      local function fn52(arg)
        local shared = replicatedStorage:FindFirstChild("shared")
        local runtime = shared and shared:FindFirstChild("runtime")
        local cPetShopFolder = (runtime and runtime:FindFirstChild("cPetShopFolder")) or replicatedStorage:FindFirstChild("cPetShopFolder")
        local rEvents2 = replicatedStorage:FindFirstChild("rEvents")
        local cPetShopRemote = rEvents2 and rEvents2:FindFirstChild("cPetShopRemote")
        return cPetShopFolder and cPetShopFolder:FindFirstChild(arg), cPetShopRemote
      end

      local function fn53(arg)
        local result, extra = fn52(arg)
        if not result or not extra or not extra:IsA("RemoteFunction") then return false end
        local ok, result2 = pcall(function()
          return extra:InvokeServer(result)
        end)
        return ok and result2 == true
      end

      function young0xPetShop2.SelectPet(arg)
        if type(arg) ~= "string" then return false end
        name = arg
        return true
      end

      function young0xPetShop2.SelectAura(arg)
        if type(arg) ~= "string" then return false end
        name2 = arg
        return true
      end

      function young0xPetShop2.BuyPet()
        return fn53(name)
      end

      function young0xPetShop2.BuyAura()
        return fn53(name2)
      end

      function young0xPetShop2.SetAutoPet(arg)
        flag6 = arg == true
        num6 += 1
        local num8 = num6
        if flag6 then
          task.spawn(function()
            while flag6 and num6 == num8 and getgenv().BRG == bRG2 do
              if not fn53(name) then
                flag6 = false
                break
              end
              task.wait(0.6)
            end
          end)
        end
        return true
      end

      function young0xPetShop2.SetAutoAura(arg)
        flag7 = arg == true
        num7 += 1
        local num8 = num7
        if flag7 then
          task.spawn(function()
            while flag7 and num7 == num8 and getgenv().BRG == bRG2 do
              if not fn53(name2) then
                flag7 = false
                break
              end
              task.wait(0.6)
            end
          end)
        end
        return true
      end

      function young0xPetShop2.Shutdown()
        flag6 = false
        flag7 = false
        num6 += 1
        num7 += 1
        if getgenv().Young0xPetShop == young0xPetShop2 then getgenv().Young0xPetShop = nil end
      end
      getgenv().Young0xPetShop = young0xPetShop2
    end)
    flag5 = false
    young0xPetShop = getgenv().Young0xPetShop
    if ok and type(young0xPetShop) == "table" and type(young0xPetShop.BuyPet) == "function" then
      bRG2.embeddedPetShop = young0xPetShop
      fn48()
      fn50()
      return young0xPetShop
    end
    bRG2.petShopLoadError = tostring(result)
    return nil
  end

  local function getTexture(arg)
    local powerUpsFolder = localPlayer:FindFirstChild("powerUpsFolder")
    local findFirstChild = powerUpsFolder and powerUpsFolder:FindFirstChild(arg, true)
    if not findFirstChild then return "" end
    local imageLabel = findFirstChild:FindFirstChildWhichIsA("ImageLabel", true)
    if imageLabel and imageLabel.Image ~= "" then return imageLabel.Image end
    if findFirstChild:IsA("ParticleEmitter") and findFirstChild.Texture ~= "" then
      return findFirstChild.Texture
    end
    local particleEmitter = findFirstChild:FindFirstChildWhichIsA("ParticleEmitter", true)
    return particleEmitter and particleEmitter.Texture or ""
  end

  local function fn52(arg)
    local shared = replicatedStorage:FindFirstChild("shared")
    shared = shared and shared:FindFirstChild("runtime")
    local cPetShopFolder = shared and shared:FindFirstChild("cPetShopFolder")
    local arg2 = arg == "Cyber" and "Cybernetic Showdown Dragon" or arg
    return cPetShopFolder and cPetShopFolder:FindFirstChild(arg2), arg2
  end

  local function fn53(arg)
    arg = tonumber(arg) or 0

    local function fn54(arg2)
      local text = string.format("%.2f", arg2):gsub("0+$", ""):gsub("%.$", "")
      return text
    end
    if arg >= 1000000 then return fn54(arg / 1000000) .. "M Cristales" end
    if arg >= 1000 then return fn54(arg / 1000) .. "K Cristales" end
    return fn54(arg) .. " Cristales"
  end

  local function fn54()
    local shared = replicatedStorage:FindFirstChild("shared")
    local runtime = shared and shared:FindFirstChild("runtime")
    local cPetShopFolder = (runtime and runtime:FindFirstChild("cPetShopFolder")) or replicatedStorage:FindFirstChild("cPetShopFolder")
    if not cPetShopFolder then return end

    local function fn55(arg)
      local tbl20 = {}
      local tbl21 = {}
      for index, item in ipairs(cPetShopFolder:GetChildren()) do
        if (item:GetAttribute("IsPowerUp") == true) == arg and not tbl21[item.Name] then
          local str = tostring(item:GetAttribute("PriceType") or "")
          local value29 = tonumber(item:GetAttribute("Price")) or 0
          if str == "Gems" or str == "Strength" then
            tbl21[item.Name] = true
            tbl20[#tbl20 + 1] = { name = item.Name, price = fn53(value29):gsub("Cristales", str), value = value29 }
          end
        end
      end
      table.sort(tbl20, function(arg2, arg3)
        if arg2.value == arg3.value then return arg2.name < arg3.name end
        return arg2.value < arg3.value
      end)
      return tbl20
    end
    local pets = fn55(false)
    local auras = fn55(true)
    if #pets > 0 then tbl19.pets = pets end
    if #auras > 0 then tbl19.auras = auras end
    tbl19.petIndex = math.clamp(tbl19.petIndex, 1, #tbl19.pets)
    tbl19.auraIndex = math.clamp(tbl19.auraIndex, 1, #tbl19.auras)
    bRG2.petShopCatalog = { pets = tbl19.pets, auras = tbl19.auras }
  end

  local function fn55()
    local shared = replicatedStorage:FindFirstChild("shared")
    shared = shared and shared:FindFirstChild("runtime")
    local cPetShopFolder = (shared and shared:FindFirstChild("cPetShopFolder")) or replicatedStorage:FindFirstChild("cPetShopFolder")
    local eventPets = {}
    if cPetShopFolder then
      for index, definition in ipairs(cPetShopFolder:GetChildren()) do
        if tostring(definition:GetAttribute("PriceType") or "") == "OverchargedShards" and definition:GetAttribute("IsPowerUp") ~= true then
          table.insert(eventPets, {
            name = definition.Name,
            price = fn53(definition:GetAttribute("Price")),
            definition = definition,
          })
        end
      end
    end
    table.sort(eventPets, function(arg, arg2)
      return (tonumber(arg.definition:GetAttribute("Price")) or 0) < (tonumber(arg2.definition:GetAttribute("Price")) or 0)
    end)
    tbl19.eventPets = eventPets
    tbl19.eventPetIndex = math.clamp(tbl19.eventPetIndex, 1, math.max(1, #eventPets))
    return eventPets
  end

  local function fn56(arg)
    if arg == "Pet" and tbl19.petMode == "Evento" then
      return { { name = "Overcharged Crystal", price = "Aleatorio · compra directa no disponible" } }, 1
    end
    return arg == "Pet" and tbl19.pets or tbl19.auras, arg == "Pet" and tbl19.petIndex or tbl19.auraIndex
  end

  local function fn57(arg, arg2)
    if arg == "Pet" then
      local result, extra = fn52(arg2)
      return extra
    end
    return arg2
  end

  local function fn58(arg, arg2)
    local shared = replicatedStorage:FindFirstChild("shared")
    local catalogs = shared and shared:FindFirstChild("catalogs")
    local rarityColorsFolder = catalogs and catalogs:FindFirstChild("rarityColorsFolder")
    local attribute = arg2 and arg2:GetAttribute("Rarity")
    local findFirstChild = rarityColorsFolder and rarityColorsFolder:FindFirstChild(tostring(attribute))
    local color3 = findFirstChild and findFirstChild:IsA("Color3Value") and findFirstChild.Value or Color3.fromRGB(190, 190, 194)
    local underColor = findFirstChild and findFirstChild:FindFirstChild("underColor")
    local lerped = underColor and underColor:IsA("Color3Value") and underColor.Value or color3:Lerp(Color3.new(0, 0, 0), 0.28)
    arg.previewShell.BackgroundColor3 = color3
    arg.previewShell.BackgroundTransparency = 0
    arg.inventoryGradient.Color = ColorSequence.new({ ColorSequenceKeypoint.new(0, color3), ColorSequenceKeypoint.new(1, lerped) })
    arg.previewStroke.Color = lerped
    arg.previewStroke.Transparency = 0.12
  end

  local function fn59(arg)
    tbl18.pet.world:ClearAllChildren()
    local result, extra = fn52(arg)
    local attribute = result and result:GetAttribute("Image") or ""
    if attribute == "" then
      local petsFolder = localPlayer:FindFirstChild("petsFolder")
      petsFolder = petsFolder and petsFolder:FindFirstChild(extra, true)
      if petsFolder and petsFolder:IsA("StringValue") then attribute = petsFolder.Value end
    end
    tbl18.pet.image.Image = attribute
    tbl18.pet.image.ImageColor3 = colors.white
    tbl18.pet.image.Visible = attribute ~= ""
    tbl18.pet.glyph.Visible = attribute == ""
    fn58(tbl18.pet, result)
  end

  local function fn60(arg)
    local result = fn52(arg)
    local attribute = result and result:GetAttribute("Image") or ""
    if attribute == "" then attribute = getTexture(arg) end
    local attribute2 = result and result:GetAttribute("ItemColor")
    tbl18.aura.image.Image = attribute
    tbl18.aura.image.ImageColor3 = typeof(attribute2) == "Color3" and attribute2 or colors.white
    tbl18.aura.image.Visible = attribute ~= ""
    tbl18.aura.glyph.Visible = attribute == ""
    fn58(tbl18.aura, result)
  end

  local function fn61(arg, arg2)
    local result, auraIndex = fn56(arg)
    if #result == 0 then return end
    auraIndex = math.clamp(auraIndex, 1, #result)
    if arg == "Pet" and tbl19.petMode == "Evento" then
      tbl19.eventPetIndex = auraIndex
    elseif arg == "Pet" then
      tbl19.petIndex = auraIndex
    else
      tbl19.auraIndex = auraIndex
    end
    local item = result[auraIndex]
    local aura = arg == "Pet" and tbl18.pet or tbl18.aura
    aura.itemName.Text = item.name
    aura.price.Text = item.price
    aura.counter.Text = arg == "Pet" and tbl19.petMode == "Evento" and "EVENTO" or (tostring(auraIndex) .. " / " .. tostring(#result))
    aura.buy.Text = "COMPRAR"
    if arg == "Pet" then
      fn59(item.name)
      if tbl19.petMode == "Evento" then
        aura.image.Image = "rbxassetid://112165955937333"
        aura.image.Visible = true
        aura.glyph.Visible = false
        aura.previewShell.BackgroundColor3 = Color3.fromRGB(124, 72, 210)
        aura.inventoryGradient.Color = ColorSequence.new({
          ColorSequenceKeypoint.new(0, Color3.fromRGB(196, 92, 255)),
          ColorSequenceKeypoint.new(1, Color3.fromRGB(72, 36, 126)),
        })
        aura.previewStroke.Color = Color3.fromRGB(196, 92, 255)
        aura.previous.Size = UDim2.new(0.5, -11, 0, 27)
        aura.previous.Position = UDim2.new(0, 8, 0, touchEnabled and 129 or 133)
        aura.previous.Text = "ABRIR 1 · 500"
        aura.previous.TextSize = touchEnabled and 7 or 8
        aura.buy.Visible = false
        aura.next.Size = UDim2.new(0.5, -11, 0, 27)
        aura.next.Position = UDim2.new(1, -8, 0, touchEnabled and 129 or 133)
        aura.next.Text = "ABRIR 10 · 5K"
        aura.next.TextSize = touchEnabled and 7 or 8
      else
        aura.previous.Size = UDim2.fromOffset(touchEnabled and 27 or 30, 27)
        aura.previous.Position = UDim2.new(0, 8, 0, touchEnabled and 129 or 133)
        aura.previous.Text = "‹"
        aura.previous.TextSize = touchEnabled and 11 or 12
        aura.buy.Visible = true
        aura.next.Size = UDim2.fromOffset(touchEnabled and 27 or 30, 27)
        aura.next.Position = UDim2.new(1, -8, 0, touchEnabled and 129 or 133)
        aura.next.Text = "›"
        aura.next.TextSize = touchEnabled and 11 or 12
      end
    else
      fn60(item.name)
    end
    if arg2 and not (arg == "Pet" and tbl19.petMode == "Evento") then
      local result2 = fn51()
      if result2 then
        if arg == "Pet" and type(result2.SelectPet) == "function" then
          pcall(result2.SelectPet, fn57(arg, item.name))
        elseif arg == "Aura" and type(result2.SelectAura) == "function" then
          pcall(result2.SelectAura, item.name)
        end
      end
    end
  end

  local function fn62(arg, arg2)
    if arg == "Pet" and tbl19.petMode == "Evento" then return end
    local result, auraIndex = fn56(arg)
    if #result == 0 then return end
    auraIndex = ((auraIndex - 1 + arg2) % #result) + 1
    if arg == "Pet" and tbl19.petMode == "Evento" then
      tbl19.eventPetIndex = auraIndex
    elseif arg == "Pet" then
      tbl19.petIndex = auraIndex
    else
      tbl19.auraIndex = auraIndex
    end
    fn61(arg, true)
  end

  local function fn63(arg, arg2)
    if flag4 then return end
    local rEvents2 = replicatedStorage:FindFirstChild("rEvents")
    local openCrystalRemote = rEvents2 and rEvents2:FindFirstChild("openCrystalRemote")
    if not openCrystalRemote or not openCrystalRemote:IsA("RemoteFunction") then return end
    task.spawn(function()
      flag4 = true
      arg2.Text = "ABRIENDO..."
      local text = nil
      local value29 = nil
      if arg == 1 then
        local packed = table.pack(pcall(function()
          return openCrystalRemote:InvokeServer("openCrystal", "Overcharged Crystal")
        end))
        if packed[1] and type(packed[2]) == "string" and packed[2] ~= "" then
          text = packed[2]
        else
          value29 = packed[8]
        end
      else
        local ok, result = pcall(function()
          return openCrystalRemote:InvokeServer("openCrystalBulk", "Overcharged Crystal", arg)
        end)
        if ok and type(result) == "table" and type(result.Results) == "table" and #result.Results > 0 then
          text = tostring(#result.Results) .. " premios recibidos"
          value29 = result.StopReason
        else
          value29 = type(result) == "table" and result.StopReason or nil
        end
      end
      if text then
        tbl18.pet.itemName.Text = text
        tbl18.pet.price.Text = value29 and ("Detenido: " .. tostring(value29)) or "Premio aleatorio entregado"
      elseif value29 == "NoCapacity" then
        tbl18.pet.itemName.Text = "Inventario lleno"
        tbl18.pet.price.Text = "Vendé pets para liberar espacio"
      elseif value29 == "InsufficientCurrency" then
        tbl18.pet.itemName.Text = "Cristales insuficientes"
        tbl18.pet.price.Text = arg == 10 and "Necesitás 5K cristales" or "Necesitás 500 cristales"
      else
        tbl18.pet.itemName.Text = "No se pudo abrir"
        tbl18.pet.price.Text = "Intentá nuevamente"
      end
      task.wait(2)
      flag4 = false
      if tbl19.petMode == "Evento" then fn61("Pet", false) end
    end)
  end

  local function fn64(arg)
    local result, extra = fn56(arg)
    local item = result[extra]
    if arg == "Pet" and tbl19.petMode == "Evento" then
      fn63(1, tbl18.pet.previous)
      return
    end
    local result2 = fn51()
    if not item or not result2 then return end
    if arg == "Pet" and type(result2.BuyPet) == "function" then
      pcall(result2.SelectPet, fn57(arg, item.name))
      pcall(result2.BuyPet)
    elseif arg == "Aura" and type(result2.BuyAura) == "function" then
      pcall(result2.SelectAura, item.name)
      pcall(result2.BuyAura)
    end
  end
  fn(tbl18.pet.previous.Activated:Connect(function()
    if tbl19.petMode == "Evento" then
      fn63(1, tbl18.pet.previous)
    else
      fn62("Pet", -1)
    end
  end))
  fn(tbl18.pet.next.Activated:Connect(function()
    if tbl19.petMode == "Evento" then
      fn63(10, tbl18.pet.next)
    else
      fn62("Pet", 1)
    end
  end))
  fn(tbl18.aura.previous.Activated:Connect(function()
    fn62("Aura", -1)
  end))
  fn(tbl18.aura.next.Activated:Connect(function()
    fn62("Aura", 1)
  end))
  fn(tbl18.pet.buy.Activated:Connect(function()
    fn64("Pet")
  end))
  fn(tbl18.aura.buy.Activated:Connect(function()
    fn64("Aura")
  end))
  fn(tbl18.pet.mode.Activated:Connect(function()
    local flag6 = young0xPetShopEmbeddedState.autoPet == true
    if flag6 and v2 then v2(false) end
    tbl19.petMode = tbl19.petMode == "Evento" and "Normal" or "Evento"
    young0xPetShopEmbeddedState.petMode = tbl19.petMode
    tbl18.pet.mode.Text = tbl19.petMode == "Evento" and "EVENTO" or "NORMAL"
    tbl18.pet.mode.BackgroundColor3 = tbl19.petMode == "Evento" and Color3.fromRGB(88, 47, 139) or Color3.fromRGB(48, 37, 76)
    fn55()
    fn61("Pet", true)
    if flag6 and v2 then v2(true) end
  end))

  local function fn65(arg, text, arg2, arg3)
    local frame12 = Instance.new("Frame")
    frame12.Name = text:gsub("%s+", "")
    frame12.Size = UDim2.new(1, -16, 0, touchEnabled and 22 or 24)
    frame12.Position = UDim2.fromOffset(8, arg2)
    frame12.BackgroundTransparency = 1
    frame12.BorderSizePixel = 0
    frame12.ZIndex = 4
    frame12.Parent = arg.frame
    local textLabel5 = Instance.new("TextLabel")
    textLabel5.Size = UDim2.new(1, -58, 1, 0)
    textLabel5.BackgroundTransparency = 1
    textLabel5.Text = text
    textLabel5.TextColor3 = Color3.fromRGB(208, 210, 215)
    textLabel5.Font = Enum.Font.GothamMedium
    textLabel5.TextSize = touchEnabled and 8 or 9
    textLabel5.TextXAlignment = Enum.TextXAlignment.Left
    textLabel5.ZIndex = 5
    textLabel5.Parent = frame12
    local frame13 = Instance.new("Frame")
    frame13.AnchorPoint = Vector2.new(1, 0.5)
    frame13.Size = UDim2.fromOffset(touchEnabled and 32 or 36, touchEnabled and 16 or 18)
    frame13.Position = UDim2.new(1, -12, 0.5, 0)
    frame13.BackgroundColor3 = colors.pillOff
    frame13.BorderSizePixel = 0
    frame13.ZIndex = 5
    frame13.Parent = frame12
    Instance.new("UICorner", frame13).CornerRadius = UDim.new(1, 0)
    local frame14 = Instance.new("Frame")
    frame14.Size = UDim2.fromOffset(touchEnabled and 12 or 14, touchEnabled and 12 or 14)
    frame14.Position = UDim2.fromOffset(2, 2)
    frame14.BackgroundColor3 = colors.white
    frame14.BorderSizePixel = 0
    frame14.ZIndex = 6
    frame14.Parent = frame13
    Instance.new("UICorner", frame14).CornerRadius = UDim.new(1, 0)
    local frame15 = Instance.new("Frame")
    frame15.AnchorPoint = Vector2.new(1, 0.5)
    frame15.Size = UDim2.fromOffset(touchEnabled and 6 or 7, touchEnabled and 6 or 7)
    frame15.Position = UDim2.new(1, 0, 0.5, 0)
    frame15.BackgroundColor3 = colors.red
    frame15.BorderSizePixel = 0
    frame15.ZIndex = 6
    frame15.Parent = frame12
    Instance.new("UICorner", frame15).CornerRadius = UDim.new(1, 0)
    local flag6 = false
    local num6 = 0

    local function fn66(arg4, arg5)
      arg4 = arg4 == true
      if arg4 == flag6 then return true end
      if not arg5 and arg3 and arg3(arg4) == false then return false end
      flag6 = arg4
      frame12:SetAttribute("Enabled", flag6)
      tweenService:Create(frame13, timing.tween, { BackgroundColor3 = flag6 and Color3.fromRGB(45, 47, 51) or colors.pillOff }):Play()
      tweenService:Create(frame14, timing.tween, {
        Position = flag6 and UDim2.new(1, -(touchEnabled and 14 or 16), 0, 2) or UDim2.fromOffset(2, 2),
      }):Play()
      tweenService:Create(frame15, timing.tween, { BackgroundColor3 = flag6 and colors.green or colors.red }):Play()
      return true
    end
    local textButton2 = Instance.new("TextButton")
    textButton2.Name = "ToggleHitbox"
    textButton2.Size = UDim2.fromScale(1, 1)
    textButton2.BackgroundTransparency = 1
    textButton2.Text = ""
    textButton2.AutoButtonColor = false
    textButton2.ZIndex = 7
    textButton2.Parent = frame12
    frame12:SetAttribute("Enabled", false)
    fn(textButton2.Activated:Connect(function()
      local now = os.clock()
      if now - num6 < 0.22 then return end
      num6 = now
      fn66(not flag6)
    end))
    return frame12, fn66
  end
  local result, extra = fn65(tbl18.pet, "Auto comprar", touchEnabled and 166 or 170, function(autoPet)
    tbl19.eventAutoGeneration += 1
    local eventAutoGeneration = tbl19.eventAutoGeneration
    if tbl19.petMode == "Evento" then
      local rEvents2 = replicatedStorage:FindFirstChild("rEvents")
      local openCrystalRemote = rEvents2 and rEvents2:FindFirstChild("openCrystalRemote")
      if autoPet and (not openCrystalRemote or not openCrystalRemote:IsA("RemoteFunction")) then return false end
      local result = fn51()
      if result and type(result.SetAutoPet) == "function" then result.SetAutoPet(false) end
      young0xPetShopEmbeddedState.autoPet = autoPet
      if autoPet then
        task.spawn(function()
          while getgenv().BRG == bRG2 and young0xPetShopEmbeddedState.autoPet and tbl19.petMode == "Evento" and tbl19.eventAutoGeneration == eventAutoGeneration and parent and parent.Parent do
            if not flag4 then
              flag4 = true
              local ok, result2 = pcall(function()
                return openCrystalRemote:InvokeServer("openCrystalBulk", "Overcharged Crystal", 10)
              end)
              flag4 = false
              if ok and type(result2) == "table" and type(result2.Results) == "table" and #result2.Results > 0 then
                tbl18.pet.itemName.Text = "Auto: " .. tostring(#result2.Results) .. " premios"
                tbl18.pet.price.Text = "Overcharged Crystal · aleatorio"
              elseif ok and type(result2) == "table" and result2.StopReason == "NoCapacity" then
                tbl18.pet.itemName.Text = "Inventario lleno"
                tbl18.pet.price.Text = "Auto comprar sigue esperando espacio"
              elseif ok and type(result2) == "table" and result2.StopReason == "InsufficientCurrency" then
                tbl18.pet.itemName.Text = "Esperando cristales"
                tbl18.pet.price.Text = "Auto comprar requiere 5K"
              end
            end
            task.wait(1)
          end
        end)
      else
        fn61("Pet", false)
      end
      return true
    end
    local result = fn51()
    if not result or type(result.SetAutoPet) ~= "function" then return false end
    result.SetAutoPet(autoPet)
    young0xPetShopEmbeddedState.autoPet = autoPet
    return true
  end)
  v2 = function(arg)
    return extra(arg == true)
  end
  local result2, extra2 = fn65(tbl18.pet, "Auto evolucionar", touchEnabled and 189 or 195, function(autoEvolve)
    local result2 = fn51()
    if not result2 or type(result2.SetAutoEvolve) ~= "function" then return false end
    result2.SetAutoEvolve(autoEvolve)
    young0xPetShopEmbeddedState.autoEvolve = autoEvolve
    return true
  end)
  local result3, extra3 = fn65(tbl18.aura, "Auto comprar", touchEnabled and 166 or 170, function(autoAura)
    local result3 = fn51()
    if not result3 or type(result3.SetAutoAura) ~= "function" then return false end
    result3.SetAutoAura(autoAura)
    young0xPetShopEmbeddedState.autoAura = autoAura
    return true
  end)
  local result4, extra4 = fn65(tbl18.aura, "Auto evolucionar", touchEnabled and 189 or 195, function(autoAuraEvolve)
    local rEvents2 = replicatedStorage:FindFirstChild("rEvents")
    local evolvePowerUpEvent = rEvents2 and rEvents2:FindFirstChild("evolvePowerUpEvent")
    if autoAuraEvolve and (not evolvePowerUpEvent or not evolvePowerUpEvent:IsA("RemoteEvent")) then
      return false
    end
    young0xPetShopEmbeddedState.autoAuraEvolve = autoAuraEvolve
    tbl19.auraEvolveGeneration += 1
    local auraEvolveGeneration = tbl19.auraEvolveGeneration
    if autoAuraEvolve then
      task.spawn(function()
        while getgenv().BRG == bRG2 and young0xPetShopEmbeddedState.autoAuraEvolve and tbl19.auraEvolveGeneration == auraEvolveGeneration and parent and parent.Parent do
          local powerUpsFolder = localPlayer:FindFirstChild("powerUpsFolder")
          local tbl20 = {}
          if powerUpsFolder then
            for index, item in ipairs(powerUpsFolder:GetChildren()) do
              if item:IsA("Folder") then
                for index2, item2 in ipairs(item:GetChildren()) do
                  if item2:IsA("ParticleEmitter") and not item2:FindFirstChild("evolved") then
                    tbl20[item2.Name] = tbl20[item2.Name] or {}
                    table.insert(tbl20[item2.Name], item2)
                  end
                end
              end
            end
          end
          local flag6 = false
          for key, value29 in pairs(tbl20) do
            if #value29 >= 5 then
              pcall(function()
                evolvePowerUpEvent:FireServer("evolvePowerUp", value29[1])
              end)
              flag6 = true
              break
            end
          end
          task.wait(flag6 and 0.9 or 0.7)
        end
      end)
    end
    return true
  end)
  bRG2.setPetShopAutoPet = function(petShopAutoPet)
    petShopAutoPet = petShopAutoPet == true
    local result5 = extra(petShopAutoPet)
    if result5 ~= false then bRG2.petShopAutoPet = petShopAutoPet end
    return result5
  end
  bRG2.setPetShopAutoAura = function(petShopAutoAura)
    petShopAutoAura = petShopAutoAura == true
    local result5 = extra3(petShopAutoAura)
    if result5 ~= false then bRG2.petShopAutoAura = petShopAutoAura end
    return result5
  end
  bRG2.setPetShopAutoEvolve = function(petShopAutoEvolve)
    petShopAutoEvolve = petShopAutoEvolve == true
    local result5 = extra2(petShopAutoEvolve)
    if result5 ~= false then bRG2.petShopAutoEvolve = petShopAutoEvolve end
    return result5
  end
  bRG2.setPetShopAutoAuraEvolve = function(petShopAutoAuraEvolve)
    petShopAutoAuraEvolve = petShopAutoAuraEvolve == true
    local result5 = extra4(petShopAutoAuraEvolve)
    if result5 ~= false then bRG2.petShopAutoAuraEvolve = petShopAutoAuraEvolve end
    return result5
  end
  bRG2.tabOpenHandlers["Pet Shop"] = function()
    tbl17.PetShop.CanvasPosition = Vector2.zero
    fn54()
    fn51()
    fn55()
    fn61("Pet", true)
    fn61("Aura", true)
  end
  tbl19.petMode = young0xPetShopEmbeddedState.petMode == "Evento" and "Evento" or "Normal"
  tbl18.pet.mode.Text = tbl19.petMode == "Evento" and "EVENTO" or "NORMAL"
  tbl18.pet.mode.BackgroundColor3 = tbl19.petMode == "Evento" and Color3.fromRGB(88, 47, 139) or Color3.fromRGB(48, 37, 76)
  local flag6 = young0xPetShopEmbeddedState.autoPet == true
  young0xPetShopEmbeddedState.autoPet = false
  bRG2.setPetShopAutoPet(flag6)
  extra3(young0xPetShopEmbeddedState.autoAura == true, true)
  extra2(young0xPetShopEmbeddedState.autoEvolve == true, true)
  extra4(young0xPetShopEmbeddedState.autoAuraEvolve == true)
  fn54()
  fn55()
  fn61("Pet", false)
  fn61("Aura", false)
end
do
  tbl17.Kills.ScrollBarThickness = 0
  tbl17.Kills.ScrollingEnabled = false
  tbl17.Kills.AutomaticCanvasSize = Enum.AutomaticSize.None
  tbl17.Kills.CanvasSize = UDim2.fromOffset(0, 0)
  local frame12 = Instance.new("Frame")
  frame12.Name = "KillsDashboard"
  frame12.Size = UDim2.new(1, 0, 0, 268)
  frame12.BackgroundTransparency = 1
  frame12.BorderSizePixel = 0
  frame12.LayoutOrder = 1
  frame12.ZIndex = 2
  frame12.Parent = tbl17.Kills
  local tbl18 = { Text = "" }
  local frame13 = Instance.new("Frame")
  frame13.Name = "LeftColumn"
  frame13.Size = UDim2.new(0.5, -3, 0, 196)
  frame13.Position = UDim2.fromOffset(0, 0)
  frame13.BackgroundTransparency = 1
  frame13.BorderSizePixel = 0
  frame13.ZIndex = 2
  frame13.Parent = frame12
  local uIListLayout3 = Instance.new("UIListLayout", frame13)
  uIListLayout3.SortOrder = Enum.SortOrder.LayoutOrder
  uIListLayout3.Padding = UDim.new(0, 4)
  local frame14 = Instance.new("Frame")
  frame14.Name = "RightColumn"
  frame14.Size = UDim2.new(0.5, -3, 0, 196)
  frame14.Position = UDim2.new(0.5, 3, 0, 0)
  frame14.BackgroundTransparency = 1
  frame14.BorderSizePixel = 0
  frame14.ZIndex = 2
  frame14.Parent = frame12
  local uIListLayout4 = Instance.new("UIListLayout", frame14)
  uIListLayout4.SortOrder = Enum.SortOrder.LayoutOrder
  uIListLayout4.Padding = UDim.new(0, 4)
  local flag4 = false
  local tbl19 = {}
  local num6 = 0
  local value29 = nil
  local textLabel5 = Instance.new("TextLabel")
  textLabel5.Name = "HopCountdown"
  textLabel5.Size = UDim2.new(1, -8, 0, 18)
  textLabel5.Position = UDim2.fromOffset(4, 206)
  textLabel5.BackgroundTransparency = 1
  textLabel5.Text = ""
  textLabel5.TextColor3 = Color3.fromRGB(145, 148, 154)
  textLabel5.Font = Enum.Font.GothamMedium
  textLabel5.TextSize = touchEnabled and 9 or 11
  textLabel5.TextXAlignment = Enum.TextXAlignment.Center
  textLabel5.Visible = false
  textLabel5.ZIndex = 3
  textLabel5.Parent = frame12
  local textLabel6 = Instance.new("TextLabel")
  textLabel6.Name = "ExactKillsCount"
  textLabel6.Size = UDim2.new(1, -8, 0, 46)
  textLabel6.Position = UDim2.fromOffset(4, 216)
  textLabel6.BackgroundTransparency = 1
  textLabel6.Text = "Kills: 0"
  textLabel6.TextColor3 = colors.white
  textLabel6.Font = Enum.Font.GothamBold
  textLabel6.TextSize = touchEnabled and 23 or 28
  textLabel6.TextXAlignment = Enum.TextXAlignment.Center
  textLabel6.TextYAlignment = Enum.TextYAlignment.Center
  textLabel6.ZIndex = 3
  textLabel6.Parent = frame12
  textLabel5.Position = UDim2.fromOffset(4, 250)

  local function fn47()
    local young0xAutoKillHub = localPlayer.PlayerGui:FindFirstChild("Young0xAutoKillHub")
    if young0xAutoKillHub then young0xAutoKillHub.Enabled = false end
  end

  local function fn48(arg, arg2)
    local text = string.lower(arg2):gsub("%s+", "")
    for index, item in ipairs({ arg and arg:FindFirstChild("leaderstats"), arg }) do
      if item then
        for index2, item2 in ipairs(item:GetChildren()) do
          if item2:IsA("ValueBase") and string.lower(item2.Name):gsub("%s+", "") == text then
            return tonumber(item2.Value) or 0
          end
        end
      end
    end
    return 0
  end

  local function fn49(arg, arg2)
    if not arg2 then return true end
    local result, result2 = fn48(arg, "goodKarma"), fn48(arg, "evilKarma")
    if arg2 == "evil" then return result > result2 end
    if arg2 == "good" then return result2 > result end
    return false
  end

  local function fn50(arg)
    local state = arg and arg.State
    local unsafeTargets = type(state) == "table" and state.unsafeTargets
    if type(unsafeTargets) ~= "table" or type(arg.MarkUnsafeTarget) ~= "function" then return end
    for index, item in ipairs(players:GetPlayers()) do
      if item ~= localPlayer then
        local item2 = unsafeTargets[item.UserId]
        if item2 and item2.reason == "young0x-protected" then
          unsafeTargets[item.UserId] = nil
          item2 = nil
        end
        if value29 and not fn49(item, value29) then
          if item2 == nil then arg.MarkUnsafeTarget(item, "karma-filter") end
        elseif item2 and item2.reason == "karma-filter" then
          unsafeTargets[item.UserId] = nil
        end
      end
    end
  end

  local function fn51(arg)
    local state = arg and arg.State
    local unsafeTargets = type(state) == "table" and state.unsafeTargets
    if type(unsafeTargets) ~= "table" then return end
    for key, value30 in pairs(unsafeTargets) do
      if type(value30) == "table" and value30.reason == "karma-filter" then unsafeTargets[key] = nil end
    end
  end

  local function kills()
    local young0xAutoKill = getgenv().Young0xAutoKill
    local state = type(young0xAutoKill) == "table" and young0xAutoKill.State or nil
    if type(young0xAutoKill) == "table" and type(young0xAutoKill.SetAutoKill) == "function" and (type(state) ~= "table" or state.running ~= false) then
      bRG2.embeddedKills = young0xAutoKill
      if type(young0xAutoKill.SetAntiLag) == "function" then
        pcall(young0xAutoKill.SetAntiLag, bRG2.combatAntiLag == true)
      end
      fn47()
      fn50(young0xAutoKill)
      tbl18.Text = "Listo"
      return young0xAutoKill
    end
    if flag4 then return nil end
    flag4 = true
    tbl18.Text = "Conectando módulo..."
    getgenv().Young0xKillsKeyUserId = localPlayer.UserId
    local ok, result = pcall(fn3)
    flag4 = false
    young0xAutoKill = getgenv().Young0xAutoKill
    if ok and type(young0xAutoKill) == "table" then
      bRG2.embeddedKills = young0xAutoKill
      if type(young0xAutoKill.SetAntiLag) == "function" then
        pcall(young0xAutoKill.SetAntiLag, bRG2.combatAntiLag == true)
      end
      fn47()
      tbl18.Text = "Listo"
      local state2 = young0xAutoKill.State
      if type(state2) == "table" then
        if tbl19.autoKill then tbl19.autoKill(state2.autoKill == true, true) end
        if tbl19.serverHop then tbl19.serverHop(state2.serverHop == true, true) end
        if tbl19.autoBrawl then tbl19.autoBrawl(state2.autoWinBrawl == true, true) end
        if tbl19.friends then tbl19.friends(state2.protectFriends == true, true) end
        if tbl19.target then tbl19.target(state2.targetMode == true, true) end
      end
      fn50(young0xAutoKill)
      return young0xAutoKill
    end
    tbl18.Text = "No se pudo conectar"
    bRG2.killsLoadError = tostring(result)
    return nil
  end

  local function fn52(arg)
    return function(arg2)
      local result = kills()
      if not result or type(result[arg]) ~= "function" then return false end
      local ok, result2 = pcall(result[arg], arg2)
      return ok and result2 ~= false
    end
  end
  local v2
  v2, tbl19.autoKill = fn41(frame13, "Auto Kill", 1, function(arg)
    local result = kills()
    if not result or type(result.SetAutoKill) ~= "function" then return false end
    if arg and value29 then
      num6 += 1
      value29 = nil
      bRG2.killsKarmaMode = nil
      fn51(result)
      if tbl19.evil then tbl19.evil(false, true) end
      if tbl19.good then tbl19.good(false, true) end
    end
    return result.SetAutoKill(arg) ~= false
  end)

  local function fn53(killsKarmaMode, arg)
    local result = kills()
    if not result or type(result.SetAutoKill) ~= "function" then return false end
    num6 += 1
    local num7 = num6
    if arg then
      value29 = killsKarmaMode
      bRG2.killsKarmaMode = killsKarmaMode
      if tbl19.autoKill then tbl19.autoKill(false, true) end
      if tbl19.target then tbl19.target(false, true) end
      if killsKarmaMode == "evil" and tbl19.good then tbl19.good(false, true) end
      if killsKarmaMode == "good" and tbl19.evil then tbl19.evil(false, true) end
      if type(result.SetTargetKill) == "function" then result.SetTargetKill(false) end
      fn50(result)
      if result.SetAutoKill(true) == false then return false end
      task.spawn(function()
        while getgenv().BRG == bRG2 and value29 == killsKarmaMode and num6 == num7 and parent and parent.Parent do
          fn50(result)
          task.wait(0.5)
        end
      end)
    elseif value29 == killsKarmaMode then
      value29 = nil
      bRG2.killsKarmaMode = nil
      fn51(result)
      result.SetAutoKill(false)
    end
    return true
  end
  v2, tbl19.evil = fn41(frame13, "Evil Karma", 2, function(arg)
    return fn53("evil", arg)
  end)
  v2, tbl19.good = fn41(frame13, "Good Karma", 3, function(arg)
    return fn53("good", arg)
  end)
  v2, tbl19.friends = fn41(frame13, "No matar a mis amigos", 4, fn52("SetProtectFriends"))
  v2, tbl19.serverHop = fn41(frame14, "Server Hop · 50 s", 1, fn52("SetServerHop"))
  local num7 = 0
  local v3
  v3 = fn42(frame14, "Elegir jugador", 2, function()
    local tbl20 = {}
    for index, item in ipairs(players:GetPlayers()) do
      if item ~= localPlayer then tbl20[#tbl20 + 1] = item end
    end
    table.sort(tbl20, function(arg, arg2)
      return arg.Name:lower() < arg2.Name:lower()
    end)
    if #tbl20 == 0 then
      tbl18.Text = "No hay otros jugadores"
      return
    end
    num7 = num7 % #tbl20 + 1
    local item = tbl20[num7]
    v3.Text = item.DisplayName .. " (@" .. item.Name .. ")"
    local result = kills()
    if result and result.SetTarget then result.SetTarget(item.Name) end
  end)
  v2, tbl19.target = fn41(frame14, "Matar jugador seleccionado", 3, function(arg)
    local result = kills()
    if not result or type(result.SetTargetKill) ~= "function" then return false end
    if arg and value29 then
      num6 += 1
      value29 = nil
      bRG2.killsKarmaMode = nil
      fn51(result)
      if tbl19.evil then tbl19.evil(false, true) end
      if tbl19.good then tbl19.good(false, true) end
    end
    if arg and tbl19.autoKill then tbl19.autoKill(false, true) end
    return result.SetTargetKill(arg) ~= false
  end)
  local num8 = 0
  v2, tbl19.autoBrawl = fn41(frame14, "Auto Win Brawl", 4, function(arg)
    local result = kills()
    if not result or type(result.SetAutoWinBrawl) ~= "function" then return false end
    local ok, result2 = pcall(result.SetAutoWinBrawl, arg)
    if not ok or result2 == false then return false end
    num8 += 1
    local num9 = num8
    if arg then
      task.spawn(function()
        while getgenv().BRG == bRG2 and num8 == num9 and parent and parent.Parent do
          local state = result.State
          if type(state) == "table" and (state.brawlJoinSent or state.brawlJoined or state.brawlBusy) then
            local gameGui = localPlayer.PlayerGui:FindFirstChild("gameGui")
            local brawlJoinLabel = gameGui and gameGui:FindFirstChild("brawlJoinLabel")
            if brawlJoinLabel and brawlJoinLabel:IsA("GuiObject") then brawlJoinLabel.Visible = false end
          end
          task.wait(0.1)
        end
      end)
    end
    return true
  end)
  fn(players.PlayerAdded:Connect(function()
    task.defer(function()
      if bRG2.embeddedKills then fn50(bRG2.embeddedKills) end
    end)
  end))
  bRG2.setKillsAuto = function(arg)
    return tbl19.autoKill(arg == true)
  end
  bRG2.setKillsServerHop = function(arg)
    return tbl19.serverHop(arg == true)
  end
  bRG2.setKillsBrawl = function(arg)
    return tbl19.autoBrawl(arg == true)
  end
  bRG2.setKillsProtectFriends = function(arg)
    return tbl19.friends(arg == true)
  end
  bRG2.setKillsTarget = function(arg)
    return tbl19.target(arg == true)
  end
  bRG2.setKillsKarma = function(arg, arg2)
    local good = arg == "evil" and tbl19.evil or (arg == "good" and tbl19.good or nil)
    return good and good(arg2 == true) or false
  end
  bRG2.ensureKillsController = kills
  if type(getgenv().Young0xKillsResume) == "table" or getgenv().Young0xKillsServerHopSticky == true then
    task.defer(kills)
  end
  task.spawn(function()
    while getgenv().BRG == bRG2 and parent and parent.Parent do
      local leaderstats = localPlayer:FindFirstChild("leaderstats")
      local kills2 = (leaderstats and (leaderstats:FindFirstChild("Kills") or leaderstats:FindFirstChild("Kill Streak"))) or localPlayer:FindFirstChild("Kills")
      local text = tostring(math.max(0, math.floor(tonumber(kills2 and kills2.Value) or 0))):reverse():gsub("(%d%d%d)", "%1."):reverse():gsub("^%.", "")
      textLabel6.Text = "Kills: " .. text
      local embeddedKills = bRG2.embeddedKills
      local state = embeddedKills and embeddedKills.State
      if type(state) == "table" and state.serverHop == true then
        local num9 = math.max(0, math.ceil((tonumber(state.serverHopCycleEndsAt) or os.clock()) - os.clock()))
        textLabel5.Text = tostring(num9) .. (num9 == 1 and " segundo" or " segundos") .. " para Server Hop"
        textLabel5.Visible = true
      else
        textLabel5.Text = ""
        textLabel5.Visible = false
      end
      task.wait(0.2)
    end
  end)
  bRG2.tabOpenHandlers.Kills = kills
end
do
  tbl17.Boss.ScrollBarThickness = 0
  tbl17.Boss.ScrollingEnabled = false
  tbl17.Boss.AutomaticCanvasSize = Enum.AutomaticSize.None
  tbl17.Boss.CanvasSize = UDim2.fromOffset(0, 0)
  local frame12 = Instance.new("Frame")
  frame12.Name = "BossDashboard"
  frame12.Size = UDim2.new(1, 0, 0, 228)
  frame12.BackgroundTransparency = 1
  frame12.BorderSizePixel = 0
  frame12.LayoutOrder = 1
  frame12.ZIndex = 2
  frame12.Parent = tbl17.Boss
  local textLabel5 = Instance.new("TextLabel")
  textLabel5.Name = "BossName"
  textLabel5.Size = UDim2.new(1, 0, 0, 24)
  textLabel5.BackgroundTransparency = 1
  textLabel5.Text = "Sin boss activo"
  textLabel5.TextColor3 = colors.white
  textLabel5.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
  textLabel5.TextStrokeTransparency = 0.35
  textLabel5.Font = Enum.Font.GothamBold
  textLabel5.TextSize = touchEnabled and 13 or 16
  textLabel5.TextXAlignment = Enum.TextXAlignment.Left
  textLabel5.ZIndex = 3
  textLabel5.Parent = frame12
  local frame13 = Instance.new("Frame")
  frame13.Name = "HealthCard"
  frame13.Size = UDim2.new(1, 0, 0, 68)
  frame13.Position = UDim2.fromOffset(0, 28)
  frame13.BackgroundColor3 = Color3.fromRGB(20, 21, 23)
  frame13.BackgroundTransparency = 0.06
  frame13.BorderSizePixel = 0
  frame13.ZIndex = 2
  frame13.Parent = frame12
  Instance.new("UICorner", frame13).CornerRadius = UDim.new(0, 7)
  local uIStroke5 = Instance.new("UIStroke", frame13)
  uIStroke5.Color, uIStroke5.Thickness, uIStroke5.Transparency = colors.white, 1, 0.55
  local textLabel6 = Instance.new("TextLabel")
  textLabel6.Size, textLabel6.Position = UDim2.new(0.3, 0, 0, 18), UDim2.fromOffset(13, 7)
  textLabel6.BackgroundTransparency, textLabel6.Text = 1, "VIDA"
  textLabel6.TextColor3, textLabel6.Font = Color3.fromRGB(146, 149, 155), Enum.Font.GothamBold
  textLabel6.TextSize, textLabel6.TextXAlignment = touchEnabled and 9 or 10, Enum.TextXAlignment.Left
  textLabel6.ZIndex, textLabel6.Parent = 3, frame13
  local textLabel7 = Instance.new("TextLabel")
  textLabel7.Size, textLabel7.Position = UDim2.new(0.7, -13, 0, 20), UDim2.new(0.3, 0, 0, 6)
  textLabel7.BackgroundTransparency, textLabel7.Text = 1, "00 / 00"
  textLabel7.TextColor3, textLabel7.Font = colors.white, Enum.Font.GothamBold
  textLabel7.TextSize, textLabel7.TextXAlignment = touchEnabled and 11 or 13, Enum.TextXAlignment.Right
  textLabel7.ZIndex, textLabel7.Parent = 3, frame13
  local frame14 = Instance.new("Frame")
  frame14.Name = "HealthTrack"
  frame14.Size, frame14.Position = UDim2.new(1, -26, 0, 10), UDim2.fromOffset(13, 43)
  frame14.BackgroundColor3, frame14.BackgroundTransparency = Color3.fromRGB(41, 43, 47), 0.1
  frame14.BorderSizePixel, frame14.ClipsDescendants = 0, true
  frame14.ZIndex, frame14.Parent = 3, frame13
  Instance.new("UICorner", frame14).CornerRadius = UDim.new(1, 0)
  local frame15 = Instance.new("Frame")
  frame15.Name = "Fill"
  frame15.Size = UDim2.fromScale(0, 1)
  frame15.BackgroundColor3 = Color3.fromRGB(211, 214, 220)
  frame15.BorderSizePixel = 0
  frame15.ZIndex = 4
  frame15.Parent = frame14
  Instance.new("UICorner", frame15).CornerRadius = UDim.new(1, 0)

  local function fn47(name, text, arg, arg2)
    local frame16 = Instance.new("Frame")
    frame16.Name = name
    frame16.Size = UDim2.new(0.5, -3, 0, 56)
    frame16.Position = UDim2.new(arg, arg2, 0, 102)
    frame16.BackgroundColor3 = Color3.fromRGB(20, 21, 23)
    frame16.BackgroundTransparency = 0.06
    frame16.BorderSizePixel = 0
    frame16.ZIndex = 2
    frame16.Parent = frame12
    Instance.new("UICorner", frame16).CornerRadius = UDim.new(0, 7)
    local uIStroke6 = Instance.new("UIStroke", frame16)
    uIStroke6.Color, uIStroke6.Thickness, uIStroke6.Transparency = colors.white, 1, 0.55
    local textLabel8 = Instance.new("TextLabel")
    textLabel8.Size, textLabel8.Position = UDim2.new(1, -20, 0, 16), UDim2.fromOffset(10, 6)
    textLabel8.BackgroundTransparency, textLabel8.Text = 1, text
    textLabel8.TextColor3, textLabel8.Font = Color3.fromRGB(146, 149, 155), Enum.Font.GothamBold
    textLabel8.TextSize, textLabel8.TextXAlignment = touchEnabled and 8 or 9, Enum.TextXAlignment.Left
    textLabel8.ZIndex, textLabel8.Parent = 3, frame16
    local textLabel9 = Instance.new("TextLabel")
    textLabel9.Size, textLabel9.Position = UDim2.new(1, -20, 0, 23), UDim2.fromOffset(10, 25)
    textLabel9.BackgroundTransparency, textLabel9.Text = 1, "--"
    textLabel9.TextColor3, textLabel9.Font = colors.white, Enum.Font.GothamBold
    textLabel9.TextSize, textLabel9.TextXAlignment = touchEnabled and 12 or 15, Enum.TextXAlignment.Left
    textLabel9.ZIndex, textLabel9.Parent = 3, frame16
    return textLabel9
  end
  local result = fn47("HitsCard", "GOLPES", 0, 0)
  local result2 = fn47("EtaCard", "TIEMPO APROXIMADO", 0.5, 3)
  local result3, bossToggleSetter = fn41(frame12, "Auto Boss", 1, function(arg)
    local value29 = type(bRG2.ensureKillsController) == "function" and bRG2.ensureKillsController() or nil
    if not value29 or type(value29.SetKillBoss) ~= "function" then return false end
    local ok, result3 = pcall(value29.SetKillBoss, arg)
    return ok and result3 ~= false
  end)
  result3.Size = UDim2.new(1, 0, 0, 46)
  result3.Position = UDim2.fromOffset(0, 164)

  local function fn48(arg)
    local num6 = math.max(0, math.floor(tonumber(arg) or 0))
    local reverse = tostring(num6):reverse():gsub("(%d%d%d)", "%1."):reverse()
    return reverse:sub(1, 1) == "." and reverse:sub(2) or reverse
  end

  local function fn49(arg)
    if not arg or arg ~= arg or arg == math.huge or arg < 0 then return "--" end
    return tostring(math.max(1, math.ceil(arg / 60))) .. " min"
  end
  local tbl18 = {}
  local value29 = nil
  local value30 = nil
  local value31 = nil
  local num6 = 0
  local num7 = 0

  local function fn50(arg)
    table.clear(tbl18)
    value29 = arg
    value30 = nil
    value31 = nil
    num6 = 0
    num7 = 0
  end

  local function fn51()
    local flag4 = workspace:GetAttribute("BossActive") == true
    local str = tostring(workspace:GetAttribute("BossDisplayName") or "")
    local health = math.max(0, tonumber(workspace:GetAttribute("BossHealth")) or 0)
    local num8 = math.max(0, tonumber(workspace:GetAttribute("BossMaxHealth")) or 0)
    local attribute = workspace:GetAttribute("BossSpawnSequence")
    local embeddedKills = bRG2.embeddedKills
    local state = embeddedKills and embeddedKills.State
    if type(state) == "table" and result3:GetAttribute("Enabled") ~= (state.killBoss == true) then
      bossToggleSetter(state.killBoss == true, true)
    end
    textLabel5.Text = flag4 and str ~= "" and str or "Sin boss activo"
    textLabel7.Text = flag4 and num8 > 0 and (fn48(health) .. " / " .. fn48(num8)) or "00 / 00"
    frame15.Size = UDim2.fromScale(flag4 and num8 > 0 and math.clamp(health / num8, 0, 1) or 0, 1)
    result.Text = fn48(flag4 and type(state) == "table" and state.bossHits or 0)
    local now = os.clock()
    if not flag4 or num8 <= 0 or attribute ~= value29 then
      fn50(attribute)
    elseif now - num7 >= 0.5 then
      num7 = now
      local item = tbl18[#tbl18]
      if item and health > item.health then fn50(attribute) end
      tbl18[#tbl18 + 1] = { time = now, health = health }
      while #tbl18 > 1 and now - tbl18[1].time > 12 do
        table.remove(tbl18, 1)
      end
    end
    local flag5 = type(state) == "table" and state.killBoss == true
    if not flag5 then
      if #tbl18 > 0 or value31 then fn50(attribute) end
      result2.Text = "0"
    elseif not flag4 then
      result2.Text = "0"
    elseif #tbl18 >= 4 and tbl18[#tbl18].time - tbl18[1].time >= 4 then
      local num9 = tbl18[#tbl18].time - tbl18[1].time
      local num10 = num9 > 0 and (tbl18[1].health - tbl18[#tbl18].health) / num9 or 0
      if num10 > 0 then
        value30 = value30 and (value30 * 0.86 + num10 * 0.14) or num10
        local num11 = health / value30
        if not value31 then value31 = num11 end
        if now - num6 >= 1.5 then
          local num12 = value31 * 0.82
          local num13 = value31 * 1.18
          value31 = value31 * 0.72 + math.clamp(num11, num12, num13) * 0.28
          num6 = now
        end
        result2.Text = fn49(value31)
      else
        result2.Text = value31 and fn49(value31) or "0"
      end
    else
      result2.Text = "0"
    end
  end
  bRG2.bossToggleSetter = bossToggleSetter
  bRG2.setBoss = function(arg)
    return bossToggleSetter(arg == true)
  end
  bRG2.tabOpenHandlers.Boss = function()
    local value32 = type(bRG2.ensureKillsController) == "function" and bRG2.ensureKillsController() or nil
    local state = value32 and value32.State
    if type(state) == "table" then bossToggleSetter(state.killBoss == true, true) end
    fn51()
  end
  task.spawn(function()
    while getgenv().BRG == bRG2 and parent and parent.Parent do
      fn51()
      task.wait(0.25)
    end
  end)
end
do
  local result = fn40(tbl17.Settings, "— MOVIMIENTO —", 1)
  result.Visible = false
  result.Size = UDim2.new()
  local setFlyToggle
  bRG2.flyRow, setFlyToggle = fn41(tbl17.Settings, "Fly", 2, function(arg)
    if arg then
      if bRG2.lockPosition then
        bRG2.setLockPositionEnabled(false)
        if bRG2.lockPositionToggleSetter then bRG2.lockPositionToggleSetter(false, true) end
      end
      stopAutoTraining()
      if value22 then value22(false, true) end
      if value23 then value23(false, true) end
      if value24 then value24(false, true) end
      if value25 then value25(false, true) end
      fn30()
    else
      value()
    end
  end)
  value2 = setFlyToggle
  bRG2.setFlyToggle = setFlyToggle
  bRG2.setFlyToggle(false, true)
  bRG2.flyRow.Visible = false
  bRG2.flyRow.Size = UDim2.new()
  bRG2.flySpeedRow, bRG2.setFlySpeed, bRG2.getFlySpeed = fn44(tbl17.Settings, "Fly Speed", 3, 1, 30, bRG2.flySpeed, function(flySpeed)
    bRG2.flySpeed = flySpeed
  end)
  bRG2.flySpeedRow.Visible = false
  bRG2.flySpeedRow.Size = UDim2.new()
  result:Destroy()
  bRG2.flyRow:Destroy()
  bRG2.flySpeedRow:Destroy()
end
bRG2.starsRow, bRG2.starsToggleSetter = fn41(tbl17.Settings, "Estrellas para AFK", 3, function(arg)
  fn31(arg)
  if bRG2.applyStarsPerformance then bRG2.applyStarsPerformance(arg) end
end)
bRG2.setStars = function(arg)
  return bRG2.starsToggleSetter(arg == true)
end
do
  local lighting = game:GetService("Lighting")
  local tbl18 = {
    effects = {},
    shadows = {},
    textures = {},
    meshTextures = {},
    specialMeshTextures = {},
    surfaceColorMaps = {},
    surfaceNormalMaps = {},
    surfaceRoughnessMaps = {},
    surfaceMetalnessMaps = {},
    worldLights = {},
    worldMaterials = {},
    worldReflectance = {},
    cloudParts = {},
    cloudParents = {},
    cloudScripts = {},
    podiumParts = {},
    podiumPrompts = {},
    podiumGuis = {},
    podiumCollision = {},
    podiumTouch = {},
    podiumQuery = {},
    guiVisibility = {},
    guiEnabled = {},
  }
  local value29, value30 = nil, nil
  local tbl19, tbl20, tbl21, tbl22 = {}, {}, {}, {}
  local flag4 = false
  local tbl23, tbl24, flag5, num6 = {}, setmetatable({}, { __mode = "k" }), false, 0

  local function fn47(arg, arg2, arg3)
    if arg[arg2] == nil then
      local embeddedKills = bRG2.embeddedKills
      local bossFarm = embeddedKills and embeddedKills.BossFarm
      local autoLag60Originals = bossFarm and bossFarm.autoLag60Originals and bossFarm.autoLag60Originals[arg2]
      local autoLag60Originals2 = autoLag60Originals and autoLag60Originals[arg3]
      arg[arg2] = autoLag60Originals2 and autoLag60Originals2.value or arg2[arg3]
    end
  end

  local function fn48(arg)
    local arg2 = arg
    for i = 1, 10 do
      if not arg2 then return false end
      if arg2.Name == "RedDragonPodium" or arg2.Name == "LimitedMountDisplay" then return true end
      arg2 = arg2.Parent
    end
    return false
  end

  local function fn49(arg, arg2, arg3)
    if arg[arg2] or not arg2.Parent then return end
    arg[arg2] = arg2:GetPropertyChangedSignal("Enabled"):Connect(function()
      if bRG2[arg3] and arg2.Parent and arg2.Enabled then arg2.Enabled = false end
    end)
  end

  local function fn50(arg)
    if tbl21[arg] or not arg.Parent then return end
    local tbl25 = {}
    for index, item in ipairs({ "CanCollide", "CanTouch", "CanQuery" }) do
      tbl25[#tbl25 + 1] = arg:GetPropertyChangedSignal(item):Connect(function()
        if bRG2.performanceDecorations and arg.Parent and arg[item] then arg[item] = false end
      end)
    end
    tbl21[arg] = tbl25
  end

  local function fn51(arg)
    pcall(function()
      if bRG2.performanceEffects and (arg:IsA("ParticleEmitter") or arg:IsA("Trail") or arg:IsA("Beam") or arg:IsA("Fire") or arg:IsA("Smoke") or arg:IsA("Sparkles") or arg:IsA("PostEffect") or arg:IsA("Highlight")) then
        fn47(tbl18.effects, arg, "Enabled")
        arg.Enabled = false
        fn49(tbl19, arg, "performanceEffects")
      end
      if bRG2.performanceTextures then
        if arg:IsA("Texture") or arg:IsA("Decal") then
          fn47(tbl18.textures, arg, "Transparency")
          arg.Transparency = 1
        elseif arg:IsA("MeshPart") then
          fn47(tbl18.meshTextures, arg, "TextureID")
          arg.TextureID = ""
        elseif arg:IsA("SpecialMesh") then
          fn47(tbl18.specialMeshTextures, arg, "TextureId")
          arg.TextureId = ""
        elseif arg:IsA("SurfaceAppearance") then
          fn47(tbl18.surfaceColorMaps, arg, "ColorMap")
          fn47(tbl18.surfaceNormalMaps, arg, "NormalMap")
          fn47(tbl18.surfaceRoughnessMaps, arg, "RoughnessMap")
          fn47(tbl18.surfaceMetalnessMaps, arg, "MetalnessMap")
          arg.ColorMap, arg.NormalMap, arg.RoughnessMap, arg.MetalnessMap = "", "", "", ""
        end
      end
      if bRG2.performanceShadows and arg:IsA("BasePart") then
        fn47(tbl18.shadows, arg, "CastShadow")
        arg.CastShadow = false
      end
      if bRG2.performanceWorld then
        if arg:IsA("Light") then
          fn47(tbl18.worldLights, arg, "Enabled")
          arg.Enabled = false
          fn49(tbl20, arg, "performanceWorld")
        elseif arg:IsA("BasePart") then
          fn47(tbl18.worldMaterials, arg, "Material")
          fn47(tbl18.worldReflectance, arg, "Reflectance")
          arg.Material = Enum.Material.SmoothPlastic
          arg.Reflectance = 0
        end
      end
      if bRG2.performanceDecorations and fn48(arg) then
        if arg:IsA("BasePart") then
          fn47(tbl18.podiumParts, arg, "LocalTransparencyModifier")
          fn47(tbl18.podiumCollision, arg, "CanCollide")
          fn47(tbl18.podiumTouch, arg, "CanTouch")
          fn47(tbl18.podiumQuery, arg, "CanQuery")
          arg.LocalTransparencyModifier = 1
          arg.CanCollide, arg.CanTouch, arg.CanQuery = false, false, false
          fn50(arg)
        elseif arg:IsA("ProximityPrompt") then
          fn47(tbl18.podiumPrompts, arg, "Enabled")
          arg.Enabled = false
        elseif arg:IsA("BillboardGui") or arg:IsA("SurfaceGui") then
          fn47(tbl18.podiumGuis, arg, "Enabled")
          arg.Enabled = false
        end
      end
      if bRG2.performanceClouds and arg:IsA("BasePart") then
        local arg2 = arg
        local flag6 = false
        for i = 1, 6 do
          if not arg2 or arg2 == workspace then break end
          if arg2.Name:lower():find("cloud", 1, true) then
            flag6 = true
            break
          end
          arg2 = arg2.Parent
        end
        if flag6 then
          fn47(tbl18.cloudParts, arg, "LocalTransparencyModifier")
          arg.LocalTransparencyModifier = 1
        end
      end
    end)
  end

  local function fn52()
    local num7 = num6
    for index, item in ipairs(workspace:GetDescendants()) do
      if num7 ~= num6 then break end
      fn51(item)
      if index % 60 == 0 then runService.Heartbeat:Wait() end
    end
  end

  local function fn53()
    num6 += 1
    tbl23 = {}
    tbl24 = setmetatable({}, { __mode = "k" })
    flag5 = false
  end

  local function fn54(arg)
    if not arg or not arg.Parent or tbl24[arg] then return end
    tbl24[arg] = true
    tbl23[#tbl23 + 1] = arg
    if flag5 then return end
    flag5 = true
    local num7 = num6
    task.spawn(function()
      local num8 = 1
      while num7 == num6 and num8 <= #tbl23 do
        local num9 = math.min(#tbl23, num8 + 29)
        while num8 <= num9 do
          local item = tbl23[num8]
          num8 += 1
          tbl24[item] = nil
          if item and item.Parent then fn51(item) end
        end
        runService.Heartbeat:Wait()
      end
      if num7 == num6 then
        tbl23 = {}
        tbl24 = setmetatable({}, { __mode = "k" })
        flag5 = false
      end
    end)
  end

  local function fn55()
    local performanceDecorations = bRG2.performanceEffects or bRG2.performanceShadows or bRG2.performanceTextures or bRG2.performanceWorld or bRG2.performanceClouds or bRG2.performanceDecorations
    if performanceDecorations and not value29 then
      value29 = workspace.DescendantAdded:Connect(fn54)
      value30 = lighting.DescendantAdded:Connect(fn54)
    elseif not performanceDecorations and value29 then
      value29:Disconnect()
      value29 = nil
      if value30 then
        value30:Disconnect()
        value30 = nil
      end
      fn53()
    end
  end

  local function fn56(arg, arg2)
    for key, value31 in pairs(arg) do
      if key and key.Parent then
        pcall(function()
          key[arg2] = value31
        end)
      end
      arg[key] = nil
    end
  end

  local function fn57(arg)
    for key, value31 in pairs(arg) do
      if type(value31) == "table" then
        for index, item in ipairs(value31) do
          if item then item:Disconnect() end
        end
      elseif value31 then
        value31:Disconnect()
      end
      arg[key] = nil
    end
  end

  local function fn58(arg)
    bRG2.performanceEffects = arg == true
    if bRG2.performanceEffects then
      if not flag4 then task.spawn(fn52) end
      for index, item in ipairs(lighting:GetChildren()) do
        if item:IsA("PostEffect") then
          fn47(tbl18.effects, item, "Enabled")
          item.Enabled = false
        end
      end
    else
      fn57(tbl19)
      fn56(tbl18.effects, "Enabled")
      if bRG2.combatAntiLag and bRG2.queueCombatAntiLagRefresh then bRG2.queueCombatAntiLagRefresh() end
    end
    fn55()
    return true
  end
  local globalShadows = lighting.GlobalShadows

  local function fn59(arg)
    bRG2.performanceShadows = arg == true
    if bRG2.performanceShadows then
      local embeddedKills = bRG2.embeddedKills
      local autoLag60SystemOriginals = embeddedKills and embeddedKills.BossFarm and embeddedKills.BossFarm.autoLag60SystemOriginals
      globalShadows = autoLag60SystemOriginals and autoLag60SystemOriginals.lighting and autoLag60SystemOriginals.lighting.GlobalShadows or lighting.GlobalShadows
      lighting.GlobalShadows = false
      if not flag4 then task.spawn(fn52) end
    else
      lighting.GlobalShadows = globalShadows
      fn56(tbl18.shadows, "CastShadow")
      if bRG2.combatAntiLag and bRG2.queueCombatAntiLagRefresh then bRG2.queueCombatAntiLagRefresh() end
    end
    fn55()
    return true
  end

  local function fn60(arg)
    bRG2.performanceTextures = arg == true
    if bRG2.performanceTextures then
      if not flag4 then task.spawn(fn52) end
    else
      fn56(tbl18.textures, "Transparency")
      fn56(tbl18.meshTextures, "TextureID")
      fn56(tbl18.specialMeshTextures, "TextureId")
      fn56(tbl18.surfaceColorMaps, "ColorMap")
      fn56(tbl18.surfaceNormalMaps, "NormalMap")
      fn56(tbl18.surfaceRoughnessMaps, "RoughnessMap")
      fn56(tbl18.surfaceMetalnessMaps, "MetalnessMap")
      if bRG2.performanceWorld and not flag4 then task.spawn(fn52) end
      if bRG2.combatAntiLag and bRG2.queueCombatAntiLagRefresh then bRG2.queueCombatAntiLagRefresh() end
    end
    fn55()
    return true
  end

  local function fn61(arg)
    bRG2.performanceWorld = arg == true
    if bRG2.performanceWorld then
      if not flag4 then task.spawn(fn52) end
      task.spawn(function()
        for index, item in ipairs(lighting:GetDescendants()) do
          fn51(item)
        end
      end)
    else
      fn57(tbl20)
      fn56(tbl18.worldLights, "Enabled")
      fn56(tbl18.worldMaterials, "Material")
      fn56(tbl18.worldReflectance, "Reflectance")
      if bRG2.performanceTextures and not flag4 then task.spawn(fn52) end
      if bRG2.combatAntiLag and bRG2.queueCombatAntiLagRefresh then bRG2.queueCombatAntiLagRefresh() end
    end
    fn55()
    return true
  end
  local terrain = workspace:FindFirstChildOfClass("Terrain")
  local value31 = nil

  local function fn62(arg)
    bRG2.performanceDecorations = arg == true
    local playerGui = localPlayer:FindFirstChildOfClass("PlayerGui")

    local function fn63(arg2)
      if arg2 and arg2:IsA("GuiObject") then
        fn47(tbl18.guiVisibility, arg2, "Visible")
        arg2.Visible = false
        if not tbl22[arg2] then
          tbl22[arg2] = arg2:GetPropertyChangedSignal("Visible"):Connect(function()
            if bRG2.performanceDecorations and arg2.Parent and arg2.Visible then arg2.Visible = false end
          end)
        end
      elseif arg2 and arg2:IsA("LayerCollector") then
        fn47(tbl18.guiEnabled, arg2, "Enabled")
        arg2.Enabled = false
        if not tbl22[arg2] then
          tbl22[arg2] = arg2:GetPropertyChangedSignal("Enabled"):Connect(function()
            if bRG2.performanceDecorations and arg2.Parent and arg2.Enabled then arg2.Enabled = false end
          end)
        end
      end
    end
    if bRG2.performanceDecorations then
      local redDragonPodium = workspace:FindFirstChild("RedDragonPodium")
      if redDragonPodium then
        for index, item in ipairs(redDragonPodium:GetDescendants()) do
          fn51(item)
        end
      end
      if playerGui then
        local gameGui = playerGui:FindFirstChild("gameGui")
        fn63(gameGui and gameGui:FindFirstChild("HudButton"))
        local currencyFrameGui = playerGui:FindFirstChild("currencyFrameGui")
        local currencyFrame = currencyFrameGui and currencyFrameGui:FindFirstChild("currencyFrame")
        fn63(currencyFrame and currencyFrame:FindFirstChild("limitedStockButton"))
        fn63(playerGui:FindFirstChild("limitedStockGui"))
        fn63(playerGui:FindFirstChild("limitedMountBillboard"))
      end
      if terrain then
        if not value31 then
          value31 = {
            WaterWaveSize = terrain.WaterWaveSize,
            WaterWaveSpeed = terrain.WaterWaveSpeed,
            WaterReflectance = terrain.WaterReflectance,
            WaterTransparency = terrain.WaterTransparency,
          }
        end
        terrain.WaterWaveSize, terrain.WaterWaveSpeed = 0, 0
        terrain.WaterReflectance, terrain.WaterTransparency = 0, 1
      end
    else
      fn57(tbl21)
      fn57(tbl22)
      fn56(tbl18.podiumParts, "LocalTransparencyModifier")
      fn56(tbl18.podiumCollision, "CanCollide")
      fn56(tbl18.podiumTouch, "CanTouch")
      fn56(tbl18.podiumQuery, "CanQuery")
      fn56(tbl18.podiumPrompts, "Enabled")
      fn56(tbl18.podiumGuis, "Enabled")
      fn56(tbl18.guiVisibility, "Visible")
      fn56(tbl18.guiEnabled, "Enabled")
      if terrain and value31 then
        for key, value32 in pairs(value31) do
          terrain[key] = value32
        end
      end
    end
    fn55()
    return true
  end

  local function fn63(arg)
    bRG2.performanceClouds = arg == true
    if bRG2.performanceClouds then
      local playerScripts = localPlayer:FindFirstChild("PlayerScripts")
      local cloudSpawnerScript = playerScripts and playerScripts:FindFirstChild("cloudSpawnerScript", true)
      if cloudSpawnerScript and cloudSpawnerScript:IsA("LocalScript") then
        fn47(tbl18.cloudScripts, cloudSpawnerScript, "Disabled")
        cloudSpawnerScript.Disabled = true
      end
      local cloudHolder = workspace:FindFirstChild("cloudHolder")
      if cloudHolder then
        for index, item in ipairs(cloudHolder:GetDescendants()) do
          fn51(item)
        end
      end
    else
      fn56(tbl18.cloudParts, "LocalTransparencyModifier")
      fn56(tbl18.cloudScripts, "Disabled")
    end
    fn55()
    return true
  end
  bRG2.performanceEffectsRow, bRG2.performanceEffectsSetter = fn41(tbl17.Performance, "Quitar efectos", 1, fn58)
  bRG2.performanceShadowsRow, bRG2.performanceShadowsSetter = fn41(tbl17.Performance, "Quitar sombras", 2, fn59)
  bRG2.performanceTexturesRow, bRG2.performanceTexturesSetter = fn41(tbl17.Performance, "Quitar texturas", 3, fn60)
  bRG2.performanceWorldRow, bRG2.performanceWorldSetter = fn41(tbl17.Performance, "Quitar luces", 4, fn61)
  bRG2.performanceMasterRow, bRG2.performanceMasterSetter = fn41(tbl17.Performance, "Máximo rendimiento", 5, function(arg)
    flag4 = true
    bRG2.performanceEffectsSetter(arg)
    bRG2.performanceShadowsSetter(arg)
    bRG2.performanceTexturesSetter(arg)
    bRG2.performanceWorldSetter(arg)
    fn63(arg)
    fn62(arg)
    flag4 = false
    if arg then task.spawn(fn52) end
    bRG2.antiLagUsed = arg == true
    return true
  end)
  bRG2.enableAntiLag = function()
    return bRG2.performanceMasterSetter(true)
  end
  bRG2.reapplyPerformance = function()
    if not (bRG2.performanceEffects or bRG2.performanceShadows or bRG2.performanceTextures or bRG2.performanceWorld or bRG2.performanceClouds or bRG2.performanceDecorations) then
      return
    end
    if bRG2.performanceShadows then lighting.GlobalShadows = false end
    if bRG2.performanceEffects then
      for index, item in ipairs(lighting:GetChildren()) do
        if item:IsA("PostEffect") then item.Enabled = false end
      end
    end
    if bRG2.performanceWorld then
      for index, item in ipairs(lighting:GetDescendants()) do
        fn51(item)
      end
    end
    if bRG2.performanceClouds then fn63(true) end
    if bRG2.performanceDecorations then fn62(true) end
    task.spawn(fn52)
    fn55()
  end
  bRG2.restorePerformance = function()
    if bRG2.performanceMasterSetter then bRG2.performanceMasterSetter(false, true) end
    fn58(false)
    fn59(false)
    fn60(false)
    fn61(false)
    fn63(false)
    fn62(false)
    fn53()
    return true
  end
end
do
  local value29 = nil
  bRG2.applyStarsPerformance = function(arg)
    if arg then
      if not value29 then
        value29 = {
          effects = bRG2.performanceEffects == true,
          shadows = bRG2.performanceShadows == true,
          textures = bRG2.performanceTextures == true,
          world = bRG2.performanceWorld == true,
        }
      end
      if bRG2.performanceMasterSetter then bRG2.performanceMasterSetter(true) end
    elseif value29 then
      local value30 = value29
      value29 = nil
      if bRG2.performanceMasterSetter then bRG2.performanceMasterSetter(false) end
      if value30.effects then bRG2.performanceEffectsSetter(true) end
      if value30.shadows then bRG2.performanceShadowsSetter(true) end
      if value30.textures then bRG2.performanceTexturesSetter(true) end
      if value30.world then bRG2.performanceWorldSetter(true) end
    end
  end
end
bRG2.minimizeKey = Enum.KeyCode.LeftControl
bRG2.waitingForMinimizeKey = false
bRG2.minimizeKeyButton = nil
bRG2.minimizeKeyFolder = "Young0xHub/PublicTraining"
bRG2.minimizeKeyPath = bRG2.minimizeKeyFolder .. "/keybind_" .. tostring(localPlayer.UserId) .. ".txt"
bRG2.minimizeKeyName = function(arg)
  local tbl18 = {
    [Enum.KeyCode.RightShift] = "Shift derecho",
    [Enum.KeyCode.LeftShift] = "Shift izquierdo",
    [Enum.KeyCode.RightControl] = "Ctrl derecho",
    [Enum.KeyCode.LeftControl] = "Ctrl izquierdo",
    [Enum.KeyCode.Space] = "Espacio",
    [Enum.KeyCode.Backspace] = "Retroceso",
    [Enum.KeyCode.Return] = "Enter",
    [Enum.KeyCode.CapsLock] = "Bloq Mayús",
  }
  if tbl18[arg] then return tbl18[arg] end
  local ok, result = pcall(userInputService.GetStringForKeyCode, userInputService, arg)
  return ok and type(result) == "string" and result ~= "" and result or arg.Name
end
bRG2.minimizeKeyText = function()
  return "Keybind: " .. bRG2.minimizeKeyName(bRG2.minimizeKey)
end
bRG2.loadMinimizeKey = function()
  if type(isfile) ~= "function" or type(readfile) ~= "function" then return false end
  local ok, result = pcall(function()
    return isfile(bRG2.minimizeKeyPath) and readfile(bRG2.minimizeKeyPath) or nil
  end)
  result = ok and type(result) == "string" and result:match("^%s*([%w_]+)%s*$") or nil
  if not result then return false end
  for index, minimizeKey in ipairs(Enum.KeyCode:GetEnumItems()) do
    if minimizeKey.Name == result and minimizeKey ~= Enum.KeyCode.Escape and minimizeKey ~= Enum.KeyCode.Unknown then
      bRG2.minimizeKey = minimizeKey
      return true
    end
  end
  return false
end
bRG2.saveMinimizeKey = function(arg)
  if typeof(arg) ~= "EnumItem" or arg.EnumType ~= Enum.KeyCode or type(writefile) ~= "function" then
    return false
  end
  return pcall(function()
    if type(isfolder) == "function" and type(makefolder) == "function" and not isfolder(bRG2.minimizeKeyFolder) then
      makefolder(bRG2.minimizeKeyFolder)
    end
    writefile(bRG2.minimizeKeyPath, arg.Name)
  end)
end
bRG2.loadMinimizeKey()
do
  local tbl18 = {
    original = setmetatable({}, { __mode = "k" }),
    recent = {},
    addedConnection = nil,
    heartbeatConnection = nil,
    shieldUntil = 0,
    stalls = 0,
    lastPruneAt = 0,
  }

  local function fn47(arg)
    if arg:IsA("ParticleEmitter") or arg:IsA("Trail") or arg:IsA("Beam") or arg:IsA("Smoke") or arg:IsA("Fire") or arg:IsA("Sparkles") or arg:IsA("Highlight") or arg:IsA("PostEffect") then
      return "Enabled", false
    end
    if arg:IsA("Explosion") then return "Visible", false end
    if arg:IsA("Sound") then return "Volume", 0 end
    return nil, nil
  end

  local function fn48(arg)
    local property, extra = fn47(arg)
    if not property or tbl18.original[arg] then return end
    local ok, value29 = pcall(function()
      return arg[property]
    end)
    if not ok then return end
    tbl18.original[arg] = { property = property, value = value29 }
    pcall(function()
      arg[property] = extra
    end)
  end

  local function fn49(arg)
    local num6 = 1
    for i = 1, #tbl18.recent do
      local item = tbl18.recent[i]
      if item and arg - item.time <= 0.7 then
        tbl18.recent[num6] = item
        num6 += 1
      end
    end
    for i = #tbl18.recent, num6, -1 do
      tbl18.recent[i] = nil
    end
  end

  local function fn50()
    for index, item in ipairs(tbl18.recent) do
      if item.object and item.object.Parent then task.defer(fn48, item.object) end
    end
  end

  local function fn51()
    if tbl18.addedConnection then
      tbl18.addedConnection:Disconnect()
      tbl18.addedConnection = nil
    end
    if tbl18.heartbeatConnection then
      tbl18.heartbeatConnection:Disconnect()
      tbl18.heartbeatConnection = nil
    end
    for key, value29 in pairs(tbl18.original) do
      if key and key.Parent then
        pcall(function()
          key[value29.property] = value29.value
        end)
      end
      tbl18.original[key] = nil
    end
    table.clear(tbl18.recent)
    tbl18.shieldUntil, tbl18.stalls, tbl18.lastPruneAt = 0, 0, 0
  end
  bRG2.setAntiCrash = function(arg)
    bRG2.antiCrash = arg == true
    fn51()
    if not bRG2.antiCrash then return true end
    tbl18.addedConnection = workspace.DescendantAdded:Connect(function(object)
      if not bRG2.antiCrash or not fn47(object) then return end
      local now = os.clock()
      tbl18.recent[#tbl18.recent + 1] = { object = object, time = now }
      fn49(now)
      if #tbl18.recent > 160 then table.remove(tbl18.recent, 1) end
      if #tbl18.recent >= 28 then
        tbl18.shieldUntil = math.max(tbl18.shieldUntil, now + 5)
        fn50()
      end
      if now <= tbl18.shieldUntil then task.defer(fn48, object) end
    end)
    tbl18.heartbeatConnection = runService.Heartbeat:Connect(function(arg2)
      if not bRG2.antiCrash then return end
      local now = os.clock()
      if now - tbl18.lastPruneAt >= 0.2 then
        tbl18.lastPruneAt = now
        fn49(now)
      end
      if arg2 >= 0.28 then
        tbl18.stalls = math.min(tbl18.stalls + 1, 4)
      elseif tbl18.stalls > 0 then
        tbl18.stalls -= 1
      end
      if tbl18.stalls >= 2 then
        tbl18.shieldUntil = math.max(tbl18.shieldUntil, now + 5)
        fn50()
        tbl18.stalls = 0
      end
    end)
    return true
  end
  local set_fps_cap2 = type(setfpscap) == "function" and setfpscap or set_fps_cap
  local get_fps_cap2 = type(getfpscap) == "function" and getfpscap or get_fps_cap
  local num6 = 0
  bRG2.setFpsUnlock = function(arg)
    arg = arg == true
    if arg and type(set_fps_cap2) ~= "function" then return false end
    if arg == (bRG2.fpsUnlock == true) then return true end
    num6 += 1
    local num7 = num6
    if arg then
      local flag4, value29 = false, nil
      if type(get_fps_cap2) == "function" then flag4, value29 = pcall(get_fps_cap2) end
      bRG2.previousFpsCap = flag4 and tonumber(value29) or 60
      local fpsUnlockTarget = 0
      local ok = pcall(set_fps_cap2, fpsUnlockTarget)
      if not ok then
        fpsUnlockTarget = 999
        ok = pcall(set_fps_cap2, fpsUnlockTarget)
      end
      if not ok then
        bRG2.previousFpsCap = nil
        return false
      end
      if type(get_fps_cap2) == "function" then
        local ok2, result = pcall(get_fps_cap2)
        if ok2 and tonumber(result) and tonumber(result) > 1 and tonumber(result) < 240 then
          fpsUnlockTarget = 999
          pcall(set_fps_cap2, fpsUnlockTarget)
        end
      end
      bRG2.fpsUnlock, bRG2.fpsUnlockTarget = true, fpsUnlockTarget
      task.spawn(function()
        while getgenv().BRG == bRG2 and bRG2.fpsUnlock and num6 == num7 do
          local flag5 = true
          if type(get_fps_cap2) == "function" then
            local ok2, result = pcall(get_fps_cap2)
            result = ok2 and tonumber(result) or nil
            flag5 = result == nil or (fpsUnlockTarget == 0 and result > 1) or (fpsUnlockTarget > 0 and math.abs(result - fpsUnlockTarget) > 1)
          end
          if flag5 then pcall(set_fps_cap2, fpsUnlockTarget) end
          task.wait(1)
        end
      end)
    else
      bRG2.fpsUnlock = false
      if type(set_fps_cap2) == "function" then pcall(set_fps_cap2, tonumber(bRG2.previousFpsCap) or 60) end
      bRG2.previousFpsCap, bRG2.fpsUnlockTarget = nil, nil
    end
    return true
  end
  bRG2.setPingReducer = function(arg)
    bRG2.pingReducer = arg == true
    if bRG2.fastRepPumpActive then
      bRG2.fastRepTargetRate = math.max(bRG2.pingReducer and 45 or 170, tonumber(bRG2.fastRepTargetRate) or 300)
    end
    return true
  end
  bRG2.antiCrashRow, bRG2.antiCrashSetter = fn41(tbl17.Settings, "Anti-Crash", 6, function(arg)
    return bRG2.setAntiCrash(arg)
  end)
  bRG2.fpsUnlockRow, bRG2.fpsUnlockSetter, bRG2.fpsUnlockAvailability = fn41(tbl17.Settings, "FPS Unlock", 7, function(arg)
    return bRG2.setFpsUnlock(arg)
  end)
  bRG2.fpsUnlockAvailability(type(set_fps_cap2) == "function")
  bRG2.pingReducerRow, bRG2.pingReducerSetter = fn41(tbl17.Settings, "MS Reducer", 8, function(arg)
    return bRG2.setPingReducer(arg)
  end)
  if userInputService.KeyboardEnabled then
    bRG2.minimizeKeyButton = fn42(tbl17.Settings, bRG2.minimizeKeyText(), 9, function()
      bRG2.waitingForMinimizeKey = true
      if bRG2.minimizeKeyButton then bRG2.minimizeKeyButton.Text = "Presioná una tecla..." end
    end)
    bRG2.minimizeKeyButton.Name = "MinimizeKeybind"
    bRG2.minimizeKeyButton.TextXAlignment = Enum.TextXAlignment.Left
    local uIPadding2 = Instance.new("UIPadding", bRG2.minimizeKeyButton)
    uIPadding2.PaddingLeft = UDim.new(0, 14)
  end
  bRG2.emergencyStop = function()
    if bRG2.emergencyStopping then return false end
    bRG2.emergencyStopping = true
    for i = #(bRG2.toggleRegistry or {}), 1, -1 do
      local item = bRG2.toggleRegistry[i]
      if item and item.row and item.row.Parent and item.row:GetAttribute("Enabled") == true then
        pcall(item.set, false)
      end
    end
    local young0xAutoKill = bRG2.embeddedKills or getgenv().Young0xAutoKill
    local bossFarm = type(young0xAutoKill) == "table" and young0xAutoKill.BossFarm or nil
    if bossFarm then
      pcall(bossFarm.SetAntiLag, bossFarm, false)
      pcall(bossFarm.SetAutoLag60, bossFarm, false)
    end
    if type(young0xAutoKill) == "table" and type(young0xAutoKill.SetAntiLag) == "function" then
      pcall(young0xAutoKill.SetAntiLag, false)
    end
    bRG2.combatAntiLag = false
    pcall(stopAutoTraining)
    if bRG2.stopMachine then pcall(bRG2.stopMachine, true) end
    pcall(fn15)
    pcall(fn12)
    if bRG2.stopFastRepPump then pcall(bRG2.stopFastRepPump) end
    if bRG2.stopEggGifts then pcall(bRG2.stopEggGifts) end
    if bRG2.restorePerformance then pcall(bRG2.restorePerformance) end
    pcall(fn17)
    bRG2.fastRep, bRG2.antiAfk, bRG2.autoEgg, bRG2.autoKing, bRG2.lockPosition = false, false, false, false, false
    bRG2.autoRebirth, bRG2.rebirthTargetMode, bRG2.autoSpinFortune = false, false, false
    bRG2.consumeAll, bRG2.autoMapChests, bRG2.collectingMapChests = false, false, false
    bRG2.setPingReducer(false)
    bRG2.setFpsUnlock(false)
    bRG2.setAntiCrash(false)
    if bRG2.setCombatAntiLag then pcall(bRG2.setCombatAntiLag, false) end
    if bRG2.saveResumeState then pcall(bRG2.saveResumeState) end
    bRG2.emergencyStopping = false
    return true
  end
  local v2
  v2 = fn42(tbl17.Settings, "Botón de emergencia", 10, function()
    if bRG2.emergencyStop() then
      local text = v2.Text
      v2.Text = "TODO APAGADO"
      task.delay(1.2, function()
        if v2.Parent then v2.Text = text end
      end)
    end
  end)
  v2.Name = "EmergencyStop"
  v2.BackgroundColor3 = Color3.fromRGB(43, 18, 23)
  v2.TextColor3 = Color3.fromRGB(255, 112, 124)
  v2:SetAttribute("Young0xIdleColor", Color3.fromRGB(43, 18, 23))
  v2:SetAttribute("Young0xHoverColor", Color3.fromRGB(67, 24, 32))
  v2:SetAttribute("Young0xHoverStrokeColor", Color3.fromRGB(255, 92, 110))
  v2:SetAttribute("Young0xHoverStrokeTransparency", 0.18)
end
local v2
local fn47 = function() end
bRG2.antiAfkRow, v2 = fn41(tbl17.Settings, "Anti-AFK", 4, function(arg)
  bRG2.antiAfk = arg == true
  if bRG2.antiAfk then
    bRG2.afkStartedAtUnix = bRG2.afkStartedAtUnix or os.time()
    bRG2.afkStartTime = tick() - math.max(0, os.time() - bRG2.afkStartedAtUnix)
    fn16()
    frame8.Visible = false
  else
    fn17()
    bRG2.afkStartedAtUnix = nil
    bRG2.afkStartTime = nil
    frame8.Visible = false
  end
  fn47(bRG2.antiAfk)
  bRG2.saveResumeState()
  return true
end)
bRG2.antiAfkRow.LayoutOrder = 4
bRG2.starsRow.LayoutOrder = 5
local textLabel5 = bRG2.antiAfkRow:FindFirstChildWhichIsA("TextLabel")
local availability = bRG2.antiAfkRow:FindFirstChild("Availability")
local value29 = nil
for index, item in ipairs(bRG2.antiAfkRow:GetChildren()) do
  if item:IsA("Frame") and item ~= availability then
    value29 = item
    break
  end
end
value21 = Instance.new("TextLabel")
value21.Name = "Young0xAntiAfkTimer"
value21.Size = UDim2.new(1, -28, 0, 16)
value21.Position = UDim2.fromOffset(14, 44)
value21.BackgroundTransparency = 1
value21.Text = "00d 00h 00m 00s"
value21.TextColor3 = colors.textDim
value21.TextStrokeTransparency = 1
value21.Font = Enum.Font.GothamMedium
value21.TextSize = touchEnabled and 10 or 12
value21.TextXAlignment = Enum.TextXAlignment.Left
value21.Visible = false
value21.ZIndex = 4
value21.Parent = bRG2.antiAfkRow
fn47 = function(arg)
  local visible = arg == true
  bRG2.antiAfkRow.Size = UDim2.new(1, 0, 0, visible and 64 or 46)
  value21.Visible = visible
  if visible then value21.Text = "00d 00h 00m 00s" end
  if textLabel5 then textLabel5.Size = UDim2.new(1, -120, 0, 46) end
  if value29 then value29.Position = UDim2.new(1, touchEnabled and -76 or -86, 0, touchEnabled and 12 or 10) end
  if availability then
    availability.Position = UDim2.new(1, touchEnabled and -18 or -21, 0, touchEnabled and 18 or 17)
  end
end
bRG2.setAntiAfk = function(arg)
  return v2(arg == true)
end
bRG2.enableAntiAfk = function()
  return bRG2.setAntiAfk(true)
end
bRG2.combatAntiLagRefreshRun = 0
bRG2.queueCombatAntiLagRefresh = function()
  bRG2.combatAntiLagRefreshRun += 1
  local combatAntiLagRefreshRun = bRG2.combatAntiLagRefreshRun
  task.delay(0.08, function()
    if combatAntiLagRefreshRun ~= bRG2.combatAntiLagRefreshRun or not bRG2.combatAntiLag then return end
    local embeddedKills = bRG2.embeddedKills
    local bossFarm = embeddedKills and embeddedKills.BossFarm
    if bossFarm then
      bossFarm:SetAutoLag60(true)
      bossFarm:SetAntiLag(embeddedKills.State and embeddedKills.State.killBoss == true)
    end
  end)
end
bRG2.combatAntiLagRow, bRG2.combatAntiLagSetter = fn41(tbl17.Settings, "Anti-Lag", 38, function(arg)
  local value30 = type(bRG2.ensureKillsController) == "function" and bRG2.ensureKillsController() or nil
  if not value30 or type(value30.SetAntiLag) ~= "function" then return false end
  local ok, result = pcall(value30.SetAntiLag, arg == true)
  if not ok or result == false then return false end
  bRG2.combatAntiLag = arg == true
  if not bRG2.combatAntiLag and bRG2.reapplyPerformance then bRG2.reapplyPerformance() end
  return true
end)
bRG2.combatAntiLagRow.LayoutOrder = 3
bRG2.setCombatAntiLag = function(arg)
  return bRG2.combatAntiLagSetter(arg == true)
end
local frame12 = Instance.new("Frame")
frame12.Name = "RewardSummary"
frame12.Size = UDim2.new(1, 0, 0, 72)
frame12.BackgroundTransparency = 1
frame12.BorderSizePixel = 0
frame12.LayoutOrder = 24
frame12.Parent = tbl17.Rewards
local result, extra = bRG2.makeStatusCard(frame12, "Consumibles", "0", 1, Color3.fromRGB(121, 202, 255))
local result2, extra2 = bRG2.makeStatusCard(frame12, "Por reclamar", "0", 2, Color3.fromRGB(121, 202, 255))
do
  local function fn48(arg, arg2, position3, color)
    arg.Size = UDim2.new(0.5, -3, 1, 0)
    arg.Position = position3
    arg.BackgroundColor3 = Color3.fromRGB(17, 18, 24)
    arg.BackgroundTransparency = 0.12
    local uIStroke5 = arg:FindFirstChildWhichIsA("UIStroke")
    if uIStroke5 then uIStroke5.Color, uIStroke5.Transparency = color, 0.42 end
    local title = arg:FindFirstChild("Title")
    if title then
      title.Position = UDim2.fromOffset(12, 8)
      title.Size = UDim2.new(1, -24, 0, 20)
      title.TextColor3 = Color3.fromRGB(190, 192, 201)
      title.TextSize = touchEnabled and 11 or 13
      title.TextXAlignment = Enum.TextXAlignment.Center
    end
    arg2.Position = UDim2.fromOffset(12, 29)
    arg2.Size = UDim2.new(1, -24, 0, 32)
    arg2.TextColor3 = colors.white
    arg2.TextSize = touchEnabled and 20 or 24
    arg2.TextXAlignment = Enum.TextXAlignment.Center
  end
  fn48(extra, result, UDim2.fromOffset(0, 0), Color3.fromRGB(121, 202, 255))
  fn48(extra2, result2, UDim2.new(0.5, 3, 0, 0), Color3.fromRGB(121, 202, 255))
end
local v3
local flag4 = false
local flag5 = false
local v4
bRG2.withRewardGuiAccess = function(arg)
  local _G2 = getgenv and getgenv() or _G
  local setidentity = _G2.setthreadidentity or _G2.setidentity
  local getidentity = _G2.getthreadidentity or _G2.getidentity
  local value30 = nil
  if type(getidentity) == "function" then
    pcall(function()
      value30 = getidentity()
    end)
  end
  if type(setidentity) == "function" then pcall(setidentity, 8) end
  local ok, result3 = pcall(arg)
  if type(setidentity) == "function" and value30 ~= nil then pcall(setidentity, value30) end
  return ok, result3
end
bRG2.refreshRewardCounters = function()
  local result3 = bRG2.countUsableConsumables()
  local result4 = fn8()
  bRG2.withRewardGuiAccess(function()
    result.Text = tostring(result3)
    result2.Text = tostring(result4)
  end)
  if not flag4 then
    local flag6 = result4 > 0
    if flag6 ~= flag5 then
      flag5 = flag6
      if v4 then v4() end
    end
  end
end
v4 = function()
  if not v3 then return end
  local selectable = flag5 and not flag4
  bRG2.withRewardGuiAccess(function()
    v3.Active = selectable
    v3.Selectable = selectable
    v3:SetAttribute("Disabled", not selectable)
    v3.Text = flag4 and "Reclamando..." or (flag5 and "Reclamar todo" or "No hay recompensas para reclamar")
    v3.TextColor3 = selectable and colors.white or Color3.fromRGB(135, 136, 145)
    v3.TextTransparency = selectable and 0 or 0.5
    v3.BackgroundColor3 = selectable and Color3.fromRGB(20, 21, 23) or Color3.fromRGB(17, 18, 22)
    v3.BackgroundTransparency = selectable and 0.06 or 0.28
    local frame13 = v3:FindFirstChildWhichIsA("Frame")
    if frame13 then
      frame13.BackgroundTransparency = 1
      frame13.BackgroundColor3 = colors.white
    end
    local uIStroke5 = v3:FindFirstChildWhichIsA("UIStroke")
    if uIStroke5 then
      uIStroke5.Color = selectable and colors.white or Color3.fromRGB(76, 76, 80)
      uIStroke5.Transparency = selectable and 0.55 or 0.62
    end
  end)
end
v3 = fn42(tbl17.Rewards, "Reclamar todo", 26, function()
  if flag4 or not flag5 then return end
  flag4 = true
  flag5 = false
  v4()
  task.spawn(function()
    fn9()
    bRG2.refreshRewardCounters()
    task.wait(0.35)
    flag4 = false
    flag5 = fn8() > 0
    bRG2.refreshRewardCounters()
    v4()
  end)
end)
v3:SetAttribute("Young0xIdleColor", Color3.fromRGB(20, 21, 23))
v3:SetAttribute("Young0xHoverColor", Color3.fromRGB(24, 28, 45))
v3:SetAttribute("Young0xIdleStrokeColor", colors.white)
v3:SetAttribute("Young0xHoverStrokeColor", colors.white)
v3:SetAttribute("Young0xIdleStrokeTransparency", 0.55)
v3:SetAttribute("Young0xHoverStrokeTransparency", 0.55)
v3.Size = UDim2.new(1, 0, 0, 46)
v3.TextSize = touchEnabled and 14 or 16
local value30 = nil
local num6 = 0
bRG2.canConsumeAll = function()
  return consumeBoostEvent ~= nil and consumeBoostEvent:IsA("RemoteEvent") and fn10() ~= nil
end
bRG2.consumeAllRow, value30, bRG2.setConsumeAllAvailable = fn41(tbl17.Rewards, "Consumir TODO", 27, function(consumeAll)
  num6 += 1
  local num7 = num6
  bRG2.consumeAll = consumeAll
  if not consumeAll then return true end
  if not bRG2.canConsumeAll() then
    bRG2.consumeAll = false
    return false
  end
  task.spawn(function()
    local num8 = 0
    local num9 = 0
    while getgenv().BRG == bRG2 and bRG2.consumeAll and num6 == num7 and parent and parent.Parent do
      local result3 = fn10()
      if not result3 then
        bRG2.consumeAll = false
        if value30 then value30(false, true) end
        break
      end
      if consumeBoostEvent and consumeBoostEvent:IsA("RemoteEvent") then
        local result4 = bRG2.countConsumablesByName(result3.Name)
        local num10 = result4 >= 10 and 10 or (result4 >= 5 and 5 or 1)
        local result5, extra3 = bRG2.consumeBatch(result3, num10)
        if result5 then
          num8 += extra3
          num9 = 0
          bRG2.refreshRewardCounters()
          task.wait(0.55)
        else
          num9 += 1
          if num9 >= 3 then
            bRG2.consumeAll = false
            if value30 then value30(false, true) end
            break
          end
          task.wait(0.6)
        end
      else
        bRG2.consumeAll = false
        if value30 then value30(false, true) end
        break
      end
    end
  end)
  return true
end)
bRG2.consumeAllRow.Size = UDim2.new(1, 0, 0, 42)
bRG2.setConsumeAll = function(arg)
  return value30(arg == true)
end
bRG2.mapChestRun = 0
bRG2.mapChestDefinitions = {
  {
    "Golden Chest",
    function()
      return workspace:FindFirstChild("goldenChest")
    end,
  },
  {
    "Enchanted Chest",
    function()
      return workspace:FindFirstChild("enchantedChest")
    end,
  },
  {
    "Magma Chest",
    function()
      return workspace:FindFirstChild("magmaChest")
    end,
  },
  {
    "Mythical Chest",
    function()
      return workspace:FindFirstChild("mythicalChest")
    end,
  },
  {
    "Legends Chest",
    function()
      return workspace:FindFirstChild("legendsChest")
    end,
  },
  {
    "Jungle Chest",
    function()
      return workspace:FindFirstChild("jungleChest")
    end,
  },
  {
    "Industrial Chest",
    function()
      local industrialMap = workspace:FindFirstChild("IndustrialMap")
      local model = industrialMap and industrialMap:FindFirstChild("Model")
      return model and model:FindFirstChild("industrialChest")
    end,
  },
  {
    "Overcharged Chest",
    function()
      local overchargedMap = workspace:FindFirstChild("OverchargedMap")
      return overchargedMap and overchargedMap:FindFirstChild("overchargedChest")
    end,
  },
}
bRG2.chestReady = function(arg)
  local timeLabel = arg and arg:FindFirstChild("timeLabel", true)
  if not timeLabel or not timeLabel:IsA("TextLabel") then return false, nil end
  local text = timeLabel.Text:lower()
  local flag6 = text:find(":", 1, true) ~= nil or text:find("collect in", 1, true) ~= nil or text:find("recolectar en", 1, true) ~= nil or text:find("coletar em", 1, true) ~= nil
  return not flag6 and (text:find("ready", 1, true) ~= nil or text:find("collect", 1, true) ~= nil or text:find("listo", 1, true) ~= nil or text:find("pronto", 1, true) ~= nil), timeLabel
end
bRG2.dismissChestPopups = function()
  local playerGui = localPlayer:FindFirstChildOfClass("PlayerGui")
  if not playerGui then return end
  for index, item in ipairs(playerGui:GetDescendants()) do
    if (item:IsA("TextLabel") or item:IsA("TextButton")) and item.Visible then
      local flag6, parent4 = true, item.Parent
      while parent4 and parent4 ~= playerGui do
        if parent4:IsA("GuiObject") and not parent4.Visible then
          flag6 = false
          break
        end
        parent4 = parent4.Parent
      end
      local text = tostring(item.Text or ""):lower()
      local index2 = flag6 and (text:find("claimed", 1, true) or text:find("collected", 1, true) or text:find("you received", 1, true) or text:find("you got", 1, true) or text:find("reclamaste", 1, true) or text:find("recibiste", 1, true) or text:find("has recibido", 1, true) or text:find("recompensa", 1, true) or text:find("ganaste", 1, true))
      if index2 then
        local item2 = item
        while item2.Parent and not item2.Parent:IsA("LayerCollector") do
          item2 = item2.Parent
        end
        if item2:IsA("GuiObject") and item2.Name ~= "Young0xHub" then item2.Visible = false end
      end
    end
  end
end
bRG2.claimReadyMapChests = function(arg)
  local character = localPlayer.Character
  local humanoid = character and character:FindFirstChildWhichIsA("Humanoid")
  local humanoidRootPart = character and character:FindFirstChild("HumanoidRootPart")
  if not character or not humanoid or humanoid.Health <= 0 or not humanoidRootPart then return end
  local embeddedKills = bRG2.embeddedKills
  local state = embeddedKills and embeddedKills.State
  if type(state) == "table" and (state.bossCombat or state.brawlBusy) then return end
  local pivot = character:GetPivot()
  local anchored = humanoidRootPart.Anchored
  bRG2.collectingMapChests = true
  for index, item in ipairs(bRG2.mapChestDefinitions) do
    if not bRG2.autoMapChests or bRG2.mapChestRun ~= arg or humanoid.Health <= 0 then break end
    local result3 = item[2]()
    local result4 = bRG2.chestReady(result3)
    local circleInner = result3 and result3:FindFirstChild("circleInner")
    if result4 and circleInner and circleInner:IsA("BasePart") then
      local num7 = circleInner.CFrame + Vector3.new(0, 3, 0)
      local anchored2 = humanoidRootPart.Anchored
      humanoidRootPart.AssemblyLinearVelocity = Vector3.zero
      humanoidRootPart.AssemblyAngularVelocity = Vector3.zero
      humanoidRootPart.Anchored = true
      character:PivotTo(num7)
      local num8 = os.clock() + 3.2
      repeat
        task.wait(0.12)
        if character ~= localPlayer.Character or not humanoidRootPart.Parent or humanoid.Health <= 0 then break end
        humanoidRootPart.AssemblyLinearVelocity = Vector3.zero
        humanoidRootPart.AssemblyAngularVelocity = Vector3.zero
        character:PivotTo(num7)
        bRG2.dismissChestPopups()
        local result5 = bRG2.chestReady(result3)
        if not result5 then break end
      until os.clock() >= num8 or not bRG2.autoMapChests or bRG2.mapChestRun ~= arg
      bRG2.dismissChestPopups()
      if humanoidRootPart.Parent then humanoidRootPart.Anchored = anchored2 end
      task.wait(0.12)
    end
  end
  if character == localPlayer.Character and humanoid.Health > 0 and humanoidRootPart.Parent then
    humanoidRootPart.Anchored = anchored
    humanoidRootPart.AssemblyLinearVelocity = Vector3.zero
    humanoidRootPart.AssemblyAngularVelocity = Vector3.zero
    character:PivotTo(pivot)
  end
  bRG2.collectingMapChests = false
end
bRG2.mapChestRow, bRG2.mapChestToggleSetter = fn41(tbl17.Rewards, "Reclamar cofres", 28, function(arg)
  bRG2.mapChestRun += 1
  local mapChestRun = bRG2.mapChestRun
  bRG2.autoMapChests = arg == true
  if not bRG2.autoMapChests then
    bRG2.collectingMapChests = false
    return true
  end
  task.spawn(function()
    while getgenv().BRG == bRG2 and bRG2.autoMapChests and bRG2.mapChestRun == mapChestRun and parent and parent.Parent do
      bRG2.claimReadyMapChests(mapChestRun)
      for i = 1, 20 do
        if not bRG2.autoMapChests or bRG2.mapChestRun ~= mapChestRun then break end
        task.wait(0.25)
      end
    end
    bRG2.collectingMapChests = false
  end)
  return true
end)
bRG2.mapChestRow.Size = UDim2.new(1, 0, 0, 42)
bRG2.setMapChestClaim = function(arg)
  return bRG2.mapChestToggleSetter(arg == true)
end
bRG2.young0xBossBridge = {
  PauseForBoss = function()
    local tbl18 = {
      consumeAll = bRG2.consumeAll == true,
      petShopAutoPet = bRG2.petShopAutoPet == true,
      petShopAutoEvolve = bRG2.petShopAutoEvolve == true,
      petShopAutoAura = bRG2.petShopAutoAura == true,
      petShopAutoAuraEvolve = bRG2.petShopAutoAuraEvolve == true,
    }
    if tbl18.consumeAll and bRG2.setConsumeAll then bRG2.setConsumeAll(false) end
    if tbl18.petShopAutoPet and bRG2.setPetShopAutoPet then bRG2.setPetShopAutoPet(false) end
    if tbl18.petShopAutoEvolve and bRG2.setPetShopAutoEvolve then bRG2.setPetShopAutoEvolve(false) end
    if tbl18.petShopAutoAura and bRG2.setPetShopAutoAura then bRG2.setPetShopAutoAura(false) end
    if tbl18.petShopAutoAuraEvolve and bRG2.setPetShopAutoAuraEvolve then bRG2.setPetShopAutoAuraEvolve(false) end
    return {
      restore = function()
        if getgenv().BRG ~= bRG2 then return end
        if tbl18.consumeAll and bRG2.setConsumeAll then bRG2.setConsumeAll(true) end
        if tbl18.petShopAutoPet and bRG2.setPetShopAutoPet then bRG2.setPetShopAutoPet(true) end
        if tbl18.petShopAutoEvolve and bRG2.setPetShopAutoEvolve then bRG2.setPetShopAutoEvolve(true) end
        if tbl18.petShopAutoAura and bRG2.setPetShopAutoAura then bRG2.setPetShopAutoAura(true) end
        if tbl18.petShopAutoAuraEvolve and bRG2.setPetShopAutoAuraEvolve then bRG2.setPetShopAutoAuraEvolve(true) end
      end,
    }
  end,
}
getgenv().Young0xPublicTrainingBossBridge = bRG2.young0xBossBridge
bRG2.refreshConsumeAllAvailability = function()
  if bRG2.setConsumeAllAvailable then bRG2.setConsumeAllAvailable(bRG2.canConsumeAll()) end
end
bRG2.refreshConsumeAllAvailability()
task.spawn(function()
  while getgenv().BRG == bRG2 and parent and parent.Parent do
    bRG2.refreshConsumeAllAvailability()
    task.wait(0.5)
  end
end)
flag5 = fn8() > 0
bRG2.refreshRewardCounters()
v4()
bRG2.consumablesFolder = localPlayer:FindFirstChild("consumablesFolder")
if bRG2.consumablesFolder then
  fn(bRG2.consumablesFolder.ChildAdded:Connect(function()
    task.defer(bRG2.refreshRewardCounters)
  end))
  fn(bRG2.consumablesFolder.ChildRemoved:Connect(function()
    task.defer(bRG2.refreshRewardCounters)
  end))
end
task.spawn(function()
  while getgenv().BRG == bRG2 and parent and parent.Parent do
    bRG2.refreshRewardCounters()
    if not flag4 then
      local result3 = fn8()
      local flag6 = result3 > 0
      if flag6 ~= flag5 then
        flag5 = flag6
        v4()
      end
    end
    task.wait(0.35)
  end
end)
do
  local function fn48()
    local frame13 = Instance.new("Frame")
    frame13.Name = "ConsumableGifts"
    frame13.Size = UDim2.new(1, 0, 0, touchEnabled and 226 or 232)
    frame13.AutomaticSize = Enum.AutomaticSize.None
    frame13.BackgroundColor3 = colors.bg
    frame13.BackgroundTransparency = 0.02
    frame13.BorderSizePixel = 0
    frame13.LayoutOrder = 1
    frame13.ZIndex = 2
    frame13.Parent = tbl17.Gifts
    Instance.new("UICorner", frame13).CornerRadius = UDim.new(0, 6)
    local uIStroke5 = Instance.new("UIStroke", frame13)
    uIStroke5.Color, uIStroke5.Transparency = colors.border, 0.35
    local uIPadding2 = Instance.new("UIPadding", frame13)
    uIPadding2.PaddingLeft, uIPadding2.PaddingRight = UDim.new(0, 8), UDim.new(0, 8)
    uIPadding2.PaddingTop, uIPadding2.PaddingBottom = UDim.new(0, 6), UDim.new(0, 6)
    local uIListLayout3 = Instance.new("UIListLayout", frame13)
    uIListLayout3.SortOrder = Enum.SortOrder.LayoutOrder
    uIListLayout3.Padding = UDim.new(0, 4)
    local fn49 = function() end

    local function fn50(name, layoutOrder, arg)
      local textLabel6 = Instance.new("TextLabel")
      textLabel6.Name = name
      textLabel6.Size = UDim2.new(1, 0, 0, arg)
      textLabel6.BackgroundTransparency = 1
      textLabel6.TextColor3 = colors.textDim
      textLabel6.TextStrokeColor3 = Color3.new(0, 0, 0)
      textLabel6.TextStrokeTransparency = 1
      textLabel6.Font = Enum.Font.GothamMedium
      textLabel6.TextSize = touchEnabled and 10 or 12
      textLabel6.TextWrapped = true
      textLabel6.TextXAlignment = Enum.TextXAlignment.Left
      textLabel6.AutoLocalize = false
      textLabel6.LayoutOrder, textLabel6.ZIndex = layoutOrder, 3
      textLabel6.Parent = frame13
      return textLabel6
    end
    local result3 = fn50("GiftInventoryCount", 1, 24)
    local str = "Protein Egg"
    local giftSelectedUserId, value31, value32, value33 = nil, nil, nil, nil
    local frame14 = Instance.new("Frame")
    frame14.Name, frame14.Size = "GiftItemSelector", UDim2.new(1, 0, 0, 36)
    frame14.BackgroundTransparency, frame14.LayoutOrder, frame14.ZIndex, frame14.Parent = 1, 2, 3, frame13
    local tbl18 = {}

    local function fn51(arg)
      local consumablesFolder = localPlayer:FindFirstChild("consumablesFolder")
      local findFirstChild = consumablesFolder and consumablesFolder:FindFirstChild(arg)
      if findFirstChild and findFirstChild:IsA("StringValue") and tostring(findFirstChild.Value):find("asset", 1, true) then
        return findFirstChild.Value
      end
      local shared = replicatedStorage:FindFirstChild("shared")
      shared = shared and shared:FindFirstChild("catalogs")
      shared = shared and shared:FindFirstChild("questItemDesc")
      local findFirstChild2 = shared and shared:FindFirstChild(arg)
      if findFirstChild2 and findFirstChild2:IsA("StringValue") then return findFirstChild2.Value end
      if not findFirstChild then return "" end
      for index, item in ipairs(findFirstChild:GetDescendants()) do
        if (item:IsA("ImageLabel") or item:IsA("ImageButton")) and item.Image ~= "" then return item.Image end
        if item:IsA("StringValue") and tostring(item.Value):find("rbx", 1, true) then return item.Value end
      end
      return ""
    end

    local function fn52(arg, arg2, arg3)
      local textButton2 = Instance.new("TextButton")
      textButton2.Size = UDim2.new(0.5, -3, 1, 0)
      textButton2.Position = UDim2.new(arg3, arg3 == 0 and 0 or 3, 0, 0)
      textButton2.BackgroundColor3, textButton2.BackgroundTransparency = Color3.fromRGB(25, 26, 29), 0.08
      textButton2.BorderSizePixel, textButton2.AutoButtonColor = 0, false
      textButton2.Text, textButton2.TextColor3, textButton2.Font, textButton2.TextSize = "      " .. arg, colors.text, Enum.Font.GothamBold, touchEnabled and 9 or 11
      textButton2.TextXAlignment = Enum.TextXAlignment.Center
      textButton2.TextStrokeTransparency = 1
      textButton2.ZIndex, textButton2.Parent = 4, frame14
      Instance.new("UICorner", textButton2).CornerRadius = UDim.new(0, 7)
      local uIStroke6 = Instance.new("UIStroke", textButton2)
      uIStroke6.Color, uIStroke6.Transparency = colors.border, 0.55
      local imageLabel = Instance.new("ImageLabel")
      imageLabel.Name = "OriginalIcon"
      imageLabel.Size = UDim2.fromOffset(touchEnabled and 22 or 25, touchEnabled and 22 or 25)
      imageLabel.Position = UDim2.fromOffset(10, math.floor((36 - imageLabel.Size.Y.Offset) / 2))
      imageLabel.BackgroundTransparency = 1
      imageLabel.ScaleType = Enum.ScaleType.Fit
      imageLabel.Image = fn51(arg2)
      imageLabel.ZIndex = 5
      imageLabel.Parent = textButton2
      tbl18[arg2] = { textButton2, uIStroke6 }
      textButton2.Activated:Connect(function()
        if value31 and value31.busy then return end
        str = arg2
        if value31 then value31.message = "" end
        value32()
      end)
    end
    fn52("Protein Eggs", "Protein Egg", 0)
    fn52("Tropical Shakes", "Tropical Shake", 0.5)
    local frame15 = Instance.new("Frame")
    frame15.Name = "GiftPlayerSelector"
    frame15.Size = UDim2.new(1, 0, 0, 40)
    frame15.BackgroundColor3, frame15.BackgroundTransparency = Color3.fromRGB(20, 21, 23), 0.06
    frame15.BorderSizePixel, frame15.LayoutOrder, frame15.ZIndex = 0, 3, 3
    frame15.Parent = frame13
    Instance.new("UICorner", frame15).CornerRadius = UDim.new(0, 7)
    local uIStroke6 = Instance.new("UIStroke", frame15)
    uIStroke6.Color, uIStroke6.Transparency = colors.white, 0.52
    local textLabel6 = Instance.new("TextLabel")
    textLabel6.Name = "PlayerName"
    textLabel6.Size, textLabel6.Position = UDim2.new(1, -88, 1, 0), UDim2.fromOffset(44, 0)
    textLabel6.BackgroundTransparency, textLabel6.Text = 1, "Elegí un jugador"
    textLabel6.TextColor3, textLabel6.Font, textLabel6.TextSize = colors.white, Enum.Font.GothamMedium, touchEnabled and 10 or 12
    textLabel6.TextTruncate, textLabel6.ZIndex, textLabel6.Parent = Enum.TextTruncate.AtEnd, 4, frame15
    local v5, v6

    local function fn53(name, text, arg)
      local textButton2 = Instance.new("TextButton")
      textButton2.Name, textButton2.Size, textButton2.Position = name, UDim2.fromOffset(40, 32), UDim2.new(arg, arg == 0 and 4 or -44, 0.5, -16)
      textButton2.BackgroundColor3, textButton2.BackgroundTransparency = Color3.fromRGB(31, 32, 35), 0.08
      textButton2.BorderSizePixel, textButton2.AutoButtonColor = 0, false
      textButton2.Text, textButton2.TextColor3, textButton2.Font, textButton2.TextSize = text, colors.white, Enum.Font.GothamBold, 16
      textButton2.ZIndex, textButton2.Parent = 5, frame15
      Instance.new("UICorner", textButton2).CornerRadius = UDim.new(0, 6)
      local uIStroke7 = Instance.new("UIStroke", textButton2)
      uIStroke7.Color, uIStroke7.Transparency = colors.white, 0.62
      return textButton2
    end
    v5, v6 = fn53("PreviousPlayer", "‹", 0), fn53("NextPlayer", "›", 1)

    local function fn54()
      local tbl19 = {}
      for index, item in ipairs(players:GetPlayers()) do
        if item ~= localPlayer then tbl19[#tbl19 + 1] = item end
      end
      table.sort(tbl19, function(arg, arg2)
        return arg.Name:lower() < arg2.Name:lower()
      end)
      return tbl19
    end

    local function fn55(arg)
      if value31 and value31.busy then return end
      local result4 = fn54()
      if #result4 == 0 then
        giftSelectedUserId, bRG2.giftSelectedUserId = nil, nil
        if value32 then value32() end
        return
      end
      local num7 = 0
      for index, item in ipairs(result4) do
        if item.UserId == giftSelectedUserId then
          num7 = index
          break
        end
      end
      local num8 = num7 == 0 and (arg > 0 and 1 or #result4) or ((num7 - 1 + arg) % #result4 + 1)
      giftSelectedUserId, bRG2.giftSelectedUserId = result4[num8].UserId, result4[num8].UserId
      if value31 then value31.message = "" end
      if value32 then value32() end
    end
    v5.Activated:Connect(function()
      fn55(-1)
    end)
    v6.Activated:Connect(function()
      fn55(1)
    end)
    fn49 = bRG2.createEggCodesButton(frame13)
    local claimEggCodesButton = frame13:FindFirstChild("ClaimEggCodesButton")
    if claimEggCodesButton then claimEggCodesButton.LayoutOrder = 4 end
    local frame16 = Instance.new("Frame")
    frame16.Name = "GiftAmountRow"
    frame16.Size = UDim2.new(1, 0, 0, 36)
    frame16.BackgroundTransparency = 1
    frame16.LayoutOrder, frame16.ZIndex = 5, 3
    frame16.Parent = frame13
    local result4 = fn50("GiftAmountLabel", 0, 36)
    result4.Text = "Cantidad"
    result4.Size = UDim2.new(1, -96, 1, 0)
    result4.Parent = frame16
    local textBox = Instance.new("TextBox")
    textBox.Name = "GiftAmount"
    textBox.AnchorPoint = Vector2.new(1, 0)
    textBox.Position = UDim2.fromScale(1, 0)
    textBox.Size = UDim2.new(0, 86, 1, 0)
    textBox.BackgroundColor3 = colors.bg
    textBox.BorderSizePixel = 0
    textBox.TextColor3, textBox.PlaceholderColor3 = colors.white, colors.textDim
    textBox.TextStrokeColor3 = Color3.new(0, 0, 0)
    textBox.TextStrokeTransparency = 1
    textBox.Font = Enum.Font.GothamMedium
    textBox.TextSize = touchEnabled and 12 or 14
    textBox.Text, textBox.PlaceholderText = bRG2.giftAmount, "Cantidad"
    textBox.ClearTextOnFocus = false
    textBox.MultiLine = false
    textBox.AutoLocalize = false
    textBox.ZIndex, textBox.Parent = 4, frame16
    Instance.new("UICorner", textBox).CornerRadius = UDim.new(0, 6)
    local uIStroke7 = Instance.new("UIStroke", textBox)
    uIStroke7.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
    uIStroke7.Color, uIStroke7.Transparency = colors.border, 0.35
    local result5 = fn42(frame13, "Regalar", 6, function()
      if value31.busy then
        value31:Cancel()
      else
        value31:Start(giftSelectedUserId, textBox.Text, str)
      end
    end)
    result5.Name = "GiftSendButton"
    result5.Size = UDim2.new(1, 0, 0, 40)
    local result6 = fn50("GiftStatus", 7, 20)
    value32 = function()
      if not frame13.Parent or not value31 or value31.closed then return end
      fn49()
      local player = giftSelectedUserId and players:GetPlayerByUserId(giftSelectedUserId)
      if not player or player.Parent ~= players then
        giftSelectedUserId, player, bRG2.giftSelectedUserId = nil, nil, nil
      end
      textLabel6.Text = player and (player.DisplayName .. "  @" .. player.Name) or "Elegí un jugador"
      local active = not value31.busy and #fn54() > 0
      for index, item in ipairs({ v5, v6 }) do
        item.Active, item.Selectable = active, active
        item.TextColor3 = active and colors.white or Color3.fromRGB(96, 98, 103)
      end
      textBox.TextEditable = not value31.busy
      result3.Text = ("Protein Eggs: %d    ·    Tropical Shakes: %d"):format(#bRG2.getGiftableItems("Protein Egg"), #bRG2.getGiftableItems("Tropical Shake"))
      result4.Text = str == "Tropical Shake" and "Cantidad de shakes" or "Cantidad de eggs"
      for key, value34 in pairs(tbl18) do
        local flag6 = key == str
        value34[1].BackgroundColor3 = flag6 and Color3.fromRGB(31, 33, 37) or Color3.fromRGB(20, 21, 23)
        value34[1].TextColor3 = flag6 and colors.white or colors.textDim
        value34[2].Color = flag6 and Color3.fromRGB(92, 95, 102) or colors.border
        value34[2].Transparency = flag6 and 0.34 or 0.65
      end
      local check, extra3 = value31:Check(giftSelectedUserId, textBox.Text, str)
      local busy = value31.busy and not value31.cancelled or check ~= nil
      result5:SetAttribute("Disabled", not busy)
      result5.Active, result5.Selectable = busy, busy
      result5.TextColor3 = busy and colors.white or colors.textDim
      result5.TextTransparency = busy and 0 or 0.4
      result5.BackgroundTransparency = busy and 0.16 or 0.45
      result5.Text = value31.busy and ((value31.cancelled and "Deteniendo" or "Cancelar") .. (" · %d/%d"):format(value31.sent, value31.total)) or "Regalar"
      local message = value31.message ~= "" and value31.message or extra3 or ""
      result6.Text = message == "Seleccioná un jugador del servidor." and "" or message
    end
    value31 = bRG2.createEggGiftSender(value32)
    value33 = function()
      if value31.closed then return end
      local player = giftSelectedUserId and players:GetPlayerByUserId(giftSelectedUserId)
      if not player or player == localPlayer then giftSelectedUserId, bRG2.giftSelectedUserId = nil, nil end
      value32()
    end
    textBox:GetPropertyChangedSignal("Text"):Connect(function()
      bRG2.giftAmount = textBox.Text
      if not value31.busy then
        value31.message = ""
        value32()
      end
    end)
    local result7 = fn(players.PlayerAdded:Connect(function()
      value33()
    end))
    local result8 = fn(players.PlayerRemoving:Connect(function(arg)
      if giftSelectedUserId == arg.UserId then giftSelectedUserId, bRG2.giftSelectedUserId = nil, nil end
      value32()
    end))
    bRG2.stopEggGifts = function()
      value31:Destroy()
      result7:Disconnect()
      result8:Disconnect()
    end
    bRG2.setGiftOptions = function(arg, arg2)
      local player = tonumber(arg) and players:GetPlayerByUserId(tonumber(arg)) or nil
      giftSelectedUserId = player and player ~= localPlayer and player.UserId or nil
      bRG2.giftSelectedUserId = giftSelectedUserId
      if arg2 ~= nil then
        textBox.Text = tostring(arg2):sub(1, 4)
        bRG2.giftAmount = textBox.Text
      end
      value32()
      return true
    end
    fn(parent.Destroying:Connect(bRG2.stopEggGifts))
    value32()
    task.spawn(function()
      while getgenv().BRG == bRG2 and not value31.closed and parent and parent.Parent do
        task.wait(0.5)
        value32()
      end
    end)
  end
  fn48()
end
;(function()
  local profiles = { selected = nil, deleteName = nil, deleteUntil = 0 }
  bRG2.Profiles = profiles

  local function fn48(arg)
    if not arg or not arg:IsA("StringValue") then return nil end

    local function fn49(arg2)
      local findFirstChild = arg:FindFirstChild(arg2)
      return findFirstChild and findFirstChild:IsA("ValueBase") and findFirstChild.Value or nil
    end
    return {
      rarity = arg.Parent and arg.Parent.Name or "",
      name = arg.Name,
      image = arg.Value,
      level = tonumber(fn49("level")) or 1,
      evolved = fn49("evolved") == true,
      chosenName = tostring(fn49("chosenName") or arg.Name),
    }
  end
  bRG2.capturePetLoadout = function()
    local tbl18 = {}
    local equippedPets = localPlayer:FindFirstChild("equippedPets")
    if equippedPets then
      local children = equippedPets:GetChildren()
      table.sort(children, function(arg, arg2)
        return arg.Name < arg2.Name
      end)
      for index, item in ipairs(children) do
        local petReference = item:FindFirstChild("petReference")
        local result3 = fn48(petReference and petReference:IsA("ObjectValue") and petReference.Value or nil)
        if result3 then tbl18[#tbl18 + 1] = result3 end
      end
    end
    return tbl18
  end
  bRG2.applyPetLoadout = function(arg)
    if type(arg) ~= "table" then return false end
    local equippedPets = localPlayer:FindFirstChild("equippedPets")
    local petsFolder = localPlayer:FindFirstChild("petsFolder")
    local equipPetEvent = rEvents and rEvents:FindFirstChild("equipPetEvent")
    if not equippedPets or not petsFolder or not equipPetEvent or not equipPetEvent:IsA("RemoteEvent") then
      return false
    end
    for index, item in ipairs(equippedPets:GetChildren()) do
      local petReference = item:FindFirstChild("petReference")
      local isA = petReference and petReference:IsA("ObjectValue") and petReference.Value
      if isA and isA:IsA("StringValue") then equipPetEvent:FireServer("unequipPet", isA) end
    end
    task.wait(0.25)
    local tbl18 = {}
    for index, item in ipairs(petsFolder:GetChildren()) do
      for index2, item2 in ipairs(item:GetChildren()) do
        if item2:IsA("StringValue") then tbl18[#tbl18 + 1] = item2 end
      end
    end
    local tbl19, num7 = {}, 0
    for index, item in ipairs(arg) do
      local value31, num8 = nil, -1
      for index2, item2 in ipairs(tbl18) do
        if not tbl19[item2] and item2.Name == item.name then
          local result3 = fn48(item2)
          local num9 = 1
          if result3.rarity == item.rarity then num9 += 8 end
          if result3.level == item.level then num9 += 4 end
          if result3.evolved == item.evolved then num9 += 4 end
          if result3.chosenName == item.chosenName then num9 += 2 end
          if result3.image == item.image then num9 += 1 end
          if num9 > num8 then value31, num8 = item2, num9 end
        end
      end
      if value31 then
        tbl19[value31], num7 = true, num7 + 1
        equipPetEvent:FireServer("equipPet", value31)
        task.wait(0.08)
      end
    end
    return num7 == #arg
  end
  bRG2.captureOptions = function()
    local lockCFrame = nil
    local state = bRG2.embeddedKills and bRG2.embeddedKills.State
    if typeof(bRG2.lockPositionCFrame) == "CFrame" then
      lockCFrame = { bRG2.lockPositionCFrame:GetComponents() }
    end
    return {
      by = by,
      trainingMode = bRG2.trainingMode,
      machineKey = bRG2.machineDefinition and (tostring(bRG2.machineDefinition.section or "") .. "|" .. tostring(bRG2.machineDefinition.label or "")) or nil,
      fastRep = bRG2.fastRep == true,
      autoEgg = bRG2.autoEgg == true,
      autoKing = bRG2.autoKing == true,
      lockPosition = bRG2.lockPosition == true,
      lockCFrame = lockCFrame,
      autoRebirth = bRG2.autoRebirth == true and not bRG2.rebirthTargetMode,
      rebirthTargetMode = bRG2.rebirthTargetMode == true,
      rebirthTarget = bRG2.rebirthTarget,
      autoSpinFortune = bRG2.autoSpinFortune == true,
      fastPunch = bRG2.fastPunch == true,
      rockRequirement = bRG2.selectedRockRequirement,
      fly = bRG2.fly == true,
      flySpeed = bRG2.flySpeed,
      stars = bRG2.stars == true,
      antiLag = bRG2.antiLagUsed == true,
      combatAntiLag = bRG2.combatAntiLag == true,
      antiCrash = bRG2.antiCrash == true,
      fpsUnlock = bRG2.fpsUnlock == true,
      pingReducer = bRG2.pingReducer == true,
      minimizeKey = bRG2.minimizeKey.Name,
      performanceEffects = bRG2.performanceEffects == true,
      performanceShadows = bRG2.performanceShadows == true,
      performanceTextures = bRG2.performanceTextures == true,
      performanceWorld = bRG2.performanceWorld == true,
      hideFrames = bRG2.hideDurability == true,
      hideMyPets = bRG2.hideMyPets == true,
      hideOtherPets = bRG2.hideOtherPets == true,
      petLoadout = bRG2.capturePetLoadout(),
      antiAfk = bRG2.antiAfk == true,
      antiAfkStartedAt = bRG2.afkStartedAtUnix,
      consumeAll = bRG2.consumeAll == true,
      autoMapChests = bRG2.autoMapChests == true,
      giftUserId = bRG2.giftSelectedUserId,
      giftAmount = bRG2.giftAmount,
      petShopAutoPet = bRG2.petShopAutoPet == true,
      petShopAutoEvolve = bRG2.petShopAutoEvolve == true,
      petShopAutoAura = bRG2.petShopAutoAura == true,
      petShopAutoAuraEvolve = bRG2.petShopAutoAuraEvolve == true,
      killsAuto = type(state) == "table" and state.autoKill == true or false,
      killsServerHop = type(state) == "table" and state.serverHop == true or false,
      killsBrawl = type(state) == "table" and state.autoWinBrawl == true or false,
      killsProtectFriends = type(state) == "table" and state.protectFriends == true or false,
      killsBoss = type(state) == "table" and state.killBoss == true or false,
      killsKarmaMode = bRG2.killsKarmaMode,
      language = getgenv().Young0xPublicTrainingLanguage,
    }
  end
  bRG2.applyOptions = function(arg)
    if type(arg) ~= "table" then return false end
    local flag6 = true

    local function fn49(arg2, arg3)
      if type(arg2) ~= "function" then
        if arg3 then flag6 = false end
        return
      end
      local ok, result3 = pcall(arg2, arg3 == true)
      if arg3 and (not ok or result3 == false) then flag6 = false end
    end
    fn49(bRG2.setAutoWeight, false)
    fn49(bRG2.setAutoHandstands, false)
    fn49(bRG2.setAutoPushups, false)
    fn49(bRG2.setAutoSitups, false)
    if type(bRG2.machineSetters) == "table" then
      for key, value31 in pairs(bRG2.machineSetters) do
        pcall(value31, false, true)
      end
    end
    if type(bRG2.stopMachine) == "function" then pcall(bRG2.stopMachine, true) end
    fn49(bRG2.setFastPunch, false)
    fn49(bRG2.setFastRep, false)
    fn49(bRG2.setFlyToggle or value2, false)
    fn49(bRG2.setLockPosition, false)
    fn49(bRG2.setAutoKing, false)
    fn49(bRG2.setAutoEgg, false)
    fn49(bRG2.setAutoRebirth, false)
    fn49(bRG2.setTargetRebirth, false)
    fn49(bRG2.setAutoSpinFortune, false)
    fn49(bRG2.setBoss, false)
    fn49(bRG2.setPetShopAutoPet, false)
    fn49(bRG2.setPetShopAutoEvolve, false)
    fn49(bRG2.setPetShopAutoAura, false)
    fn49(bRG2.setPetShopAutoAuraEvolve, false)
    fn49(bRG2.setKillsAuto, false)
    fn49(bRG2.setKillsServerHop, false)
    fn49(bRG2.setKillsBrawl, false)
    fn49(bRG2.setKillsProtectFriends, false)
    fn49(bRG2.setConsumeAll, false)
    fn49(bRG2.setMapChestClaim, false)
    fn49(bRG2.setAntiAfk, false)
    fn49(bRG2.setStars, false)
    fn49(bRG2.hideFramesToggleSetter, false)
    fn49(bRG2.hideMyPetsToggleSetter, false)
    fn49(bRG2.hideOtherPetsToggleSetter, false)
    fn49(bRG2.performanceMasterSetter, false)
    fn49(bRG2.performanceEffectsSetter, false)
    fn49(bRG2.performanceShadowsSetter, false)
    fn49(bRG2.performanceTexturesSetter, false)
    fn49(bRG2.performanceWorldSetter, false)
    fn49(bRG2.setCombatAntiLag, false)
    fn49(bRG2.antiCrashSetter, false)
    fn49(bRG2.fpsUnlockSetter, false)
    fn49(bRG2.pingReducerSetter, false)
    if type(arg.flySpeed) == "number" and type(bRG2.setFlySpeed) == "function" then
      pcall(bRG2.setFlySpeed, arg.flySpeed)
    end
    if type(bRG2.setGiftOptions) == "function" then
      pcall(bRG2.setGiftOptions, arg.giftUserId, arg.giftAmount or "10")
    end
    local tbl18 = {
      weight = bRG2.setAutoWeight,
      handstands = bRG2.setAutoHandstands,
      pushups = bRG2.setAutoPushups,
      situps = bRG2.setAutoSitups,
    }
    local flag7 = false
    if type(arg.machineKey) == "string" and type(bRG2.machineSetters) == "table" then
      local item = bRG2.machineSetters[arg.machineKey]
      if type(item) == "function" then
        local ok, result3 = pcall(item, true)
        flag7 = ok and result3 ~= false
        if not flag7 then flag6 = false end
      else
        flag6 = false
      end
    end
    if not flag7 and type(arg.trainingMode) == "string" then fn49(tbl18[arg.trainingMode], true) end
    fn49(bRG2.setFastRep, arg.fastRep)
    if arg.fastPunch == true then
      fn49(bRG2.setFastPunch, true)
      if type(arg.rockRequirement) == "number" then
        local ok, result3 = pcall(bRG2.setRock, arg.rockRequirement, true)
        if not ok or result3 == false then flag6 = false end
      end
    end
    fn49(bRG2.setAutoEgg, arg.autoEgg)
    fn49(bRG2.setAutoKing, arg.autoKing)
    if arg.lockPosition == true then
      fn49(bRG2.setLockPosition, true)
      if type(arg.lockCFrame) == "table" and #arg.lockCFrame == 12 then
        local ok, lockPositionCFrame = pcall(function()
          return CFrame.new(table.unpack(arg.lockCFrame))
        end)
        if ok and typeof(lockPositionCFrame) == "CFrame" then bRG2.lockPositionCFrame = lockPositionCFrame end
      end
    end
    if type(arg.rebirthTarget) == "number" and type(bRG2.setRebirthTargetValue) == "function" then
      pcall(bRG2.setRebirthTargetValue, arg.rebirthTarget)
    end
    fn49(bRG2.setAutoRebirth, arg.autoRebirth)
    fn49(bRG2.setTargetRebirth, arg.rebirthTargetMode)
    fn49(bRG2.setAutoSpinFortune, arg.autoSpinFortune)
    fn49(bRG2.setConsumeAll, arg.consumeAll)
    fn49(bRG2.setMapChestClaim, arg.autoMapChests)
    fn49(bRG2.hideFramesToggleSetter, arg.hideFrames)
    fn49(bRG2.hideMyPetsToggleSetter, arg.hideMyPets)
    fn49(bRG2.hideOtherPetsToggleSetter, arg.hideOtherPets)
    fn49(bRG2.performanceEffectsSetter, arg.performanceEffects)
    fn49(bRG2.performanceShadowsSetter, arg.performanceShadows)
    fn49(bRG2.performanceTexturesSetter, arg.performanceTextures)
    fn49(bRG2.performanceWorldSetter, arg.performanceWorld)
    fn49(bRG2.setCombatAntiLag, arg.combatAntiLag)
    fn49(bRG2.antiCrashSetter, arg.antiCrash)
    fn49(bRG2.fpsUnlockSetter, arg.fpsUnlock)
    fn49(bRG2.pingReducerSetter, arg.pingReducer)
    fn49(bRG2.setStars, arg.stars)
    if type(arg.minimizeKey) == "string" then
      for index, minimizeKey in ipairs(Enum.KeyCode:GetEnumItems()) do
        if minimizeKey.Name == arg.minimizeKey and minimizeKey ~= Enum.KeyCode.Escape and minimizeKey ~= Enum.KeyCode.Unknown then
          bRG2.minimizeKey = minimizeKey
          bRG2.saveMinimizeKey(bRG2.minimizeKey)
          if bRG2.minimizeKeyButton and bRG2.minimizeKeyButton.Parent then
            bRG2.minimizeKeyButton.Text = bRG2.minimizeKeyText()
          end
          break
        end
      end
    end
    if arg.petShopAutoPet == true then fn49(bRG2.setPetShopAutoPet, true) end
    if arg.petShopAutoEvolve == true then fn49(bRG2.setPetShopAutoEvolve, true) end
    if arg.petShopAutoAura == true then fn49(bRG2.setPetShopAutoAura, true) end
    if arg.petShopAutoAuraEvolve == true then fn49(bRG2.setPetShopAutoAuraEvolve, true) end
    if arg.killsAuto == true then fn49(bRG2.setKillsAuto, true) end
    if arg.killsServerHop == true then fn49(bRG2.setKillsServerHop, true) end
    if arg.killsBrawl == true then fn49(bRG2.setKillsBrawl, true) end
    if arg.killsProtectFriends == true then fn49(bRG2.setKillsProtectFriends, true) end
    if arg.killsBoss == true then fn49(bRG2.setBoss, true) end
    if (arg.killsKarmaMode == "evil" or arg.killsKarmaMode == "good") and type(bRG2.setKillsKarma) == "function" then
      local ok, result3 = pcall(bRG2.setKillsKarma, arg.killsKarmaMode, true)
      if not ok or result3 == false then flag6 = false end
    end
    if type(arg.language) == "number" and type(bRG2.setLanguage) == "function" then
      pcall(bRG2.setLanguage, arg.language)
    end
    if arg.fly == true then fn49(value2, true) end
    if arg.antiLag == true and type(bRG2.enableAntiLag) == "function" then bRG2.enableAntiLag() end
    if type(arg.petLoadout) == "table" and type(bRG2.applyPetLoadout) == "function" then
      local ok, result3 = pcall(bRG2.applyPetLoadout, arg.petLoadout)
      if not ok or result3 == false then flag6 = false end
    end
    if arg.antiAfk == true and type(bRG2.enableAntiAfk) == "function" then
      if type(arg.antiAfkStartedAt) == "number" then
        bRG2.afkStartedAtUnix = math.min(os.time(), arg.antiAfkStartedAt)
      end
      bRG2.enableAntiAfk()
      if bRG2.afkStartedAtUnix then bRG2.afkStartTime = tick() - math.max(0, os.time() - bRG2.afkStartedAtUnix) end
    end
    if arg.antiAfk ~= true and type(bRG2.setAntiAfk) == "function" then bRG2.setAntiAfk(false) end
    return flag6
  end

  function profiles:Available()
    return bRG2.localFilesAvailable() and type(listfiles) == "function"
  end

  function profiles:Sanitize(arg)
    arg = tostring(arg or ""):gsub("^%s+", ""):gsub("%s+$", "")
    return arg:gsub("[^%w_%- ]", "_"):sub(1, 32)
  end

  function profiles:Normalize(arg)
    return self:Sanitize(arg):lower()
  end

  function profiles:Path(arg)
    local sanitize = self:Sanitize(arg)
    if sanitize == "" then return nil end
    return bRG2.profileFolder .. "/" .. sanitize .. ".txt", sanitize
  end

  function profiles:List()
    if not self:Available() or not bRG2.ensureLocalFolders(true) then return {} end
    local ok, result3 = pcall(listfiles, bRG2.profileFolder)
    if not ok or type(result3) ~= "table" then return {} end
    local tbl18 = {}
    for index, item in ipairs(result3) do
      local match = tostring(item):match("([^/\\]+)%.txt$")
      if match then tbl18[#tbl18 + 1] = match end
    end
    table.sort(tbl18, function(arg, arg2)
      return arg:lower() < arg2:lower()
    end)
    return tbl18
  end

  function profiles:FindDuplicate(arg, arg2)
    local normalize = self:Normalize(arg)
    local normalize2 = arg2 and self:Normalize(arg2) or nil
    if normalize == "" then return nil end
    for index, item in ipairs(self:List()) do
      local normalize3 = self:Normalize(item)
      if normalize3 == normalize and normalize3 ~= normalize2 then return item end
    end
    return nil
  end

  function profiles:Write(arg, arg2)
    local path, name = self:Path(arg)
    if not path then return false, nil, "empty" end
    if not self:Available() then return false, nil, "unavailable" end
    local findDuplicate = self:FindDuplicate(name)
    if findDuplicate and not arg2 then return false, nil, "duplicate", findDuplicate end
    if findDuplicate and arg2 then path, name = self:Path(findDuplicate) end
    local result3 = bRG2.writeLocalJson(path, {
      version = 1,
      by = by,
      name = name,
      userId = localPlayer.UserId,
      updatedAt = os.time(),
      options = bRG2.captureOptions(),
    }, true)
    if result3 then return true, name end
    return false, name, "write"
  end

  function profiles:Load(arg)
    local path, extra3 = self:Path(arg)
    if not path then return false, nil, "missing" end
    local result3 = bRG2.readLocalJson(path)
    if type(result3) ~= "table" or tonumber(result3.userId) ~= localPlayer.UserId or type(result3.options) ~= "table" then
      return false, nil, "invalid"
    end
    local result4 = bRG2.applyOptions(result3.options)
    if result4 then return true, extra3 end
    return true, extra3, "partial"
  end

  function profiles:Rename(arg, arg2)
    local path, extra3 = self:Path(arg)
    local path2, name = self:Path(arg2)
    if not path2 then return false, nil, "empty" end
    if not path or type(delfile) ~= "function" or not isfile(path) then return false, nil, "missing" end
    if self:Normalize(extra3) == self:Normalize(name) then return false, nil, "same" end
    local findDuplicate = self:FindDuplicate(name, extra3)
    if findDuplicate or isfile(path2) then return false, nil, "duplicate", findDuplicate or name end
    local result3 = bRG2.readLocalJson(path)
    if type(result3) ~= "table" then return false, nil, "invalid" end
    result3.name = name
    result3.updatedAt = os.time()
    if not bRG2.writeLocalJson(path2, result3, true) then return false, nil, "write" end
    local ok = pcall(delfile, path)
    if not ok then
      pcall(delfile, path2)
      return false, nil, "write"
    end
    return true, name
  end

  function profiles:Delete(arg)
    local path = self:Path(arg)
    if not path or type(delfile) ~= "function" or not isfile(path) then return false end
    return pcall(delfile, path)
  end
  local profilePage = bRG2.profilePage
  if false then
    local v5, v6, v7, v8
    local v9, v10, v11, v12
    local v13, v14, v15, v16
    local v17, v18, v19, v20

    local function fn49(placeholderText, layoutOrder)
      local frame13 = Instance.new("Frame")
      frame13.Size = UDim2.new(1, 0, 0, 46)
      frame13.BackgroundColor3 = colors.surface2
      frame13.BackgroundTransparency = 0.16
      frame13.BorderSizePixel = 0
      frame13.LayoutOrder = layoutOrder
      frame13.ZIndex = 2
      frame13.Parent = profilePage
      Instance.new("UICorner", frame13).CornerRadius = UDim.new(0, 6)
      local uIStroke5 = Instance.new("UIStroke", frame13)
      uIStroke5.Color, uIStroke5.Transparency = colors.border, 0.35
      local textBox = Instance.new("TextBox")
      textBox.Size = UDim2.new(1, -20, 1, 0)
      textBox.Position = UDim2.fromOffset(10, 0)
      textBox.BackgroundTransparency = 1
      textBox.ClearTextOnFocus = false
      textBox.Text = ""
      textBox.PlaceholderText = placeholderText
      textBox.PlaceholderColor3 = colors.textDim
      textBox.TextColor3 = colors.white
      textBox.TextStrokeColor3 = Color3.new(0, 0, 0)
      textBox.TextStrokeTransparency = 0.35
      textBox.Font = Enum.Font.FredokaOne
      textBox.TextSize = 14
      textBox.TextXAlignment = Enum.TextXAlignment.Left
      textBox.AutoLocalize = false
      textBox.ZIndex = 3
      textBox.Parent = frame13
      return frame13, textBox
    end

    local function fn50(arg, active)
      arg:SetAttribute("Disabled", not active)
      arg.Active, arg.Selectable = active, active
      arg.TextColor3 = active and colors.white or Color3.fromRGB(105, 105, 105)
      arg.TextTransparency = active and 0 or 0.15
      arg.BackgroundColor3 = active and colors.surface2 or Color3.fromRGB(14, 14, 14)
      arg.BackgroundTransparency = active and 0.16 or 0.34
      local frame13 = arg:FindFirstChildWhichIsA("Frame")
      if frame13 then
        frame13.BackgroundColor3 = active and colors.red or Color3.fromRGB(72, 72, 72)
        frame13.BackgroundTransparency = active and 0 or 0.25
      end
      local uIStroke5 = arg:FindFirstChildWhichIsA("UIStroke")
      if uIStroke5 then
        uIStroke5.Color = active and colors.border or Color3.fromRGB(62, 62, 62)
        uIStroke5.Transparency = active and 0.08 or 0.58
      end
    end
    local num7 = 0

    local function fn51(text, arg)
      num7 += 1
      local num8 = num7
      v7.Text = text
      v7.TextColor3 = arg and colors.green or Color3.fromRGB(225, 150, 105)
      task.delay(2.2, function()
        if v7.Parent and num7 == num8 then
          v7.Text = profiles:Available() and "Guardá tus opciones y cargalas cuando quieras." or "Tu executor no permite perfiles locales."
          v7.TextColor3 = colors.textDim
        end
      end)
    end

    local function fn52()
      v13.Visible, v15.Visible, v16.Visible = false, false, false
    end

    local function fn53()
      v17.Visible, v19.Visible, v20.Visible = false, false, false
    end

    local function fn54()
      for index, item in ipairs(v6:GetChildren()) do
        if item:IsA("GuiObject") then item:Destroy() end
      end
      local list = profiles:List()
      local flag6 = false
      for index, item in ipairs(list) do
        if item == profiles.selected then flag6 = true end
      end
      if not flag6 then profiles.selected = list[1] end
      v5.Text = profiles.selected and ("Perfil: " .. profiles.selected .. "  ▾") or "No tenés perfiles"
      if #list == 0 then v6.Visible = false end
      for index, item in ipairs(list) do
        local selected = item
        local result3 = fn42(v6, selected, index, function()
          profiles.selected = selected
          v6.Visible = false
          fn54()
        end)
        result3.Size = UDim2.new(1, -6, 0, 38)
        result3.TextSize = 13
        local frame13 = result3:FindFirstChildWhichIsA("Frame")
        if frame13 then frame13.Visible = false end
      end
      if v8 then v8(true) end
      local available = profiles.selected ~= nil and profiles:Available()
      fn50(v5, #list > 0 and profiles:Available())
      for index, item in ipairs({ v9, v10, v11, v12 }) do
        if item then fn50(item, available) end
      end
      if not available then fn53() end
    end
    fn40(profilePage, "— MIS PERFILES —", 1)
    v5 = fn42(profilePage, "No tenés perfiles", 2, function()
      if not profiles:Available() then
        fn51("Tu executor no permite perfiles locales.", false)
        return
      end
      if #profiles:List() == 0 then
        v6.Visible = false
        fn51("Primero creá un perfil.", false)
        return
      end
      v6.Visible = not v6.Visible
      if v6.Visible then
        fn54()
        if v8 then v8(true) end
      end
    end)
    v5.Name = "ProfileSelector"
    v6 = Instance.new("ScrollingFrame")
    v6.Name = "ProfileList"
    v6.Size = UDim2.new(1, 0, 0, 0)
    v6.BackgroundColor3 = colors.bg
    v6.BackgroundTransparency = 0.15
    v6.BorderSizePixel = 0
    v6.ScrollBarThickness = 0
    v6.ScrollBarImageColor3 = colors.white
    v6.CanvasSize = UDim2.new()
    v6.AutomaticCanvasSize = Enum.AutomaticSize.Y
    v6.ScrollingDirection = Enum.ScrollingDirection.Y
    v6.ElasticBehavior = Enum.ElasticBehavior.Never
    v6.Visible = false
    v6.LayoutOrder = 3
    v6.ZIndex = 3
    v6.Parent = profilePage
    local uIListLayout3 = Instance.new("UIListLayout", v6)
    uIListLayout3.SortOrder = Enum.SortOrder.LayoutOrder
    uIListLayout3.Padding = UDim.new(0, 3)
    v8 = fn37(v6, uIListLayout3, touchEnabled and 120 or 161)
    v9 = fn42(profilePage, "Cargar perfil", 4, function()
      if not profiles.selected then return end
      local load, extra3, extra4 = profiles:Load(profiles.selected)
      fn51(
        load and (extra4 == "partial" and "Perfil cargado; alguna opción no estaba disponible." or "Perfil cargado: " .. extra3) or "No se pudo cargar el perfil.",
        load
      )
    end)
    fn40(profilePage, "— GUARDAR —", 10)
    fn42(profilePage, "Crear perfil", 11, function()
      fn53()
      v13.Visible, v15.Visible, v16.Visible = true, true, true
      v14:CaptureFocus()
    end)
    v13, v14 = fn49("Nombre", 12)
    v15 = fn42(profilePage, "Guardar", 13, function()
      local write, selected, extra3, extra4 = profiles:Write(v14.Text, false)
      if write then
        profiles.selected = selected
        v14.Text = ""
        fn52()
        fn54()
        fn51("Perfil guardado: " .. selected, true)
      elseif extra3 == "duplicate" then
        fn51("Ya existe: " .. tostring(extra4), false)
      elseif extra3 == "empty" then
        fn51("Escribí un nombre.", false)
      else
        fn51("No se pudo guardar el perfil.", false)
      end
    end)
    v16 = fn42(profilePage, "Cancelar", 14, fn52)
    v10 = fn42(profilePage, "Actualizar perfil", 15, function()
      if not profiles.selected then return end
      local write, extra3 = profiles:Write(profiles.selected, true)
      fn51(write and ("Perfil actualizado: " .. extra3) or "No se pudo actualizar el perfil.", write)
    end)
    fn40(profilePage, "— ADMINISTRAR —", 20)
    v11 = fn42(profilePage, "Renombrar perfil", 21, function()
      if not profiles.selected then return end
      fn52()
      v17.Visible, v19.Visible, v20.Visible = true, true, true
      v18:CaptureFocus()
    end)
    v17, v18 = fn49("Nuevo nombre", 22)
    v19 = fn42(profilePage, "Confirmar", 23, function()
      if not profiles.selected then return end
      local rename, selected, extra3, extra4 = profiles:Rename(profiles.selected, v18.Text)
      if rename then
        profiles.selected = selected
        v18.Text = ""
        fn53()
        fn54()
        fn51("Perfil renombrado: " .. selected, true)
      elseif extra3 == "duplicate" then
        fn51("Ya existe: " .. tostring(extra4), false)
      elseif extra3 == "same" then
        fn51("Usá otro nombre.", false)
      elseif extra3 == "empty" then
        fn51("Escribí un nombre.", false)
      else
        fn51("No se pudo renombrar el perfil.", false)
      end
    end)
    v20 = fn42(profilePage, "Cancelar", 24, fn53)
    v12 = fn42(profilePage, "Eliminar perfil", 25, function()
      if not profiles.selected then return end
      if profiles.deleteName ~= profiles.selected or time() > profiles.deleteUntil then
        profiles.deleteName = profiles.selected
        profiles.deleteUntil = time() + 6
        v12.Text = "Confirmar eliminar " .. profiles.selected
        task.delay(6.1, function()
          if v12.Parent and time() > profiles.deleteUntil then
            profiles.deleteName = nil
            v12.Text = "Eliminar perfil"
          end
        end)
        return
      end
      local selected = profiles.selected
      local delete = profiles:Delete(selected)
      profiles.deleteName = nil
      profiles.selected = nil
      v12.Text = "Eliminar perfil"
      fn54()
      fn51(delete and ("Perfil eliminado: " .. selected) or "No se pudo eliminar el perfil.", delete)
    end)
    v7 = Instance.new("TextLabel")
    v7.Name = "ProfileStatus"
    v7.Size = UDim2.new(1, 0, 0, 42)
    v7.BackgroundColor3 = colors.surface2
    v7.BackgroundTransparency = 0.16
    v7.BorderSizePixel = 0
    v7.Text = profiles:Available() and "Guardá tus opciones y cargalas cuando quieras." or "Tu executor no permite perfiles locales."
    v7.TextColor3 = colors.textDim
    v7.TextStrokeColor3 = Color3.new(0, 0, 0)
    v7.TextStrokeTransparency = 0.45
    v7.Font = Enum.Font.FredokaOne
    v7.TextSize = 13
    v7.TextWrapped = true
    v7.AutoLocalize = false
    v7.LayoutOrder = 30
    v7.ZIndex = 2
    v7.Parent = profilePage
    Instance.new("UICorner", v7).CornerRadius = UDim.new(0, 6)
    fn52()
    fn53()
    fn54()
  end
  profilePage.ScrollingEnabled = false
  profilePage.AutomaticCanvasSize = Enum.AutomaticSize.None
  profilePage.CanvasSize = UDim2.new()
  for index, item in ipairs(profilePage:GetChildren()) do
    if item:IsA("GuiObject") then item:Destroy() end
  end
  local frame13 = Instance.new("Frame")
  frame13.Name = "Young0xProfileSurface"
  frame13.Size = UDim2.new(1, 0, 0, touchEnabled and 200 or 218)
  frame13.BackgroundTransparency = 1
  frame13.BorderSizePixel = 0
  frame13.LayoutOrder = 1
  frame13.ZIndex = 3
  frame13.Parent = profilePage
  frame13:SetAttribute("Young0x", by)
  local refreshProfiles
  local str = "normal"
  local tbl18 = { kind = nil, name = nil, untilTime = 0 }
  local tbl19, tbl20 = {}, {}

  local function fn49(name, arg, arg2, arg3, arg4, arg5, arg6)
    local result3 = fn42(frame13, arg, 1, arg6)
    result3.Name = name
    result3.Position = UDim2.new(arg2.Scale, arg2.Offset, 0, arg3)
    result3.Size = UDim2.new(arg4.Scale, arg4.Offset, 0, arg5)
    result3.Font = Enum.Font.GothamMedium
    result3.TextSize = touchEnabled and 11 or 13
    result3.ZIndex = 5
    local frame14 = result3:FindFirstChildWhichIsA("Frame")
    if frame14 then frame14.Visible = false end
    local uIStroke5 = result3:FindFirstChildWhichIsA("UIStroke")
    if uIStroke5 then uIStroke5.Color, uIStroke5.Transparency = colors.white, 0.52 end
    return result3
  end

  local function fn50(arg, visible)
    for index, item in ipairs(arg) do
      item.Visible = visible
    end
  end
  local num7 = 0

  local function fn51(arg, text)
    num7 += 1
    local num8, text2 = num7, arg.Text
    arg.Text = text
    task.delay(1.8, function()
      if arg.Parent and num7 == num8 then
        arg.Text = text2
        if refreshProfiles then refreshProfiles() end
      end
    end)
  end
  local frame14 = Instance.new("Frame")
  frame14.Name = "ProfileSelector"
  frame14.Size = UDim2.new(1, 0, 0, 42)
  frame14.BackgroundColor3, frame14.BackgroundTransparency = colors.surface2, 0.12
  frame14.BorderSizePixel, frame14.ZIndex, frame14.Parent = 0, 4, frame13
  Instance.new("UICorner", frame14).CornerRadius = UDim.new(0, 7)
  local uIStroke5 = Instance.new("UIStroke", frame14)
  uIStroke5.Color, uIStroke5.Transparency = colors.white, 0.52
  local textLabel6 = Instance.new("TextLabel")
  textLabel6.Name = "SelectedProfile"
  textLabel6.Size, textLabel6.Position = UDim2.new(1, -90, 1, 0), UDim2.fromOffset(45, 0)
  textLabel6.BackgroundTransparency = 1
  textLabel6.Text, textLabel6.TextColor3 = "", colors.white
  textLabel6.Font, textLabel6.TextSize = Enum.Font.GothamMedium, touchEnabled and 11 or 13
  textLabel6.TextTruncate, textLabel6.ZIndex, textLabel6.Parent = Enum.TextTruncate.AtEnd, 6, frame14
  local tbl21 = {}

  local function fn52(arg)
    if #tbl21 == 0 then return end
    local index = table.find(tbl21, profiles.selected) or 1
    profiles.selected = tbl21[((index - 1 + arg) % #tbl21) + 1]
    tbl18.kind = nil
    refreshProfiles()
  end
  local result3 = fn49("PreviousProfile", "‹", UDim.new(0, 4), 5, UDim.new(0, 36), 32, function()
    fn52(-1)
  end)
  local result4 = fn49("NextProfile", "›", UDim.new(1, -40), 5, UDim.new(0, 36), 32, function()
    fn52(1)
  end)
  result3.Parent, result4.Parent = frame14, frame14
  local v5
  v5 = fn49("LoadProfile", "Cargar perfil", UDim.new(), 47, UDim.new(1, 0), 42, function()
    if not profiles.selected then return end
    local load, extra3, extra4 = profiles:Load(profiles.selected)
    fn51(v5, load and (extra4 == "partial" and "Perfil cargado parcialmente" or "Perfil cargado") or "No se pudo cargar")
  end)
  local v6
  local v7
  local v8
  local v9
  local frame15 = Instance.new("Frame")
  frame15.Name = "ProfileNameEditor"
  frame15.Size = UDim2.new(1, 0, 0, 44)
  frame15.BackgroundColor3, frame15.BackgroundTransparency = colors.surface2, 0.12
  frame15.BorderSizePixel, frame15.ZIndex, frame15.Parent = 0, 4, frame13
  Instance.new("UICorner", frame15).CornerRadius = UDim.new(0, 7)
  local uIStroke6 = Instance.new("UIStroke", frame15)
  uIStroke6.Color, uIStroke6.Transparency = colors.white, 0.52
  local textBox = Instance.new("TextBox")
  textBox.Name = "ProfileName"
  textBox.Size, textBox.Position = UDim2.new(1, -20, 1, 0), UDim2.fromOffset(10, 0)
  textBox.BackgroundTransparency, textBox.ClearTextOnFocus = 1, false
  textBox.Text, textBox.PlaceholderText = "", "Nombre del perfil"
  textBox.TextColor3, textBox.PlaceholderColor3 = colors.white, colors.textDim
  textBox.TextStrokeTransparency = 1
  textBox.Font, textBox.TextSize = Enum.Font.GothamMedium, touchEnabled and 11 or 13
  textBox.TextXAlignment, textBox.ZIndex, textBox.Parent = Enum.TextXAlignment.Left, 6, frame15
  local v10
  v10 = fn49("SaveProfile", "Guardar", UDim.new(), 50, UDim.new(0.5, -3), 42, function()
    local v11, selected, v12, v13
    local flag6 = str == "rename"
    if str == "rename" then
      v11, selected, v12, v13 = profiles:Rename(profiles.selected, textBox.Text)
    else
      v11, selected, v12, v13 = profiles:Write(textBox.Text, false)
    end
    if v11 then
      profiles.selected, textBox.Text, str = selected, "", "normal"
      refreshProfiles()
      fn51(v5, flag6 and "Perfil renombrado" or "Perfil guardado")
    elseif v12 == "duplicate" then
      fn51(v10, "Ese nombre ya existe")
    elseif v12 == "empty" then
      fn51(v10, "Escribí un nombre")
    else
      fn51(v10, "No se pudo guardar")
    end
  end)
  local result5 = fn49("CancelProfile", "Cancelar", UDim.new(0.5, 3), 50, UDim.new(0.5, -3), 42, function()
    textBox.Text, str = "", "normal"
    refreshProfiles()
  end)
  tbl20 = { frame15, v10, result5 }

  local function fn53(arg)
    if not profiles:Available() then
      fn51(v6, "Perfiles no disponibles")
      return
    end
    str = arg
    textBox.Text = arg == "rename" and tostring(profiles.selected or "") or ""
    refreshProfiles()
    textBox:CaptureFocus()
  end
  v6 = fn49("CreateProfile", "Crear perfil", UDim.new(), 94, UDim.new(0.5, -3), 40, function()
    fn53("create")
  end)
  v7 = fn49("UpdateProfile", "Actualizar perfil", UDim.new(0.5, 3), 94, UDim.new(0.5, -3), 40, function()
    if not profiles.selected then return end
    if tbl18.kind ~= "update" or tbl18.name ~= profiles.selected or time() > tbl18.untilTime then
      tbl18 = { kind = "update", name = profiles.selected, untilTime = time() + 4 }
      fn51(v7, "Tocá otra vez para actualizar")
      return
    end
    tbl18.kind = nil
    local write = profiles:Write(profiles.selected, true)
    refreshProfiles()
    fn51(v7, write and "Perfil actualizado" or "No se pudo actualizar")
  end)
  v8 = fn49("RenameProfile", "Renombrar perfil", UDim.new(), 139, UDim.new(0.5, -3), 40, function()
    if profiles.selected then fn53("rename") end
  end)
  v9 = fn49("DeleteProfile", "Eliminar perfil", UDim.new(0.5, 3), 139, UDim.new(0.5, -3), 40, function()
    if not profiles.selected then return end
    if tbl18.kind ~= "delete" or tbl18.name ~= profiles.selected or time() > tbl18.untilTime then
      tbl18 = { kind = "delete", name = profiles.selected, untilTime = time() + 4 }
      fn51(v9, "Tocá otra vez para eliminar")
      return
    end
    local selected = profiles.selected
    tbl18.kind = nil
    local delete = profiles:Delete(selected)
    profiles.selected = nil
    refreshProfiles()
    fn51(v6, delete and "Perfil eliminado" or "No se pudo eliminar")
  end)
  tbl19 = { frame14, v5, v6, v7, v8, v9 }
  refreshProfiles = function()
    tbl21 = profiles:List()
    if not table.find(tbl21, profiles.selected) then profiles.selected = tbl21[1] end
    fn50(tbl20, str ~= "normal")
    fn50(tbl19, str == "normal")
    if str ~= "normal" then return end
    local active = #tbl21 > 0
    frame14.Visible, v5.Visible = active, active
    v7.Visible, v8.Visible, v9.Visible = active, active, active
    textLabel6.Text = profiles.selected or ""
    v6.Position = active and UDim2.new(0, 0, 0, 94) or UDim2.new(0, 0, 0, 0)
    v6.Size = active and UDim2.new(0.5, -3, 0, 40) or UDim2.new(1, 0, 0, 46)
    v6.Text = active and "Crear perfil" or "Crear perfil"
    result3.Active, result4.Active = active, active
  end
  bRG2.refreshProfiles = refreshProfiles
  refreshProfiles()
  if bRG2.resumeRequested then
    local result6 = bRG2.readResumeOptions()
    if result6 then
      task.spawn(function()
        for i = 1, 12 do
          if getgenv().BRG ~= bRG2 or not parent or not parent.Parent then return end
          if bRG2.applyOptions(result6) then break end
          task.wait(1)
        end
        bRG2.saveResumeState()
      end)
    end
  end
  task.spawn(function()
    while getgenv().BRG == bRG2 and parent and parent.Parent do
      if bRG2.antiAfk then bRG2.saveResumeState() end
      task.wait(1)
    end
  end)
end)()
do
  local function fn48(arg)
    local flag6 = false
    pcall(function()
      if setclipboard then
        setclipboard(arg)
        flag6 = true
      end
    end)
    return flag6
  end
  local result3 = fn40(tbl17.Settings, "— INFO —", 30)
  result3.Visible = false
  result3.Size = UDim2.new()
  local frame13 = Instance.new("Frame")
  frame13.Name = "YoungCredits"
  frame13.Size = UDim2.new(1, 0, 0, 214)
  frame13.BackgroundColor3 = colors.surface2
  frame13.BackgroundTransparency = 0.16
  frame13.BorderSizePixel = 0
  frame13.LayoutOrder = 31
  frame13.ZIndex = 2
  frame13.Parent = tbl17.Settings
  frame13.Visible = false
  frame13.Size = UDim2.new()
  Instance.new("UICorner", frame13).CornerRadius = UDim.new(0, 7)
  local uIStroke5 = Instance.new("UIStroke", frame13)
  uIStroke5.Color = colors.blue
  uIStroke5.Thickness = 1.4
  uIStroke5.Transparency = 0.08

  local function fn49(text, arg, arg2, textSize, arg3)
    local textLabel6 = Instance.new("TextLabel")
    textLabel6.Size = UDim2.new(1, -14, 0, arg2)
    textLabel6.Position = UDim2.new(0, 7, 0, arg)
    textLabel6.BackgroundTransparency = 1
    textLabel6.Text = text
    textLabel6.TextColor3 = arg3 or colors.white
    textLabel6.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
    textLabel6.TextStrokeTransparency = 0
    textLabel6.Font = Enum.Font.FredokaOne
    textLabel6.TextSize = textSize
    textLabel6.TextWrapped = true
    textLabel6.TextXAlignment = Enum.TextXAlignment.Center
    textLabel6.TextYAlignment = Enum.TextYAlignment.Center
    textLabel6.ZIndex = 3
    textLabel6.Parent = frame13
    return textLabel6
  end

  local function fn50(parent4, image, arg, arg2, imageColor3, text)
    if text then
      local textLabel6 = Instance.new("TextLabel")
      textLabel6.Size = UDim2.fromOffset(arg2, arg2)
      textLabel6.Position = UDim2.new(arg, -(arg2 / 2), 0.5, -(arg2 / 2))
      textLabel6.BackgroundColor3 = imageColor3
      textLabel6.BorderSizePixel = 0
      textLabel6.Text = text
      textLabel6.TextColor3 = Color3.fromRGB(0, 0, 0)
      textLabel6.TextStrokeColor3 = Color3.fromRGB(255, 255, 255)
      textLabel6.TextStrokeTransparency = 0.5
      textLabel6.Font = Enum.Font.FredokaOne
      textLabel6.TextSize = math.floor(arg2 * 0.62)
      textLabel6.ZIndex = parent4.ZIndex + 1
      textLabel6.Parent = parent4
      Instance.new("UICorner", textLabel6).CornerRadius = UDim.new(0, 6)
    end
    local imageLabel = Instance.new("ImageLabel")
    imageLabel.Size = UDim2.fromOffset(arg2 + 10, arg2 + 10)
    imageLabel.Position = UDim2.new(arg, -((arg2 + 10) / 2), 0.5, -((arg2 + 10) / 2))
    imageLabel.BackgroundTransparency = 1
    imageLabel.Image = image
    imageLabel.ImageColor3 = imageColor3
    imageLabel.ImageTransparency = 0.68
    imageLabel.ZIndex = parent4.ZIndex + 2
    imageLabel.Parent = parent4
    local imageLabel2 = Instance.new("ImageLabel")
    imageLabel2.Size = UDim2.fromOffset(arg2, arg2)
    imageLabel2.Position = UDim2.new(arg, -(arg2 / 2), 0.5, -(arg2 / 2))
    imageLabel2.BackgroundTransparency = 1
    imageLabel2.Image = image
    imageLabel2.ImageColor3 = imageColor3
    imageLabel2.ZIndex = parent4.ZIndex + 3
    imageLabel2.Parent = parent4
    return imageLabel2
  end
  fn49(" ✦ Young0x Hub - Muscle Legends ✦", 7, 28, touchEnabled and 13 or 14, colors.white)
  fn49("PUBLIC TRAINING", 35, 24, touchEnabled and 14 or 15, colors.cyan)
  local textButton2 = Instance.new("TextButton")
  textButton2.Name = "YoutubeButton"
  textButton2.Size = UDim2.new(1, -22, 0, 38)
  textButton2.Position = UDim2.new(0, 11, 0, 66)
  textButton2.BackgroundColor3 = colors.surface2
  textButton2.BackgroundTransparency = 0.16
  textButton2.AutoButtonColor = false
  textButton2.Text = "YouTube"
  textButton2.TextColor3 = colors.white
  textButton2.TextStrokeTransparency = 1
  textButton2.Font = Enum.Font.FredokaOne
  textButton2.TextSize = 12
  textButton2.TextXAlignment = Enum.TextXAlignment.Center
  textButton2.AutoLocalize = false
  textButton2.ZIndex = 3
  textButton2.Parent = frame13
  Instance.new("UICorner", textButton2).CornerRadius = UDim.new(0, 11)
  do
    local frame14 = Instance.new("Frame")
    frame14.Name = "TopSheen"
    frame14.Size = UDim2.new(1, -20, 0, 1)
    frame14.Position = UDim2.fromOffset(10, 0)
    frame14.BackgroundColor3 = colors.white
    frame14.BackgroundTransparency = 0.92
    frame14.BorderSizePixel = 0
    frame14.ZIndex = textButton2.ZIndex + 1
    frame14.Parent = textButton2
    Instance.new("UICorner", frame14).CornerRadius = UDim.new(1, 0)
    local uIGradient4 = Instance.new("UIGradient", frame14)
    uIGradient4.Transparency = NumberSequence.new({
      NumberSequenceKeypoint.new(0, 1),
      NumberSequenceKeypoint.new(0.5, 0),
      NumberSequenceKeypoint.new(1, 1),
    })
  end
  local uIStroke6 = Instance.new("UIStroke", textButton2)
  uIStroke6.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
  uIStroke6.Color = colors.blue
  uIStroke6.Thickness = 1
  uIStroke6.Transparency = 0.16
  fn(textButton2.MouseEnter:Connect(function()
    tweenService:Create(textButton2, TweenInfo.new(0.1), { BackgroundColor3 = Color3.fromRGB(35, 35, 35) }):Play()
    tweenService:Create(uIStroke6, TweenInfo.new(0.1), { Transparency = 0.03, Color = colors.white }):Play()
  end))
  fn(textButton2.MouseLeave:Connect(function()
    tweenService:Create(textButton2, TweenInfo.new(0.1), { BackgroundColor3 = colors.surface2 }):Play()
    tweenService:Create(uIStroke6, TweenInfo.new(0.1), { Transparency = 0.16, Color = colors.blue }):Play()
  end))
  fn(textButton2.MouseButton1Click:Connect(function()
    local text = textButton2.Text
    textButton2.Text = fn48(tbl.Texts.youtubeUrl) and "Link copiado" or text
    task.delay(1.1, function()
      if textButton2 and textButton2.Parent then textButton2.Text = text end
    end)
  end))
  local textButton3 = Instance.new("TextButton")
  textButton3.Name = "DiscordButton"
  textButton3.Size = UDim2.new(1, -22, 0, 38)
  textButton3.Position = UDim2.new(0, 11, 0, 110)
  textButton3.BackgroundColor3 = colors.surface2
  textButton3.BackgroundTransparency = 0.16
  textButton3.AutoButtonColor = false
  textButton3.Text = "Discord"
  textButton3.TextColor3 = colors.white
  textButton3.TextStrokeTransparency = 1
  textButton3.Font = Enum.Font.FredokaOne
  textButton3.TextSize = 12
  textButton3.TextXAlignment = Enum.TextXAlignment.Center
  textButton3.AutoLocalize = false
  textButton3.ZIndex = 3
  textButton3.Parent = frame13
  Instance.new("UICorner", textButton3).CornerRadius = UDim.new(0, 11)
  do
    local frame14 = Instance.new("Frame")
    frame14.Name = "TopSheen"
    frame14.Size = UDim2.new(1, -20, 0, 1)
    frame14.Position = UDim2.fromOffset(10, 0)
    frame14.BackgroundColor3 = colors.white
    frame14.BackgroundTransparency = 0.92
    frame14.BorderSizePixel = 0
    frame14.ZIndex = textButton3.ZIndex + 1
    frame14.Parent = textButton3
    Instance.new("UICorner", frame14).CornerRadius = UDim.new(1, 0)
    local uIGradient4 = Instance.new("UIGradient", frame14)
    uIGradient4.Transparency = NumberSequence.new({
      NumberSequenceKeypoint.new(0, 1),
      NumberSequenceKeypoint.new(0.5, 0),
      NumberSequenceKeypoint.new(1, 1),
    })
  end
  local uIStroke7 = Instance.new("UIStroke", textButton3)
  uIStroke7.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
  uIStroke7.Color = colors.blue
  uIStroke7.Thickness = 1
  uIStroke7.Transparency = 0.16
  fn(textButton3.MouseEnter:Connect(function()
    tweenService:Create(textButton3, TweenInfo.new(0.1), { BackgroundColor3 = Color3.fromRGB(35, 35, 35) }):Play()
    tweenService:Create(uIStroke7, TweenInfo.new(0.1), { Transparency = 0.03, Color = colors.white }):Play()
  end))
  fn(textButton3.MouseLeave:Connect(function()
    tweenService:Create(textButton3, TweenInfo.new(0.1), { BackgroundColor3 = colors.surface2 }):Play()
    tweenService:Create(uIStroke7, TweenInfo.new(0.1), { Transparency = 0.16, Color = colors.blue }):Play()
  end))
  fn(textButton3.MouseButton1Click:Connect(function()
    local text = textButton3.Text
    textButton3.Text = fn48(tbl.Texts.discordInvite) and "Link copiado" or text
    task.delay(1.1, function()
      if textButton3 and textButton3.Parent then textButton3.Text = text end
    end)
  end))
  fn49("Script de Young para todos ustedes", 151, 30, touchEnabled and 13 or 14, colors.white)
  fn49("Dios te ama", 181, 24, touchEnabled and 14 or 15, Color3.fromRGB(255, 255, 255))
  frame13:Destroy()
  result3:Destroy()
end
do
  local result3 = fn40(tbl17.Settings, "IDIOMA", 23)
  result3:Destroy()
  local tbl18 = {
    {
      name = "Español",
      prefix = "Idioma",
      tabs = {
        Inicio = "Inicio",
        Entrenar = "Entrenar",
        ["Full Train"] = "Full Train",
        Rocks = "Rocks",
        Rebirths = "Rebirths",
        ["Estadísticas"] = "Estadísticas",
        ["Pet Shop"] = "Pet Shop",
        Kills = "Kills",
        Boss = "Boss",
        Recompensas = "Recompensas",
        Ruleta = "Ruleta",
        Regalos = "Regalos",
        Perfiles = "Perfiles",
        Rendimiento = "Rendimiento",
        Ajustes = "Ajustes",
      },
      texts = {},
    },
    {
      name = "Português",
      prefix = "Idioma",
      tabs = {
        Inicio = "Início",
        Entrenar = "Treino",
        ["Full Train"] = "Treino completo",
        Rocks = "Rochas",
        Rebirths = "Renasc.",
        ["Estadísticas"] = "Estatísticas",
        ["Pet Shop"] = "Pet Shop",
        Kills = "Abates",
        Boss = "Chefe",
        Recompensas = "Prêmios",
        Ruleta = "Roleta",
        Regalos = "Presentes",
        Perfiles = "Perfis",
        Rendimiento = "Desempenho",
        Ajustes = "Ajustes",
      },
      texts = {
        ["ESTADO ACTUAL"] = "STATUS ATUAL",
        FUERZA = "FORÇA",
        DURABILIDAD = "DURABILIDADE",
        ["ENTRENAMIENTO BÁSICO"] = "TREINO BÁSICO",
        ["Auto Weight"] = "Auto Peso",
        ["Auto Handstands"] = "Auto Parada de mão",
        ["Auto Pushups"] = "Auto Flexões",
        ["Auto Situps"] = "Auto Abdominais",
        ["Auto King"] = "Auto Rei",
        ["Lock Position"] = "Travar posição",
        ["PRÓXIMO REBIRTH"] = "PRÓXIMO RENASCIMENTO",
        ["Auto Rebirths"] = "Auto Renascimentos",
        ["SELECCIONÁ UNA ROCA"] = "ESCOLHA UMA ROCHA",
        ["Comprar pet seleccionado"] = "Comprar pet selecionado",
        ["Compra automática de pets"] = "Compra automática de pets",
        ["Comprar aura seleccionada"] = "Comprar aura selecionada",
        ["Compra automática de auras"] = "Compra automática de auras",
        ["Server Hop inteligente"] = "Server Hop inteligente",
        ["No matar a mis amigos"] = "Não matar meus amigos",
        ["Elegir jugador"] = "Escolher jogador",
        ["Matar jugador seleccionado"] = "Matar jogador selecionado",
        RECOMPENSAS = "PRÊMIOS",
        ["Reclamar TODO"] = "Coletar TUDO",
        ["Consumir TODO"] = "Consumir TUDO",
        ["GIROS DISPONIBLES"] = "GIROS DISPONÍVEIS",
        GIFTS = "PRESENTES",
        MOVIMIENTO = "MOVIMENTO",
        RENDIMIENTO = "DESEMPENHO",
        ["Activar Anti Lag"] = "Ativar Anti Lag",
        ["ANTI AFK"] = "ANTI-AFK",
        ["Activar Anti AFK"] = "Ativar Anti-AFK",
        INFO = "INFO",
        IDIOMA = "IDIOMA",
        ["Cerrar el script"] = "Fechar script",
      },
    },
    {
      name = "English",
      prefix = "Language",
      tabs = {
        Inicio = "Home",
        Entrenar = "Training",
        ["Full Train"] = "Full Train",
        Rocks = "Rocks",
        Rebirths = "Rebirths",
        ["Estadísticas"] = "Stats",
        ["Pet Shop"] = "Pet Shop",
        Kills = "Kills",
        Boss = "Boss",
        Recompensas = "Rewards",
        Ruleta = "Wheel",
        Regalos = "Gifts",
        Perfiles = "Profiles",
        Rendimiento = "Performance",
        Ajustes = "Settings",
      },
      texts = {
        ["ESTADO ACTUAL"] = "CURRENT STATUS",
        FUERZA = "STRENGTH",
        DURABILIDAD = "DURABILITY",
        ["ENTRENAMIENTO BÁSICO"] = "BASIC TRAINING",
        ["Auto Egg · 30 min"] = "Auto Egg · 30 min",
        ["Auto King"] = "Auto King",
        ["Lock Position"] = "Lock Position",
        ["PRÓXIMO REBIRTH"] = "NEXT REBIRTH",
        ["SELECCIONÁ UNA ROCA"] = "SELECT A ROCK",
        ["Comprar pet seleccionado"] = "Buy selected pet",
        ["Compra automática de pets"] = "Auto-buy pets",
        ["Comprar aura seleccionada"] = "Buy selected aura",
        ["Compra automática de auras"] = "Auto-buy auras",
        ["Server Hop inteligente"] = "Smart Server Hop",
        ["No matar a mis amigos"] = "Protect my friends",
        ["Elegir jugador"] = "Select player",
        ["Matar jugador seleccionado"] = "Kill selected player",
        RECOMPENSAS = "REWARDS",
        ["Reclamar TODO"] = "Claim ALL",
        ["Consumir TODO"] = "Consume ALL",
        ["GIROS DISPONIBLES"] = "AVAILABLE SPINS",
        GIFTS = "GIFTS",
        MOVIMIENTO = "MOVEMENT",
        RENDIMIENTO = "PERFORMANCE",
        ["Activar Anti Lag"] = "Enable Anti Lag",
        ["ANTI AFK"] = "ANTI-AFK",
        ["Activar Anti AFK"] = "Enable Anti-AFK",
        INFO = "INFO",
        IDIOMA = "LANGUAGE",
        ["Cerrar el script"] = "Close script",
      },
    },
    {
      name = "العربية",
      prefix = "اللغة",
      tabs = {
        Inicio = "الرئيسية",
        Entrenar = "تدريب",
        ["Full Train"] = "تدريب كامل",
        Rocks = "الصخور",
        Rebirths = "الولادات",
        ["Estadísticas"] = "الإحصائيات",
        ["Pet Shop"] = "المتجر",
        Kills = "القتل",
        Boss = "الزعيم",
        Recompensas = "المكافآت",
        Ruleta = "العجلة",
        Regalos = "الهدايا",
        Perfiles = "الملفات",
        Rendimiento = "الأداء",
        Ajustes = "الإعدادات",
      },
      texts = {
        ["ESTADO ACTUAL"] = "الحالة الحالية",
        FUERZA = "القوة",
        DURABILIDAD = "التحمل",
        ["ENTRENAMIENTO BÁSICO"] = "التدريب الأساسي",
        ["Auto Weight"] = "أوزان تلقائية",
        ["Auto Handstands"] = "وقوف تلقائي",
        ["Auto Pushups"] = "ضغط تلقائي",
        ["Auto Situps"] = "بطن تلقائي",
        ["Auto King"] = "ملك تلقائي",
        ["Lock Position"] = "تثبيت الموقع",
        ["PRÓXIMO REBIRTH"] = "الولادة التالية",
        ["Auto Rebirths"] = "ولادة تلقائية",
        ["SELECCIONÁ UNA ROCA"] = "اختر صخرة",
        ["Comprar pet seleccionado"] = "شراء الحيوان المحدد",
        ["Compra automática de pets"] = "شراء الحيوانات تلقائياً",
        ["Comprar aura seleccionada"] = "شراء الهالة المحددة",
        ["Compra automática de auras"] = "شراء الهالات تلقائياً",
        ["Server Hop inteligente"] = "تنقل ذكي",
        ["No matar a mis amigos"] = "حماية الأصدقاء",
        ["Elegir jugador"] = "اختر لاعباً",
        ["Matar jugador seleccionado"] = "قتل اللاعب المحدد",
        RECOMPENSAS = "المكافآت",
        ["Reclamar TODO"] = "استلام الكل",
        ["Consumir TODO"] = "استخدام الكل",
        ["GIROS DISPONIBLES"] = "الدورات المتاحة",
        GIFTS = "الهدايا",
        MOVIMIENTO = "الحركة",
        RENDIMIENTO = "الأداء",
        ["Activar Anti Lag"] = "تفعيل تقليل التأخير",
        ["ANTI AFK"] = "منع الخمول",
        ["Activar Anti AFK"] = "تفعيل منع الخمول",
        INFO = "معلومات",
        IDIOMA = "اللغة",
        ["Cerrar el script"] = "إغلاق السكربت",
      },
    },
  }
  tbl18 = { tbl18[1], tbl18[3], tbl18[2], tbl18[4] }
  tbl18[2].name = "Inglés"
  tbl18[3].name = "Portugués"
  local tbl19 = {
    [2] = {
      ["KEY RESTANTE"] = "KEY REMAINING",
      Consumibles = "Consumables",
      ["Por reclamar"] = "Unclaimed",
      ["Reclamar todo"] = "Claim all",
      Fuerza = "Strength",
      Durabilidad = "Durability",
      Agilidad = "Agility",
      Gemas = "Gems",
      Cristales = "Crystals",
      Giros = "Spins",
      ["Juego:"] = "Game:",
      ["Autor:"] = "Author:",
      ["Edad de la cuenta:"] = "Account age:",
      ["Días en total:"] = "Total days:",
      ["Servidor:"] = "Server:",
      ["Versión del juego:"] = "Game version:",
      ["Canjeando..."] = "Redeeming...",
      ["MIS PERFILES"] = "MY PROFILES",
      GUARDAR = "SAVE",
      ADMINISTRAR = "MANAGE",
      Deteniendo = "Stopping",
      ["Objetivo alcanzado"] = "Target reached",
      ["PRÓXIMO BOSS"] = "NEXT BOSS",
      ["VIDA DEL BOSS"] = "BOSS HEALTH",
      COMPRAR = "BUY",
      ["Auto comprar"] = "Auto buy",
      ["Calculando fuerza/min"] = "Calculating strength/min",
      ["La key expira en:"] = "Key expires in:",
      ["No hay recompensas para reclamar"] = "No rewards to claim",
      ["Reclamar cofres"] = "Claim chests",
      ["Auto Egg · 30 min"] = "Auto Egg · 30 min",
      ["Ocultar frames"] = "Hide pop-ups",
      ["Ocultar mis pets"] = "Hide my pets",
      ["Ocultar otras pets"] = "Hide other pets",
      ["Ir a Entrenar   ›"] = "Go to Training   ›",
      ["Fast Rep"] = "Fast Rep",
      ["Auto Rebirth"] = "Auto Rebirth",
      Objetivo = "Target",
      ["Escribí un número"] = "Enter a number",
      ["Ejemplo: 18,980"] = "Example: 18,980",
      ["Renacer hasta el objetivo"] = "Rebirth until target",
      Calculando = "Calculating",
      ["Calculando..."] = "Calculating...",
      restantes = "remaining",
      ["Fast Punch"] = "Fast Punch",
      ["Activa Fast Punch primero"] = "Enable Fast Punch first",
      ["— SELECCIONÁ UNA ROCA —"] = "— SELECT A ROCK —",
      ["SELECCIONÁ UNA ROCA"] = "SELECT A ROCK",
      ["Auto comprar pets"] = "Auto-buy pets",
      ["Auto evolucionar pets"] = "Auto-evolve pets",
      ["Auto comprar auras"] = "Auto-buy auras",
      ["Comprar Pet"] = "Buy Pet",
      ["Comprar "] = "Buy ",
      ["Compra de pet enviada"] = "Pet purchase sent",
      ["Compra de aura enviada"] = "Aura purchase sent",
      ["No se pudo comprar"] = "Purchase failed",
      ["Conectando Pet Shop..."] = "Connecting Pet Shop...",
      ["Se conecta al abrir esta pestaña"] = "Connects when this tab opens",
      ["Pet Shop conectado"] = "Pet Shop connected",
      ["Auto Kill"] = "Auto Kill",
      ["Auto Win Brawl"] = "Auto Win Brawl",
      ["No matar a mis amigos"] = "Do not kill my friends",
      ["Elegir jugador"] = "Select player",
      ["Elegí un jugador"] = "Choose a player",
      ["Seleccioná un jugador del servidor."] = "Select a player from the server.",
      ["Matar jugador seleccionado"] = "Kill selected player",
      ["No hay otros jugadores"] = "No other players",
      ["Conectando módulo..."] = "Connecting module...",
      ["No se pudo conectar"] = "Connection failed",
      Listo = "Ready",
      ["Auto Boss"] = "Auto Boss",
      ["Sin boss activo"] = "No active boss",
      VIDA = "HEALTH",
      CONSUMIBLES = "CONSUMABLES",
      ["RECOMPENSAS POR RECLAMAR"] = "UNCLAIMED REWARDS",
      ["Reclamar TODO"] = "Claim ALL",
      ["Reclamando..."] = "Claiming...",
      ["Consumir TODO"] = "Consume ALL",
      ["Reclamar cofres del mapa"] = "Claim map chests",
      GIROS = "SPINS",
      ["Girar ruleta"] = "Spin wheel",
      ["Girar automáticamente"] = "Auto spin",
      ["Esperando giro..."] = "Waiting for spin...",
      ["Girando..."] = "Spinning...",
      ["Sin giros disponibles"] = "No spins available",
      ["No tienes giros disponibles"] = "No spins available",
      ["Premio obtenido"] = "Reward obtained",
      ["Protein Eggs"] = "Protein Eggs",
      ["Tropical Shakes"] = "Tropical Shakes",
      ["Elegí un jugador"] = "Choose a player",
      Cantidad = "Amount",
      ["Cantidad de eggs"] = "Egg amount",
      ["Cantidad de shakes"] = "Shake amount",
      Regalar = "Gift",
      ["Nombre del perfil"] = "Profile name",
      ["Crear perfil"] = "Create profile",
      ["Cargar perfil"] = "Load profile",
      ["Actualizar perfil"] = "Update profile",
      ["Eliminar perfil"] = "Delete profile",
      ["Renombrar perfil"] = "Rename profile",
      ["No tenés perfiles"] = "You have no profiles",
      ["Guardá tus opciones y cargalas cuando quieras."] = "Save your options and load them whenever you want.",
      ["Tu executor no permite perfiles locales."] = "Your executor does not support local profiles.",
      Guardar = "Save",
      Cancelar = "Cancel",
      Confirmar = "Confirm",
      ["Quitar efectos"] = "Remove effects",
      ["Quitar sombras"] = "Remove shadows",
      ["Quitar texturas"] = "Remove textures",
      ["Quitar luces"] = "Remove lights",
      ["Máximo rendimiento"] = "Maximum performance",
      ["Estrellas para AFK"] = "AFK stars",
      ["Cerrar el script"] = "Close script",
      ["¿Estás seguro de que querés cerrar el script?"] = "Are you sure you want to close the script?",
      ["Copiar link"] = "Copy link",
      ["Link copiado"] = "Link copied",
      Copiado = "Copied",
      ["Script de Young para todos ustedes"] = "Young's script for all of you",
      ["Dios te ama"] = "God loves you",
      Activo = "Active",
      Abierto = "Open",
      Cargando = "Loading",
      ["Cargando..."] = "Loading...",
      ["Anti-Crash"] = "Anti-Crash",
      ["FPS Unlock"] = "FPS Unlock",
      ["MS Reducer"] = "MS Reducer",
      ["Botón de emergencia"] = "Emergency button",
      ["TODO APAGADO"] = "EVERYTHING STOPPED",
      ["Presioná una tecla..."] = "Press a key...",
    },
    [3] = {
      ["KEY RESTANTE"] = "KEY RESTANTE",
      Consumibles = "Consumíveis",
      ["Por reclamar"] = "A coletar",
      ["Reclamar todo"] = "Coletar tudo",
      Fuerza = "Força",
      Durabilidad = "Durabilidade",
      Agilidad = "Agilidade",
      Gemas = "Gemas",
      Cristales = "Cristais",
      Giros = "Giros",
      Rebirths = "Renascimentos",
      Kills = "Abates",
      Brawls = "Brigas",
      ["Juego:"] = "Jogo:",
      ["Autor:"] = "Autor:",
      ["Edad de la cuenta:"] = "Idade da conta:",
      ["Días en total:"] = "Dias no total:",
      ["Servidor:"] = "Servidor:",
      ["Versión del juego:"] = "Versão do jogo:",
      ["Canjeando..."] = "Resgatando...",
      ["MIS PERFILES"] = "MEUS PERFIS",
      GUARDAR = "SALVAR",
      ADMINISTRAR = "GERENCIAR",
      Deteniendo = "Parando",
      ["Auto Strength"] = "Força automática",
      ["Auto Handstands"] = "Parada de mãos automática",
      ["Auto Pushups"] = "Flexões automáticas",
      ["Auto Situps"] = "Abdominais automáticos",
      ["Auto Kill"] = "Abate automático",
      ["Evil Karma"] = "Karma maligno",
      ["Good Karma"] = "Karma bom",
      ["Auto Win Brawl"] = "Vencer briga automaticamente",
      ["Objetivo alcanzado"] = "Objetivo alcançado",
      ["PRÓXIMO BOSS"] = "PRÓXIMO CHEFE",
      ["VIDA DEL BOSS"] = "VIDA DO CHEFE",
      COMPRAR = "COMPRAR",
      ["Auto comprar"] = "Compra automática",
      ["Calculando fuerza/min"] = "Calculando força/min",
      ["La key expira en:"] = "A chave expira em:",
      ["No hay recompensas para reclamar"] = "Não há recompensas para coletar",
      ["Reclamar cofres"] = "Coletar baús",
      ["Auto Egg · 30 min"] = "Ovo automático · 30 min",
      ["Ocultar frames"] = "Ocultar pop-ups",
      ["Ocultar mis pets"] = "Ocultar meus pets",
      ["Ocultar otras pets"] = "Ocultar outros pets",
      ["Ir a Entrenar   ›"] = "Ir para Treino   ›",
      ["Fast Rep"] = "Rep rápida",
      ["Auto Rebirth"] = "Renascimento automático",
      Objetivo = "Objetivo",
      ["Escribí un número"] = "Digite um número",
      ["Ejemplo: 18,980"] = "Exemplo: 18.980",
      ["Renacer hasta el objetivo"] = "Renascer até o objetivo",
      Calculando = "Calculando",
      ["Calculando..."] = "Calculando...",
      restantes = "restantes",
      ["Fast Punch"] = "Soco rápido",
      ["Activa Fast Punch primero"] = "Ative Soco rápido primeiro",
      ["— SELECCIONÁ UNA ROCA —"] = "— ESCOLHA UMA ROCHA —",
      ["Auto comprar pets"] = "Comprar pets automaticamente",
      ["Auto evolucionar pets"] = "Evoluir pets automaticamente",
      ["Auto comprar auras"] = "Comprar auras automaticamente",
      ["Comprar Pet"] = "Comprar pet",
      ["Compra de pet enviada"] = "Compra de pet enviada",
      ["Compra de aura enviada"] = "Compra de aura enviada",
      ["No se pudo comprar"] = "Não foi possível comprar",
      ["Conectando Pet Shop..."] = "Conectando Pet Shop...",
      ["Se conecta al abrir esta pestaña"] = "Conecta ao abrir esta aba",
      ["Pet Shop conectado"] = "Pet Shop conectado",
      ["No matar a mis amigos"] = "Não matar meus amigos",
      ["Elegir jugador"] = "Escolher jogador",
      ["Elegí un jugador"] = "Escolha um jogador",
      ["Seleccioná un jugador del servidor."] = "Escolha um jogador do servidor.",
      ["Matar jugador seleccionado"] = "Matar jogador selecionado",
      ["No hay otros jugadores"] = "Não há outros jogadores",
      ["Conectando módulo..."] = "Conectando módulo...",
      ["No se pudo conectar"] = "Falha na conexão",
      Listo = "Pronto",
      ["Auto Boss"] = "Chefe automático",
      ["Sin boss activo"] = "Nenhum chefe ativo",
      VIDA = "VIDA",
      CONSUMIBLES = "CONSUMÍVEIS",
      ["RECOMPENSAS POR RECLAMAR"] = "RECOMPENSAS A COLETAR",
      ["Reclamar TODO"] = "Coletar TUDO",
      ["Reclamando..."] = "Coletando...",
      ["Consumir TODO"] = "Consumir TUDO",
      ["Reclamar cofres del mapa"] = "Coletar baús do mapa",
      GIROS = "GIROS",
      ["Girar ruleta"] = "Girar roleta",
      ["Girar automáticamente"] = "Girar automaticamente",
      ["Esperando giro..."] = "Aguardando giro...",
      ["Girando..."] = "Girando...",
      ["Sin giros disponibles"] = "Sem giros disponíveis",
      ["No tienes giros disponibles"] = "Sem giros disponíveis",
      ["Premio obtenido"] = "Prêmio obtido",
      Cantidad = "Quantidade",
      ["Cantidad de eggs"] = "Quantidade de ovos",
      ["Cantidad de shakes"] = "Quantidade de shakes",
      Regalar = "Presentear",
      ["Nombre del perfil"] = "Nome do perfil",
      ["Crear perfil"] = "Criar perfil",
      ["Cargar perfil"] = "Carregar perfil",
      ["Actualizar perfil"] = "Atualizar perfil",
      ["Eliminar perfil"] = "Excluir perfil",
      ["Renombrar perfil"] = "Renomear perfil",
      ["No tenés perfiles"] = "Você não tem perfis",
      ["Guardá tus opciones y cargalas cuando quieras."] = "Salve suas opções e carregue quando quiser.",
      ["Tu executor no permite perfiles locales."] = "Seu executor não permite perfis locais.",
      Guardar = "Salvar",
      Cancelar = "Cancelar",
      Confirmar = "Confirmar",
      ["Quitar efectos"] = "Remover efeitos",
      ["Quitar sombras"] = "Remover sombras",
      ["Quitar texturas"] = "Remover texturas",
      ["Quitar luces"] = "Remover luzes",
      ["Máximo rendimiento"] = "Desempenho máximo",
      ["Estrellas para AFK"] = "Estrelas para AFK",
      ["Cerrar el script"] = "Fechar script",
      ["¿Estás seguro de que querés cerrar el script?"] = "Tem certeza de que deseja fechar o script?",
      ["Copiar link"] = "Copiar link",
      ["Link copiado"] = "Link copiado",
      Copiado = "Copiado",
      ["Dios te ama"] = "Deus te ama",
      Activo = "Ativo",
      Abierto = "Aberto",
      ["Anti-Crash"] = "Anti-Crash",
      ["FPS Unlock"] = "Desbloquear FPS",
      ["MS Reducer"] = "Redutor de MS",
      ["Botón de emergencia"] = "Botão de emergência",
      ["TODO APAGADO"] = "TUDO DESLIGADO",
      ["Presioná una tecla..."] = "Pressione uma tecla...",
    },
    [4] = {
      ["KEY RESTANTE"] = "المفتاح المتبقي",
      Consumibles = "المستهلكات",
      ["Por reclamar"] = "غير مستلمة",
      ["Reclamar todo"] = "استلام الكل",
      Fuerza = "القوة",
      Durabilidad = "التحمل",
      Agilidad = "الرشاقة",
      Gemas = "الجواهر",
      Cristales = "البلورات",
      Giros = "الدورات",
      Rebirths = "الولادات",
      Kills = "القتل",
      Brawls = "المعارك",
      ["Juego:"] = "اللعبة:",
      ["Autor:"] = "المؤلف:",
      ["Edad de la cuenta:"] = "عمر الحساب:",
      ["Días en total:"] = "إجمالي الأيام:",
      ["Servidor:"] = "الخادم:",
      ["Versión del juego:"] = "إصدار اللعبة:",
      ["Canjeando..."] = "جارٍ الاسترداد...",
      ["MIS PERFILES"] = "ملفاتي",
      GUARDAR = "حفظ",
      ADMINISTRAR = "إدارة",
      Deteniendo = "جارٍ الإيقاف",
      ["Auto Strength"] = "قوة تلقائية",
      ["Auto Handstands"] = "وقوف على اليدين تلقائي",
      ["Auto Pushups"] = "تمارين ضغط تلقائية",
      ["Auto Situps"] = "تمارين بطن تلقائية",
      ["Auto Kill"] = "قتل تلقائي",
      ["Evil Karma"] = "كارما شريرة",
      ["Good Karma"] = "كارما طيبة",
      ["Auto Win Brawl"] = "فوز تلقائي في القتال",
      ["Objetivo alcanzado"] = "تم بلوغ الهدف",
      ["PRÓXIMO BOSS"] = "الزعيم التالي",
      ["VIDA DEL BOSS"] = "صحة الزعيم",
      COMPRAR = "شراء",
      ["Auto comprar"] = "شراء تلقائي",
      ["Calculando fuerza/min"] = "حساب القوة/دقيقة",
      ["La key expira en:"] = "تنتهي صلاحية المفتاح خلال:",
      ["No hay recompensas para reclamar"] = "لا توجد مكافآت للاستلام",
      ["Reclamar cofres"] = "استلام الصناديق",
      ["Auto Egg · 30 min"] = "بيضة تلقائية · 30 دقيقة",
      ["Ocultar frames"] = "إخفاء النوافذ المنبثقة",
      ["Ocultar mis pets"] = "إخفاء حيواناتي",
      ["Ocultar otras pets"] = "إخفاء حيوانات الآخرين",
      ["Ir a Entrenar   ›"] = "الذهاب إلى التدريب   ›",
      ["Fast Rep"] = "تكرار سريع",
      ["Auto Rebirth"] = "ولادة تلقائية",
      Objetivo = "الهدف",
      ["Escribí un número"] = "أدخل رقماً",
      ["Ejemplo: 18,980"] = "مثال: 18,980",
      ["Renacer hasta el objetivo"] = "الولادة حتى الهدف",
      Calculando = "جارٍ الحساب",
      ["Calculando..."] = "جارٍ الحساب...",
      restantes = "متبقي",
      ["Fast Punch"] = "لكمة سريعة",
      ["Activa Fast Punch primero"] = "فعّل اللكمة السريعة أولاً",
      ["— SELECCIONÁ UNA ROCA —"] = "— اختر صخرة —",
      ["Auto comprar pets"] = "شراء الحيوانات تلقائياً",
      ["Auto evolucionar pets"] = "تطوير الحيوانات تلقائياً",
      ["Auto comprar auras"] = "شراء الهالات تلقائياً",
      ["Comprar Pet"] = "شراء حيوان",
      ["No se pudo comprar"] = "تعذر الشراء",
      ["Conectando Pet Shop..."] = "جارٍ الاتصال بالمتجر...",
      ["Se conecta al abrir esta pestaña"] = "يتصل عند فتح هذه الصفحة",
      ["Pet Shop conectado"] = "تم اتصال المتجر",
      ["No matar a mis amigos"] = "لا تقتل أصدقائي",
      ["Elegir jugador"] = "اختر لاعباً",
      ["Elegí un jugador"] = "اختر لاعباً",
      ["Seleccioná un jugador del servidor."] = "اختر لاعباً من الخادم.",
      ["Matar jugador seleccionado"] = "قتل اللاعب المحدد",
      ["No hay otros jugadores"] = "لا يوجد لاعبون آخرون",
      ["Conectando módulo..."] = "جارٍ اتصال الوحدة...",
      ["No se pudo conectar"] = "فشل الاتصال",
      Listo = "جاهز",
      ["Auto Boss"] = "زعيم تلقائي",
      ["Sin boss activo"] = "لا يوجد زعيم نشط",
      VIDA = "الحياة",
      CONSUMIBLES = "المستهلكات",
      ["RECOMPENSAS POR RECLAMAR"] = "مكافآت غير مستلمة",
      ["Reclamar TODO"] = "استلام الكل",
      ["Reclamando..."] = "جارٍ الاستلام...",
      ["Consumir TODO"] = "استخدام الكل",
      ["Reclamar cofres del mapa"] = "استلام صناديق الخريطة",
      GIROS = "الدورات",
      ["Girar ruleta"] = "تدوير العجلة",
      ["Girar automáticamente"] = "تدوير تلقائي",
      ["Esperando giro..."] = "بانتظار الدوران...",
      ["Girando..."] = "جارٍ الدوران...",
      ["Sin giros disponibles"] = "لا توجد دورات",
      ["No tienes giros disponibles"] = "لا توجد دورات",
      ["Premio obtenido"] = "تم الحصول على الجائزة",
      Cantidad = "الكمية",
      ["Cantidad de eggs"] = "عدد البيض",
      ["Cantidad de shakes"] = "عدد المشروبات",
      Regalar = "إهداء",
      ["Nombre del perfil"] = "اسم الملف",
      ["Crear perfil"] = "إنشاء ملف",
      ["Cargar perfil"] = "تحميل الملف",
      ["Actualizar perfil"] = "تحديث الملف",
      ["Eliminar perfil"] = "حذف الملف",
      ["Renombrar perfil"] = "إعادة تسمية الملف",
      ["No tenés perfiles"] = "لا توجد ملفات محفوظة",
      ["Guardá tus opciones y cargalas cuando quieras."] = "احفظ خياراتك وحمّلها وقتما تريد.",
      ["Tu executor no permite perfiles locales."] = "المنفذ لا يدعم الملفات المحلية.",
      Guardar = "حفظ",
      Cancelar = "إلغاء",
      Confirmar = "تأكيد",
      ["Quitar efectos"] = "إزالة المؤثرات",
      ["Quitar sombras"] = "إزالة الظلال",
      ["Quitar texturas"] = "إزالة الخامات",
      ["Quitar luces"] = "إزالة الأضواء",
      ["Máximo rendimiento"] = "أقصى أداء",
      ["Estrellas para AFK"] = "نجوم الخمول",
      ["Cerrar el script"] = "إغلاق السكربت",
      ["¿Estás seguro de que querés cerrar el script?"] = "هل أنت متأكد من إغلاق السكربت؟",
      ["Copiar link"] = "نسخ الرابط",
      ["Link copiado"] = "تم نسخ الرابط",
      Copiado = "تم النسخ",
      ["Dios te ama"] = "الله يحبك",
      Activo = "نشط",
      Abierto = "مفتوح",
      ["Anti-Crash"] = "منع التعطل",
      ["FPS Unlock"] = "فتح حد الإطارات",
      ["MS Reducer"] = "تقليل زمن الاستجابة",
      ["Botón de emergencia"] = "زر الطوارئ",
      ["TODO APAGADO"] = "تم إيقاف الكل",
      ["Presioná una tecla..."] = "اضغط مفتاحاً...",
    },
  }
  for key, value31 in pairs(tbl19) do
    for key2, value32 in pairs(value31) do
      tbl18[key].texts[key2] = value32
    end
  end
  tbl18[1].greeting = "Hola %s, Disfruta del Script."
  tbl18[2].greeting = "Hello %s, Enjoy the Script."
  tbl18[3].greeting = "Olá %s, Aproveite o Script."
  tbl18[4].greeting = "مرحباً %s، استمتع بالسكربت."
  local young0xPublicTrainingLanguag = math.clamp(tonumber(getgenv().Young0xPublicTrainingLanguage) or 1, 1, #tbl18)
  local v5
  local parent4
  bRG2.languageChoices = {}
  local flag6 = false
  local tbl20 = setmetatable({}, { __mode = "k" })
  bRG2.refreshLanguageTypography = function()
    if v5 then
      v5.Font = Enum.Font.Garamond
      v5.TextSize = touchEnabled and 13 or 15
      v5.TextStrokeColor3 = Color3.fromRGB(5, 5, 7)
      v5.TextStrokeTransparency = 0.55
    end
    for index, item in ipairs(bRG2.languageChoices) do
      item.Font = Enum.Font.Garamond
      item.TextSize = touchEnabled and 13 or 15
      item.TextStrokeColor3 = Color3.fromRGB(5, 5, 7)
      item.TextStrokeTransparency = 0.55
    end
  end

  local function fn48(arg, arg2)
    arg = tostring(arg or "")
    local texts = arg2.texts and arg2.texts[arg]
    if texts then return texts end
    local tabs = arg2.tabs and arg2.tabs[arg]
    if tabs then return tabs end
    if arg == "Hola " .. localPlayer.DisplayName .. ", Disfruta del Script." then
      return string.format(arg2.greeting, localPlayer.DisplayName)
    end
    local match = arg:match("^(%d+) segundos? para Server Hop$")
    if match then
      if young0xPublicTrainingLanguag == 2 then return match .. " seconds until Server Hop" end
      if young0xPublicTrainingLanguag == 3 then return match .. " segundos para Server Hop" end
      if young0xPublicTrainingLanguag == 4 then return match .. " ثانية حتى تغيير الخادم" end
    end
    local match2 = arg:match("^Tiempo aprox:%s*(.*)$")
    if match2 then
      if young0xPublicTrainingLanguag == 2 then return "Estimated time: " .. match2 end
      if young0xPublicTrainingLanguag == 3 then return "Tempo estimado: " .. match2 end
      if young0xPublicTrainingLanguag == 4 then return "الوقت المتوقع: " .. match2 end
    end
    local match3 = arg:match("^(%d+/%d+)%s+jugadores$")
    if match3 then
      if young0xPublicTrainingLanguag == 2 then return match3 .. " players" end
      if young0xPublicTrainingLanguag == 3 then return match3 .. " jogadores" end
      if young0xPublicTrainingLanguag == 4 then return match3 .. " لاعباً" end
    end
    local match4 = arg:match("^Cuenta creada:%s*(.+)$")
    if match4 then
      if young0xPublicTrainingLanguag == 2 then return "Account created: " .. match4 end
      if young0xPublicTrainingLanguag == 3 then return "Conta criada: " .. match4 end
      if young0xPublicTrainingLanguag == 4 then return "تاريخ إنشاء الحساب: " .. match4 end
    end
    local match5 = arg:match("^Canjear%s+(%d+)%s+Protein Eggs$")
    if match5 then
      if young0xPublicTrainingLanguag == 2 then return "Redeem " .. match5 .. " Protein Eggs" end
      if young0xPublicTrainingLanguag == 3 then return "Resgatar " .. match5 .. " ovos de proteína" end
      if young0xPublicTrainingLanguag == 4 then return "استرداد " .. match5 .. " بيضات بروتين" end
    end
    local match6 = arg:match("^Kills:%s*(.+)$")
    if match6 then
      if young0xPublicTrainingLanguag == 3 then return "Abates: " .. match6 end
      if young0xPublicTrainingLanguag == 4 then return "القتل: " .. match6 end
    end
    local match7 = arg:match("^Rebirths:%s*(.+)$")
    if match7 then
      if young0xPublicTrainingLanguag == 3 then return "Renascimentos: " .. match7 end
      if young0xPublicTrainingLanguag == 4 then return "الولادات: " .. match7 end
    end
    local match8 = arg:match("^(.+)%s+restantes$")
    if match8 then
      if young0xPublicTrainingLanguag == 2 then return match8 .. " remaining" end
      if young0xPublicTrainingLanguag == 3 then return match8 .. " restantes" end
      if young0xPublicTrainingLanguag == 4 then return match8 .. " متبقي" end
    end
    local match9 = arg:match("^Calculando ciclos%s+(.+)$")
    if match9 then
      if young0xPublicTrainingLanguag == 2 then return "Calculating cycles " .. match9 end
      if young0xPublicTrainingLanguag == 3 then return "Calculando ciclos " .. match9 end
      if young0xPublicTrainingLanguag == 4 then return "حساب الدورات " .. match9 end
    end
    local match10 = arg:match("^Server Hop%s+·%s+(%d+)%s+s$")
    if match10 then
      if young0xPublicTrainingLanguag == 3 then return "Trocar servidor · " .. match10 .. " s" end
      if young0xPublicTrainingLanguag == 4 then return "تغيير الخادم · " .. match10 .. " ث" end
    end
    local match11, extra3 = arg:match("^Protein Eggs:%s*(%d+)%s+·%s+Tropical Shakes:%s*(%d+)$")
    if match11 then
      if young0xPublicTrainingLanguag == 3 then
        return "Ovos de proteína: " .. match11 .. "    ·    Shakes tropicais: " .. extra3
      end
      if young0xPublicTrainingLanguag == 4 then
        return "بيض البروتين: " .. match11 .. "    ·    المشروبات الاستوائية: " .. extra3
      end
    end
    if arg:match("^%d+%s+años?") or arg:match("^%d+%s+mes") or arg:match("^%d+%s+días?") then
      if young0xPublicTrainingLanguag == 2 then
        return arg:gsub("(%d+) años", "%1 years"):gsub("(%d+) año", "%1 year"):gsub("(%d+) meses", "%1 months"):gsub("(%d+) mes", "%1 month"):gsub("(%d+) días", "%1 days"):gsub("(%d+) día", "%1 day"):gsub(" y ", " and ")
      elseif young0xPublicTrainingLanguag == 3 then
        return arg:gsub("(%d+) años", "%1 anos"):gsub("(%d+) año", "%1 ano"):gsub("(%d+) meses", "%1 meses"):gsub("(%d+) mes", "%1 mês"):gsub("(%d+) días", "%1 dias"):gsub("(%d+) día", "%1 dia"):gsub(" y ", " e ")
      elseif young0xPublicTrainingLanguag == 4 then
        return arg:gsub("(%d+) años", "%1 سنوات"):gsub("(%d+) año", "%1 سنة"):gsub("(%d+) meses", "%1 أشهر"):gsub("(%d+) mes", "%1 شهر"):gsub("(%d+) días", "%1 أيام"):gsub("(%d+) día", "%1 يوم"):gsub(" y ", " و ")
      end
    end
    return arg
  end
  bRG2.translateText = function(arg)
    return fn48(arg, tbl18[young0xPublicTrainingLanguag])
  end

  local function fn49(arg, arg2, arg3)
    local attribute = arg:GetAttribute(arg3)
    if type(attribute) ~= "string" then
      attribute = arg[arg2]
      arg:SetAttribute(arg3, attribute)
    end
    local result4 = fn48(attribute, tbl18[young0xPublicTrainingLanguag])
    if arg[arg2] ~= result4 then arg[arg2] = result4 end
  end

  local function fn50(arg)
    if tbl20[arg] or not (arg:IsA("TextLabel") or arg:IsA("TextButton") or arg:IsA("TextBox")) then return end
    tbl20[arg] = true
    if type(arg:GetAttribute("Young0xI18nSource")) ~= "string" then
      arg:SetAttribute("Young0xI18nSource", arg.Text)
    end
    fn(arg:GetPropertyChangedSignal("Text"):Connect(function()
      if flag6 then return end
      local text = arg.Text
      arg:SetAttribute("Young0xI18nSource", text)
      flag6 = true
      arg.Text = fn48(text, tbl18[young0xPublicTrainingLanguag])
      flag6 = false
    end))
    if arg:IsA("TextBox") then
      if type(arg:GetAttribute("Young0xI18nPlaceholderSource")) ~= "string" then
        arg:SetAttribute("Young0xI18nPlaceholderSource", arg.PlaceholderText)
      end
      fn(arg:GetPropertyChangedSignal("PlaceholderText"):Connect(function()
        if flag6 then return end
        local placeholderText = arg.PlaceholderText
        arg:SetAttribute("Young0xI18nPlaceholderSource", placeholderText)
        flag6 = true
        arg.PlaceholderText = fn48(placeholderText, tbl18[young0xPublicTrainingLanguag])
        flag6 = false
      end))
    end
  end

  local function fn51()
    local item = tbl18[young0xPublicTrainingLanguag]
    flag6 = true
    for key, value31 in pairs(tbl12) do
      value31:SetAttribute("Young0xI18nSource", key)
      value31.Text = item.tabs[key] or key
    end
    for index, item2 in ipairs(parent:GetDescendants()) do
      if item2 ~= v5 and (item2:IsA("TextLabel") or item2:IsA("TextButton") or item2:IsA("TextBox")) then
        fn50(item2)
        fn49(item2, "Text", "Young0xI18nSource")
        if item2:IsA("TextBox") then fn49(item2, "PlaceholderText", "Young0xI18nPlaceholderSource") end
      end
    end
    if bRG2.greetingLabel then
      bRG2.greetingLabel:SetAttribute("Young0xI18nSource", "Hola " .. localPlayer.DisplayName .. ", Disfruta del Script.")
      bRG2.greetingLabel.Text = string.format(item.greeting, localPlayer.DisplayName)
    end
    v5.Text = (item.prefix or "Idioma") .. ": " .. item.name
    for index, item2 in ipairs(bRG2.languageChoices) do
      local flag7 = index == young0xPublicTrainingLanguag
      item2.BackgroundColor3 = flag7 and Color3.fromRGB(48, 49, 54) or Color3.fromRGB(24, 25, 28)
      item2.BackgroundTransparency = flag7 and 0.34 or 0.58
      item2.TextColor3 = flag7 and Color3.fromRGB(235, 237, 242) or Color3.fromRGB(188, 191, 199)
      local uIStroke5 = item2:FindFirstChildWhichIsA("UIStroke")
      if uIStroke5 then
        uIStroke5.Color, uIStroke5.Transparency = Color3.fromRGB(150, 153, 162), flag7 and 0.54 or 0.78
      end
    end
    bRG2.refreshLanguageTypography()
    flag6 = false
    getgenv().Young0xPublicTrainingLanguage = young0xPublicTrainingLanguag
    bRG2.language = item.name
    if parent4 then parent4.Visible = false end
  end
  v5 = fn42(tbl17.Settings, "Idioma", 1, function()
    bRG2.refreshLanguageTypography()
    if parent4 then parent4.Visible = not parent4.Visible end
  end)
  v5.Name = "LanguageDropdownButton"
  v5.BackgroundColor3 = Color3.fromRGB(22, 23, 26)
  v5.BackgroundTransparency = 0.42
  v5.TextColor3 = Color3.fromRGB(211, 213, 220)
  v5:SetAttribute("Young0xIdleColor", Color3.fromRGB(22, 23, 26))
  v5:SetAttribute("Young0xHoverColor", Color3.fromRGB(39, 40, 44))
  v5:SetAttribute("Young0xHoverStrokeColor", Color3.fromRGB(154, 157, 166))
  v5:SetAttribute("Young0xHoverStrokeTransparency", 0.48)
  parent4 = Instance.new("Frame")
  parent4.Name = "LanguageDropdown"
  parent4.Size = UDim2.new(1, 0, 0, 66)
  parent4.BackgroundColor3, parent4.BackgroundTransparency = Color3.fromRGB(14, 15, 18), 0.34
  parent4.BorderSizePixel, parent4.Visible, parent4.ZIndex = 0, false, 2
  parent4.LayoutOrder = 2
  parent4.Parent = tbl17.Settings
  fn(parent.DescendantAdded:Connect(function(arg)
    task.defer(function()
      if getgenv().BRG ~= bRG2 or not arg.Parent then return end
      fn50(arg)
      if arg:IsA("TextLabel") or arg:IsA("TextButton") or arg:IsA("TextBox") then
        flag6 = true
        fn49(arg, "Text", "Young0xI18nSource")
        if arg:IsA("TextBox") then fn49(arg, "PlaceholderText", "Young0xI18nPlaceholderSource") end
        flag6 = false
      end
    end)
  end))
  Instance.new("UICorner", parent4).CornerRadius = UDim.new(0, 7)
  local uIStroke5 = Instance.new("UIStroke", parent4)
  uIStroke5.Color, uIStroke5.Transparency = Color3.fromRGB(139, 142, 151), 0.66
  for index, item in ipairs(tbl18) do
    local textButton2 = Instance.new("TextButton")
    textButton2.Name = "Language" .. index
    local num7, num8 = (index - 1) % 2, math.floor((index - 1) / 2)
    textButton2.Size = UDim2.new(0.5, -6, 0, 25)
    textButton2.Position = UDim2.new(num7 * 0.5, num7 == 0 and 4 or 2, 0, 5 + num8 * 30)
    textButton2.BackgroundColor3, textButton2.BackgroundTransparency = Color3.fromRGB(24, 25, 28), 0.58
    textButton2.BorderSizePixel, textButton2.AutoButtonColor = 0, false
    textButton2.Text, textButton2.TextColor3 = item.name, Color3.fromRGB(188, 191, 199)
    textButton2.Font, textButton2.TextSize, textButton2.ZIndex = Enum.Font.Garamond, touchEnabled and 11 or 13, 3
    textButton2.Parent = parent4
    bRG2.languageChoices[index] = textButton2
    bRG2.refreshLanguageTypography()
    Instance.new("UICorner", textButton2).CornerRadius = UDim.new(0, 6)
    local uIStroke6 = Instance.new("UIStroke", textButton2)
    uIStroke6.Color, uIStroke6.Transparency = Color3.fromRGB(150, 153, 162), 0.78
    textButton2.MouseEnter:Connect(function()
      tweenService:Create(textButton2, timing.tween, {
        BackgroundColor3 = Color3.fromRGB(43, 44, 49),
        BackgroundTransparency = 0.38,
        TextColor3 = Color3.fromRGB(235, 237, 242),
      }):Play()
    end)
    textButton2.MouseLeave:Connect(function()
      local flag7 = index == young0xPublicTrainingLanguag
      tweenService:Create(textButton2, timing.tween, {
        BackgroundColor3 = flag7 and Color3.fromRGB(48, 49, 54) or Color3.fromRGB(24, 25, 28),
        BackgroundTransparency = flag7 and 0.34 or 0.58,
        TextColor3 = flag7 and Color3.fromRGB(235, 237, 242) or Color3.fromRGB(188, 191, 199),
      }):Play()
    end)
    textButton2.Activated:Connect(function()
      young0xPublicTrainingLanguag = index
      fn51()
    end)
  end
  bRG2.setLanguage = function(arg)
    young0xPublicTrainingLanguag = math.clamp(math.floor(tonumber(arg) or 1), 1, #tbl18)
    fn51()
    return true
  end
  fn51()
end
local result3 = fn42(tbl17.Settings, "Cerrar el script", 40, function()
  if requestCloseConfirmation then
    requestCloseConfirmation()
  elseif closeHub then
    closeHub()
  end
end)
fn43(result3, "✕", colors.pink)
result3:Destroy()

local function fn48(arg, arg2, arg3)
  pcall(function()
    tweenService:Create(arg, arg2, arg3):Play()
  end)
end

local function fn49(arg, arg2)
  for index, item in ipairs(arg:GetDescendants()) do
    if item:IsA("GuiObject") then
      fn48(item, arg2, { BackgroundTransparency = 1 })
      if item:IsA("ScrollingFrame") then
        item.ScrollBarImageTransparency = 1
        item.ScrollBarThickness = 0
      end
      if item:IsA("TextLabel") or item:IsA("TextButton") or item:IsA("TextBox") then
        fn48(item, arg2, { TextTransparency = 1, TextStrokeTransparency = 1 })
      end
      if item:IsA("ImageLabel") or item:IsA("ImageButton") then fn48(item, arg2, { ImageTransparency = 1 }) end
    elseif item:IsA("UIStroke") then
      fn48(item, arg2, { Transparency = 1 })
    end
  end
end
flag3 = false
closeHub = function(arg)
  if flag3 then return end
  flag3 = true
  if arg == true then
    bRG2.saveResumeState()
  else
    bRG2.clearResumeState()
  end
  if bRG2.stopEggGifts then bRG2.stopEggGifts() end
  if bRG2.embeddedPetShop and type(bRG2.embeddedPetShop.Shutdown) == "function" then
    pcall(bRG2.embeddedPetShop.Shutdown, true)
    bRG2.embeddedPetShop = nil
  end
  if bRG2.embeddedKills and type(bRG2.embeddedKills.Shutdown) == "function" then
    pcall(bRG2.embeddedKills.Shutdown, true)
    bRG2.embeddedKills = nil
  end
  value()
  stopAutoTraining()
  if bRG2.stopMachine then bRG2.stopMachine(true) end
  if bRG2.destroyMachineAnimationTracks then bRG2.destroyMachineAnimationTracks() end
  bRG2.autoEgg = false
  bRG2.autoEggRun += 1
  bRG2.autoKing = false
  bRG2.autoKingRun += 1
  bRG2.destroyAutoKingPlatform()
  bRG2.lockPosition = false
  bRG2.lockPositionRun += 1
  bRG2.lockPositionCFrame = nil
  bRG2.autoRebirth = false
  bRG2.autoRebirthRun += 1
  bRG2.rebirthTargetMode = false
  bRG2.autoSpinFortune = false
  bRG2.autoSpinFortuneRun += 1
  fn31(false)
  fn33(false)
  if bRG2.restorePerformance then bRG2.restorePerformance() end
  if bRG2.setOtherPetsHidden then bRG2.setOtherPetsHidden(false) end
  if bRG2.hideMyPets and bRG2.setMyPetsHidden then bRG2.setMyPetsHidden(false) end
  if value20 then
    value20:Disconnect()
    value20 = nil
  end
  if bRG2.durabilityGuiConn then
    bRG2.durabilityGuiConn:Disconnect()
    bRG2.durabilityGuiConn = nil
  end
  fn12()
  fn15()
  fn17()
  bRG2.waitingForMinimizeKey = false
  if bRG2.setPingReducer then pcall(bRG2.setPingReducer, false) end
  if bRG2.setFpsUnlock then pcall(bRG2.setFpsUnlock, false) end
  if bRG2.setAntiCrash then pcall(bRG2.setAntiCrash, false) end
  if getgenv().Young0xPublicTrainingBossBridge == bRG2.young0xBossBridge then
    getgenv().Young0xPublicTrainingBossBridge = nil
  end
  bRG2.consumeAll = false
  num6 += 1
  bRG2.autoMapChests = false
  bRG2.mapChestRun += 1
  bRG2.collectingMapChests = false
  fn28()
  if bRG2.clearPortalBranding then bRG2.clearPortalBranding() end
  fn2()
  if arg == true then
    if screenGui and screenGui.Parent then screenGui:Destroy() end
    if parent and parent.Parent then parent:Destroy() end
    return
  end
  local tweenInfo = TweenInfo.new(0.32, Enum.EasingStyle.Quart, Enum.EasingDirection.In)
  if bRG2.shellUI.fadeCloseConfirmation then bRG2.shellUI.fadeCloseConfirmation(tweenInfo) end
  if bRG2.shellUI.setInfoPanelOpen then bRG2.shellUI.setInfoPanelOpen(false) end
  if bRG2.shellUI.InfoHandle and bRG2.shellUI.InfoHandle.Parent then
    fn49(bRG2.shellUI.InfoHandle, tweenInfo)
    fn48(bRG2.shellUI.InfoHandle, tweenInfo, { BackgroundTransparency = 1 })
  end
  if bRG2.shellUI.InfoPanel and bRG2.shellUI.InfoPanel.Parent then
    fn49(bRG2.shellUI.InfoPanel, tweenInfo)
    fn48(bRG2.shellUI.InfoPanel, tweenInfo, { BackgroundTransparency = 1 })
  end
  local x = frame2.AbsoluteSize.X
  local y = frame2.AbsoluteSize.Y
  local num7 = math.floor(x * 0.84)
  local num8 = math.floor(y * 0.84)
  local uDim2 = UDim2.new(
    frame2.Position.X.Scale,
    frame2.Position.X.Offset + (x - num7) / 2,
    frame2.Position.Y.Scale,
    frame2.Position.Y.Offset + (y - num8) / 2
  )
  fn49(frame2, tweenInfo)
  if frame8 and frame8.Parent and frame8.Visible then
    fn49(frame8, tweenInfo)
    fn48(frame8, tweenInfo, { BackgroundTransparency = 1 })
    fn48(uIStroke3, tweenInfo, { Transparency = 1 })
  end
  fn48(frame2, tweenInfo, { Size = UDim2.fromOffset(num7, num8), Position = uDim2, BackgroundTransparency = 1 })
  fn48(frame3, tweenInfo, { Size = UDim2.fromOffset(num7, num8), Position = uDim2 })
  fn48(frame, tweenInfo, {
    Size = UDim2.fromOffset(num7 + 10, num8 + 10),
    Position = UDim2.new(uDim2.X.Scale, uDim2.X.Offset - 5, uDim2.Y.Scale, uDim2.Y.Offset - 5),
    BackgroundTransparency = 1,
  })
  fn48(uIStroke, tweenInfo, { Transparency = 1 })
  task.delay(0.35, function()
    if screenGui and screenGui.Parent then screenGui:Destroy() end
    if parent and parent.Parent then parent:Destroy() end
  end)
end
flag = false
bRG2.closeHub = closeHub
bRG2.expireAccess = function()
  if bRG2.accessExpired then return end
  bRG2.accessExpired = true
  bRG2.startExpiryAntiAfk()
  local _G2 = getgenv and getgenv() or _G
  _G2.Young0xPublicTrainingExpiresAt = nil
  _G2.Young0xPublicTrainingStartedAt = nil
  _G2.Young0xPublicTrainingKeyClient = nil
  _G2.Young0xPublicTrainingKey = nil
  _G2.SCRIPT_KEY = nil
  pcall(function()
    local text = "Young0xHub/PublicTraining/key-" .. tostring(localPlayer.UserId) .. ".txt"
    if type(isfile) == "function" and type(delfile) == "function" and isfile(text) then delfile(text) end
  end)
  if bRG2.embeddedPetShop and type(bRG2.embeddedPetShop.Shutdown) == "function" then
    pcall(bRG2.embeddedPetShop.Shutdown, true)
  end
  if bRG2.embeddedKills and type(bRG2.embeddedKills.Shutdown) == "function" then
    pcall(bRG2.embeddedKills.Shutdown, true)
  end
  closeHub(false)
  task.delay(0.5, function()
    local ok = pcall(function()
      local httpGet = game:HttpGet(bRG2.publicModuleUrl)
      local result4 = loadstring(httpGet)
      if type(result4) ~= "function" then error("script inválido") end
      result4()
    end)
    if not ok then
      pcall(function()
        local httpGet = game:HttpGet("https://cdn.jsdelivr.net/gh/Young0xHUB/MuscleLegends@main/modules/pt.lua")
        local result4 = loadstring(httpGet)
        if type(result4) == "function" then result4() end
      end)
    end
  end)
end
local touchEnabled4 = touchEnabled and math.min(hubW, 330) or math.min(hubW, 430)
local num7 = (hubW - touchEnabled4) / 2
local position3 = frame2.Position
local num8 = 0
setHubMinimized = function(arg)
  if bRG2.shellUI.isCloseConfirmationOpen() then return end
  if flag3 or flag == arg then return end
  if bRG2.shellUI.setInfoPanelOpen then bRG2.shellUI.setInfoPanelOpen(false, arg == true) end
  flag = arg
  if bRG2.shellUI.setInfoHandleShown then bRG2.shellUI.setInfoHandleShown(not arg, arg == true) end
  bRG2.shellUI.copyNotice.Visible = false
  bRG2.shellUI.copyNotice.TextTransparency = 1
  frame4.Size = UDim2.new(1, 0, 0, titleH)
  num8 += 1
  local num9 = num8
  frame5.Visible = false
  scrollingFrame.Visible = false
  frame7.Visible = false
  bRG2.shellUI.FooterBar.Visible = false
  if bRG2.shellUI.setMinimizedHeader then bRG2.shellUI.setMinimizedHeader(flag) end
  if flag then
    position3 = frame2.Position
    local uDim2 = UDim2.new(position3.X.Scale, position3.X.Offset + num7, position3.Y.Scale, position3.Y.Offset)
    tweenService:Create(
      frame2,
      TweenInfo.new(timing.minimizeDur, Enum.EasingStyle.Quad),
      { Size = UDim2.fromOffset(touchEnabled4, titleH), Position = uDim2 }
    ):Play()
    tweenService:Create(
      frame3,
      TweenInfo.new(timing.minimizeDur, Enum.EasingStyle.Quad),
      { Size = UDim2.fromOffset(touchEnabled4, titleH), Position = uDim2 }
    ):Play()
    tweenService:Create(frame, TweenInfo.new(timing.minimizeDur, Enum.EasingStyle.Quad), {
      Size = UDim2.fromOffset(touchEnabled4 + 10, titleH + 10),
      Position = UDim2.new(uDim2.X.Scale, uDim2.X.Offset - 5, uDim2.Y.Scale, uDim2.Y.Offset - 5),
    }):Play()
  else
    if bRG2.clampDragPosition then position3 = bRG2.clampDragPosition(position3, true) end
    tweenService:Create(
      frame2,
      TweenInfo.new(timing.minimizeDur, Enum.EasingStyle.Quad),
      { Size = UDim2.fromOffset(hubW, hubH), Position = position3 }
    ):Play()
    tweenService:Create(
      frame3,
      TweenInfo.new(timing.minimizeDur, Enum.EasingStyle.Quad),
      { Size = UDim2.fromOffset(hubW, hubH), Position = position3 }
    ):Play()
    tweenService:Create(frame, TweenInfo.new(timing.minimizeDur, Enum.EasingStyle.Quad), {
      Size = UDim2.fromOffset(hubW + 10, hubH + 10),
      Position = UDim2.new(position3.X.Scale, position3.X.Offset - 5, position3.Y.Scale, position3.Y.Offset - 5),
    }):Play()
    task.delay(timing.minimizeDur, function()
      if num9 ~= num8 or flag or not frame2.Parent then return end
      frame5.Visible = true
      scrollingFrame.Visible = true
      frame7.Visible = true
      bRG2.shellUI.FooterBar.Visible = false
    end)
  end
end
bRG2.setHubMinimized = setHubMinimized
if userInputService.KeyboardEnabled then
  fn(userInputService.InputBegan:Connect(function(arg, arg2)
    if arg.UserInputType ~= Enum.UserInputType.Keyboard then return end
    if bRG2.waitingForMinimizeKey then
      bRG2.waitingForMinimizeKey = false
      if arg.KeyCode ~= Enum.KeyCode.Escape and arg.KeyCode ~= Enum.KeyCode.Unknown then
        bRG2.minimizeKey = arg.KeyCode
        bRG2.saveMinimizeKey(bRG2.minimizeKey)
      end
      if bRG2.minimizeKeyButton and bRG2.minimizeKeyButton.Parent then
        bRG2.minimizeKeyButton.Text = bRG2.minimizeKeyText()
      end
      return
    end
    if arg2 or userInputService:GetFocusedTextBox() then return end
    if arg.KeyCode == bRG2.minimizeKey then setHubMinimized(not flag) end
  end))
end
bRG2.copyNoticeRun = 0
bRG2.showDiscordCopied = function()
  if flag3 or not frame2 or not frame2.Parent then return end
  bRG2.copyNoticeRun += 1
  local copyNoticeRun = bRG2.copyNoticeRun
  bRG2.shellUI.copyNotice.Visible = true
  bRG2.shellUI.copyNotice.TextTransparency = 1
  tweenService:Create(
    bRG2.shellUI.copyNotice,
    TweenInfo.new(0.16, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
    { TextTransparency = 0 }
  ):Play()
  if flag then
    local touchEnabled5 = touchEnabled and 8 or 9
    tweenService:Create(
      frame2,
      TweenInfo.new(0.18, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
      { Size = UDim2.fromOffset(touchEnabled4, titleH + touchEnabled5) }
    ):Play()
    tweenService:Create(
      frame3,
      TweenInfo.new(0.18, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
      { Size = UDim2.fromOffset(touchEnabled4, titleH + touchEnabled5) }
    ):Play()
    tweenService:Create(
      frame,
      TweenInfo.new(0.18, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
      { Size = UDim2.fromOffset(touchEnabled4 + 10, titleH + touchEnabled5 + 10) }
    ):Play()
    tweenService:Create(
      frame4,
      TweenInfo.new(0.18, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
      { Size = UDim2.new(1, 0, 0, titleH + touchEnabled5) }
    ):Play()
  end
  task.delay(3, function()
    if copyNoticeRun ~= bRG2.copyNoticeRun or not bRG2.shellUI.copyNotice.Parent then return end
    tweenService:Create(bRG2.shellUI.copyNotice, TweenInfo.new(0.14), { TextTransparency = 1 }):Play()
    if flag then
      tweenService:Create(
        frame2,
        TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut),
        { Size = UDim2.fromOffset(touchEnabled4, titleH) }
      ):Play()
      tweenService:Create(
        frame3,
        TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut),
        { Size = UDim2.fromOffset(touchEnabled4, titleH) }
      ):Play()
      tweenService:Create(
        frame,
        TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut),
        { Size = UDim2.fromOffset(touchEnabled4 + 10, titleH + 10) }
      ):Play()
      tweenService:Create(frame4, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut), { Size = UDim2.new(1, 0, 0, titleH) }):Play()
    end
    task.delay(0.15, function()
      if copyNoticeRun == bRG2.copyNoticeRun and bRG2.shellUI.copyNotice.Parent then
        bRG2.shellUI.copyNotice.Visible = false
      end
    end)
  end)
end

function bRG2.initializeCloseConfirmation()
  local flag6 = false
  local num9 = 0
  bRG2.shellUI.closeConfirmationOpen = function()
    return flag6
  end
  local frame13 = Instance.new("Frame")
  frame13.Name = "CloseConfirmationLayer"
  frame13.Size = UDim2.fromScale(1, 1)
  frame13.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
  frame13.BackgroundTransparency = 1
  frame13.BorderSizePixel = 0
  frame13.Active = false
  frame13.Visible = false
  frame13.ZIndex = 2000
  frame13.Parent = parent

  local function fn50(parent4, name, arg)
    local frame14 = Instance.new("Frame")
    frame14.Name = name
    frame14.Size = UDim2.fromScale(1, 1)
    frame14.BackgroundColor3 = Color3.fromRGB(5, 6, 8)
    frame14.BackgroundTransparency = 1
    frame14.BorderSizePixel = 0
    frame14.Active = true
    frame14.Visible = false
    frame14.ZIndex = 1999
    frame14.Parent = parent4
    Instance.new("UICorner", frame14).CornerRadius = UDim.new(0, arg)
    return frame14
  end
  local parent4 = fn50(frame2, "CloseFrost", 11)
  local result4 = fn50(bRG2.shellUI.InfoPanel, "CloseFrost", touchEnabled and 10 or 12)
  local result5 = fn50(bRG2.shellUI.InfoHandle, "CloseFrost", touchEnabled and 7 or 8)
  local textButton2 = Instance.new("TextButton")
  textButton2.Name = "ModalDragSurface"
  textButton2.Size = UDim2.new(1, 0, 0, titleH)
  textButton2.BackgroundTransparency = 1
  textButton2.BorderSizePixel = 0
  textButton2.AutoButtonColor = false
  textButton2.Text = ""
  textButton2.Active = true
  textButton2.ZIndex = 2001
  textButton2.Parent = parent4
  fn(textButton2.InputBegan:Connect(function(arg)
    if flag6 and bRG2.beginHeaderDrag then bRG2.beginHeaderDrag(arg, true) end
  end))
  local touchEnabled5 = touchEnabled and math.min(hubW - 28, 318) or 352
  local touchEnabled6 = touchEnabled and 144 or 152
  local canvasGroup = Instance.new("CanvasGroup")
  canvasGroup.Name = "CloseDialog"
  canvasGroup.AnchorPoint = Vector2.new(0.5, 0.5)
  canvasGroup.Size = UDim2.fromOffset(touchEnabled5, touchEnabled6)
  canvasGroup.BackgroundColor3 = Color3.fromRGB(13, 14, 17)
  canvasGroup.BackgroundTransparency = 0.025
  canvasGroup.BorderSizePixel = 0
  canvasGroup.GroupTransparency = 1
  canvasGroup.ZIndex = 2003
  canvasGroup.Parent = frame13
  Instance.new("UICorner", canvasGroup).CornerRadius = UDim.new(0, 12)
  local uIStroke5 = Instance.new("UIStroke", canvasGroup)
  uIStroke5.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
  uIStroke5.Color = Color3.fromRGB(91, 95, 104)
  uIStroke5.Transparency = 0.16
  uIStroke5.Thickness = 1
  local textLabel6 = Instance.new("TextLabel")
  textLabel6.Name = "Question"
  textLabel6.Size = UDim2.new(1, -32, 0, touchEnabled and 65 or 70)
  textLabel6.Position = UDim2.fromOffset(16, touchEnabled and 13 or 15)
  textLabel6.BackgroundTransparency = 1
  textLabel6.Text = "¿Estás seguro de que querés cerrar el script?"
  textLabel6.TextColor3 = Color3.fromRGB(239, 241, 245)
  textLabel6.Font = Enum.Font.GothamBold
  textLabel6.TextSize = touchEnabled and 14 or 16
  textLabel6.TextWrapped = true
  textLabel6.TextXAlignment = Enum.TextXAlignment.Center
  textLabel6.TextYAlignment = Enum.TextYAlignment.Center
  textLabel6.ZIndex = 2004
  textLabel6.Parent = canvasGroup
  local frame14 = Instance.new("Frame")
  frame14.Size = UDim2.new(1, -28, 0, 1)
  frame14.Position = UDim2.new(0, 14, 0, touchEnabled and 79 or 86)
  frame14.BackgroundColor3 = Color3.fromRGB(45, 48, 55)
  frame14.BackgroundTransparency = 0.22
  frame14.BorderSizePixel = 0
  frame14.ZIndex = 2004
  frame14.Parent = canvasGroup

  local function fn51(name, text, arg, backgroundColor3, backgroundColor32)
    local textButton3 = Instance.new("TextButton")
    textButton3.Name = name
    textButton3.Size = UDim2.new(0.5, -21, 0, touchEnabled and 36 or 38)
    textButton3.Position = UDim2.new(arg, arg == 0 and 14 or 7, 1, touchEnabled and -49 or -52)
    textButton3.BackgroundColor3 = backgroundColor3
    textButton3.BorderSizePixel = 0
    textButton3.AutoButtonColor = false
    textButton3.Text = text
    textButton3.TextColor3 = colors.white
    textButton3.Font = Enum.Font.GothamBold
    textButton3.TextSize = touchEnabled and 13 or 14
    textButton3.ZIndex = 2004
    textButton3.Parent = canvasGroup
    Instance.new("UICorner", textButton3).CornerRadius = UDim.new(0, 8)
    local uIStroke6 = Instance.new("UIStroke", textButton3)
    uIStroke6.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
    uIStroke6.Color = backgroundColor32
    uIStroke6.Transparency = 0.32
    local uIScale = Instance.new("UIScale", textButton3)
    fn(textButton3.MouseEnter:Connect(function()
      tweenService:Create(textButton3, timing.tween, { BackgroundColor3 = backgroundColor32 }):Play()
      tweenService:Create(uIScale, timing.tween, { Scale = 1.025 }):Play()
    end))
    fn(textButton3.MouseLeave:Connect(function()
      tweenService:Create(textButton3, timing.tween, { BackgroundColor3 = backgroundColor3 }):Play()
      tweenService:Create(uIScale, timing.tween, { Scale = 1 }):Play()
    end))
    return textButton3
  end
  local result6 = fn51("Yes", "Sí", 0, Color3.fromRGB(27, 139, 72), Color3.fromRGB(34, 164, 86))
  local result7 = fn51("No", "No", 0.5, Color3.fromRGB(176, 43, 54), Color3.fromRGB(205, 54, 67))
  local uIScale = Instance.new("UIScale", canvasGroup)

  local function fn52()
    canvasGroup.Position = UDim2.new(
      frame2.Position.X.Scale,
      frame2.Position.X.Offset + frame2.AbsoluteSize.X / 2,
      frame2.Position.Y.Scale,
      frame2.Position.Y.Offset + frame2.AbsoluteSize.Y / 2
    )
  end

  local function dismissCloseConfirmation()
    if not flag6 then return end
    flag6 = false
    num9 += 1
    local num10 = num9
    tweenService:Create(parent4, TweenInfo.new(0.17), { BackgroundTransparency = 1 }):Play()
    tweenService:Create(result4, TweenInfo.new(0.17), { BackgroundTransparency = 1 }):Play()
    tweenService:Create(result5, TweenInfo.new(0.17), { BackgroundTransparency = 1 }):Play()
    tweenService:Create(canvasGroup, TweenInfo.new(0.17, Enum.EasingStyle.Quad, Enum.EasingDirection.In), { GroupTransparency = 1 }):Play()
    tweenService:Create(uIScale, TweenInfo.new(0.17, Enum.EasingStyle.Quad, Enum.EasingDirection.In), { Scale = 0.94 }):Play()
    task.delay(0.18, function()
      if num10 == num9 and not flag6 and frame13.Parent then
        frame13.Visible = false
        parent4.Visible = false
        result4.Visible = false
        result5.Visible = false
      end
    end)
  end
  bRG2.shellUI.fadeCloseConfirmation = function(arg)
    flag6 = false
    num9 += 1
    arg = arg or TweenInfo.new(0.32, Enum.EasingStyle.Quart, Enum.EasingDirection.In)
    tweenService:Create(parent4, arg, { BackgroundTransparency = 1 }):Play()
    tweenService:Create(result4, arg, { BackgroundTransparency = 1 }):Play()
    tweenService:Create(result5, arg, { BackgroundTransparency = 1 }):Play()
    tweenService:Create(canvasGroup, arg, { GroupTransparency = 1 }):Play()
    tweenService:Create(uIScale, arg, { Scale = 0.84 }):Play()
  end
  requestCloseConfirmation = function()
    if flag6 or flag3 or not frame2.Parent then return end
    flag6 = true
    num9 += 1
    if bRG2.shellUI.cancelPanelCloseAnimation then bRG2.shellUI.cancelPanelCloseAnimation() end
    fn52()
    frame13.Visible = true
    parent4.Visible = true
    result4.Visible = bRG2.shellUI.InfoPanel.Visible
    result5.Visible = bRG2.shellUI.InfoHandle.Visible
    parent4.BackgroundTransparency = 1
    result4.BackgroundTransparency = 1
    result5.BackgroundTransparency = 1
    canvasGroup.GroupTransparency = 1
    uIScale.Scale = 0.92
    tweenService:Create(parent4, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), { BackgroundTransparency = 0.38 }):Play()
    if result4.Visible then
      tweenService:Create(result4, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), { BackgroundTransparency = 0.38 }):Play()
    end
    if result5.Visible then
      tweenService:Create(result5, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), { BackgroundTransparency = 0.32 }):Play()
    end
    tweenService:Create(canvasGroup, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), { GroupTransparency = 0 }):Play()
    tweenService:Create(uIScale, TweenInfo.new(0.22, Enum.EasingStyle.Back, Enum.EasingDirection.Out), { Scale = 1 }):Play()
  end
  fn(result7.Activated:Connect(dismissCloseConfirmation))
  fn(result6.Activated:Connect(function()
    if not flag6 or flag3 then return end
    flag6 = false
    closeHub(false)
  end))
  fn(frame2:GetPropertyChangedSignal("Position"):Connect(function()
    if flag6 then fn52() end
  end))
  fn(frame2:GetPropertyChangedSignal("AbsoluteSize"):Connect(function()
    if flag6 then fn52() end
  end))
  fn(bRG2.shellUI.closeButton.MouseButton1Click:Connect(function()
    if flag then
      pcall(function()
        if setclipboard then setclipboard(tbl.Texts.youtubeUrl) end
      end)
      if bRG2.showDiscordCopied then bRG2.showDiscordCopied() end
      return
    end
    requestCloseConfirmation()
  end))
  bRG2.shellUI.requestCloseConfirmation = requestCloseConfirmation
  bRG2.shellUI.dismissCloseConfirmation = dismissCloseConfirmation
end
bRG2.initializeCloseConfirmation()
bRG2.initializeCloseConfirmation = nil
local tbl18 = {
  active = false,
  moved = false,
  start = nil,
  startPos = nil,
  target = nil,
  lastPointer = nil,
  lastPointerAt = 0,
  velocity = Vector2.zero,
  inertia = false,
}
local value31 = nil
local num9 = 2
bRG2.clampDragPosition = function(arg, arg2)
  local currentCamera = workspace.CurrentCamera
  local vector22 = currentCamera and currentCamera.ViewportSize or Vector2.new(1920, 1080)
  local flag6 = flag and arg2 ~= true
  local hubW2 = flag6 and touchEnabled4 or hubW
  local hubH2 = flag6 and titleH or hubH
  local num10 = 8
  local sideHandleReserve = (not touchEnabled and not flag6) and (bRG2.shellUI.sideHandleReserve or 0) or 0
  local num11 = vector22.X * arg.X.Scale + arg.X.Offset
  local num12 = vector22.Y * arg.Y.Scale + arg.Y.Offset
  local num13 = math.max(num10, vector22.X - hubW2 - num10 - sideHandleReserve)
  local num14 = math.max(num10, vector22.Y - hubH2 - num10)
  num11 = math.clamp(num11, num10, num13)
  num12 = math.clamp(num12, num10, num14)
  return UDim2.new(arg.X.Scale, num11 - vector22.X * arg.X.Scale, arg.Y.Scale, num12 - vector22.Y * arg.Y.Scale)
end

local function fn50()
  frame3.Position = frame2.Position
  frame.Position = UDim2.new(frame2.Position.X.Scale, frame2.Position.X.Offset - 5, frame2.Position.Y.Scale, frame2.Position.Y.Offset - 5)
  if bRG2.shellUI.updateInfoLayout then bRG2.shellUI.updateInfoLayout(true) end
end
fn(frame2:GetPropertyChangedSignal("Position"):Connect(fn50))
fn(frame2:GetPropertyChangedSignal("AbsoluteSize"):Connect(fn50))
local currentCamera = workspace.CurrentCamera
if currentCamera then
  fn(currentCamera:GetPropertyChangedSignal("ViewportSize"):Connect(function()
    frame2.Position = bRG2.clampDragPosition(frame2.Position)
    if flag then
      position3 = bRG2.clampDragPosition(
        UDim2.new(frame2.Position.X.Scale, frame2.Position.X.Offset - num7, frame2.Position.Y.Scale, frame2.Position.Y.Offset),
        true
      )
    end
    fn50()
  end))
end
bRG2.beginHeaderDrag = function(arg, arg2)
  if arg.UserInputType == Enum.UserInputType.MouseButton1 or arg.UserInputType == Enum.UserInputType.Touch then
    if tbl18.active then return end
    if value31 then
      value31:Cancel()
      value31 = nil
    end
    local vector22 = Vector2.new(arg.Position.X, arg.Position.Y)
    tbl18.active = true
    tbl18.moved = false
    tbl18.start = vector22
    tbl18.startPos = frame2.Position
    tbl18.target = frame2.Position
    tbl18.lastPointer = vector22
    tbl18.lastPointerAt = os.clock()
    tbl18.velocity = Vector2.zero
    tbl18.inertia = false
    local v5
    v5 = arg.Changed:Connect(function()
      if arg.UserInputState == Enum.UserInputState.End then
        if v5 then v5:Disconnect() end
        local active = tbl18.active and not tbl18.moved
        tbl18.active = false
        if active then
          tbl18.target = nil
          tbl18.inertia = false
          if not arg2 then setHubMinimized(not flag) end
        elseif tbl18.moved then
          local num10 = math.max(0, os.clock() - tbl18.lastPointerAt)
          local num11 = tbl18.velocity * math.exp(-math.max(0, num10 - 0.06) * 18)
          local num12 = num11 * 0.045
          local touchEnabled5 = touchEnabled and 24 or 30
          if num12.Magnitude > touchEnabled5 then num12 = num12.Unit * touchEnabled5 end
          if num12.Magnitude < 2 then num12 = Vector2.zero end
          local position4 = frame2.Position
          local position5 = bRG2.clampDragPosition(UDim2.new(position4.X.Scale, position4.X.Offset + num12.X, position4.Y.Scale, position4.Y.Offset + num12.Y))
          if flag then
            position3 = bRG2.clampDragPosition(UDim2.new(position5.X.Scale, position5.X.Offset - num7, position5.Y.Scale, position5.Y.Offset), true)
          end
          tbl18.target = nil
          tbl18.inertia = false
          if num12.Magnitude >= 2 then
            value31 = tweenService:Create(frame2, TweenInfo.new(0.34, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), { Position = position5 })
            value31:Play()
            local value32 = value31
            fn(value32.Completed:Connect(function()
              if value31 == value32 then value31 = nil end
            end))
          end
        end
      end
    end)
    fn(v5)
  end
end
for index, item in ipairs({
  textButton,
  textLabel,
  bRG2.shellUI.subtitle,
  bRG2.shellUI.copyNotice,
  bRG2.shellUI.infoDragSurface,
}) do
  fn(item.InputBegan:Connect(bRG2.beginHeaderDrag))
end
fn(userInputService.InputChanged:Connect(function(arg)
  if not tbl18.active then return end
  if arg.UserInputType == Enum.UserInputType.MouseMovement or arg.UserInputType == Enum.UserInputType.Touch then
    local vector22 = Vector2.new(arg.Position.X, arg.Position.Y)
    local now = os.clock()
    local num10 = math.max(1 / 240, now - tbl18.lastPointerAt)
    local num11 = (vector22 - tbl18.lastPointer) / num10
    if num11.Magnitude > 2400 then num11 = num11.Unit * 2400 end
    tbl18.velocity = tbl18.velocity:Lerp(num11, 0.38)
    tbl18.lastPointer = vector22
    tbl18.lastPointerAt = now
    local num12 = vector22 - tbl18.start
    if num12.Magnitude >= num9 then tbl18.moved = true end
    if not tbl18.moved then return end
    local num13 = tbl18.startPos.X.Offset + num12.X
    local num14 = tbl18.startPos.Y.Offset + num12.Y
    tbl18.target = bRG2.clampDragPosition(UDim2.new(tbl18.startPos.X.Scale, num13, tbl18.startPos.Y.Scale, num14))
  end
end))
fn(runService.RenderStepped:Connect(function(arg)
  if not tbl18.active or not tbl18.target or flag3 then return end
  local num10 = 7
  local num11 = 1 - math.exp(-math.max(0, arg) * num10)
  frame2.Position = frame2.Position:Lerp(tbl18.target, num11)
end))
task.spawn(function()
  local now = os.clock()
  while getgenv().BRG == bRG2 and parent and parent.Parent and not bRG2.accessExpired do
    if os.time() >= bRG2.keyExpiresAt then
      bRG2.expireAccess()
      break
    end
    if bRG2.keyClient and bRG2.keyValue and os.clock() - now >= 180 then
      now = os.clock()
      local ok, result4 = pcall(function()
        return bRG2.keyClient.check_key(bRG2.keyValue)
      end)
      if ok and type(result4) == "table" then
        if result4.valid ~= true then
          local message = result4.error or result4.message
          if message == "KEY_EXPIRED" or message == "KEY_INVALIDATED" or message == "HWID_MISMATCH" then
            bRG2.expireAccess()
            break
          end
        end
      end
    end
    task.wait(0.25)
  end
end)

local function fn51(arg)
  if arg:IsA("TextLabel") or arg:IsA("TextButton") or arg:IsA("TextBox") then
    arg.Font = Enum.Font.Garamond
    if arg:GetAttribute("Young0xGenesisText") ~= true then
      arg:SetAttribute("Young0xGenesisText", true)
      if not arg.TextScaled then
        arg.TextSize += 1
      else
        local uITextSizeConstraint = arg:FindFirstChildWhichIsA("UITextSizeConstraint")
        if uITextSizeConstraint then uITextSizeConstraint.MaxTextSize += 1 end
      end
    end
    arg.TextStrokeTransparency = 1
  end
end
for index, item in ipairs(parent:GetDescendants()) do
  fn51(item)
end
fn(parent.DescendantAdded:Connect(function(arg)
  task.defer(function()
    if arg.Parent and getgenv().BRG == bRG2 then fn51(arg) end
  end)
end))
for key, value32 in pairs(tbl13) do
  value32.ScrollingEnabled = false
  value32.ScrollBarThickness = 0
end
local frame13 = Instance.new("Frame")
frame13.Name = "BlankContentMask"
frame13.Size = UDim2.new(1, 0, 1, -11)
frame13.BackgroundColor3 = colors.bg
frame13.BorderSizePixel = 0
frame13.Active = true
frame13.ZIndex = 900
frame13.Parent = frame7
local frame14 = Instance.new("Frame")
frame14.Name = "BlankContentBottomMask"
frame14.Size = UDim2.new(1, 0, 0, 22)
frame14.Position = UDim2.new(0, 0, 1, -22)
frame14.BackgroundColor3 = colors.bg
frame14.BorderSizePixel = 0
frame14.Active = true
frame14.ZIndex = 901
frame14.Parent = frame7
Instance.new("UICorner", frame14).CornerRadius = UDim.new(0, 11)
bRG2.shellUI.blankContentMask = frame13
bRG2.shellUI.blankContentBottomMask = frame14
bRG2.shellUI.readyTabs = {
  Inicio = true,
  Entrenar = true,
  ["Full Train"] = true,
  Rebirths = true,
  Rocks = true,
  Kills = true,
  Boss = true,
  ["Pet Shop"] = true,
  Recompensas = true,
  Ruleta = true,
  Regalos = true,
  ["Estadísticas"] = true,
  Perfiles = true,
  Rendimiento = true,
  Ajustes = true,
}
tbl17.Rocks.ScrollingEnabled = true
tbl17.Rocks.ScrollBarThickness = touchEnabled and 2 or 3
tbl17.Rocks.AutomaticCanvasSize = Enum.AutomaticSize.Y
for index, item in ipairs({ tbl17.Gifts, bRG2.profilePage, tbl17.Settings }) do
  item.ScrollingEnabled = true
  item.ScrollBarThickness = touchEnabled and 2 or 3
  item.AutomaticCanvasSize = Enum.AutomaticSize.Y
end
fn38("Inicio")
fn35()
bRG2.shellUI.moveToProtectedLayer = function(arg)
  local playerGui = arg and bRG2.shellUiRoot or localPlayer.PlayerGui
  if not playerGui or parent.Parent == playerGui then return end
  pcall(function()
    local _G2 = getgenv and getgenv() or _G
    local setidentity = _G2 and (_G2.setthreadidentity or _G2.setidentity)
    if type(setidentity) == "function" then setidentity(8) end
    parent.Parent = playerGui
  end)
end
bRG2.shellUI.moveToProtectedLayer(true)
fn(game:GetService("GuiService").MenuOpened:Connect(function()
  bRG2.shellUI.moveToProtectedLayer(false)
end))
fn(game:GetService("GuiService").MenuClosed:Connect(function()
  bRG2.shellUI.moveToProtectedLayer(true)
end))
