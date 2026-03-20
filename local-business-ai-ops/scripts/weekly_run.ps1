param(
  [string]$Industry = "餐饮",
  [string]$City = "上海",
  [string]$Audience = "25-35岁上班族"
)

$timestamp = Get-Date -Format "yyyy-MM-dd_HHmm"
$outDir = Join-Path $PSScriptRoot "..\output\$timestamp"
New-Item -ItemType Directory -Force -Path $outDir | Out-Null

@"
# Weekly Run Params
- 行业: $Industry
- 城市: $City
- 客群: $Audience
- 时间: $(Get-Date)
"@ | Out-File -FilePath (Join-Path $outDir "run-info.md") -Encoding utf8

Copy-Item (Join-Path $PSScriptRoot "..\templates\topic_prompt.md") (Join-Path $outDir "01_topic_prompt.md")
Copy-Item (Join-Path $PSScriptRoot "..\templates\script_prompt.md") (Join-Path $outDir "02_script_prompt.md")

Write-Host "已生成本周执行目录: $outDir"
Write-Host "下一步：把 prompt 丢给模型批量产出内容。"
