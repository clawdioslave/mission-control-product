// Mission Control Configuration
// Customize this file with your actual data

const CONFIG = {
  "business_name": "b",
  "user_name": "Test Business",
  "user_type": "freelancer",
  "modules": [
    "client_projects",
    "finances",
    "goals",
    "time_tracking"
  ],
  "data": {
    "daily_focus": [
      "",
      "",
      ""
    ],
    "projects": [],
    "revenue": {
      "current": 0,
      "goal": 0
    },
    "goals": [],
    "tasks": []
  }
};

// Initialize dashboard
document.addEventListener('DOMContentLoaded', function() {
    // Set date
    document.getElementById('current-date').textContent = new Date().toLocaleDateString('en-US', { 
        weekday: 'long', year: 'numeric', month: 'long', day: 'numeric' 
    });
    
    // Load your data here
    console.log('Mission Control loaded for', CONFIG.business_name);
});
