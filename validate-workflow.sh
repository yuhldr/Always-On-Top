#!/bin/bash

# GitHub Workflow Validation Script
# Validates the YAML syntax of GitHub workflow files

echo "========================================="
echo "  GitHub Workflow Validator"
echo "========================================="
echo ""

WORKFLOW_FILE=".github/workflows/release.yml"

if [ ! -f "$WORKFLOW_FILE" ]; then
    echo "❌ Error: Workflow file not found: $WORKFLOW_FILE"
    exit 1
fi

echo "🔍 Validating workflow file: $WORKFLOW_FILE"
echo ""

# Check if yamllint is available
if command -v yamllint &> /dev/null; then
    echo "🔧 Using yamllint for validation..."
    if yamllint "$WORKFLOW_FILE"; then
        echo "✅ YAML syntax is valid"
    else
        echo "❌ YAML syntax errors found"
        exit 1
    fi
else
    echo "⚠️  yamllint not available, using basic validation..."
    
    # Basic YAML validation using Python
    if command -v python3 &> /dev/null; then
        if python3 -c "
import yaml
import sys
try:
    with open('$WORKFLOW_FILE', 'r') as f:
        yaml.safe_load(f)
    print('✅ YAML syntax is valid')
except yaml.YAMLError as e:
    print('❌ YAML syntax error:', e)
    sys.exit(1)
except Exception as e:
    print('❌ Error reading file:', e)
    sys.exit(1)
"; then
        echo "🎉 Validation passed!"
    else
        echo "❌ Validation failed!"
        exit 1
    fi
    else
        echo "⚠️  Python not available, manual check only..."
        
        # Basic checks
        if grep -q "name:" "$WORKFLOW_FILE" && \
           grep -q "on:" "$WORKFLOW_FILE" && \
           grep -q "jobs:" "$WORKFLOW_FILE"; then
            echo "✅ Basic structure looks correct"
        else
            echo "❌ Missing required YAML structure"
            exit 1
        fi
    fi
fi

echo ""
echo "📋 Workflow Summary:"
echo "  • Name: $(grep "^name:" "$WORKFLOW_FILE" | cut -d' ' -f2-)"
echo "  • Triggers: $(grep -A5 "^on:" "$WORKFLOW_FILE" | grep -E "push|tags" | tr -d ' -')"
echo "  • Jobs: $(grep -A1 "^jobs:" "$WORKFLOW_FILE" | tail -1 | cut -d':' -f1 | tr -d ' ')"
echo ""
echo "🎉 Workflow validation complete!"
echo ""
echo "💡 To test the workflow:"
echo "   git add .github/workflows/release.yml"
echo "   git commit -m 'Fix workflow syntax'"
echo "   git push origin main"
echo "   git tag v2.1"
echo "   git push origin v2.1"
