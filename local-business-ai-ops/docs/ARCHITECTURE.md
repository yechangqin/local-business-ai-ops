# Architecture

## 1. Project Goal
Build a repeatable AI-powered operations pipeline for local-business content teams.

## 2. Pipeline
1. Input brief (industry/city/audience/persona)
2. Topic generation
3. Script generation
4. Publishing calendar generation
5. Reply template generation
6. Weekly report generation

## 3. Artifacts
- `templates/`: prompt templates and message templates
- `scripts/`: runnable automation entry points
- `output/<timestamp>/`: generated weekly package
- `docs/`: SOP, architecture, and operations docs

## 4. Quality Gates
- No unverifiable claims
- Every script includes explicit CTA
- Every weekly report includes KPI + next actions
- Deliverables should be client-ready (no raw brainstorming dump)
