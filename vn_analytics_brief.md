# Grab Vietnam — Analytics Case Study

**Role:** Specialist, Business Insights
**Time Allocation:** 3 days
**Debrief:** A 45-minute follow-up session will be scheduled to walk through your submission

---

## What This Assessment Is

We are not testing whether you can write code or build dashboards. We are testing whether you can think like a business owner — interrogating messy data, separating signal from noise, and translating uncertainty into a decision a senior leader will act on.

AI tool usage is **expected and evaluated**. Your interaction log with any LLM is a primary submission artefact — it is as important as the analysis itself. We want to see how you direct AI tools, not just what they produce for you.

---

## The Situation

Grab Vietnam operates across a highly competitive, fast-moving consumer market. As the super-app expands beyond mobility into grocery and everyday essentials, the Vietnam Growth team is under pressure to build cross-service habits and grow the GrabMart vertical.

To accelerate GrabMart adoption, the team launched the **Cross-Sell Mega Promo** — piloted **exclusively in Ho Chi Minh City (HCMC) for 6 weeks**.

**The mechanic:** Place a GrabFood order over 100,000 VND → receive a 50,000 VND voucher for your next GrabMart order.

At the end of the pilot, the raw report looks extraordinary:

- Gross GMV and Transaction Volume for **both Food and Mart in HCMC skyrocketed by more than 45%**
- The Country Head is thrilled and wants to **immediately secure a million-dollar budget** to roll this programme out across Hanoi

The Growth Insights team has been asked to respond before the budget is committed.

---

## Your Task

> *The Country Head believes this campaign successfully shifted user behaviour and built cross-service habits. Based on deep behavioural and P&L data, do you agree? What is really driving this 45% growth? Build a data-driven argument and make a final recommendation on whether to expand this programme to Hanoi.*

There is no predetermined correct answer. What we are evaluating is how rigorously you interrogate the data before committing to a position — and whether you can defend that position under pressure.

---

## Dataset

**File:** `grab_vn_case_analytics.db` (SQLite)  
**Schema reference:** `grab_vn_case_analytics_metadata.md`

**Scope:** 14 weeks of 2024. Promo window: Weeks 7–12 (HCMC only). Cities: Ho Chi Minh City, Da Nang, Hanoi. Figures in **VND thousands** — divide by 1,000 for millions.

| Table | Description |
|---|---|
| `transactions` | Individual transaction records across all cities, services, and periods |
| `users` | User profiles — city, first Mart order date (behavioural baseline) |
| `merchants` | Merchant attributes — vertical, type, and Grab's take rate per order |
| `weather_daily` | Daily temperature readings per city |

### Key Fields

**transactions**

| Column | Description |
|---|---|
| `transaction_id` | Primary key |
| `date` / `week_number` | Date and relative week (1–14) |
| `period` | `Pre-Promo`, `Promo`, or `Post-Promo` |
| `user_id` / `merchant_id` | Foreign keys |
| `service_type` | `GrabFood` or `GrabMart` |
| `item_subtotal` | Value of goods ordered (VND thousands) |
| `delivery_fee_collected` | Delivery fee paid by the user (VND thousands) |
| `driver_payout` | Amount Grab pays to the driver (VND thousands) |
| `promo_discount` | Voucher value funded by Grab (VND thousands) |
| `is_cross_sell_voucher` | `1` if the Mega Promo code was applied, `0` otherwise |

**users**

| Column | Description |
|---|---|
| `user_id` | Primary key (hashed) |
| `city` | City of registration |
| `user_segment` | Behavioural segment (`Regular`, `High Value`, `Voucher Hunter`, `Occasional`) |
| `first_mart_order_date` | Date of user's very first Mart order (historical baseline) |

**merchants**

| Column | Description |
|---|---|
| `merchant_id` | Primary key (hashed) |
| `vertical` | `Food` or `Mart` |
| `merchant_type` | `SME` or `Key Account` |
| `take_rate` | Grab's commission rate per order (e.g., `0.10` = 10%) |

**weather_daily**

| Column | Description |
|---|---|
| `date` / `city` | Date and city |
| `avg_temperature_celsius` | Average daily temperature |

---

## How to Approach This

The mechanical work — querying, calculating, charting — is table stakes. Your job is to ask the right questions, pressure-test the outputs, and know when a result looks wrong or incomplete.

The best submissions are not the most technically elaborate. They are the ones where it is clear the analyst was driving — deciding what to look for, catching where the data or the AI misled them, and ultimately owning the recommendation.

Think carefully about what the data can and cannot tell you. A 45% GMV lift has more than one possible explanation. The P&L of a cross-sell promo has more than one possible interpretation. Both of these matter before a budget decision is made.

---

## Deliverables

Submit all four of the following:

**1. Analysis artefact**  
Your working file — SQL scripts, Python notebook, or equivalent. We care about the reasoning trail, not the format.

**2. Presentable Report & Dashboard / Unit Economics Summary**  
A well-formatted report & dashboard showing the **Contribution Margin (P&L)** of the campaign. You must establish the Profit/Loss formula per order using your own commercial logic. We are looking for a framework, not a single number — show your assumptions explicitly.

**3. Executive brief**  
A maximum one-page memo addressed to the Country Head. State your position clearly. Give him the two or three things he must understand before acting on this data. Write it as if you are sending it the morning before the budget meeting.

**4. AI interaction log**  
Export the full conversation history from any LLM session used during this assessment. If you used multiple tools, include all logs. Do not edit or curate the log — we want to see the raw interaction, including dead ends and corrections.

---

## Notes

- Any AI tool is permitted: ChatGPT, Claude, Gemini, Copilot, or others
- The debrief will focus on your log: why you prompted the way you did, how you validated outputs, and where you disagreed with the AI
- Schema questions should be answered by `grab_vn_case_analytics_metadata.md` before reaching out to your hiring contact
- The Excel deliverable is intentionally open-ended — there is no single correct P&L formula. We are evaluating your commercial reasoning and transparency about assumptions

---

## Submission

Send all four deliverables to your hiring contact by the deadline.

Good luck.
