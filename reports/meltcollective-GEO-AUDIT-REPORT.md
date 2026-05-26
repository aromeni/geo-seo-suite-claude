# GEO Audit Report — meltcollective.co.uk
**Date:** 13 March 2026
**Audited by:** /geo audit (GEO-SEO Suite for Claude Code)
**Pages analysed:** Homepage, /services, /ethics, /contact, /melt_partners

---

## GEO Score: 34/100 — Needs Attention

> Critical AI readiness issues require immediate action. Competitors are likely capturing the AI search traffic this brand should own.

| Component | Score | Weight | Contribution |
|---|---|---|---|
| AI Citability & Visibility | 35/100 | 25% | 8.75 |
| Brand Authority Signals | 28/100 | 20% | 5.60 |
| Content Quality & E-E-A-T | 49/100 | 20% | 9.80 |
| Technical Foundations | 45/100 | 15% | 6.75 |
| Structured Data | 5/100 | 10% | 0.50 |
| Platform Optimization | 27/100 | 10% | 2.70 |
| **Overall GEO Score** | **34/100** | | |

**Cross-agent cap applied:** Technical Crawler Access Score = 10/100 (no robots.txt). Rule: Crawler Access <40 → AI Visibility capped at 50. AI Visibility raw score was 35 — already under cap. No additional reduction applied.

**SSR Severity: LOW** — Site is fully server-rendered. All content present in raw HTML. No cap applied to AI Visibility from SSR.

---

## Executive Summary

Melt Collective is a London-based collective of 7 independent data science professionals with a credible enterprise client roster (BBC, ITV, Google, Netflix, Sainsbury's, The Economist) and 18 specialist services. The underlying business is strong. The website is not.

The GEO Score of **34/100** reflects near-total absence of AI discoverability infrastructure — not a failure of the business itself. The site has zero structured data, no robots.txt, no sitemap, no meta descriptions, no canonical tags, no privacy policy, and no llms.txt. The single biggest positive finding is that the site is **fully server-rendered** — all content is present in raw HTML and immediately parseable by AI crawlers. This is a strong foundation to build from.

**Top 3 priorities:**
1. Add JSON-LD schema (Organization + Person × 7 + Service × 18) — single highest-leverage action
2. Create robots.txt + sitemap.xml — unblocks all search engine and AI crawler discovery pathways
3. Add meta descriptions + canonical tags + Open Graph tags to every page

Addressing the quick wins alone could push the GEO Score to approximately **55–60/100** within 60–90 days of indexing.

---

## AI Visibility Dashboard

| AI Platform | Readiness | Key Gap | Priority Action |
|---|---|---|---|
| Google AI Overviews | 28/100 | No schema, no FAQ, no author credentials | Organization + Person JSON-LD on homepage |
| ChatGPT Web Search | 27/100 | No sitemap submitted to Bing, no IndexNow | Create robots.txt + sitemap.xml, submit to Bing Webmaster |
| Perplexity AI | 24/100 | No direct-answer content, no Wikipedia, no blog | Write 3 long-form direct-answer service articles |
| Google Gemini | 22/100 | No Knowledge Panel, no Google Business Profile | Claim and verify Google Business Profile with full NAP |
| Bing Copilot | 27/100 | Same Bing-index gaps as ChatGPT | Submit sitemap to Bing, add LocalBusiness schema |
| Brave Search | 34/100 | No meta descriptions, no OG tags | Add meta tags and Open Graph to all pages |
| DuckDuckGo AI | 27/100 | Bing-backed, same root gaps | Bing Webmaster Tools submission |

---

## Section 1: Technical Foundations — 45/100

| Category | Score | Max | Status |
|---|---|---|---|
| Crawlability | 3 | 15 | FAIL |
| Indexability | 4 | 12 | FAIL |
| Security | 5 | 10 | WARN |
| URL Structure | 5 | 8 | WARN |
| Mobile Optimisation | 3 | 10 | FAIL |
| Core Web Vitals (est.) | 6 | 15 | WARN |
| Server-Side Rendering | 13 | 15 | PASS |
| Page Speed & Server | 6 | 15 | WARN |
| **Total** | **45** | **100** | |

### Critical Technical Issues

| # | Issue | Impact |
|---|---|---|
| 1 | robots.txt missing (404) | No crawler control, no sitemap declaration |
| 2 | sitemap.xml missing (404) | No machine-readable content map |
| 3 | No canonical tags | Duplicate content risk — /index.html vs / |
| 4 | No meta descriptions | AI engines cannot use authoritative page summaries |
| 5 | No viewport meta tag | Google mobile-first indexing penalty |
| 6 | No privacy policy | Likely UK GDPR non-compliance — Google Analytics active |
| 7 | No IndexNow | No instant indexing signal to Bing/ChatGPT |

### Key Positive: Full Server-Side Rendering ✓

All content is present in raw HTML. AI crawlers (GPTBot, ClaudeBot, PerplexityBot) receive fully-rendered, parseable content on every request. This is the most important positive finding in the audit.

---

## Section 2: AI Citability & Visibility — 35/100

| Page | Citability Score |
|---|---|
| Homepage | 59/100 |
| Services | 31/100 |
| Ethics | 59/100 |
| **Overall** | **50/100** |

### AI Crawler Access

| Signal | Status |
|---|---|
| robots.txt | ABSENT (404) |
| llms.txt | ABSENT (404) |
| llms-full.txt | ABSENT (404) |
| GPTBot, ClaudeBot, PerplexityBot | Allowed by default (unintentional) |

### Top 3 Most Citable Passages

**1 — Collective Model (Homepage)**
> "Melt is a group of independent data science professionals who work together to solve your problems and deliver your projects. Our members are data scientists, economists, technologists, researchers and statisticians, each with over 20 years' experience."

**2 — Ethics Framework**
> "In all our working practices we aim to follow the guidelines given in A Guide for Ethical Data Science, as published by the Royal Statistical Society. Our five principles: Avoid harm; Support the value of data science for society; Apply and maintain professional competence; Seek to preserve or increase trustworthiness; Maintain accountability and oversight."

**3 — Client Portfolio**
> "Clients include Google, Facebook, Netflix, Sainsbury's, Unilever, BBC, ITV, The Economist, and Wikipedia."

---

## Section 3: Brand Authority — 28/100

| Platform | Status | Score |
|---|---|---|
| Wikipedia | No article | 0/30 |
| LinkedIn (Company) | Confirmed | 12/20 |
| GitHub | meltgroup org, 1 repo | 5/15 |
| Crunchbase | No profile | 0/10 |
| Reddit | No mentions | 0/10 |
| YouTube | No presence | 0/10 |
| **Total** | | **28/100** |

---

## Section 4: Content Quality & E-E-A-T — 49/100

**YMYL Classification: Non-YMYL**

| Dimension | Score |
|---|---|
| Experience | 11/25 |
| Expertise | 13/25 |
| Authoritativeness | 17/25 |
| Trustworthiness | 8/25 |
| **Total** | **49/100** |

**Strongest signal:** ~60 named enterprise clients across media, FMCG, tech, and public sector.

**Weakest signal:** No privacy policy, no dates on any content, no case studies, no consultant credential pages.

---

## Section 5: Structured Data — 5/100

**The site has zero structured data of any kind.**

| Schema | Status | Priority |
|---|---|---|
| Organization | MISSING | Critical |
| Person (×7) | MISSING | Critical |
| Service (×18) | MISSING | High |
| WebSite + SearchAction | MISSING | High |
| LocalBusiness | MISSING | Medium |
| FAQPage | MISSING | Medium |
| Open Graph tags | MISSING | High |

### Ready-to-Deploy Organization Schema

```json
<script type="application/ld+json">
{
  "@context": "https://schema.org",
  "@type": "Organization",
  "@id": "https://www.meltcollective.co.uk/#organization",
  "name": "Melt Collective",
  "alternateName": "The Melt Collective",
  "url": "https://www.meltcollective.co.uk/",
  "description": "London-based collective of independent data science professionals delivering AI strategy, machine learning, statistical modelling, Bayesian analysis, and data visualisation for enterprise clients.",
  "slogan": "Soft skills for hard problems",
  "areaServed": {"@type": "Country", "name": "United Kingdom"},
  "address": {"@type": "PostalAddress", "addressLocality": "London", "addressCountry": "GB"},
  "contactPoint": {"@type": "ContactPoint", "email": "simon.raper@meltcollective.co.uk", "contactType": "sales"},
  "knowsAbout": ["Data Science", "AI Strategy", "Machine Learning", "Bayesian Modelling", "Marketing Mix Modelling", "Statistical Modelling", "Data Visualisation", "Forecasting"],
  "sameAs": ["https://www.linkedin.com/company/the-melt-collective", "https://github.com/meltgroup"]
}
</script>
```

---

## Section 6: Platform Optimization — 27/100

| Platform | Score |
|---|---|
| Google AI Overviews | 28/100 |
| ChatGPT Web Search | 27/100 |
| Perplexity AI | 24/100 |
| Google Gemini | 22/100 |
| Bing Copilot | 27/100 |
| Brave Search | 34/100 |
| DuckDuckGo AI | 27/100 |
| **Average** | **27/100** |

---

## Prioritised Action Plan

### Quick Wins — This Week

| # | Action | Effort |
|---|---|---|
| 1 | Create robots.txt with Sitemap + AI crawler Allow | 30 min |
| 2 | Create sitemap.xml, submit to Google + Bing | 2 hrs |
| 3 | Add viewport meta tag to every page | 30 min |
| 4 | Add meta descriptions to all pages | 2 hrs |
| 5 | Create /llms.txt | 30 min |
| 6 | Add Organization JSON-LD to homepage | 2 hrs |
| 7 | Add privacy policy — UK GDPR required | 2 hrs |
| 8 | Fix /index.html nav reference → / | 15 min |

### Medium-Term — This Month

| # | Action | Effort |
|---|---|---|
| 1 | Person JSON-LD for all 7 consultants | 4 hrs |
| 2 | Service JSON-LD for all 18 services | 6 hrs |
| 3 | Open Graph + canonical tags on all pages | 3 hrs |
| 4 | Security headers (HSTS, X-Frame-Options, CSP) | 2 hrs |
| 5 | Fix underscore URLs with 301 redirects | 1 hr |
| 6 | Google Business Profile — full NAP | 1 hr |
| 7 | Crunchbase company profile | 30 min |
| 8 | IndexNow + Bing Webmaster Tools | 1.5 hrs |

### Strategic — This Quarter

| # | Action |
|---|---|
| 1 | Expand 18 service pages to 500–800 word long-form content |
| 2 | Publish 3 anonymised case studies with quantified outcomes |
| 3 | Add individual consultant bio pages with credentials |
| 4 | Rewrite ethics page — dated, original, references EU AI Act 2024 |
| 5 | Create Wikidata entity record |
| 6 | Activate GitHub org with public methodology repo |
| 7 | Start quarterly blog — minimum 4 posts/year |

---

## Estimated Impact

| Milestone | Est. GEO Score |
|---|---|
| Current | 34/100 |
| After Quick Wins (Week 1) | 49–54/100 |
| After Month 1 | 59–64/100 |
| Full implementation | 72–80/100 |

---

*Report generated by `/geo audit` — GEO-SEO Suite for Claude Code*
*github.com/aromeni/geo-seo-suite-claude*
