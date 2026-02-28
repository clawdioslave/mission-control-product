#!/bin/bash
# Beta Tester Feedback Collection System Setup

echo "🎯 BETA TESTER FEEDBACK COLLECTION SYSTEM"
echo "=========================================="
echo ""
echo "This script helps you set up feedback collection for beta testers"
echo ""

# Create feedback tracking directory
mkdir -p ~/.openclaw/workspaceollama/projects/MISSION-CONTROL-PRODUCT/beta-feedback

cat > ~/.openclaw/workspaceollama/projects/MISSION-CONTROL-PRODUCT/beta-feedback/SETUP_INSTRUCTIONS.md << 'EOF'
# Beta Tester Feedback Collection Setup

## 📊 METHOD: Google Forms + Google Sheets

### Step 1: Create Google Forms (15 minutes)

**Form 1: Day 2 Check-In Survey**

Go to: https://forms.google.com

**Settings:**
- Form title: "Mission Control — Day 2 Check-In"
- Description: "Quick 2-minute survey to see how your first day went"

**Questions to add:**

1. **Setup Experience** (Multiple choice)
   - ✅ Yes, super easy!
   - ⚠️ Took 10-15 minutes
   - ❌ Took longer than 15 minutes
   - 😕 Haven't set it up yet

2. **First Impressions** (Multiple choice)
   - 🤩 Love it! Already using daily
   - 👍 Good, see potential
   - 😐 It's okay
   - 😕 Not what I expected
   - 😞 Confusing/frustrating

3. **Most Useful Feature** (Multiple choice)
   - Daily Focus
   - Client Projects
   - Revenue Dashboard
   - Goal Tracker
   - Task Manager
   - Haven't explored yet

4. **What's Confusing?** (Paragraph, optional)
   - "Be honest — what's not working or confusing?"

5. **Missing Features** (Paragraph, optional)
   - "What would make this 10x more useful?"

6. **Bugs/Issues** (Paragraph, optional)
   - "Describe what happened..."

**Settings to enable:**
- ✅ Collect email addresses
- ✅ Show progress bar
- ✅ Response receipts

**Theme:**
- Header color: #7b2cbf (purple) or your brand color
- Background: Light

---

**Form 2: Day 5 Final Feedback**

**Settings:**
- Form title: "Mission Control — Final Beta Feedback"
- Description: "Help us improve with your detailed feedback (5 minutes)"

**Questions to add:**

1. **Usage Frequency** (Multiple choice)
   - Every day (5+ days)
   - 3-4 days
   - 1-2 days
   - Opened it but didn't really use
   - Haven't used it yet

2. **Daily Workflow** (Paragraph, optional)
   - "Walk me through your morning/evening routine with Mission Control..."

3. **Most Valuable Module** (Multiple choice)
   - [List all their selected modules]
   - None really

4. **Least Useful** (Multiple choice)
   - [List all their selected modules]
   - Using them all

5. **Time Saved** (Multiple choice)
   - Yes, 30+ minutes per day
   - Yes, 10-30 minutes per day
   - Yes, a few minutes here and there
   - Not yet, but I see potential
   - No, not really

6. **Organization Impact** (Linear scale 1-5)
   - 1 = No change
   - 5 = Dramatically more organized

7. **Would You Pay $29?** (Multiple choice)
   - 💯 Absolutely, already want to upgrade
   - 🤔 Probably, if [tell us what would convince you]
   - 💭 Maybe, not sure yet
   - ❌ No, not valuable enough for me
   - 🆓 Free version is enough

8. **What Would Make You Upgrade?** (Paragraph, optional)
   - "Be specific — what automation or feature would be a no-brainer?"

9. **Feature Requests** (Paragraph, optional)
   - "Dream big — what would make this perfect for you?"

10. **Biggest Frustration** (Paragraph, optional)
    - "Don't hold back — what's most frustrating?"

11. **NPS Score** (Linear scale 0-10)
    - 0 = Not at all likely to recommend
    - 10 = Extremely likely

12. **Testimonial Permission** (Multiple choice)
    - ✅ Yes, use my name and feedback
    - ✅ Yes, but anonymous only
    - 🎥 Yes, and I'll record a video testimonial
    - ❌ No, keep my feedback private

13. **Referrals** (Paragraph, optional)
    - "Know anyone else who'd benefit? (email addresses)"

14. **Final Thoughts** (Paragraph, optional)
    - "Open mic — whatever's on your mind..."

**Thank You Message:**
"🎉 THANK YOU! Your feedback is invaluable. As promised, you now have Mission Control Pro FREE for life ($99 value). Expect your 'Founding Member' badge soon!"

---

### Step 2: Get Form Links

**For each form:**
1. Click "Send" button
2. Click link icon
3. Click "Shorten URL"
4. Copy the link

**Save these links:**
- Day 2 Survey: _______________
- Day 5 Survey: _______________

---

### Step 3: Create Tracking Spreadsheet

**Go to:** https://sheets.google.com

**Create new sheet with columns:**

| Column | Purpose |
|--------|---------|
| A | Name |
| B | Email |
| C | Business Type |
| D | Date Sent |
| E | Day 2 Survey Completed | (Y/N) |
| F | Day 2 Date | (date) |
| G | Day 5 Survey Completed | (Y/N) |
| H | Day 5 Date | (date) |
| I | Testimonial | (Y/N) |
| J | Video Testimonial | (Y/N) |
| K | Key Feedback | (summary) |
| L | Bugs Reported | (list) |
| M | Feature Requests | (list) |
| N | Would Pay | (Y/N/Maybe) |
| O | NPS Score | (0-10) |
| P | Notes | (your notes) |

**Share settings:**
- Private to you (don't share with testers)

---

### Step 4: Automate Response Collection

**In Google Forms:**
1. Go to "Responses" tab
2. Click green Sheets icon
3. "Create a new spreadsheet"
4. Name it "Mission Control Beta Responses"

**Now all responses auto-populate the sheet!**

---

### Step 5: Set Up Notifications

**Get email when someone responds:**

**Option A: Google Forms Native**
1. In Form: Settings → "Get email notifications for new responses"

**Option B: Zapier (Advanced)**
1. Go to zapier.com
2. Create Zap: Google Forms → Email
3. Trigger: New form response
4. Action: Send email to you
5. Include response details in email

---

## 📧 EMAIL SEQUENCE FOR BETA TESTERS

### Email 1: Welcome + Dashboard Delivery (Day 0)

**Subject:** 🚀 Your Mission Control Beta Access

```
Hey [Name],

Your custom Mission Control dashboard is ready!

📦 WHAT'S ATTACHED:
• Your personalized dashboard
• Setup guide (5 minutes)
• All Pro features unlocked

🚀 QUICK START:
1. Download and extract the ZIP
2. Open dashboard.html
3. Edit config.js with your data
4. Start tracking!

📋 YOUR FEEDBACK MISSION:
• Day 2 Survey: [LINK] (30 seconds)
• Day 5 Survey: [LINK] (5 minutes)
• Optional: 2-min video testimonial

💬 QUESTIONS?
Reply to this email anytime. I'm here to help!

Thanks for being a founding member,
Chris
```

---

### Email 2: Day 2 Survey Reminder (Day 2)

**Subject:** Quick check-in — How's Mission Control?

```
Hey [Name],

You've had Mission Control for 2 days!

Quick favor: 30-second survey?

👉 [Day 2 Survey Link]

Just 3 multiple choice questions:
• How was setup?
• First impressions?
• Any confusion?

Your feedback directly shapes the product.

Thanks!
Chris
```

---

### Email 3: Mid-Week Check-In (Day 3-4)

**Subject:** How's it going with Mission Control?

```
Hey [Name],

Quick personal check-in (not automated!):

How's Mission Control working for you?

Any questions or stuck points I can help with?

Just reply to this email.

— Chris
```

---

### Email 4: Day 5 Survey (Day 5)

**Subject:** Final feedback — 5 minutes?

```
Hey [Name],

You've used Mission Control for 5 days!

Final feedback survey: 👉 [Day 5 Survey Link]

This one goes deeper:
• What's working?
• What's missing?
• Would you pay $29?
• Feature requests?

Takes 5 minutes. Huge impact.

🎁 As promised:
• Pro tier FREE for life ($99 value)
• Founding member status
• Lifetime updates

Optional: Record a 2-min testimonial?
Just reply with video or Loom link.

Thanks for everything!
Chris
```

---

### Email 5: Thank You + Next Steps (Day 7)

**Subject:** 🎉 You're a Mission Control Founding Member!

```
Hey [Name],

Beta testing complete — THANK YOU!

🎁 YOUR REWARDS:
✓ Mission Control Pro (free for life)
✓ Founding Member badge
✓ Lifetime updates
✓ Direct access to me

📊 WHAT I LEARNED FROM YOU:
[Personalize based on their feedback]

🚀 WHAT'S NEXT:
• Official launch: [DATE]
• Your testimonial featured (if you said yes)
• Pro features unlocked forever

Questions? Just reply.

Thanks for helping build this!

— Chris
P.S. — Know anyone else who'd benefit? Send them to [link]
```

---

## 📊 TRACKING TEMPLATE

**Copy this into your spreadsheet:**

```
Name          | Email              | Type       | Sent   | D2 | D2 Date | D5 | D5 Date | Test | Video | NPS | Pay | Notes
--------------|--------------------|------------|--------|----|---------|----|---------|------|-------|-----|-----|-------
[Test Name 1] | [email@example.com]| Freelancer | [date] | ☐  |         | ☐  |         | ☐    | ☐     |     |     |
[Test Name 2] | [email@example.com]| Agency     | [date] | ☐  |         | ☐  |         | ☐    | ☐     |     |     |
```

---

## 🎯 SUCCESS METRICS

### Response Rate Targets:
- Day 2 Survey: 80%+
- Day 5 Survey: 70%+
- Video Testimonial: 30%+

### Quality Targets:
- Average NPS: 50+
- "Would Pay $29": 50%+
- Feature requests: 3+ per tester
- Bugs found: <2 critical

---

## ✅ CHECKLIST

**Before sending to beta testers:**
- [ ] Create Day 2 Google Form
- [ ] Create Day 5 Google Form
- [ ] Get form links
- [ ] Create tracking spreadsheet
- [ ] Set up response notifications
- [ ] Customize email templates with their names
- [ ] Test send to yourself first

**Ready? Send those recruitment emails!**
EOF

echo ""
echo "✅ Feedback collection system created!"
echo ""
echo "📁 Location: beta-feedback/SETUP_INSTRUCTIONS.md"
echo ""
echo "⏱️  Time to set up: 15 minutes"
echo ""
echo "Next steps:"
echo "1. Open SETUP_INSTRUCTIONS.md"
echo "2. Follow Step 1 (create Google Forms)"
echo "3. Save form links"
echo "4. Send to beta testers!"
echo ""