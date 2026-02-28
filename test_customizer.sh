#!/bin/bash
# Quick test of the customizer

echo "Testing Mission Control Customizer..."
echo "======================================"
echo ""

cd ~/.openclaw/workspaceollama/projects/MISSION-CONTROL-PRODUCT/customizer

# Run with test inputs
echo "a
1,3,6
a
b
Test Business
John Doe
a" | python3 customize.py 2>&1 | tail -30