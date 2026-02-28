#!/bin/bash
# Phase 1: Stress Test Mission Control Customizer
# Run 10 test scenarios

cd ~/.openclaw/workspaceollama/projects/MISSION-CONTROL-PRODUCT/customizer

echo "🧪 PHASE 1: STRESS TESTING CUSTOMIZER"
echo "======================================"
echo ""

# Test 1: Freelancer, Free tier, 3 modules
echo "Test 1/10: Freelancer + Free tier + 3 modules"
echo "a
1,3,6
free
a
b
Test Freelancer Biz
John Doe
a
1
a" | python3 customize.py > test_outputs/test1.log 2>&1
echo "✅ Test 1 complete"

# Test 2: Agency, Pro tier, 8 modules
echo "Test 2/10: Agency + Pro tier + 8 modules"
echo "b
1,2,3,4,6,7,8,9
pro
a
b
Agency Pro LLC
Sarah Smith
a
2
b" | python3 customize.py > test_outputs/test2.log 2>&1
echo "✅ Test 2 complete"

# Test 3: Startup, Free tier, 5 modules
echo "Test 3/10: Startup + Free tier + 5 modules"
echo "c
1,3,5,6,10
free
a
b
Startup Inc
Mike Johnson
b
3
c" | python3 customize.py > test_outputs/test3.log 2>&1
echo "✅ Test 3 complete"

# Test 4: Creator, Pro tier, 6 modules
echo "Test 4/10: Creator + Pro tier + 6 modules"
echo "d
1,4,6,11,12,13
pro
a
b
Creator Studio
Alex Creator
a
4
d" | python3 customize.py > test_outputs/test4.log 2>&1
echo "✅ Test 4 complete"

# Test 5: Consultant, Free tier, 4 modules
echo "Test 5/10: Consultant + Free tier + 4 modules"
echo "e
1,3,6,15
free
a
b
Consulting Co
Jane Consultant
b
5
e" | python3 customize.py > test_outputs/test5.log 2>&1
echo "✅ Test 5 complete"

echo ""
echo "📊 Checking test results..."
echo ""

# Count successful outputs
SUCCESS_COUNT=$(ls -1 test_outputs/ | wc -l)
echo "Tests completed: $SUCCESS_COUNT"

# Check for dashboard.html in latest output
LATEST=$(ls -td outputs/*/ | head -1)
if [ -f "$LATEST/dashboard.html" ]; then
    echo "✅ Latest output has dashboard.html"
else
    echo "❌ Latest output missing dashboard.html"
fi

if [ -f "$LATEST/config.js" ]; then
    echo "✅ Latest output has config.js"
else
    echo "❌ Latest output missing config.js"
fi

echo ""
echo "Phase 1 Complete!"