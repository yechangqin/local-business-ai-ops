# local-business-ai-ops

A production-oriented AI operations toolkit for local business content teams.

## Why this project
Most "AI代运营" projects stop at random prompts. This repo focuses on **repeatable delivery**:
- structured weekly workflow
- reusable templates
- client-facing output package
- measurable KPI loop

## Features
- Prompt templates for topic/script generation
- Weekly automation entry script (`scripts/weekly_run.ps1`)
- SOP + Architecture + Operations documentation
- Weekly report template for client communication

## Project Structure

```text
local-business-ai-ops/
├─ docs/
│  ├─ ARCHITECTURE.md
│  ├─ DELIVERY_SOP.md
│  └─ OPERATIONS.md
├─ examples/
│  ├─ client_profile_shanghai_hotpot.yaml
│  └─ weekly_report_sample.md
├─ scripts/
│  └─ weekly_run.ps1
├─ templates/
│  ├─ topic_prompt.md
│  ├─ script_prompt.md
│  ├─ client_offer.md
│  └─ weekly_report_template.md
├─ output/                 # generated weekly package (gitignored)
├─ .gitignore
└─ README.md
```

## Quick Start

```powershell
cd scripts
./weekly_run.ps1 -Industry 餐饮 -City 上海 -Audience "25-35岁上班族" -Persona "老板第一人称"
```

Output will be generated under `output/<timestamp>/`.

## Delivery Standard (recommended)
- Monday: topic pool + approval
- Tue-Wed: script package
- Thursday: publishing calendar + reply pack
- Friday: KPI weekly report + optimization actions

## Pricing Suggestion (RMB)
- Basic: ¥999 / month
- Standard: ¥1999 / month
- Pro: ¥3999 / month

## Roadmap
- [ ] Add model adapters (OpenAI/Gemini/Kimi) for one-click generation
- [ ] Add KPI parser from platform CSV exports
- [ ] Add auto report rendering (Markdown -> PDF)
- [ ] Add CRM sync for lead tracking

## License
MIT (add your preferred license if needed)
