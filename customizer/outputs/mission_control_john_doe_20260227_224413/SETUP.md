# Setup Guide: Test Business

## Step 1: Open Your Dashboard

1. Open `dashboard.html` in your browser
2. You should see your custom dashboard with 3 modules

## Step 2: Customize Your Data (5 minutes)

Edit `config.js` and add:

### Daily Focus
Replace the empty strings with your 3 priorities:
```javascript
daily_focus: [
    "[Your #1 priority today]",
    "[Your #2 priority]", 
    "[Your #3 priority]"
]
```


### Client Projects
Add your active projects:
```javascript
projects: [
    {{name: "Client A Website", status: "In Progress", deadline: "2026-03-15"}},
    {{name: "Client B Consulting", status: "Planning", deadline: "2026-03-30"}}
]
```

### Revenue Tracking
Set your monthly goal and current progress:
```javascript
revenue: {{
    current: 3500,  // What you've earned this month
    goal: 10000     // Your monthly target
}}
```

### 90-Day Goals
Define your key goals:
```javascript
goals: [
    {{title: "Launch new service", target: "March 31", progress: 40}},
    {{title: "Reach $10k MRR", target: "April 30", progress: 35}}
]
```

## Step 3: Save and Refresh

1. Save `config.js`
2. Refresh `dashboard.html`
3. See your data appear!

## Step 4: Daily Use

Each morning:
1. Open your dashboard
2. Review/update your 3 priorities
3. Check your client projects, finances
4. Work from your priorities

## Need Help?

Your setup is optimized for freelancers who want to organization.

Start simple. Add complexity as needed.
