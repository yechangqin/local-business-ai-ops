[CmdletBinding()]
param(
  [Parameter(Mandatory=$false)]
  [ValidateNotNullOrEmpty()]
  [string]$Industry = "餐饮",

  [Parameter(Mandatory=$false)]
  [ValidateNotNullOrEmpty()]
  [string]$City = "上海",

  [Parameter(Mandatory=$false)]
  [ValidateNotNullOrEmpty()]
  [string]$Audience = "25-35岁上班族",

  [Parameter(Mandatory=$false)]
  [ValidateNotNullOrEmpty()]
  [string]$Persona = "老板第一人称",

  [switch]$InitOnly
)

Set-StrictMode -Version Latest
$ErrorActionPreference = "Stop"

$projectRoot = Resolve-Path (Join-Path $PSScriptRoot "..")
$timestamp = Get-Date -Format "yyyy-MM-dd_HHmm"
$outDir = Join-Path $projectRoot "output\$timestamp"
New-Item -ItemType Directory -Force -Path $outDir | Out-Null

$meta = [ordered]@{
  timestamp = (Get-Date).ToString("s")
  industry = $Industry
  city = $City
  audience = $Audience
  persona = $Persona
  run_mode = $(if($InitOnly){"init_only"} else {"full_package"})
}

$meta | ConvertTo-Json -Depth 3 | Out-File -FilePath (Join-Path $outDir "run-meta.json") -Encoding utf8

@"
# Weekly Run Parameters
- 行业: $Industry
- 城市: $City
- 客群: $Audience
- 人设: $Persona
- 时间: $(Get-Date)
"@ | Out-File -FilePath (Join-Path $outDir "00_run_info.md") -Encoding utf8

# Copy prompt templates
Copy-Item (Join-Path $projectRoot "templates\topic_prompt.md") (Join-Path $outDir "01_topic_prompt.md") -Force
Copy-Item (Join-Path $projectRoot "templates\script_prompt.md") (Join-Path $outDir "02_script_prompt.md") -Force
Copy-Item (Join-Path $projectRoot "templates\weekly_report_template.md") (Join-Path $outDir "03_weekly_report_template.md") -Force

# Create structured placeholders for downstream editing or model output
"选题标题,目标人群,脚本要点,推荐发布时间" | Out-File -FilePath (Join-Path $outDir "topic_ideas.csv") -Encoding utf8
@"
# Draft Scripts

> 在这里粘贴模型生成的脚本结果（建议每条含：标题3个、30-60秒口播、封面文案、CTA）
"@ | Out-File -FilePath (Join-Path $outDir "draft_scripts.md") -Encoding utf8

@"
# Publishing Calendar

| 日期 | 发布时间 | 内容主题 | 目标动作 |
|---|---|---|---|
| 周一 | 12:30 | 示例主题A | 评论关键词 |
"@ | Out-File -FilePath (Join-Path $outDir "publishing_calendar.md") -Encoding utf8

@"
# Engagement Reply Pack

## 评论回复模板
- 模板1：...

## 私信回复模板
- 模板1：...
"@ | Out-File -FilePath (Join-Path $outDir "engagement_replies.md") -Encoding utf8

if (-not $InitOnly) {
  @"
# 本周执行建议
1. 使用 01/02 prompt 批量生成内容
2. 优先发布“痛点+案例”类型
3. 周五回填 KPI 到 weekly_report_template
"@ | Out-File -FilePath (Join-Path $outDir "next_actions.md") -Encoding utf8
}

Write-Host "[OK] Weekly package generated: $outDir"
Write-Host "[TIP] Next: run your model with 01/02 prompts, then fill KPI report."