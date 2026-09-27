# Grab Vietnam Case Analytics — Conversation Log

**Date:** 2026-09-28  
**Context:** Grab Vietnam Business Insight / GrabFood & GrabMart case

---

## User
brief qua các resources đã upload

- phần understanding là tôi đã sum-up lại để có thể nắm bắt nhanh được concept
- grab_vn_case_analytics_metadata.md là database của gồm các table phục vụ cho việc phân tích
- vn_analytics_brief.md là origin case

mình sẽ bắt đầu trả lời câu hỏi đầu tiên với việc phân tích hành để làm rõ là nhận định có đang hợp lí không

---

## User
okeee mình nghĩ là nên bắt đầu với background research --

là 45% này tăng trong kì promo thì cũng chắc chắn 1 điều là tăng GMV đến từ GrabFood existing do là này đến từ chương trình của campaign của Grab là phải tiêu 100,000 vnđ từ GrabFood thì mới acq được 50,000 vnđ từ grabmart -- v thực sự tỉ lệ acquisition rate trong kì promo và %profit của những người thực sự xài được voucher từ grabmart là bao nhiêu trên tổng gmv

---

## User
xây dựng thử câu query mẫu cho mình đi - rồi mình chỉnh lại từ các nhận định của bạn

---

## User
okeee mình sẽ utilize lại phần % acquisition funnel adding theo 1 view là existed-mart-user và new-mart-user để mình có được view là acquisition behavior mart user trong cross sell chiếm bao nhiêu trong tổng user cũng như gmv trong giai đoạn diễn ra promo

---

## User
okeee xây dựng 1 câu query mẫu cho mình đi để mình thử testing

---

## User
đây là các kết quả của acquisition_funnel:

| metric | value |
|---|---:|
| food_users | 4999 |
| eligible_food_users | 4991 |
| voucher_redeemers | 4446 |
| campaign_acquired_users | 4441 |
| food_eligibility_rate | 99.84 |
| voucher_redemption_rate | 89.08 |
| campaign_acquisition_rate | 88.84 |

---

## User
mart_user_type:

| mart_user_type | users | user_share | cross_sell_users | cross_sell_user_rate | mart_gmv | gmv_share | cross_sell_gmv | cross_sell_gmv_share | gmv_per_user |
|---|---:|---:|---:|---:|---:|---:|---:|---:|---:|
| New Mart User | 643 | 13.24 | 643 | 100.00 | 240,164.6 | 13.4 | 111,391.1 | 46.38 | 373.51 |
| Existing Mart User | 4,215 | 86.76 | 3,804 | 90.25 | 1,551,967.9 | 86.6 | 670,364.1 | 43.19 | 368.20 |

---

## User
à 1 chút giải thích là thời điểm 2024-02-12 là thời điểm mà campaign bắt đầu chạy -- cho nên marking từ lúc đó để nhận new-user hay existed-user là đúng nhé

---

## User
để mình confirm lại cái mình hiểu phải không nhé -- có nghĩ là:

- cross-sell diễn ra thành công -- vì hầu như new-mart đều là từ voucher used. Nhưng số lượng này vẫn còn hạn chế so với food-users (existed) sử dụng voucher -- nên là về phần là 45% growth thì không thể đến được từ new-mart mà vẫn còn 1 yếu tố tăng ẩn nào đó mình chưa tìm ra - và mình cũng muốn biết là phần new-mart đó đóng bao nhiêu phần trăm vào yếu tố ẩn giúp tăng 45% so với base line đúng không
- và mình cũng quan sát trong bộ data (giai đoạn sau campaign -- 2 tuần (behavior hình thành)) các user new mart này có còn dùng mart sau campaign hay không đúng k

---

## User
How much New Mart contribute to the uplift -- Test in this cohort

1. Phân rã Uplift theo tệp người dùng (user-segmentation) (Done)
2. Phân rã theo hành vi giỏ hàng (basket behavior and gaming)
   - Hành vi kéo giỏ hàng: trung bình đơn Food trước đây của người dùng là 70-80k. Nhờ promo, họ cố mua thêm để bill nhảy lên mức > 100k. Giải thích được vì sao GMV cũng tăng
   - Hành vi chẻ đơn: Người dùng muốn đặt 300k, thay vì đặt 1 đơn -- thì chia làm 3 để lấy 3 vouchers. GMV Food tăng về số lượng đơn nhưng chi phí khuyến mãi (Promo cost) bị nhân lên gấp 3 --> loss in PnL
3. Phân rã Uplift theo Hiệu Quả Tài Chính (P&L & Unit Economics)
   - Uplift mang lại GMV, nhưng có mang lại Lợi nhuận biên (Margin) dương hay không?
   - Sức nặng của Voucher 50k: Cần xem xét giá trị đơn hàng trung bình (AOV) của GrabMart. Nếu AOV của Mart là 150k, voucher 50k tương đương mức giảm giá lên tới 33%. Đây là mức cắt máu cực kỳ sâu.
   - Net Revenue (Doanh thu thuần): Tổng GMV tăng 45%, nhưng sau khi trừ đi chi phí khuyến mãi (Promo cost) khổng lồ từ việc rải voucher 50k, Net Revenue thực tế tăng bao nhiêu, hay thậm chí đang âm?

---

## User
How much New Mart contribute to the uplift -- Test in this cohort

### 1. Phân rã Uplift theo tệp người dùng (user-segmentation) (Done)

### 2. Phân rã theo hành vi giỏ hàng (basket behavior and gaming)

Basket behavior result:

| Period | Total Food Orders | AOV (VND '000) | < 80K (%) | 80K - 99.9K (%) | 100K - 119.9K (%) | >= 120K (%) |
|---|---:|---:|---:|---:|---:|---:|
| Pre-Promo | 4,056 | 133.8 | 11.8 | 14.6 | 19.7 | 53.9 |
| Promo | 9,555 | 115.4 | 8.1 | 9.9 | 50.7 | 31.3 |

Same-user behavior:

| Total Tracked Users | User AOV Pre-Promo | User AOV During Promo | Avg Uplift Per User | Users Crossing Threshold (%) |
|---:|---:|---:|---:|---:|
| 4,985 | 130.2 | 118.2 | -12.0 | 5.8 |

Order-splitting result:

| Metric | Pre-Promo | Promo | % Change |
|---|---:|---:|---:|
| Cohort Size | 4,985 | 4,985 | - |
| Avg Orders per User | 8.14 | 19.15 | +135.3% |
| Avg GMV per User | 1,088.9 | 2,210.0 | +103.0% |
| Avg GMV per Order (AOV) | 130.2 | 118.2 | -9.2% |

Interpretation discussed: this provides strong evidence of increased transaction frequency and qualifying behavior, more consistent with incentive-driven transaction expansion than pure basket-size expansion. Exact decomposition between splitting and bundling still needs basket-level analysis.

---

## User
Splitting query:

```sql
WITH user_period_metrics AS (
    SELECT
        user_id,
        period,
        count(transaction_id) as total_orders,
        sum(item_subtotal) as total_gmv,
        avg(item_subtotal) as aov
    FROM transactions
    WHERE city = 'Ho Chi Minh City'
      AND service_type = 'GrabFood'
      AND period in ('Pre-Promo', 'Promo')
    GROUP BY user_id, period
),
cohort_comparison AS (
    SELECT
        pre.user_id,
        pre.total_orders as orders_pre,
        pre.total_gmv as gmv_pre,
        pre.aov as aov_pre,
        promo.total_orders as orders_promo,
        promo.total_gmv as gmv_promo,
        promo.aov as aov_promo
    FROM user_period_metrics pre
    JOIN user_period_metrics promo
      ON pre.user_id = promo.user_id
    WHERE pre.period = 'Pre-Promo'
      AND promo.period = 'Promo'
)
SELECT
    count(user_id) as cohort_size,
    round(avg(orders_pre), 2) as avg_orders_per_user_pre,
    round(avg(gmv_pre), 1) as avg_gmv_per_user_pre,
    round(avg(aov_pre), 1) as avg_gmv_per_order_pre,
    round(avg(orders_promo), 2) as avg_orders_per_user_promo,
    round(avg(gmv_promo), 1) as avg_gmv_per_user_promo,
    round(avg(aov_promo), 1) as avg_gmv_per_order_promo,
    round(100.0 * (avg(orders_promo) - avg(orders_pre)) / avg(orders_pre), 1) as pct_change_orders_per_user,
    round(100.0 * (avg(gmv_promo) - avg(gmv_pre)) / avg(gmv_pre), 1) as pct_change_gmv_per_user,
    round(100.0 * (avg(aov_promo) - avg(aov_pre)) / avg(aov_pre), 1) as pct_change_gmv_per_order
FROM cohort_comparison;
```

---

## User
Added voucher-related metrics:

```sql
sum(
    case
        when promo_discount > 0 then 1
        else 0
    end
) as voucher_orders,

sum(is_cross_sell_voucher) as voucher_count
```

---

## User
I added qualification logic: `item_subtotal > 100K` means the order qualifies. Compared pre-promo vs promo, qualifying orders increased by +162%.

Interpretation: this further supports the hypothesis that order splitting / transaction restructuring was used to apply the voucher.

---

## User
PnL result:

| Service | Period | Total Orders | Total GMV (VND '000) | Avg Revenue / Order | Avg Cost / Order | Avg Margin / Order | Total Contribution Margin (VND '000) |
|---|---|---:|---:|---:|---:|---:|---:|
| GrabFood | Pre-Promo | 40,564 | 5,428,398.4 | 31.8 | 23.0 | 8.8 | 357,110.7 |
| GrabFood | Promo | 95,552 | 11,030,020.5 | 29.0 | 23.7 | 5.3 | 506,458.8 |
| GrabMart | Pre-Promo | 14,517 | 1,383,717.7 | 24.5 | 20.0 | 4.5 | 64,848.0 |
| GrabMart | Promo | 23,630 | 1,792,132.5 | 22.6 | 47.6 | -25.0 | -590,574.8 |
| TOTAL | Pre-Promo | 55,081 | 6,812,116.1 | - | - | - | 421,958.7 |
| TOTAL | Promo | 119,182 | 12,822,153.0 | - | - | - | -84,116.0 |

Assumptions used:

```sql
WITH order_economics AS (
    SELECT
        t.period,
        t.service_type,
        t.transaction_id,
        t.item_subtotal,
        (t.item_subtotal * m.take_rate) + t.delivery_fee_collected AS gross_revenue,
        t.driver_payout + t.promo_discount AS direct_cost,
        ((t.item_subtotal * m.take_rate) + t.delivery_fee_collected)
            - (t.driver_payout + t.promo_discount) AS contribution_margin
    FROM transactions t
    JOIN merchants m
      ON t.merchant_id = m.merchant_id
    WHERE t.city = 'Ho Chi Minh City'
      AND t.period in ('Pre-Promo', 'Promo')
)
SELECT
    service_type,
    period,
    count(transaction_id) as total_orders,
    round(sum(item_subtotal), 1) as total_gmv,
    round(avg(gross_revenue), 1) as avg_revenue_per_order,
    round(avg(direct_cost), 1) as avg_cost_per_order,
    round(avg(contribution_margin), 1) as avg_margin_per_order,
    round(SUM(contribution_margin), 1) as total_contribution_margin
FROM order_economics
GROUP BY service_type, period;
```

Interpretation discussed: GMV growth alone does not imply healthy growth; GrabMart contribution margin deteriorated materially during the promotion.

---

## User
The first two questions are now answered:

1. Based on detailed behavioural and business-performance data, do we agree with the Country Head's statement?
   - Answer: No, based on the behavioural and P&L clues.
2. What is actually driving the 45% growth?
   - Current answer: largely incentive-driven transaction behaviour / order splitting, with bundling still requiring further decomposition.

---

## User
I want to implement Difference-in-Differences to predict sustainable growth, adding external factors such as weather and incremental factors.

---

## User
We discussed validating whether HCMC and Hanoi have sufficiently comparable trends, with Da Nang as an alternative.

Validation table:

| city | week_number | avg_weekly_temp | active_users | avg_food_gmv_per_user | avg_mart_gmv_per_user | overall_aov | avg_total_orders_per_user |
|---|---:|---:|---:|---:|---:|---:|---:|
| Da Nang | 1 | 30.6 | 1681 | 229.6 | 56.9 | 125.1 | 2.29 |
| Da Nang | 2 | 29.4 | 1629 | 220.0 | 55.6 | 124.8 | 2.21 |
| Da Nang | 3 | 29.9 | 1630 | 226.9 | 56.7 | 124.7 | 2.27 |
| Da Nang | 4 | 29.8 | 1617 | 216.0 | 58.6 | 122.5 | 2.24 |
| Da Nang | 5 | 30.7 | 1654 | 224.6 | 58.1 | 123.1 | 2.30 |
| Da Nang | 6 | 29.0 | 1615 | 213.5 | 57.7 | 122.7 | 2.21 |
| Hanoi | 1 | 22.3 | 2824 | 218.8 | 56.4 | 124.3 | 2.21 |
| Hanoi | 2 | 20.4 | 2868 | 221.3 | 60.2 | 124.2 | 2.27 |
| Hanoi | 3 | 21.3 | 2854 | 225.1 | 125.2 | 2.25 |
| Hanoi | 4 | 21.9 | 2877 | 219.7 | 55.1 | 124.4 | 2.21 |
| Hanoi | 5 | 20.1 | 2815 | 223.3 | 55.5 | 124.5 | 2.24 |
| Hanoi | 6 | 20.9 | 2865 | 224.0 | 55.7 | 124.2 | 2.25 |
| Ho Chi Minh City | 1 | 30.0 | 4135 | 221.3 | 57.3 | 123.1 | 2.26 |
| Ho Chi Minh City | 2 | 30.1 | 4072 | 221.7 | 57.9 | 123.9 | 2.26 |
| Ho Chi Minh City | 3 | 29.4 | 4093 | 218.6 | 55.3 | 123.1 | 2.23 |
| Ho Chi Minh City | 4 | 30.3 | 4129 | 227.1 | 55.2 | 124.9 | 2.26 |
| Ho Chi Minh City | 5 | 29.3 | 4089 | 217.7 | 55.9 | 123.6 | 2.21 |
| Ho Chi Minh City | 6 | 29.5 | 4050 | 219.3 | 56.2 | 123.5 | 2.23 |

The pre-promo query aggregates transactions to city-week and joins weekly temperature.

---

## User
Correlation results:

### avg_food_gmv_per_user

| | HCMC | Hanoi | Da Nang |
|---|---:|---:|---:|
| HCMC | 1.000 | -0.722 | -0.389 |
| Hanoi | -0.722 | 1.000 | -0.095 |
| Da Nang | -0.389 | -0.095 | 1.000 |

### avg_mart_gmv_per_user

| | HCMC | Hanoi | Da Nang |
|---|---:|---:|---:|
| HCMC | 1.000 | **0.809** | -0.728 |
| Hanoi | **0.809** | 1.000 | -0.882 |
| Da Nang | -0.728 | -0.882 | 1.000 |

### avg_weekly_temp

| | HCMC | Hanoi | Da Nang |
|---|---:|---:|---:|
| HCMC | 1.000 | **0.516** | -0.137 |
| Hanoi | **0.516** | 1.000 | 0.173 |
| Da Nang | -0.137 | 0.173 | 1.000 |

### overall_aov

| | HCMC | Hanoi | Da Nang |
|---|---:|---:|---:|
| HCMC | 1.000 | -0.334 | -0.607 |
| Hanoi | -0.334 | 1.000 | 0.241 |
| Da Nang | -0.607 | 0.241 | 1.000 |

### avg_total_orders_per_user

| | HCMC | Hanoi | Da Nang |
|---|---:|---:|---:|
| HCMC | 1.000 | -0.305 | -0.365 |
| Hanoi | -0.305 | 1.000 | -0.480 |
| Da Nang | -0.365 | -0.480 | 1.000 |

Interpretation discussed:
- Hanoi is the strongest candidate control because HCMC-Hanoi Mart GMV/user correlation is 0.809.
- HCMC-Hanoi weekly temperature correlation is 0.516, while HCMC-Da Nang is -0.137.
- Correlation alone is not sufficient to certify parallel trends, especially with only six pre-period observations.
- Normalized pre-trend plots and slope comparisons should be checked before relying on DID.

---

## User
Asked whether bundling exists.

Conclusion discussed:
- It may exist, but current evidence is stronger for order splitting / incentive-induced transaction behaviour.
- Bundling would be expected to show basket value / items per order increasing without a corresponding large increase in order frequency.
- Current pattern is orders/user +135.3%, AOV/order -9.2%, qualifying orders +162%, which is more consistent with splitting.
- Basket-level / item-level analysis is needed to separate splitting, bundling, and genuinely incremental orders.

---

## User
Noted that `avg_mart_gmv_per_user` still follows a usable trend and can be used as the primary outcome in the panel.

Proposed panel:

- city
- week
- avg_mart_gmv_per_user — primary outcome
- avg_food_gmv_per_user — control/covariate
- avg_total_orders_per_user — control/covariate
- overall_aov — control/covariate
- avg_weekly_temp — external factor

HCMC = treatment.
Hanoi = candidate control.
Da Nang = alternative / robustness check, but ultimately excluded due to violating validation / opposite trend.

---

## User
Provided two plots:

1. Event-study DiD: Incremental Mart GMV per User
2. Pooled DiD: Incremental growth across periods

Interpretation:
- Event-study estimates weekly effects separately, so it is noisier.
- Pooled DiD uses all six promo weeks to estimate one treatment effect, giving a narrower CI and a more stable estimate.
- The pooled DiD estimate should be used for the incremental percentage / P&L calculation rather than averaging six event-study weekly coefficients.
- Both models agree on the business conclusion: Promo generated positive Mart GMV uplift, but the post-promo effect declines toward baseline.
- The uplift appears largely incentive-driven; splitting is strongly supported, while bundling remains to be decomposed.
- There is no strong evidence of durable habit formation / persistent cross-sell behaviour within the observed post-promo window.
- Therefore the recommendation for Hanoi is “do not scale the current mechanic.”

---

# Final Q3 framing developed

## Q3. Should Grab expand the campaign to Hanoi?

### Recommendation: No — not in its current form.

The campaign successfully generated incremental Mart GMV during the promotional period, but the available evidence does not yet support the conclusion that this uplift represents sustainable behavioural growth.

The recommendation is therefore not to scale the current campaign mechanic to Hanoi until the durability and economics of the incremental growth are proven.

### 1. HCMC is the treatment market; Hanoi is the most suitable comparison market

Da Nang was excluded because its pre-promotion Mart GMV per user trajectory moved in a materially different direction from HCMC, making it unsuitable under the parallel-trend requirement.

Hanoi showed a substantially more comparable pre-promotion Mart GMV trajectory and was therefore retained as the comparison market.

Weekly temperature was considered as an external factor that could influence demand and incorporated as a control variable rather than being treated as the campaign effect itself.

### 2. The campaign clearly generated short-term incremental Mart GMV

The event-study provides a granular view of weekly treatment effects but is noisier because each week is estimated separately.

The pooled DiD aggregates the six promotional weeks into one treatment effect, providing a more stable estimate of average incremental Mart GMV during Promo and the preferred estimate for incremental-GMV / P&L calculation.

Both approaches show positive incremental Mart GMV during Promo.

### 3. The uplift does not appear to persist after the incentive ends

The campaign produces positive incremental Mart GMV during Promo, but the effect declines substantially toward the pre-promotion baseline after Promo.

Therefore, the campaign can stimulate Mart demand, but we do not find strong evidence that the promotional uplift translates into a durable shift in Mart purchasing behaviour within the observed post-promo period.

### 4. Behavioural evidence provides a plausible explanation

During Promo:
- Orders per user: +135.3%
- GMV per user: +103.0%
- AOV per order: -9.2%
- Qualifying orders (>100K): +162%
- 5.8% of tracked users moved from below the 100K threshold pre-promo to >=100K during Promo.

The pattern is more consistent with incentive-induced transaction expansion than with pure habit formation.

There is strong evidence of increased qualifying transactions, and order splitting is a highly plausible mechanism. However, the entire uplift should not yet be attributed specifically to splitting because basket-level analysis is still required to distinguish:
- order splitting,
- genuine basket expansion / bundling,
- genuinely incremental orders.

Preferred wording:

> “The incremental growth appears to be materially driven by incentive-induced transaction behaviour, with strong evidence of increased qualifying transactions.”

### 5. P&L reinforces the concern

GrabMart contribution margin:
- Pre-Promo: +64.8M VND '000
- Promo: -590.6M VND '000

Margin per order:
- Pre-Promo: +4.5K
- Promo: -25.0K

Therefore, increased GMV did not translate into healthier unit economics.

### 6. Final recommendation

Do not scale the current campaign mechanic to Hanoi yet.

This is not because the campaign failed. It successfully stimulated Mart demand and generated measurable incremental GMV during Promo.

The issue is that we have not established that this growth is:
1. Durable — the uplift declines substantially after the campaign.
2. Behaviourally healthy — transaction-level evidence points toward incentive-driven qualifying behaviour.
3. Economically attractive — Mart contribution margin deteriorated materially during Promo.

Recommended strategic next step:

> “Before expanding to Hanoi, Grab should redesign or optimize the incentive mechanism to distinguish genuine incremental Mart adoption from promo-induced transaction expansion, and then validate whether acquired behaviour persists after the incentive is removed.”

### Executive takeaway

> “The campaign successfully generated short-term incremental Mart GMV, but the uplift appears materially incentive-driven and does not show strong evidence of persistence after the promotion. Given the associated deterioration in Mart unit economics, we would not recommend scaling the current mechanic to Hanoi until durable behaviour and positive incremental economics are demonstrated.”

---

## Important analytical caveats

- Current evidence supports **incentive-driven transaction behaviour**, not a definitive decomposition that 100% of the uplift is caused by order splitting.
- Bundling / genuine basket expansion still needs explicit basket-level testing.
- “No habit formation” should be avoided as an absolute claim; the stronger defensible wording is **“no strong evidence of persistent habit formation within the observed post-promo period.”**
- Correlation with only six pre-promo weekly observations is not sufficient by itself to establish parallel trends.
- Pooled DiD is preferred for the overall Promo-period incremental effect; event-study is more useful for understanding temporal dynamics.
