#!/bin/bash
# Comprehensive Customizer Testing - Multiple Scenarios

cd ~/.openclaw/workspaceollama/projects/MISSION-CONTROL-PRODUCT/customizer

echo "🧪 COMPREHENSIVE CUSTOMIZER TESTING"
echo "===================================="
echo ""
echo "Running 6 different user scenarios..."
echo ""

# Create test output directory
mkdir -p test_scenarios

# Scenario 1: Freelance Developer (Free tier, minimal)
echo "SCENARIO 1: Freelance Developer (Free tier, 3 modules)"
echo "--------------------------------------------------------"
printf "a\n1,3,6\nfree\na\nb\nDev Studio\nAlex\na\n1\na\n" | python3 customize.py 2>&1 | grep -E "(Generating|✅|📁|Modules:|Tier:)" 
echo ""

# Move output to test folder
LATEST=$(ls -td outputs/*/ 2>/dev/null | head -1)
if [ -d "$LATEST" ]; then
    mv "$LATEST" test_scenarios/freelancer_free/
    echo "✅ Saved to: test_scenarios/freelancer_free/"
fi
echo ""

# Scenario 2: Agency Owner (Pro tier, many modules)
echo "SCENARIO 2: Agency Owner (Pro tier, 10 modules)"
echo "------------------------------------------------"
printf "b\n1,2,3,4,5,6,7,8,9,10\npro\na\nb\nGrowth Agency\nSarah\na\n2\nb\n" | python3 customize.py 2>&1 | grep -E "(Generating|✅|📁|Modules:|Tier:)"
echo ""

LATEST=$(ls -td outputs/*/ 2>/dev/null | head -1)
if [ -d "$LATEST" ]; then
    mv "$LATEST" test_scenarios/agency_pro/
    echo "✅ Saved to: test_scenarios/agency_pro/"
fi
echo ""

# Scenario 3: Content Creator (Pro tier, content focus)
echo "SCENARIO 3: Content Creator (Pro tier, content modules)"
echo "--------------------------------------------------------"
printf "d\n1,4,6,11,12,13\npro\na\nb\nCreator Labs\nJamie\na\n4\nd\n" | python3 customize.py 2>&1 | grep -E "(Generating|✅|📁|Modules:|Tier:)"
echo ""

LATEST=$(ls -td outputs/*/ 2>/dev/null | head -1)
if [ -d "$LATEST" ]; then
    mv "$LATEST" test_scenarios/creator_pro/
    echo "✅ Saved to: test_scenarios/creator_pro/"
fi
echo ""

# Scenario 4: Consultant (Free tier testing Pro module selection)
echo "SCENARIO 4: Consultant (Free tier + Pro modules - upgrade prompt test)"
echo "----------------------------------------------------------------------"
printf "e\n1,3,6,15,16\nfree\na\nb\nConsulting Pro\nMichael\nb\n3\ne\n" | python3 customize.py 2>&1 | grep -E "(Generating|✅|📁|Modules:|Tier:|Pro modules|Upgrade)"
echo ""

LATEST=$(ls -td outputs/*/ 2>/dev/null | head -1)
if [ -d "$LATEST" ]; then
    mv "$LATEST" test_scenarios/consultant_free/
    echo "✅ Saved to: test_scenarios/consultant_free/"
fi
echo ""

# Scenario 5: Startup Founder (Light mode, green accent)
echo "SCENARIO 5: Startup Founder (Light mode + Green)"
echo "------------------------------------------------"
printf "c\n1,6,10,17,18\npro\na\nb\nStartup Inc\nTaylor\nb\n3\nc\n" | python3 customize.py 2>&1 | grep -E "(Generating|✅|📁|Modules:|Tier:)"
echo ""

LATEST=$(ls -td outputs/*/ 2>/dev/null | head -1)
if [ -d "$LATEST" ]; then
    mv "$LATEST" test_scenarios/startup_light/
    echo "✅ Saved to: test_scenarios/startup_light/"
fi
echo ""

# Scenario 6: Minimal (1 module only - edge case)
echo "SCENARIO 6: Minimal Setup (1 module only - edge case)"
echo "------------------------------------------------------"
printf "a\n1\nfree\na\nb\nSimple Biz\nChris\na\n1\na\n" | python3 customize.py 2>&1 | grep -E "(Generating|✅|📁|Modules:|Tier:)"
echo ""

LATEST=$(ls -td outputs/*/ 2>/dev/null | head -1)
if [ -d "$LATEST" ]; then
    mv "$LATEST" test_scenarios/minimal/
    echo "✅ Saved to: test_scenarios/minimal/"
fi
echo ""

# Summary
echo ""
echo "===================================="
echo "📊 TEST RESULTS SUMMARY"
echo "===================================="
echo ""

cd test_scenarios
for dir in */; do
    if [ -d "$dir" ]; then
        echo "📁 $dir:"
        if [ -f "$dir/dashboard.html" ]; then
            echo "   ✅ dashboard.html"
        else
            echo "   ❌ Missing dashboard.html"
        fi
        if [ -f "$dir/config.js" ]; then
            echo "   ✅ config.js"
        else
            echo "   ❌ Missing config.js"
        fi
        if [ -f "$dir/README.md" ]; then
            echo "   ✅ README.md"
        else
            echo "   ❌ Missing README.md"
        fi
        if [ -f "$dir/SETUP.md" ]; then
            echo "   ✅ SETUP.md"
        else
            echo "   ❌ Missing SETUP.md"
        fi
        if [ -d "$dir/automations" ]; then
            echo "   ✅ automations/ (Pro tier)"
        fi
        echo ""
    fi
done

echo "===================================="
echo "✅ ALL TESTS COMPLETE"
echo "===================================="
echo ""
echo "Test scenarios saved in: test_scenarios/"
echo ""
echo "To view a dashboard:"
echo "  open test_scenarios/[scenario]/dashboard.html"