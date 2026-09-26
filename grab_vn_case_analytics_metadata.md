# Grab Vietnam Analytics Case Study — Database Metadata

**File:** `grab_vn_case_analytics.db` (SQLite)
**Case:** "The 4-Layer Illusion" — GrabMart Cross-Sell Mega Promo Analysis

---

## Context

Grab Vietnam ran a **Cross-Sell Mega Promo** (GrabFood order over 100k VND triggers a 50k VND GrabMart voucher) exclusively in **Ho Chi Minh City (HCMC)** for 6 weeks. Both Gross GMV and Transaction Volume for Food and Mart surged over 45%. The Country Head wants to roll out to Hanoi immediately with a million-dollar budget. Your task is to assess whether this growth represents genuine behavioural change and whether the unit economics support expansion.

**Date ranges:**

| Period | Weeks |
|---|---|
| Pre-Promo | 1–6 |
| Promo (HCMC only) | 7–12 |
| Post-Promo | 13–14 |

**Cities covered:** Ho Chi Minh City, Da Nang, Hanoi

**Services covered:** GrabFood, GrabMart

---

## Tables

### `users`

User master table. One row per registered user.

| Column | Type | Description |
|---|---|---|
| `user_id` | TEXT | Primary key (hashed) |
| `city` | TEXT | City of the user (`Ho Chi Minh City`, `Da Nang`, `Hanoi`) |
| `user_segment` | TEXT | Behavioural segment (`Regular`, `High Value`, `Voucher Hunter`, `Occasional`) |
| `first_mart_order_date` | TEXT | ISO date of the user's very first Mart order (pre-dates this dataset if they were existing Mart users) |

---

### `merchants`

Merchant master table. One row per merchant.

| Column | Type | Description |
|---|---|---|
| `merchant_id` | TEXT | Primary key (hashed) |
| `vertical` | TEXT | `Food` or `Mart` |
| `merchant_type` | TEXT | `SME` or `Key Account` |
| `take_rate` | REAL | Grab's commission percentage per order (e.g., `0.10` = 10%) |

---

### `transactions`

Individual transaction-level fact table. Core table for all analysis.

| Column | Type | Description |
|---|---|---|
| `transaction_id` | TEXT | Primary key |
| `date` | TEXT | ISO date of transaction (`YYYY-MM-DD`) |
| `week_number` | INTEGER | Week number relative to start (1–14) |
| `period` | TEXT | `Pre-Promo`, `Promo`, or `Post-Promo` — denormalised for convenience |
| `city` | TEXT | City where the transaction occurred |
| `service_type` | TEXT | `GrabFood` or `GrabMart` |
| `user_id` | TEXT | Foreign key → `users.user_id` |
| `merchant_id` | TEXT | Foreign key → `merchants.merchant_id` |
| `item_subtotal` | REAL | Value of goods ordered, VND thousands |
| `delivery_fee_collected` | REAL | Delivery fee paid by the user, VND thousands |
| `driver_payout` | REAL | Amount Grab pays to the driver, VND thousands |
| `promo_discount` | REAL | Voucher value funded by Grab, VND thousands |
| `is_cross_sell_voucher` | INTEGER | `1` if the Mega Promo voucher was applied, `0` otherwise |

---

### `weather_daily`

Daily temperature readings per city. One row per city per day.

| Column | Type | Description |
|---|---|---|
| `date` | TEXT | ISO date (`YYYY-MM-DD`) |
| `city` | TEXT | City name |
| `avg_temperature_celsius` | REAL | Average daily temperature in Celsius |

---

## Suggested Starter Queries

```sql
-- 1. Top-line GMV by city and period (the surface number)
SELECT city, period, service_type,
       ROUND(SUM(item_subtotal) / 1e3, 1) AS gross_gmv_M_vnd,
       COUNT(*) AS n_transactions
FROM transactions
GROUP BY city, period, service_type
ORDER BY city, period, service_type;

-- 2. Cross-sell voucher redemption rate by city (HCMC only during promo)
SELECT city, period,
       SUM(is_cross_sell_voucher) AS vouchers_redeemed,
       COUNT(*) AS n_transactions,
       ROUND(100.0 * SUM(is_cross_sell_voucher) / COUNT(*), 1) AS redemption_pct
FROM transactions
WHERE service_type = 'GrabMart'
GROUP BY city, period;

-- 3. Unit economics per transaction (build toward P&L)
SELECT service_type, merchant_type,
       ROUND(AVG(item_subtotal), 1)           AS avg_subtotal,
       ROUND(AVG(delivery_fee_collected), 1)  AS avg_delivery_fee,
       ROUND(AVG(driver_payout), 1)           AS avg_driver_payout,
       ROUND(AVG(promo_discount), 1)          AS avg_discount,
       ROUND(AVG(m.take_rate * 100), 1)       AS avg_take_rate_pct
FROM transactions t
JOIN merchants m ON t.merchant_id = m.merchant_id
WHERE city = 'Ho Chi Minh City' AND period = 'Promo'
GROUP BY service_type, merchant_type;

-- 4. New vs. existing Mart users activated during promo
SELECT
    CASE
        WHEN u.first_mart_order_date >= '2024-02-12' THEN 'New Mart User'
        ELSE 'Existing Mart User'
    END AS user_type,
    COUNT(DISTINCT t.user_id) AS unique_users,
    COUNT(*) AS n_transactions
FROM transactions t
JOIN users u ON t.user_id = u.user_id
WHERE t.city = 'Ho Chi Minh City'
  AND t.service_type = 'GrabMart'
  AND t.period = 'Promo'
GROUP BY user_type;

-- 5. Post-promo Mart retention — do cross-sell users stick?
SELECT
    CASE WHEN SUM(CASE WHEN period = 'Promo' AND is_cross_sell_voucher = 1 THEN 1 ELSE 0 END) > 0
         THEN 'Cross-Sell Redeemer' ELSE 'Non-Redeemer' END AS segment,
    SUM(CASE WHEN period = 'Post-Promo' AND service_type = 'GrabMart' THEN 1 ELSE 0 END) AS post_promo_mart_tx
FROM transactions t
JOIN users u ON t.user_id = u.user_id
WHERE u.city = 'Ho Chi Minh City'
GROUP BY t.user_id
HAVING SUM(CASE WHEN service_type = 'GrabMart' THEN 1 ELSE 0 END) > 0;
```
