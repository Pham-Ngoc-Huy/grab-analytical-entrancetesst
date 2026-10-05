> **45% growth → Acquisition? → New users không đủ → Behaviour? → Threshold-driven transactions → Economics? → Unhealthy → Sustainable? → Fades → Don't scale yet**

---

# Slide 1 — Opening / Set the Question

### Script

> **Hope you are all doing well.**
>
> Before I start, I just want to clarify one thing.
>
> This research and presentation is based on **my own analysis of the given problem**.
>
> So there might be some assumptions or approaches that may not fully align with yours. If there are any concerns or different opinions, please keep them until the end, so we can discuss them together

---

# Slide 2 — The 45% Growth: Real, but Sustainable?

### Script

> Let's start. With the information, I received from the case:
> 
> Grab launched the campaign in Ho Chi Minh City generated more than 45% GMV growth
>
> Based on this result, *The Country Head believes this campaign successfully shifted user behaviour and built cross-service habits. AND whether we should scale this campaign to Hanoi.
> 
> We want to find out whether this is a true growth and if this growth is real, is it sustainable ?
>
>
<!-- explaination the continuos process -->
>
> I will take the **45% uplift as a given starting point**.
>
>
> Because the campaign mechanism itself is quite straightforward.
>
> A GrabFood user needs to make a **100K Food order**, and then they receive a **50K GrabMart voucher**.
>
> So the campaign is basically trying to use an existing Food transaction to stimulate a new or additional Mart transaction.
>
> Therefore, I decided to decompose the problem into three levels.
>
> First, **who is actually generating the Mart GMV?**
>
> Second, **what behaviour is generating the additional transactions?**
>
> And third, **does this additional GMV create healthy economics value?**
>
>
> To answer these questions, my strategy is:
<!-- <chỉ chỏ vui vui> -->

---

# Slide 3 — Cross-sell Works, But New Mart Users Are Not the Whole Story

> So I started with the **acquisition funnel**.
>
> And actually, the first finding is quite positive.
>
> We can see that in `Promo` phase -- total **4,999 Food users** participate in the campaign, 
>
> around **89% Food-users redeemed the voucher and classified as campaign-acquired users**.
>
> From this perspective, I would say:
>
> **the cross-sell mechanism is clearly working.**
>
> But,
>
> **Are these users actually contributing to the Mart Growth?**
>
> To answer the question, I separated the promo-period Mart users into two groups:
>
> **Existing Mart users and New Mart users.**
>
> And this is where I found something interesting.
>
> New Mart users are only around **13.24% of the promo-period Mart users**.
>
> While Existing Mart users are around **86.76%**.
>
> And in terms of GMV, New Mart users contribute around **13.4% of total Mart GMV**.
>
> So I think there are conclusions here.
>
> We have to admit that **cross-sell acquisition is clearly effective.** base on above data
>
> However, **new-user acquisition alone cannot explain the overall Mart GMV uplift.**
>
> Because the majority of the GMV is still coming from users who were already using Mart (existing user).
>
>
> **If the acquisition is not the whole story, then what happened to the transaction behaviour inside the existing Food and Mart customer base?**
>
---

# Slide 4 — The Uplift Is Strongly Associated with Threshold-Driven Behaviour

### Script

> So now I moved from **user acquisition** into **transaction behaviour**.
>
> My initial hypothesis was:
>
> maybe users simply started buying more.
>
> Because the campaign requires a Food order above **100K** to unlock the Mart voucher, maybe users were increasing their basket size to reach this threshold.
>
> So I looked at the behaviour of the same tracked cohort before and during the promotion.
>
>
> Orders per user increased from **8.14 to 19.15**, which is around **+135%**.
>
> GMV per user also increased by around **103%**.
>
> But at the same time, **AOV per order decreased by 9.2%**.
>
> And this is quite important.
>
> If the main story was simply **basket expansion**, I would expect the average order value to increase.
>
> But instead, we see:
>
> **more orders, while each order is actually smaller.**
>
> Then I looked specifically at the qualifying orders above the 100K threshold.
>
> Those increased by around **162%**.
<!-- Done -->
>
> And within the same tracked cohort, around **5.8% of users crossed the threshold** — meaning their pre-promo AOV was below 100K, but during the promo it became 100K or above.
>
> So when I put these pieces together:
>
> **orders increase significantly, qualifying orders around the voucher threshold increase sharply, while AOV decreases.**
>
> It gives us a **strong signal of threshold-driven transaction behaviour**.
>
> And this is where i think that **order splitting becomes a highly plausible mechanism**.
>
> However, I want to careful with the conclusion.
>
> I would not say that **100% of the uplift is proven by order splitting**.
>
> but this give us a motivation to decompose **genuine basket expansion / bundling** from **order splitting**.
>
> Therefore, study further.
>
> So my safer conclusion here is:
>
> **the campaign created incentive of transaction expansion, rather than giving us a clear evidence of a pure behavioural habit shift.**

<!-- Done Q1 -->
---

# Slide 5 — More GMV Did Not Mean Healthier Mart Economics

### Script

> So after understanding **how the transactions increased**, I moved to the next question:
>
> **Does more GMV actually mean more value for the business?**
>
> Because from a business perspective, I don't think we should stop at GMV.
>
> So I built my own contribution-margin framework, using the commercial logic I established, since the case intentionally leaves the P&L formula open-ended.
>
> For GrabMart, GMV increased from around **1.38 billion to 1.79 billion VND**, which is around **29.5% growth**.
>
> So yes, there is clearly additional Mart volume.
>
> But when we look at the economics, the story changes.
>
> Contribution margin per order moved from positive to negative.
>
> And the same trend happened to the total contribution margin.
>
> So under my assumptions and calculations, the campaign pay for additional Mart volume, but that volume was **economically expensive**.
>
> And this is an important intuition for me:
>
> **The campaign generates more transactions.**, but
>
> **GMV growth should not automatically be treated as healthy incremental growth.**
> 
>
> **we have a strong signal that the transactions are incentive-driven, and the incremental Mart economics are negative under the current assumptions.**
>
> Up to this point, we knew what is
> 
> **really driving this 45% growth**
>
> The next question becomes:
>
> **Even if we accept this economic trade-off during the promo, did the behaviour actually stay after the promotion ended?**

---

# Slide 6 — Test Sustainability: Mart GMV Uplift Fades After Promo


### Script

> So this is where I moved from descriptive analysis into a more causal framework.
>
> The question I wanted to answer was:
>
> **Is this actually a sustainable behavioural shift, or is it simply a temporary promotion effect?**
>
> To test this, I used a **Difference-in-Differences and Event Study framework**.
>
> I used **Ho Chi Minh City as the treatment market**, and Hanoi as the candidate control.
>
> I also tested Da Nang during the validation stage, but the pre-period trend was not consistent enough with HCMC, so I did not use Da Nang as the main control group.
>
> I also considered **weather as an external factor**, because weather can affect customer ordering behaviour independently from the campaign.
>
> I used two specifications here.
>
> The first one is the **Event Study**, which allows me to see the effect week by week.
>
> At first, i got that it gives us more detail, but the result still contain lots of noise.
>
> The second one is the **Pooled DiD**, where I only breakdown it into 3 phases to  estimate one overall treatment effect during the promotion.
>
> For the P&L interpretation, I prefer the pooled DiD because it gives us one more stable estimate of the overall Promo effect.
>
>
> During the promotion, there is a positive uplift.
>
> But after the promotion ends, the effect moves **close to the baseline**.
>
> So this gives us weak evidence for persistent habit formation.

---

# Slide 7 — Final Recommendation


### Script

> So finally, let me bring all the findings together.
>
> My recommendation is:
>
> **I would not scale the current campaign mechanic to Hanoi yet.**
>
> And there are three main reasons.
>
> **First — Durability.**
>
> We see a clear uplift during the promotion, after the promotion the effect declines toward the baseline.
>
> If we only look at the effect of last 2 weeks, it did genereate a very small incremental growth compare to the pre-promo.
>
> However, we don't have strong evidence that the campaign created a persistent Mart habit.
> 
> **Second — Behaviour.**
>
> Orders per user increased by **135%**, qualifying orders increased by **162%**, while AOV decreased by **9.2%**.
>
> So the evidence is more consistent with **incentive-driven transaction expansion** than with a pure shift toward larger or more sustainable Mart consumption.
>
> **Third — Economics.**
>
> Under the current assumptions, Mart contribution margin turns unhealthy since one-order is expensive during the promotion.
>
> So although the campaign can stimulate demand, we cannot yet call this **healthy incremental growth**.
>
> Therefore, my recommendation is not to completely reject the campaign.
>
> Instead, I would say:
>
> **Hold the Hanoi scale-up, optimize the mechanic, and re-test.**
>
> Specifically, the next test should explicitly separate:
>
> **order splitting versus genuine basket expansion or bundling.**
>
> Then we should re-test:
>
> **post-promo retention and incremental contribution margin.**
>
> If we can prove that the additional Mart behaviour remains after the incentive is removed, and that the incremental contribution margin becomes healthy, then I think we have a much stronger case to consider Hanoi.
>
> So my final decision framework is:
>
> **HOLD SCALE → OPTIMIZE THE MECHANIC → RE-TEST SUSTAINABILITY → THEN CONSIDER HANOI.**

---

# Slide 8 — Thank You
> **Thank you for listening.**
>
> That's the end of my analysis.
>
> I'm happy to discuss any of the assumptions, methodology, or findings.

---
Điểm nhấn mạnh

> **The campaign works as a demand-stimulation mechanism, but it has not yet proven to be a sustainable growth mechanism.**


**không phủ nhận 45% growth**.
**không phủ nhận cross-sell acquisition**.

 chứng minh:

```text
Campaign works
      ↓
Cross-sell works
      ↓
But...
New users ≠ whole uplift
      ↓
Transaction frequency ↑
AOV ↓
Qualifying orders ↑
      ↓
Strong threshold-driven behaviour
      ↓
CM deteriorates
      ↓
Post-promo fades
      ↓
Not yet sustainable
      ↓
Don't scale current mechanic
```