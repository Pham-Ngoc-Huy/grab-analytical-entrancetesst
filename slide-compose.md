# Presentation Flow — Proposed 9 Slides

## Slide 1 — Business Question: *What is really driving the 45% uplift?*

### Objective

Đặt vấn đề và tạo tension ngay từ đầu.

### Nội dung

**Context**

* GrabFood → GrabMart cross-sell campaign
* Food order ≥ 100K → receive 50K GrabMart voucher
* HCMC campaign generated ~45% GMV uplift

**3 questions cần trả lời**

1. **What is actually driving the uplift?**
2. **Is the uplift incremental and economically healthy?**
3. **Is the growth sustainable enough to scale to Hanoi?**

### Key message

> **The observed GMV growth is clear. The real question is whether Grab is creating new, sustainable Mart demand — or temporarily stimulating transactions through the promotion.**

---

# Slide 2 — Analytical Framework: *From Campaign Mechanism → Business Decision*

### Objective

Cho interviewer thấy bạn **không chạy SQL một cách ad-hoc**, mà có framework.

Có thể visual hóa thành:

```text
Campaign
   ↓
Customer Acquisition
   ↓
Behaviour Change
   ↓
GMV Uplift
   ↓
P&L Impact
   ↓
Sustainability
   ↓
Hanoi Rollout?
```

### 3 analytical lenses

**1. User**

* Who contributes to Mart GMV?
* New vs Existing Mart users
* Cross-sell acquisition

**2. Behaviour**

* Basket size
* Order frequency
* Voucher qualification
* Order splitting / bundling

**3. Business Value**

* GMV
* Contribution Margin
* Post-promo retention
* Incremental growth

### Key message

> **I decompose the 45% uplift from “who” → “how” → “whether it creates value” → “whether it persists”.**

---

# Slide 3 — Data & Methodology: *How I built the analytical base*

### Objective

Đây chính là phần **Material Reviewing** của bạn.

Không cần show metadata quá sâu.

### Nội dung

**Data reviewed**

* Transactions
* Merchant / take-rate information
* Weather
* Promo / voucher attributes

**Key definitions established**

* New vs Existing Mart User
* Voucher redemption
* Cross-sell acquisition
* Qualifying Food order ≥100K
* Contribution Margin

**Analytical approach**

```text
Descriptive Analysis
        ↓
Cohort / Behaviour Analysis
        ↓
P&L / Unit Economics
        ↓
DiD / Event Study
        ↓
Sustainability Assessment
```

### Important note

Ở đây có thể nói:

> “Since the case dataset does not explicitly provide every business definition, I established analytical definitions based on the campaign mechanism and validated them against the available data.”

Điểm này rất tốt để defend assumption.

---

# Slide 4 — Q1: *Does cross-sell acquisition explain the uplift?*

Đây là **Question 1**.

### Objective

Trả lời:

> **Is the 45% growth mainly driven by acquiring new Mart users?**

### Visual

```text
4,999 Food Users
       ↓
4,991 Eligible
       ↓
4,446 Voucher Redeemers
       ↓
4,441 Campaign Acquired
       ↓
Promo Mart Users
       ↓
┌───────────────────┐
│ Existing Mart     │ 86.76%
│ New Mart          │ 13.24%
└───────────────────┘
```

Sau đó show:

| Segment       | Users | Mart GMV |
| ------------- | ----: | -------: |
| New Mart      |   643 |    13.4% |
| Existing Mart | 4,215 |    86.6% |

### Conclusion

> **Cross-sell acquisition is highly effective, but New Mart users represent only a limited share of the Promo-period Mart GMV. Therefore, acquisition alone cannot explain the observed uplift.**

### Transition

> **If acquisition is not enough, what changed in the behaviour of users who were already in the ecosystem?**

Đây là transition cực kỳ quan trọng.

---

# Slide 5 — Q2: *What behaviour is actually driving the uplift?*

Đây là slide **quan trọng nhất của cả deck**.

### Objective

Move từ:

> **Who drove the growth?**

sang:

> **How did they generate the growth?**

### Evidence 1 — Order frequency

```text
Orders / User
8.14 → 19.15
+135.3%
```

### Evidence 2 — AOV

```text
AOV / Order
130.2K → 118.2K
-9.2%
```

### Evidence 3 — Qualification

```text
Qualifying Orders >100K
+162%
```

### Evidence 4 — Same-user threshold crossing

```text
5.8%
of tracked users

Pre <100K
      ↓
Promo ≥100K
```

### Conclusion

> **The uplift is primarily associated with a sharp increase in transaction frequency and qualifying orders, rather than an increase in average basket value.**

Then carefully:

> **This provides strong evidence of threshold-driven, incentive-induced transaction behaviour and a strong splitting signal.**

**Không nói:**
❌ “100% uplift is caused by splitting.”

**Nói:**
✅ “Splitting is a strong behavioural explanation, but its exact contribution to incremental GMV requires further transaction-level decomposition.”

---

# Slide 6 — Q2 Deep Dive: *Is this genuine basket expansion or order splitting?*

Mình **khuyên thêm slide này** thay vì nhét tất cả vào Slide 5.

### Objective

Address directly the Country Head's original hypothesis:

> **“GMV increased because users changed their behaviour / bought more.”**

### Visual

Có thể chia đôi:

### Hypothesis A — Genuine Basket Expansion

```text
Previous basket
70–80K
      ↓
User adds items
      ↓
100K+
      ↓
Voucher
```

### Hypothesis B — Order Splitting

```text
300K intended spend

      ↓

100K + 100K + 100K

      ↓

3 qualifying orders

      ↓

3 voucher opportunities
```

Sau đó evidence:

| Metric                   |     Finding |
| ------------------------ | ----------: |
| Orders / user            | **+135.3%** |
| AOV / order              |   **-9.2%** |
| Qualifying orders >100K  |   **+162%** |
| Users crossing threshold |    **5.8%** |

### Conclusion

> **The data is inconsistent with a pure “users simply bought larger baskets” explanation. The combination of higher order frequency, lower AOV and sharply higher qualifying orders is more consistent with incentive-driven order generation, including potential order splitting.**

### Đây chính là câu trả lời cho Country Head.

---

# Slide 7 — Q3: *Does incremental GMV create incremental value?*

### Objective

Không để interviewer nghĩ:

> “Okay, splitting exists — but maybe GMV is still profitable?”

### P&L

|                |      Pre |       Promo |
| -------------- | -------: | ----------: |
| Mart GMV       | 1,383.7M |    1,792.1M |
| Margin / Order |    +4.5K |  **-25.0K** |
| Total CM       |   +64.8M | **-590.6M** |

### Main visual

```text
              GMV
               ↑
          +29.5%
               │
               │
               ↓
        Contribution Margin
               │
        +64.8M → -590.6M
```

### Conclusion

> **The promotion generated incremental Mart GMV, but under the stated unit-economic assumptions, the incremental volume came with materially worse economics.**

Và một câu rất mạnh:

> **GMV growth should not be treated as healthy growth unless incremental contribution margin is also positive.**

---

# Slide 8 — Sustainability: *Did the behaviour persist after the incentive disappeared?*

Đây là phần **DiD / Event Study**.

### Objective

Trả lời câu hỏi:

> **Was this a temporary promotion effect or a sustainable behavioural shift?**

### Method

```text
HCMC
Treatment

vs

Hanoi
Candidate Control
```

Da Nang:

> **Rejected during validation because its pre-period trend was inconsistent with HCMC.**

Weather:

> Included as an external factor / robustness consideration.

### Two models

**Event Study**

→ week-by-week treatment dynamics

**Pooled DiD**

→ one overall Promo treatment effect
→ preferred for estimating incremental effect for P&L

### Main finding

```text
             Promo
               ↑
        incremental GMV
               │
               ↓
        Post-Promo
               │
               ↓
       Near baseline
```

### Conclusion

> **The uplift is visible during the promotion, but the post-promo trajectory provides weak evidence of persistent habit formation.**

Important nuance:

> **The result supports “temporary incentive-driven uplift” more strongly than “durable behavioural shift”.**

---

# Slide 9 — Final Recommendation: *Should Grab scale this campaign to Hanoi?*

### Objective

Bring all evidence together.

Don't introduce new analysis here.

Use a **4-box synthesis**:

| Dimension      | Evidence                                         | Assessment             |
| -------------- | ------------------------------------------------ | ---------------------- |
| Acquisition    | New users only 13.2% of Mart users               | ⚠️ Not enough          |
| Behaviour      | Orders +135%, qualifying orders +162%, AOV -9.2% | ⚠️ Incentive-driven    |
| Economics      | CM +64.8M → -590.6M                              | ❌ Unhealthy            |
| Sustainability | Post-promo near baseline                         | ❌ Weak habit formation |

Then final recommendation:

# **DO NOT SCALE THE CURRENT MECHANIC TO HANOI YET**

Instead:

```text
Current Campaign
       ↓
Redesign Incentive
       ↓
Reduce Splitting / Gaming
       ↓
Test Genuine Mart Adoption
       ↓
Measure Post-Promo Retention
       ↓
Validate Incremental Contribution Margin
       ↓
Re-assess Hanoi Rollout
```

### Final statement

> **The campaign successfully stimulates Mart transactions, but the evidence does not yet demonstrate sustainable incremental growth. The observed uplift appears more consistent with incentive-driven transaction expansion than durable cross-sell habit formation, while the current economics deteriorate materially. Therefore, I would not recommend scaling the current mechanic to Hanoi before redesigning and re-testing the incentive.**

---

# Toàn bộ story khi present

Mình sẽ nhớ đúng **một câu cho mỗi slide**:

| Slide | One-line story                                                                                  |
| ----- | ----------------------------------------------------------------------------------------------- |
| **1** | We see ~45% growth, but we need to understand what is actually driving it.                      |
| **2** | I decompose the uplift from acquisition → behaviour → economics → sustainability.               |
| **3** | I establish the definitions and analytical methodology from the available data.                 |
| **4** | Cross-sell acquisition works, but New Mart users alone cannot explain the uplift.               |
| **5** | The real change is transaction behaviour: frequency rises sharply while AOV falls.              |
| **6** | This is more consistent with threshold-driven behaviour / splitting than pure basket expansion. |
| **7** | The additional GMV comes with materially worse Mart economics.                                  |
| **8** | Once the incentive disappears, the uplift moves back toward baseline — weak habit formation.    |
| **9** | Therefore, don't scale the current mechanic; redesign, re-test, then reconsider Hanoi.          |

### Và quan trọng nhất: đừng để deck thành “9 slides of analysis”.

Nó nên có **3 acts**:

**ACT 1 — What happened?**
Slides 1–4
→ *45% growth → acquisition doesn't explain it.*

**ACT 2 — Why did it happen?**
Slides 5–7
→ *transaction behaviour → splitting signal → poor economics.*

**ACT 3 — Will it last?**
Slides 8–9
→ *DiD → weak persistence → don't scale yet.*

Đây sẽ là một presentation có tính **consulting / business case storytelling** hơn rất nhiều so với việc lần lượt show từng query và từng metric.
