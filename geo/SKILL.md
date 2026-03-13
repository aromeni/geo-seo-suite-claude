---
name: geo
description: >
  GEO-first SEO analysis tool. Optimizes websites for AI-powered search engines
  (ChatGPT, Claude, Perplexity, Gemini, Google AI Overviews, Brave Search, DuckDuckGo AI,
  Amazon AI Shopping) while maintaining traditional SEO foundations. Performs full GEO
  audits, citability scoring, AI crawler analysis, llms.txt generation, brand mention
  scanning with sentiment and recency, platform-specific optimization, schema markup,
  technical SEO, content quality (E-E-A-T with YMYL classification), and client-ready
  GEO report generation. Use when user says "geo", "seo", "audit", "AI search",
  "AI visibility", "optimize", "citability", "llms.txt", "schema", "brand mentions",
  "GEO report", or any URL for analysis.
---

# GEO-SEO Analysis Tool — Claude Code Skill (March 2026)

> **Philosophy:** GEO-first, SEO-supported. AI search is eating traditional search.
> This tool optimizes for where traffic is going, not where it was.

---

## Quick Reference

| Command | What It Does |
|---------|-------------|
| `/geo audit <url>` | Full GEO + SEO audit: Technical first, then 4 agents in parallel |
| `/geo page <url>` | Deep single-page GEO analysis |
| `/geo citability <url>` | Score content for AI citation readiness |
| `/geo crawlers <url>` | Check AI crawler access (robots.txt — 12 crawlers including GPTBot, ClaudeBot, PerplexityBot) |
| `/geo llmstxt <url>` | Analyze or generate llms.txt file |
| `/geo brands <url>` | Scan brand mentions with sentiment polarity and recency decay |
| `/geo platforms <url>` | Platform optimization: Google AIO, ChatGPT, Perplexity, Gemini, Bing Copilot, Amazon AI*, Brave, DDG |
| `/geo schema <url>` | Detect, validate (with JS-injection penalties), and generate structured data |
| `/geo technical <url>` | Technical SEO + PageSpeed Insights field data + SSR framework detection |
| `/geo content <url>` | Content quality, E-E-A-T, and YMYL-adaptive scoring |
| `/geo report <url>` | Generate client-ready GEO deliverable |
| `/geo report-pdf <url>` | Generate professional PDF report with charts and scores |
| `/geo quick <url>` | 90-second GEO visibility snapshot (5 key checks, no subagents) |

*Amazon AI scored only for product/review/shopping content.

---

## Market Context (Why GEO Matters)

| Metric | Value | Source |
|--------|-------|--------|
| GEO services market (2025) | $850M-$886M | Yahoo Finance / Superlines |
| Projected GEO market (2031) | $7.3B (34% CAGR) | Industry analysts |
| AI-referred sessions growth | +527% (Jan-May 2025) | SparkToro |
| AI traffic conversion vs organic | 4.4x higher | Industry data |
| Google AI Overviews reach | 1.5B users/month, 200+ countries | Google |
| ChatGPT weekly active users | 900M+ | OpenAI |
| Perplexity monthly queries | 500M+ | Perplexity |
| Brave Search monthly queries | ~100M+ | Brave |
| DuckDuckGo monthly queries | ~3B+ | DuckDuckGo |
| Gartner: search traffic drop by 2028 | -50% | Gartner |
| Marketers investing in GEO | Only 23% | Industry surveys |
| Brand mentions vs backlinks for AI | 3x stronger correlation | Ahrefs (Dec 2025) |

---

## Orchestration Logic

### Full Audit (`/geo audit <url>`)

**Phase 1: Discovery (Sequential)**
1. Fetch homepage HTML (WebFetch)
2. Detect business type (SaaS, Local, E-commerce, Publisher, Agency, Healthcare/Medical, Financial, Legal, Other)
3. Extract key pages from sitemap.xml or internal links (up to 50 pages)
4. Note detected business type — passed as context to subagents, especially `geo-content` for YMYL classification

**Phase 2a: Technical Analysis First (Sequential — REQUIRED before Phase 2b)**

Run `geo-technical` alone and wait for it to complete before launching other agents. Its output provides two values that gate the AI Visibility Score:
- **SSR Severity rating** (CRITICAL / HIGH / MEDIUM / LOW)
- **Crawler Access Score** (0-100)

These are passed as context to `geo-ai-visibility` in Phase 2b so cross-agent score capping can be applied.

| Subagent | File | Responsibility |
|----------|------|---------------|
| geo-technical | `agents/geo-technical.md` | Technical SEO, Core Web Vitals (PSI API + HTML), SSR detection, crawlability, security |

**Phase 2b: Parallel Analysis (Launch remaining 4 subagents simultaneously)**

Pass the following context from Phase 2a to `geo-ai-visibility`:
- `technical_ssr_severity: [CRITICAL/HIGH/MEDIUM/LOW]`
- `technical_crawler_access_score: [0-100]`

Pass `business_type` from Phase 1 to `geo-content` to inform YMYL classification.

| Subagent | File | Responsibility |
|----------|------|---------------|
| geo-ai-visibility | `agents/geo-ai-visibility.md` | Citability, AI crawlers, llms.txt, brand mentions (with sentiment + recency), cross-agent cap |
| geo-platform-analysis | `agents/geo-platform-analysis.md` | Platform optimization: Google AIO, ChatGPT, Perplexity, Gemini, Bing Copilot, Amazon AI*, Brave, DDG |
| geo-content | `agents/geo-content.md` | Content quality, E-E-A-T, YMYL classification, readability, AI content detection |
| geo-schema | `agents/geo-schema.md` | Schema detection, validation (with JS-injection penalties), sameAs URL validity |

*Amazon AI scored only for product/review/shopping content; N/A for all other types.

**Phase 3: Synthesis (Sequential)**
1. Collect all subagent reports
2. Verify cross-agent caps were applied (confirm AI Visibility final score reflects Technical SSR/crawler findings)
3. Calculate composite GEO Score (0-100) — see scoring methodology below
4. Generate prioritized action plan with effort:impact ratios
5. Output client-ready report

**Error Handling:**
- If a subagent times out (>30s): note failure in report, exclude from composite score, flag as "incomplete — rerun `geo-[component] <url>`"
- If WebFetch is rate-limited or blocked: note "rate-limited — result may be partial" and continue with available data; do not fabricate results
- If Phase 2a (geo-technical) fails: launch Phase 2b anyway but flag in geo-ai-visibility output that cross-agent caps could not be applied

### Scoring Methodology

| Category | Weight | Measured By | Dependencies |
|----------|--------|-------------|-------------|
| AI Citability & Visibility | 25% | Passage scoring (with recency/sentiment), AI crawler access, llms.txt | **Capped by Technical score** — CRITICAL SSR → max 35; HIGH SSR → max 55; Crawler Access <40 → max 50 |
| Brand Authority Signals | 20% | Mentions on Reddit, YouTube, Wikipedia, LinkedIn (adjusted for sentiment and recency decay) | None |
| Content Quality & E-E-A-T | 20% | E-E-A-T signals, original data, author credentials | **YMYL-adaptive**: Trustworthiness raised to 25% and Freshness to 15% for YMYL-Critical content (effective weight within the 20% allocation) |
| Technical Foundations | 15% | SSR (PSI API + HTML), Core Web Vitals, crawlability, mobile, security | **Gates AI Visibility cap** — run first in all full audits |
| Structured Data | 10% | Schema completeness (with JS-injection penalties), JSON-LD validation, sameAs URL validity | None |
| Platform Optimization | 10% | 8 platforms: Google AIO, ChatGPT, Perplexity, Gemini, Bing Copilot, Amazon AI*, Brave, DDG | Amazon AI scored only for product/shopping pages |

**Important scoring notes:**
- The Technical score is not just a component — it actively **caps** the AI Visibility score via cross-agent logic. A site with CRITICAL SSR issues cannot score above 35 on AI Visibility regardless of content quality or brand strength, because AI crawlers cannot access the page.
- Content Quality weight is **effective**, not nominal, for YMYL content. A YMYL-Critical page audited by `geo-content` has its internal weights shifted (Trustworthiness 25%, Freshness 15%), which concentrates the overall 20% allocation heavily on trust and currency signals.
- Platform Optimization average excludes N/A platforms (Amazon AI is N/A for non-product content).

---

## Business Type Detection

Analyze homepage for patterns. **Business type is passed as context to `geo-content` to pre-inform YMYL classification (Step 1b).**

| Type | Signals | YMYL Level | Key Schema |
|------|---------|-----------|-----------|
| **SaaS** | Pricing page, "Sign up", "Free trial", "/app", "/dashboard", API docs | Non-YMYL | SoftwareApplication, Organization |
| **Local Service** | Phone number, address, "Near me", Google Maps embed, service area | Non-YMYL | LocalBusiness, PostalAddress |
| **E-commerce** | Product pages, cart, "Add to cart", price elements, product schema | Non-YMYL (YMYL-Medium for safety/medical products) | Product, Offer, AggregateRating |
| **Publisher** | Blog, articles, bylines, publication dates, article schema | Varies by topic — assess per-page | Article, Person, NewsArticle |
| **Agency** | Portfolio, case studies, "Our services", client logos, testimonials | Non-YMYL | Organization, Service |
| **Healthcare / Medical** | Medical terminology, symptoms/treatments, "consult your doctor" disclaimers, `.health` domain | **YMYL-Critical** | MedicalOrganization, Physician, MedicalCondition |
| **Financial Services** | "Investment", interest rates, "APY", "not financial advice" disclaimers, financial product pages | **YMYL-Critical** | FinancialProduct, Organization, LoanOrCredit |
| **Legal** | "Not legal advice", attorney/law firm signals, case citations, jurisdiction references | **YMYL-Critical** | Attorney, LegalService, Organization |
| **News / Journalism** | Breaking news, bylined reporting, publication timestamps, wire service attribution | **YMYL-High** | NewsArticle, Person, Organization |
| **Government / Civic** | `.gov` TLD, official seals, government service descriptions, legislative content | **YMYL-High** | GovernmentOrganization, GovernmentService |
| **Other** | Default — apply general GEO best practices | Non-YMYL unless content signals otherwise | Organization |

**Type-specific adjustments:**
- **Healthcare/Financial/Legal**: Pre-flag as YMYL-Critical to `geo-content`; Trustworthiness and Freshness weights are elevated automatically
- **SaaS**: Prioritise SoftwareApplication schema and comparison page strategy; Amazon AI scored as N/A
- **E-commerce**: Prioritise Product schema, review aggregation, and Amazon AI Shopping platform score
- **Publisher**: YMYL level determined per-page by `geo-content` based on article topic, not site type
- **Local**: Prioritise LocalBusiness schema, Google Business Profile, and NAP consistency across platforms

---

## Architecture: Skills vs Agents

This tool has two layers:

**Skills** (`skills/` directory) — invoked directly by slash commands (e.g., `/geo citability`). Each skill is a focused, standalone analysis that can be run independently without the full audit pipeline.

**Agents** (`agents/` directory) — used only during `/geo audit`. Agents are subprocesses that run the full analysis logic in parallel. Each agent bundles one or more skills and produces a report section for the composite audit.

Use a **skill** directly when you need a single focused output fast. Use `/geo audit` when you need the full cross-agent composite score with capping and synthesis.

### Sub-Skills (10 Specialized Components)

| # | Skill | Directory | Purpose | Invoked by |
|---|-------|-----------|---------|-----------|
| 1 | geo-audit | `skills/geo-audit/` | Full audit orchestration and scoring | `/geo audit` |
| 2 | geo-citability | `skills/geo-citability/` | Passage-level AI citation readiness | `/geo citability` or via geo-ai-visibility agent |
| 3 | geo-crawlers | `skills/geo-crawlers/` | AI crawler access and robots.txt (12 crawlers) | `/geo crawlers` or via geo-ai-visibility agent |
| 4 | geo-llmstxt | `skills/geo-llmstxt/` | llms.txt analysis and generation | `/geo llmstxt` or via geo-ai-visibility agent |
| 5 | geo-brand-mentions | `skills/geo-brand-mentions/` | Brand presence with sentiment + recency scoring | `/geo brands` or via geo-ai-visibility agent |
| 6 | geo-platform-optimizer | `skills/geo-platform-optimizer/` | 8-platform AI search optimization | `/geo platforms` or via geo-platform-analysis agent |
| 7 | geo-schema | `skills/geo-schema/` | Schema detection, JS-penalty scoring, sameAs validity | `/geo schema` or via geo-schema agent |
| 8 | geo-technical | `skills/geo-technical/` | Technical SEO + PSI field data + SSR detection | `/geo technical` or via geo-technical agent |
| 9 | geo-content | `skills/geo-content/` | E-E-A-T + YMYL classification + freshness | `/geo content` or via geo-content agent |
| 10 | geo-report | `skills/geo-report/` | Client-ready deliverable generation | `/geo report` |

### Agents (5 Workers — used in `/geo audit` only)

| Agent | File | Phase | Skills Bundled |
|-------|------|-------|---------------|
| geo-technical | `agents/geo-technical.md` | **2a (first, sequential)** | geo-technical |
| geo-ai-visibility | `agents/geo-ai-visibility.md` | 2b (parallel) — requires Technical output | geo-citability, geo-crawlers, geo-llmstxt, geo-brand-mentions |
| geo-platform-analysis | `agents/geo-platform-analysis.md` | 2b (parallel) | geo-platform-optimizer |
| geo-content | `agents/geo-content.md` | 2b (parallel) — receives business_type from Phase 1 | geo-content |
| geo-schema | `agents/geo-schema.md` | 2b (parallel) | geo-schema |

---

## Output Files

All commands generate structured output in the current working directory:

| Command | Output File | Notes |
|---------|------------|-------|
| `/geo audit` | `GEO-AUDIT-REPORT.md` | Full composite report with all 5 agent sections |
| `/geo page` | `GEO-PAGE-ANALYSIS.md` | Single-page deep analysis |
| `/geo citability` | `GEO-CITABILITY-SCORE.md` | Passage-level citability scores |
| `/geo crawlers` | `GEO-CRAWLER-ACCESS.md` | 12-crawler access matrix |
| `/geo llmstxt` | `llms.txt` | Ready to deploy at domain root |
| `/geo brands` | `GEO-BRAND-MENTIONS.md` | Sentiment + recency adjusted scores |
| `/geo platforms` | `GEO-PLATFORM-OPTIMIZATION.md` | 8-platform scores (N/A platforms excluded from average) |
| `/geo schema` | `GEO-SCHEMA-REPORT.md` + JSON-LD files | Schema report + generated templates as separate `.json` files |
| `/geo technical` | `GEO-TECHNICAL-AUDIT.md` | Includes PSI field data if available |
| `/geo content` | `GEO-CONTENT-ANALYSIS.md` | YMYL level and weight table used are shown prominently |
| `/geo report` | `GEO-CLIENT-REPORT.md` | Presentation-ready client deliverable |
| `/geo report-pdf` | `GEO-REPORT.pdf` | Professional PDF with charts (requires prior audit run) |
| `/geo quick` | Inline only (no file saved) | 5-check snapshot, ~90 seconds |

---

## PDF Report Generation

The `/geo report-pdf <url>` command generates a professional, branded PDF report:

### How It Works
1. Run the full audit or individual analyses first
2. Collect all scores and findings into a JSON structure
3. Execute the PDF generator: `python3 scripts/generate_pdf_report.py data.json GEO-REPORT.pdf`
   (Run from the `geo-seo-claude-main` directory, or use the absolute path to the scripts folder)

### What the PDF Includes
- **Cover page** with GEO score gauge visualization
- **Score breakdown** with color-coded bar charts
- **AI Platform Readiness** dashboard with horizontal bar chart
- **Crawler Access** status table with color-coded Allow/Block
- **Key Findings** categorized by severity (Critical/High/Medium/Low)
- **Prioritized Action Plan** (Quick Wins, Medium-Term, Strategic)
- **Methodology & Glossary** appendix

### Workflow
1. First run `/geo audit <url>` to collect all data
2. Then run `/geo report-pdf <url>` to generate the PDF
3. The tool will compile audit data into JSON, then generate the PDF
4. Output: `GEO-REPORT.pdf` in the current directory

---

## Quality Gates

- **Crawl limit:** Max 50 pages per audit (focus on quality over quantity)
- **Timeout:** 30 seconds per page fetch; if a fetch times out, note the failure and continue — do not retry indefinitely
- **Rate limiting:** 1-second delay between sequential page fetches (applies to page crawling in Phase 1, not to subagent launches)
- **Robots.txt:** Always fetch and respect before crawling any pages
- **Duplicate detection:** Skip pages with >80% content similarity to already-crawled pages
- **Subagent failure:** If a subagent fails or times out, exclude its score from the composite and flag the component as "incomplete — rerun `geo-[component] <url>`" in the report
- **WebFetch blocked:** If rate-limited or access denied, note "result may be partial due to access restrictions" — never fabricate data for blocked resources

---

## /geo quick — Rapid Visibility Snapshot

The `/geo quick <url>` command runs 5 targeted checks without launching subagents. Produces an inline summary only (no output file). Runs in approximately 90 seconds.

**The 5 checks (sequential, all via WebFetch + Bash):**

1. **AI Crawler Access** — Fetch `/robots.txt`, check if GPTBot, ClaudeBot, and PerplexityBot are allowed or blocked. Report: Allowed / Blocked / Unknown for each.

2. **Server-Side Rendering** — Fetch target URL raw HTML. Check if body content is present without JS execution. Apply framework detection table (Next.js, SvelteKit, etc.). Report: LOW / MEDIUM / HIGH / CRITICAL.

3. **llms.txt Presence** — Fetch `/llms.txt`. Report: Present (valid) / Present (malformed) / Absent.

4. **Schema Presence** — Check raw HTML for `<script type="application/ld+json">`. Report: types found (e.g., Organization, Article) or "None detected". Check if server-rendered or suspect JS-injected.

5. **Wikipedia Entity Check** — Run Wikipedia API call for the brand name. Report: Direct article found / Disambiguation only / Not found.

**Quick Score (0-100):**
| Check | Points |
|---|---|
| AI crawlers: all 3 allowed | 25 |
| SSR: LOW/MEDIUM severity | 25 (0 for CRITICAL) |
| llms.txt: present and valid | 15 |
| Schema: Organization present (server-rendered) | 20 |
| Wikipedia: direct article found | 15 |

**Output format:**
```
## GEO Quick Snapshot — [URL]

| Check | Result | Points |
|---|---|---|
| AI Crawler Access | [GPTBot: ✓ ClaudeBot: ✓ PerplexityBot: ✗] | [X]/25 |
| Server-Side Rendering | [LOW/MEDIUM/HIGH/CRITICAL] | [X]/25 |
| llms.txt | [Present/Absent] | [X]/15 |
| Schema Markup | [Types found or None] | [X]/20 |
| Wikipedia Entity | [Found/Disambiguation/Not Found] | [X]/15 |

**Quick Score: [X]/100**

Top 3 immediate actions:
1. [Most impactful fix]
2. [Second fix]
3. [Third fix]

For a full audit: /geo audit [URL]
```

---

## Quick Start Examples

```
# Full GEO audit of a website
/geo audit https://example.com

# Check if AI bots can see your site
/geo crawlers https://example.com

# Score a specific page for AI citability
/geo citability https://example.com/blog/best-article

# Generate an llms.txt file for your site
/geo llmstxt https://example.com

# Get a 90-second visibility snapshot
/geo quick https://example.com

# Generate a client-ready report
/geo report https://example.com
```
