// Mission Control App Logic

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
