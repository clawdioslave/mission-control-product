#!/usr/bin/env python3
"""
Mission Control Customizer
Creates a customized dashboard system based on user inputs
"""

import json
import os
import shutil
from datetime import datetime
from pathlib import Path

class MissionControlCustomizer:
    def __init__(self):
        self.template_dir = Path(__file__).parent / "templates"
        self.output_dir = Path(__file__).parent / "outputs"
        self.user_config = {}
        
    def run_wizard(self):
        """Interactive customization wizard"""
        print("=" * 60)
        print("🚀 MISSION CONTROL CUSTOMIZER")
        print("=" * 60)
        print("\nLet's customize your dashboard system...\n")
        
        # Question 1: Who are you?
        print("1️⃣  WHO ARE YOU?")
        print("-" * 40)
        print("a) Freelancer / Solopreneur")
        print("b) Agency Owner")
        print("c) Startup Founder")
        print("d) Content Creator")
        print("e) Consultant / Coach")
        print("f) Other")
        
        user_type = input("\nSelect (a-f): ").strip().lower()
        type_map = {
            'a': 'freelancer',
            'b': 'agency', 
            'c': 'startup',
            'd': 'creator',
            'e': 'consultant',
            'f': 'other'
        }
        self.user_config['user_type'] = type_map.get(user_type, 'freelancer')
        
        # Question 2: What do you track?
        print("\n\n2️⃣  WHAT DO YOU NEED TO TRACK?")
        print("-" * 40)
        print("Select all that apply (comma-separated):")
        print("1. Client projects")
        print("2. Personal tasks")
        print("3. Revenue / finances")
        print("4. Content calendar")
        print("5. Team members")
        print("6. Goals / OKRs")
        print("7. Time tracking")
        print("8. Habits / routines")
        
        tracking = input("\nEnter numbers (e.g., 1,3,6): ").strip()
        tracking_map = {
            '1': 'client_projects',
            '2': 'personal_tasks',
            '3': 'finances',
            '4': 'content_calendar',
            '5': 'team',
            '6': 'goals',
            '7': 'time_tracking',
            '8': 'habits'
        }
        selected = [tracking_map.get(n.strip(), 'personal_tasks') for n in tracking.split(',') if n.strip() in tracking_map]
        self.user_config['tracking_modules'] = selected if selected else ['personal_tasks', 'goals']
        
        # Question 3: Primary pain point
        print("\n\n3️⃣  WHAT'S YOUR BIGGEST CHALLENGE?")
        print("-" * 40)
        print("a) Too many apps/tools")
        print("b) Losing track of deadlines")
        print("c) Not knowing where time goes")
        print("d) Scattered client communication")
        print("e) No visibility into progress")
        print("f) Overwhelmed by options")
        
        pain = input("\nSelect (a-f): ").strip().lower()
        pain_map = {
            'a': 'tool_overload',
            'b': 'deadlines',
            'c': 'time_tracking',
            'd': 'communication',
            'e': 'visibility',
            'f': 'overwhelm'
        }
        self.user_config['pain_point'] = pain_map.get(pain, 'tool_overload')
        
        # Question 4: Tech comfort level
        print("\n\n4️⃣  HOW TECH-COMFORTABLE ARE YOU?")
        print("-" * 40)
        print("a) I can code / automate things")
        print("b) I'm good with tools like Notion/Airtable")
        print("c) I prefer simple, no-code solutions")
        print("d) I need everything very basic")
        
        tech = input("\nSelect (a-d): ").strip().lower()
        tech_map = {
            'a': 'advanced',
            'b': 'intermediate',
            'c': 'beginner',
            'd': 'basic'
        }
        self.user_config['tech_level'] = tech_map.get(tech, 'intermediate')
        
        # Question 5: Business name
        print("\n\n5️⃣  PERSONALIZATION")
        print("-" * 40)
        business_name = input("Your business/project name: ").strip()
        self.user_config['business_name'] = business_name if business_name else "My Business"
        
        user_name = input("Your name (for dashboard): ").strip()
        self.user_config['user_name'] = user_name if user_name else "User"
        
        # Question 6: Primary goal
        print("\n\n6️⃣  WHAT'S YOUR PRIMARY GOAL?")
        print("-" * 40)
        print("a) Get more organized")
        print("b) Scale my business")
        print("c) Save time daily")
        print("d) Reduce stress/anxiety")
        print("e) Track progress better")
        
        goal = input("\nSelect (a-e): ").strip().lower()
        goal_map = {
            'a': 'organization',
            'b': 'scale',
            'c': 'save_time',
            'd': 'reduce_stress',
            'e': 'track_progress'
        }
        self.user_config['primary_goal'] = goal_map.get(goal, 'organization')
        
        print("\n\n" + "=" * 60)
        print("✅ Configuration complete!")
        print("=" * 60)
        
        return self.user_config
    
    def generate_custom_dashboard(self):
        """Generate customized dashboard based on config"""
        
        # Create output directory
        timestamp = datetime.now().strftime("%Y%m%d_%H%M%S")
        output_name = f"mission_control_{self.user_config['user_name'].replace(' ', '_').lower()}_{timestamp}"
        output_path = self.output_dir / output_name
        output_path.mkdir(parents=True, exist_ok=True)
        
        print(f"\n🔧 Generating your customized Mission Control...")
        print(f"   Output: {output_path}")
        
        # Generate all files
        self._generate_readme(output_path)
        self._generate_dashboard_html(output_path)
        self._generate_config_js(output_path)
        self._generate_setup_guide(output_path)
        self._copy_templates(output_path)
        
        print(f"\n✅ Generated custom Mission Control at:")
        print(f"   {output_path}")
        
        return output_path
    
    def _generate_readme(self, output_path: Path):
        """Generate personalized README"""
        
        readme = f"""# {self.user_config['business_name']} — Mission Control

**Customized Dashboard System**  
Generated: {datetime.now().strftime("%B %d, %Y")}

---

## 🎯 Your Configuration

| Setting | Value |
|---------|-------|
| **Business Type** | {self.user_config['user_type'].title()} |
| **Tracking Modules** | {', '.join(m.replace('_', ' ').title() for m in self.user_config['tracking_modules'])} |
| **Primary Goal** | {self.user_config['primary_goal'].replace('_', ' ').title()} |
| **Tech Level** | {self.user_config['tech_level'].title()} |

---

## 🚀 Quick Start

1. **Open `dashboard.html`** in your browser
2. **Customize the config** in `config.js` with your specific data
3. **Start tracking** your work immediately

---

## 📊 What's Included

Based on your needs, this Mission Control includes:

{self._generate_modules_list()}

---

## 🎨 Customization

Edit `config.js` to add:
- Your actual projects and clients
- Your revenue goals and current numbers
- Your team members (if applicable)
- Your specific metrics and KPIs

---

## 💡 Tips for {self.user_config['user_type'].title()}s

{self._generate_tips()}

---

**Built with Mission Control Generator**  
Your command center for clarity and growth.
"""
        
        (output_path / "README.md").write_text(readme)
    
    def _generate_modules_list(self) -> str:
        """Generate list of included modules"""
        modules = []
        
        if 'client_projects' in self.user_config['tracking_modules']:
            modules.append("- **Client Project Tracker** — Manage all client work in one view")
        if 'personal_tasks' in self.user_config['tracking_modules']:
            modules.append("- **Task Command Center** — Daily priorities and action items")
        if 'finances' in self.user_config['tracking_modules']:
            modules.append("- **Revenue Dashboard** — Track income, expenses, and goals")
        if 'content_calendar' in self.user_config['tracking_modules']:
            modules.append("- **Content Pipeline** — Plan and track content creation")
        if 'team' in self.user_config['tracking_modules']:
            modules.append("- **Team Directory** — Manage team members and assignments")
        if 'goals' in self.user_config['tracking_modules']:
            modules.append("- **Goal Tracker** — 90-day goals with weekly milestones")
        if 'time_tracking' in self.user_config['tracking_modules']:
            modules.append("- **Time Insights** — Where your hours go (daily/weekly)")
        if 'habits' in self.user_config['tracking_modules']:
            modules.append("- **Habit System** — Build and track key routines")
            
        return '\n'.join(modules) if modules else "- **Core Dashboard** — Daily focus and priorities"
    
    def _generate_tips(self) -> str:
        """Generate personalized tips"""
        tips_map = {
            'freelancer': """- Set weekly revenue targets in the dashboard
- Track time per client to identify most profitable work
- Use the weekly review to plan client outreach""",
            'agency': """- Monitor team capacity vs. project load
- Track client acquisition vs. churn monthly
- Set up project health scores for early warning""",
            'startup': """- Focus on 1-2 key metrics (revenue, users, retention)
- Review weekly to spot trends early
- Use goal tracker for 90-day milestones""",
            'creator': """- Track content output and engagement
- Plan content 2 weeks ahead
- Monitor revenue streams separately""",
            'consultant': """- Track client pipeline stages
- Log insights per client for better service
- Monitor utilization rate (billable vs. non-billable)""",
            'other': """- Start simple: 3-5 key metrics max
- Review daily for first week to build habit
- Add complexity only when needed"""
        }
        return tips_map.get(self.user_config['user_type'], tips_map['other'])
    
    def _generate_dashboard_html(self, output_path: Path):
        """Generate customized HTML dashboard"""
        # Copy base template and customize
        template_path = self.template_dir / "dashboard_base.html"
        if template_path.exists():
            html = template_path.read_text()
            # Customize with user data
            html = html.replace("{{BUSINESS_NAME}}", self.user_config['business_name'])
            html = html.replace("{{USER_NAME}}", self.user_config['user_name'])
            html = html.replace("{{USER_TYPE}}", self.user_config['user_type'])
            (output_path / "dashboard.html").write_text(html)
        else:
            # Generate basic HTML
            html = self._generate_basic_dashboard()
            (output_path / "dashboard.html").write_text(html)
    
    def _generate_basic_dashboard(self) -> str:
        """Generate basic dashboard HTML"""
        modules_html = self._generate_modules_html()
        
        return f"""<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>{self.user_config['business_name']} — Mission Control</title>
    <link rel="stylesheet" href="styles.css">
</head>
<body>
    <div class="container">
        <header>
            <h1>🚀 {self.user_config['business_name']}</h1>
            <p class="tagline">Welcome back, {self.user_config['user_name']}</p>
            <p class="date" id="current-date"></p>
        </header>
        
        <main class="dashboard">
            {modules_html}
        </main>
        
        <footer>
            <p>Mission Control for {self.user_config['user_type'].title()}s</p>
        </footer>
    </div>
    
    <script src="config.js"></script>
    <script src="app.js"></script>
</body>
</html>"""
    
    def _generate_modules_html(self) -> str:
        """Generate HTML for selected modules"""
        modules = []
        
        # Always include daily focus
        modules.append("""
            <section class="module daily-focus">
                <h2>🎯 Today's Focus</h2>
                <div class="focus-area">
                    <div class="priority" id="priority-1"></div>
                    <div class="priority" id="priority-2"></div>
                    <div class="priority" id="priority-3"></div>
                </div>
            </section>
        """)
        
        if 'client_projects' in self.user_config['tracking_modules']:
            modules.append("""
            <section class="module client-projects">
                <h2>👥 Active Projects</h2>
                <div id="projects-list"></div>
            </section>
            """)
        
        if 'finances' in self.user_config['tracking_modules']:
            modules.append("""
            <section class="module finances">
                <h2>💰 This Month</h2>
                <div class="metrics">
                    <div class="metric">
                        <span class="label">Revenue</span>
                        <span class="value" id="revenue">$0</span>
                    </div>
                    <div class="metric">
                        <span class="label">Goal</span>
                        <span class="value" id="revenue-goal">$0</span>
                    </div>
                </div>
            </section>
            """)
        
        if 'goals' in self.user_config['tracking_modules']:
            modules.append("""
            <section class="module goals">
                <h2>🎯 90-Day Goals</h2>
                <div id="goals-list"></div>
            </section>
            """)
        
        return '\n'.join(modules)
    
    def _generate_config_js(self, output_path: Path):
        """Generate config.js with user data structure"""
        
        config = {
            "business_name": self.user_config['business_name'],
            "user_name": self.user_config['user_name'],
            "user_type": self.user_config['user_type'],
            "modules": self.user_config['tracking_modules'],
            "data": {
                "daily_focus": ["", "", ""],
                "projects": [],
                "revenue": {"current": 0, "goal": 0},
                "goals": [],
                "tasks": []
            }
        }
        
        js_content = f"""// Mission Control Configuration
// Customize this file with your actual data

const CONFIG = {json.dumps(config, indent=2)};

// Initialize dashboard
document.addEventListener('DOMContentLoaded', function() {{
    // Set date
    document.getElementById('current-date').textContent = new Date().toLocaleDateString('en-US', {{ 
        weekday: 'long', year: 'numeric', month: 'long', day: 'numeric' 
    }});
    
    // Load your data here
    console.log('Mission Control loaded for', CONFIG.business_name);
}});
"""
        
        (output_path / "config.js").write_text(js_content)
    
    def _generate_setup_guide(self, output_path: Path):
        """Generate personalized setup guide"""
        
        guide = f"""# Setup Guide: {self.user_config['business_name']}

## Step 1: Open Your Dashboard

1. Open `dashboard.html` in your browser
2. You should see your custom dashboard with {len(self.user_config['tracking_modules'])} modules

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

{self._generate_module_setup()}

## Step 3: Save and Refresh

1. Save `config.js`
2. Refresh `dashboard.html`
3. See your data appear!

## Step 4: Daily Use

Each morning:
1. Open your dashboard
2. Review/update your 3 priorities
3. Check your {', '.join(self.user_config['tracking_modules'][:2]).replace('_', ' ')}
4. Work from your priorities

## Need Help?

Your setup is optimized for {self.user_config['user_type']}s who want to {self.user_config['primary_goal'].replace('_', ' ')}.

Start simple. Add complexity as needed.
"""
        
        (output_path / "SETUP.md").write_text(guide)
    
    def _generate_module_setup(self) -> str:
        """Generate setup instructions for selected modules"""
        instructions = []
        
        if 'client_projects' in self.user_config['tracking_modules']:
            instructions.append("""
### Client Projects
Add your active projects:
```javascript
projects: [
    {{name: "Client A Website", status: "In Progress", deadline: "2026-03-15"}},
    {{name: "Client B Consulting", status: "Planning", deadline: "2026-03-30"}}
]
```""")
        
        if 'finances' in self.user_config['tracking_modules']:
            instructions.append("""
### Revenue Tracking
Set your monthly goal and current progress:
```javascript
revenue: {{
    current: 3500,  // What you've earned this month
    goal: 10000     // Your monthly target
}}
```""")
        
        if 'goals' in self.user_config['tracking_modules']:
            instructions.append("""
### 90-Day Goals
Define your key goals:
```javascript
goals: [
    {{title: "Launch new service", target: "March 31", progress: 40}},
    {{title: "Reach $10k MRR", target: "April 30", progress: 35}}
]
```""")
        
        return '\n'.join(instructions)
    
    def _copy_templates(self, output_path: Path):
        """Copy CSS and JS templates"""
        # Create basic CSS
        css = """/* Mission Control Styles */
* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
}

body {
    font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, sans-serif;
    background: #0a0a0f;
    color: #e0e0e0;
    line-height: 1.6;
}

.container {
    max-width: 1400px;
    margin: 0 auto;
    padding: 20px;
}

header {
    background: linear-gradient(135deg, #1a1a2e 0%, #16213e 100%);
    padding: 30px;
    border-radius: 12px;
    margin-bottom: 30px;
    border: 1px solid #2a2a4a;
}

header h1 {
    font-size: 2em;
    background: linear-gradient(135deg, #00d4ff, #7b2cbf);
    -webkit-background-clip: text;
    -webkit-text-fill-color: transparent;
}

.tagline {
    color: #888;
    margin-top: 5px;
}

.date {
    color: #666;
    font-size: 0.9em;
    margin-top: 10px;
}

.dashboard {
    display: grid;
    grid-template-columns: repeat(auto-fit, minmax(350px, 1fr));
    gap: 20px;
}

.module {
    background: #151520;
    padding: 25px;
    border-radius: 12px;
    border: 1px solid #2a2a4a;
}

.module h2 {
    color: #fff;
    margin-bottom: 15px;
    font-size: 1.2em;
}

.priority {
    background: #1a1a2e;
    padding: 15px;
    border-radius: 8px;
    margin-bottom: 10px;
    border-left: 3px solid #00d4ff;
}

.metrics {
    display: flex;
    gap: 20px;
}

.metric {
    text-align: center;
}

.metric .label {
    display: block;
    color: #888;
    font-size: 0.85em;
}

.metric .value {
    display: block;
    font-size: 1.5em;
    font-weight: bold;
    color: #00d4ff;
}

footer {
    text-align: center;
    padding: 30px;
    color: #666;
    margin-top: 30px;
}
"""
        (output_path / "styles.css").write_text(css)
        
        # Create basic JS
        js = """// Mission Control App Logic

function renderDashboard() {
    // Render daily focus
    if (CONFIG.data.daily_focus) {
        CONFIG.data.daily_focus.forEach((focus, index) => {
            const el = document.getElementById(`priority-${index + 1}`);
            if (el) el.textContent = focus || `[Priority ${index + 1}]`;
        });
    }
    
    // Render revenue
    if (CONFIG.data.revenue) {
        const revEl = document.getElementById('revenue');
        const goalEl = document.getElementById('revenue-goal');
        if (revEl) revEl.textContent = `$${CONFIG.data.revenue.current.toLocaleString()}`;
        if (goalEl) goalEl.textContent = `$${CONFIG.data.revenue.goal.toLocaleString()}`;
    }
}

// Initialize
document.addEventListener('DOMContentLoaded', renderDashboard);
"""
        (output_path / "app.js").write_text(js)

if __name__ == "__main__":
    customizer = MissionControlCustomizer()
    
    # Run wizard
    config = customizer.run_wizard()
    
    # Generate customized dashboard
    output_path = customizer.generate_custom_dashboard()
    
    print("\n" + "=" * 60)
    print("🎉 YOUR CUSTOM MISSION CONTROL IS READY!")
    print("=" * 60)
    print(f"\n📁 Location: {output_path}")
    print("\n📖 Next steps:")
    print("   1. Open README.md for overview")
    print("   2. Open SETUP.md for configuration guide")
    print("   3. Open dashboard.html in your browser")
    print("   4. Edit config.js with your data")
    print("\n🚀 Ready to launch your business to the next level!")