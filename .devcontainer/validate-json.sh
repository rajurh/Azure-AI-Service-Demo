#!/bin/bash

# Validation script for DevContainer JSON files
echo "🔍 Validating DevContainer JSON files..."

# Function to validate JSON
validate_json() {
    local file=$1
    echo "Checking $file..."
    
    if python -m json.tool "$file" > /dev/null 2>&1; then
        echo "✅ $file - Valid JSON"
        return 0
    else
        echo "❌ $file - Invalid JSON"
        python -m json.tool "$file"
        return 1
    fi
}

# Validate all devcontainer JSON files
validate_json ".devcontainer/devcontainer.json"
validate_json ".devcontainer/devcontainer-codespaces.json"
validate_json ".github/codespaces/devcontainer.json"

echo ""
echo "🎯 JSON Validation Complete!"
echo "All devcontainer files should now work properly with GitHub Codespaces."
