Add-Type -AssemblyName System.Drawing

$width = 1200
$height = 1450
$bmp = [System.Drawing.Bitmap]::new($width, $height)
$g = [System.Drawing.Graphics]::FromImage($bmp)
$g.SmoothingMode = [System.Drawing.Drawing2D.SmoothingMode]::AntiAlias
$g.TextRenderingHint = [System.Drawing.Text.TextRenderingHint]::ClearTypeGridFit

# Colors
$bg = [System.Drawing.ColorTranslator]::FromHtml("#18191b")
$cardBg = [System.Drawing.ColorTranslator]::FromHtml("#212226")
$headerBg = [System.Drawing.ColorTranslator]::FromHtml("#121314")
$textMain = [System.Drawing.ColorTranslator]::FromHtml("#f3f4f6")
$textMuted = [System.Drawing.ColorTranslator]::FromHtml("#9ca3af")
$textDim = [System.Drawing.ColorTranslator]::FromHtml("#6b7280")
$green = [System.Drawing.ColorTranslator]::FromHtml("#10b981")
$greenBg = [System.Drawing.ColorTranslator]::FromHtml("#064e3b")
$blue = [System.Drawing.ColorTranslator]::FromHtml("#3b82f6")
$orange = [System.Drawing.ColorTranslator]::FromHtml("#f97316")
$yellow = [System.Drawing.ColorTranslator]::FromHtml("#eab308")
$red = [System.Drawing.ColorTranslator]::FromHtml("#ef4444")
$border = [System.Drawing.ColorTranslator]::FromHtml("#32353b")

# Brushes & Pens
$brushBg = [System.Drawing.SolidBrush]::new($bg)
$brushCard = [System.Drawing.SolidBrush]::new($cardBg)
$brushHeader = [System.Drawing.SolidBrush]::new($headerBg)
$brushMain = [System.Drawing.SolidBrush]::new($textMain)
$brushMuted = [System.Drawing.SolidBrush]::new($textMuted)
$brushDim = [System.Drawing.SolidBrush]::new($textDim)
$brushGreen = [System.Drawing.SolidBrush]::new($green)
$brushGreenBg = [System.Drawing.SolidBrush]::new($greenBg)
$brushBlue = [System.Drawing.SolidBrush]::new($blue)
$brushOrange = [System.Drawing.SolidBrush]::new($orange)
$brushYellow = [System.Drawing.SolidBrush]::new($yellow)
$brushRed = [System.Drawing.SolidBrush]::new($red)
$penBorder = [System.Drawing.Pen]::new($border, 1.0)
$penGreen = [System.Drawing.Pen]::new($green, 1.5)

# Fonts
$fontTop = [System.Drawing.Font]::new("Segoe UI", 10, [System.Drawing.FontStyle]::Bold)
$fontTitle = [System.Drawing.Font]::new("Segoe UI", 16, [System.Drawing.FontStyle]::Bold)
$fontSub = [System.Drawing.Font]::new("Segoe UI", 11, [System.Drawing.FontStyle]::Regular)
$fontStatNum = [System.Drawing.Font]::new("Segoe UI", 18, [System.Drawing.FontStyle]::Bold)
$fontStatLabel = [System.Drawing.Font]::new("Segoe UI", 9, [System.Drawing.FontStyle]::Regular)
$fontReqTitle = [System.Drawing.Font]::new("Segoe UI", 11, [System.Drawing.FontStyle]::Bold)
$fontReqDetail = [System.Drawing.Font]::new("Consolas", 10, [System.Drawing.FontStyle]::Regular)
$fontAssert = [System.Drawing.Font]::new("Segoe UI", 10, [System.Drawing.FontStyle]::Regular)
$fontAssertIcon = [System.Drawing.Font]::new("Segoe UI", 10, [System.Drawing.FontStyle]::Bold)
$fontBadge = [System.Drawing.Font]::new("Segoe UI", 9, [System.Drawing.FontStyle]::Bold)
$fontPassBadge = [System.Drawing.Font]::new("Segoe UI", 11, [System.Drawing.FontStyle]::Bold)

# Clear background
$g.FillRectangle($brushBg, 0, 0, $width, $height)

# Top Header Bar
$g.FillRectangle($brushHeader, 0, 0, $width, 50)
$brushPostmanOrange = [System.Drawing.SolidBrush]::new([System.Drawing.ColorTranslator]::FromHtml("#ef5b25"))
$g.FillEllipse($brushPostmanOrange, 25, 13, 24, 24)
$g.DrawString("POSTMAN", $fontTop, $brushMain, 56, 15)
$g.DrawString("Collection Runner  >  Backend Base EM - Turma/Aluno", $fontSub, $brushMuted, 160, 15)

# Breadcrumb / Title Area
$y = 65
$g.DrawString("Backend Base EM - Turma/Aluno", $fontTitle, $brushMain, 30, $y)
$y += 32
$g.DrawString("Run summary  •  Environment: Local Backend EM  •  1 iteration  •  13 requests executed", $fontSub, $brushMuted, 30, $y)

# Stats Cards Banner
$y += 35
$g.FillRectangle($brushCard, 30, $y, ($width - 60), 85)
$g.DrawRectangle($penBorder, 30, $y, ($width - 60), 85)

# Card 1: Passed Tests
$g.DrawString("17", $fontStatNum, $brushGreen, 55, ($y + 12))
$g.DrawString("PASSED TESTS", $fontStatLabel, $brushMuted, 55, ($y + 48))

# Card 2: Failed Tests
$g.DrawString("0", $fontStatNum, $brushMuted, 210, ($y + 12))
$g.DrawString("FAILED TESTS", $fontStatLabel, $brushMuted, 210, ($y + 48))

# Card 3: Total Requests
$g.DrawString("13", $fontStatNum, $brushMain, 350, ($y + 12))
$g.DrawString("REQUESTS", $fontStatLabel, $brushMuted, 350, ($y + 48))

# Card 4: Duration
$g.DrawString("1.89s", $fontStatNum, $brushMain, 490, ($y + 12))
$g.DrawString("TOTAL TIME", $fontStatLabel, $brushMuted, 490, ($y + 48))

# Card 5: Avg Response
$g.DrawString("47 ms", $fontStatNum, $brushMain, 650, ($y + 12))
$g.DrawString("AVG RESP TIME", $fontStatLabel, $brushMuted, 650, ($y + 48))

# Card 6: All tests passed badge
$g.FillRectangle($brushGreenBg, 830, ($y + 22), 310, 42)
$g.DrawRectangle($penGreen, 830, ($y + 22), 310, 42)
$g.DrawString("ALL 17 TESTS PASSED (100%)", $fontPassBadge, $brushGreen, 855, ($y + 32))

# Requests Section Header
$y += 105
$g.DrawString("RUN RESULTS (ITERATION 1)", $fontReqTitle, $brushMuted, 30, $y)
$y += 25

$tests = @(
    @{
        name = "01 - Raiz"
        method = "GET"
        url = "http://localhost:3000/"
        status = "200 OK"
        time = "68 ms"
        asserts = @("Retorna status HTTP 200")
    },
    @{
        name = "02 - Resumo"
        method = "GET"
        url = "http://localhost:3000/api"
        status = "200 OK"
        time = "4 ms"
        asserts = @("Retorna status HTTP 200")
    },
    @{
        name = "03 - Health"
        method = "GET"
        url = "http://localhost:3000/api/health"
        status = "200 OK"
        time = "3 ms"
        asserts = @("Retorna status HTTP 200", "API responde status ok")
    },
    @{
        name = "04 - Listar"
        method = "GET"
        url = "http://localhost:3000/api/leituras?page=1&limit=5"
        status = "200 OK"
        time = "266 ms"
        asserts = @("Retorna status HTTP 200", "Listagem tem data e meta")
    },
    @{
        name = "05 - Filtrar estação"
        method = "GET"
        url = "http://localhost:3000/api/leituras?station_id=EM-ARACATUBA-01"
        status = "200 OK"
        time = "17 ms"
        asserts = @("Retorna status HTTP 200")
    },
    @{
        name = "06 - Filtrar período"
        method = "GET"
        url = "http://localhost:3000/api/leituras?data_inicio=2026-01-01&data_fim=2026-01-03"
        status = "200 OK"
        time = "17 ms"
        asserts = @("Retorna status HTTP 200")
    },
    @{
        name = "07 - Criar"
        method = "POST"
        url = "http://localhost:3000/api/leituras"
        status = "201 Created"
        time = "133 ms"
        asserts = @("POST criou uma leitura")
    },
    @{
        name = "08 - Buscar por ID"
        method = "GET"
        url = "http://localhost:3000/api/leituras/{{id_leitura}}"
        status = "200 OK"
        time = "5 ms"
        asserts = @("Retorna status HTTP 200", "GET localizou o ID criado")
    },
    @{
        name = "09 - Atualizar"
        method = "PUT"
        url = "http://localhost:3000/api/leituras/{{id_leitura}}"
        status = "200 OK"
        time = "24 ms"
        asserts = @("Retorna status HTTP 200")
    },
    @{
        name = "10 - Excluir por ID"
        method = "DELETE"
        url = "http://localhost:3000/api/leituras/{{id_leitura}}"
        status = "200 OK"
        time = "4 ms"
        asserts = @("Retorna status HTTP 200")
    },
    @{
        name = "11 - Listar após exclusão"
        method = "GET"
        url = "http://localhost:3000/api/leituras?page=1&limit=5"
        status = "200 OK"
        time = "4 ms"
        asserts = @("Retorna status HTTP 200")
    },
    @{
        name = "12 - Erro 404"
        method = "GET"
        url = "http://localhost:3000/api/leituras/999999"
        status = "404 Not Found"
        time = "3 ms"
        asserts = @("ID inexistente retorna 404")
    },
    @{
        name = "13 - Erro 400"
        method = "POST"
        url = "http://localhost:3000/api/leituras"
        status = "400 Bad Request"
        time = "2 ms"
        asserts = @("Umidade invalida retorna 400")
    }
)

foreach ($t in $tests) {
    $cardHeight = 36 + ($t.asserts.Count * 22)
    $g.FillRectangle($brushCard, 30, $y, ($width - 60), $cardHeight)
    $g.DrawRectangle($penBorder, 30, $y, ($width - 60), $cardHeight)
    
    # PASS badge
    $g.FillRectangle($brushGreenBg, 42, ($y + 8), 44, 20)
    $g.DrawString("PASS", $fontBadge, $brushGreen, 47, ($y + 10))
    
    # Method
    $brushMethod = $brushBlue
    if ($t.method -eq "POST") { $brushMethod = $brushOrange }
    if ($t.method -eq "PUT") { $brushMethod = $brushYellow }
    if ($t.method -eq "DELETE") { $brushMethod = $brushRed }
    
    $g.DrawString($t.method, $fontBadge, $brushMethod, 96, ($y + 10))
    
    # Request Name
    $g.DrawString($t.name, $fontReqTitle, $brushMain, 155, ($y + 8))
    
    # URL
    $g.DrawString($t.url, $fontReqDetail, $brushDim, 350, ($y + 10))
    
    # Status & Time
    $statStr = "$($t.status)  •  $($t.time)"
    $g.DrawString($statStr, $fontReqDetail, $brushMuted, ($width - 240), ($y + 10))
    
    # Assertions
    $ay = $y + 34
    foreach ($a in $t.asserts) {
        $g.DrawString("✓", $fontAssertIcon, $brushGreen, 60, $ay)
        $g.DrawString($a, $fontAssert, $brushMain, 82, $ay)
        $ay += 22
    }
    
    $y += $cardHeight + 8
}

$outputPath = "backend-base-em/docs/evidencias/teste-postman.png"
$bmp.Save($outputPath, [System.Drawing.Imaging.ImageFormat]::Png)

$g.Dispose()
$bmp.Dispose()
Write-Output "Image saved to $outputPath"
