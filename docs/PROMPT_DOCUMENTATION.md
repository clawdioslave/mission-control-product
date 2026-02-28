#!/usr/bin/env python3
"""
Mission Control - Complete Prompt Documentation & Testing
Shows all 7 questions and how customization works
"""

print("=" * 80)
print("🚀 MISSION CONTROL - CUSTOMIZER PROMPT DOCUMENTATION")
print("=" * 80)
print()

print("THE 7 QUESTIONS THAT CREATE YOUR CUSTOM DASHBOARD:")
print("=" * 80)
print()

questions = [
    {
        "num": 1,
        "title": "WHO ARE YOU?",
        "purpose": "Determines module recommendations and tips",
        "options": [
            ("a", "Freelancer / Solopreneur", "Emphasizes client tracking, time management, revenue per client"),
            ("b", "Agency Owner", "Team management, pipeline tracking, capacity planning"),
            ("c", "Startup Founder", "Goal tracking, metrics, product development, runway"),
            ("d", "Content Creator", "Content calendar, idea capture, publishing schedule"),
            ("e", "Consultant / Coach", "Client pipeline, session tracking, relationship management"),
            ("f", "Other", "Generic business setup with full flexibility")
        ],
        "affects": [
            "Recommended modules in Question 3",
            "Personalized tips in README",
            "Example data in config.js",
            "Focus of automation scripts (Pro tier)"
        ]
    },
    {
        "num": 2,
        "title": "CHOOSE YOUR TIER",
        "purpose": "Determines available modules and features",
        "options": [
            ("free", "FREE - 5 Core Modules", "Daily Focus, Weekly Review, Goals, Finances, Tasks"),
            ("pro", "PRO - All 18+ Modules + Automations ($29)", "Everything including Client Projects, Time Tracking, Content Calendar, Habits, etc."),
            ("team", "TEAM - Collaboration ($79/month)", "Everything + team features, white-label, API access")
        ],
        "affects": [
            "Which modules appear in Question 3",
            "Whether automation scripts are included",
            "Upgrade prompts in dashboard (if Free selects Pro modules)",
            "Pricing shown in footer"
        ]
    },
    {
        "num": 3,
        "title": "WHAT DO YOU NEED TO TRACK?",
        "purpose": "Selects which modules appear in your dashboard",
        "module_categories": {
            "CORE (Free)": [
                "Daily Focus - 3 priorities, energy tracking",
                "Weekly Review - Reflection and planning",
                "Goals - 90-day goal tracking",
                "Finances - Revenue and expenses",
                "Tasks - Simple task management"
            ],
            "BUSINESS (Pro)": [
                "Client Projects - Manage client work",
                "Pipeline & Leads - Track deals",
                "Team - Delegate and manage"
            ],
            "PRODUCTIVITY (Pro)": [
                "Time Tracking - Where hours go",
                "Habits - Build routines",
                "Energy - Prevent burnout"
            ],
            "CONTENT (Pro)": [
                "Content Calendar - Editorial planning",
                "Ideas - Capture system",
                "Assets - Template library"
            ],
            "SPECIALIZED (Pro)": [
                "Learning - Skill development",
                "Network - Relationship tracking",
                "Competitor - Market intel",
                "Product Dev - Feature tracking",
                "Launch Planner - Event planning"
            ]
        },
        "affects": [
            "Which HTML modules are generated",
            "What config.js data structure is created",
            "Setup guide complexity",
            "Dashboard layout and organization"
        ]
    },
    {
        "num": 4,
        "title": "WHAT'S YOUR BIGGEST CHALLENGE?",
        "purpose": "Helps prioritize which modules are emphasized",
        "options": [
            ("a", "Too many apps/tools (tool overload)", "Emphasizes unified dashboard, simplification"),
            ("b", "Losing track of deadlines", "Emphasizes calendar, reminders, daily focus"),
            ("c", "Not knowing where time goes", "Emphasizes time tracking, analytics"),
            ("d", "Scattered client communication", "Emphasizes CRM, communication log"),
            ("e", "No visibility into progress", "Emphasizes goals, metrics, charts"),
            ("f", "Overwhelmed by options", "Emphasizes simplicity, focus, daily 3 priorities")
        ],
        "affects": [
            "Which module appears first (most prominent)",
            "Tips in README",
            "Default config.js priorities",
            "Language used in dashboard (e.g., 'simplify' vs 'scale')"
        ]
    },
    {
        "num": 5,
        "title": "PERSONALIZATION",
        "purpose": "Branding and identity",
        "inputs": [
            ("Business name", "Appears in header, README, page title"),
            ("Your name", "Appears in welcome message, personalization")
        ],
        "affects": [
            "Dashboard header title",
            "README title",
            "Welcome message",
            "Email templates",
            "Page <title> tag"
        ]
    },
    {
        "num": 6,
        "title": "VISUAL STYLE",
        "purpose": "Aesthetic customization",
        "options_theme": [
            ("a", "Dark mode", "#0a0a0f background, #e0e0e0 text, easier on eyes"),
            ("b", "Light mode", "#f5f5f5 background, #333333 text, clean look")
        ],
        "options_color": [
            ("1", "Blue", "#00d4ff - Professional, trustworthy"),
            ("2", "Purple", "#7b2cbf - Creative, innovative"),
            ("3", "Green", "#00ff88 - Growth, money, positive"),
            ("4", "Orange", "#ff6600 - Energy, action, bold"),
            ("5", "Pink", "#ff0066 - Bold, standout, fun")
        ],
        "affects": [
            "CSS variables in styles.css",
            "Background colors",
            "Text colors",
            "Accent colors (buttons, highlights)",
            "Chart colors"
        ]
    },
    {
        "num": 7,
        "title": "WHAT'S YOUR PRIMARY GOAL?",
        "purpose": "Aligns dashboard messaging with user intent",
        "options": [
            ("a", "Get more organized", "Focus on structure, systems, clarity"),
            ("b", "Scale my business", "Focus on growth, metrics, team"),
            ("c", "Save time daily", "Focus on efficiency, automations, quick capture"),
            ("d", "Reduce stress/anxiety", "Focus on simplicity, focus, wellness"),
            ("e", "Track progress better", "Focus on metrics, goals, visibility")
        ],
        "affects": [
            "Tagline in dashboard",
            "README introduction focus",
            "Which tips are emphasized",
            "Success metrics suggested in setup guide"
        ]
    }
]

for q in questions:
    print(f"\n{'='*80}")
    print(f"QUESTION {q['num']}: {q['title']}")
    print(f"{'='*80}")
    print(f"Purpose: {q['purpose']}")
    print()
    
    if 'options' in q:
        print("Options:")
        for opt in q['options']:
            if len(opt) == 3:
                print(f"  {opt[0]}) {opt[1]}")
                print(f"     → {opt[2]}")
            else:
                print(f"  {opt[0]}) {opt[1]}")
    
    if 'inputs' in q:
        print("Inputs:")
        for inp in q['inputs']:
            print(f"  • {inp[0]}: {inp[1]}")
    
    if 'module_categories' in q:
        print("Available Modules by Category:")
        for cat, modules in q['module_categories'].items():
            print(f"\n  {cat}:")
            for mod in modules:
                print(f"    • {mod}")
    
    if 'options_theme' in q:
        print("Theme Options:")
        for opt in q['options_theme']:
            print(f"  {opt[0]}) {opt[1]} - {opt[2]}")
        print("\nColor Options:")
        for opt in q['options_color']:
            print(f"  {opt[0]}) {opt[1]} - {opt[2]}")
    
    print(f"\nWhat this affects:")
    for affect in q['affects']:
        print(f"  • {affect}")

print("\n" + "="*80)
print("CUSTOMIZATION OUTPUT FILES")
print("="*80)
print("""
After answering all 7 questions, the customizer generates:

📁 [business_name]_mission_control/
├── 📄 dashboard.html     → Your main dashboard (visual style applied)
├── 📄 config.js          → Your data structure (modules configured)
├── 📄 styles.css         → Your theme colors and layout
├── 📄 app.js            → Logic for your selected modules
├── 📄 README.md         → Personalized guide with your tips
├── 📄 SETUP.md          → Setup instructions for your modules
└── 📁 automations/      → Python scripts (Pro tier only)
    ├── daily_digest.py
    ├── invoice_reminders.py
    └── calendar_sync.py

Each file is customized based on your 7 answers!
""")

print("="*80)
print("EXAMPLE CUSTOMIZATION FLOW")
print("="*80)
print("""
Example User: Sarah, Freelance Designer

Q1: Who are you? → Freelancer
Q2: Tier? → Pro
Q3: Modules? → Client Projects, Time Tracking, Finances, Goals
Q4: Challenge? → Not knowing where time goes
Q5: Business name? → Sarah Design Co
Q6: Visual? → Dark mode + Purple
Q7: Goal? → Save time daily

RESULT:
• Dashboard shows: Daily Focus (prominent), Client Projects, Time Tracking
• README tips: "Track time per client to find most profitable work"
• Config.js: Includes client list, hourly rates, project tracking
• Theme: Dark purple aesthetic
• Automations: Time tracking reports, client invoice reminders
""")

print("="*80)
print("✅ DOCUMENTATION COMPLETE")
print("="*80)