# Azure AI Demos - Setup Guide

This guide will help you set up the Python environment and Azure resources needed to run the Azure AI demonstration notebooks.

## Prerequisites

- Python 3.8 or higher
- Azure subscription with access to Cognitive Services
- Visual Studio Code (recommended) with Python and Jupyter extensions
- Git (for cloning repositories)

## 1. Virtual Environment Setup

### Option A: Using Python venv (Recommended)

#### Windows (PowerShell/Command Prompt)
```powershell
# Navigate to your project directory
cd "C:\AzureAIDemos"

# Create virtual environment
python -m venv azure_ai_env

# Activate virtual environment
.\azure_ai_env\Scripts\Activate.ps1

# If execution policy prevents activation, run:
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser

# Then try activation again
.\azure_ai_env\Scripts\Activate.ps1
```

#### macOS/Linux
```bash
# Navigate to your project directory
cd "/path/to/AzureAIDemos"

# Create virtual environment
python3 -m venv azure_ai_env

# Activate virtual environment
source azure_ai_env/bin/activate
```

### Option B: Using Conda
```bash
# Create conda environment
conda create -n azure_ai_demos python=3.11

# Activate environment
conda activate azure_ai_demos
```

## 2. Install Dependencies

With your virtual environment activated:

```powershell
# Upgrade pip to latest version
python -m pip install --upgrade pip

# Install all required packages
pip install -r requirements.txt

# Alternative: Install with no cache if you encounter build errors
# pip install --no-cache-dir -r requirements.txt

# For development (optional)
pip install black flake8 pytest
```

### Important Notes for Python 3.12+
If you encounter build errors with some packages (especially numpy), try:
```powershell
# Install build tools first (Windows)
pip install setuptools wheel

# Then install requirements
pip install -r requirements.txt
```

## 3. Azure Resource Setup

### Create Cognitive Services Resources

#### Using Azure Portal
1. Go to [Azure Portal](https://portal.azure.com)
2. Create the following resources:
   - **Cognitive Services Multi-Service** (recommended for all demos)
   - Or individual services:
     - Language Service
     - Speech Service
     - Computer Vision
     - Document Intelligence

#### Using Azure CLI
```bash
# Login to Azure
az login

# Set your subscription
az account set --subscription "your-subscription-id"

# Create resource group
az group create --name "rg-azure-ai-demos" --location "eastus"

# Create multi-service Cognitive Services resource
az cognitiveservices account create \
  --name "cs-azure-ai-demos" \
  --resource-group "rg-azure-ai-demos" \
  --kind "CognitiveServices" \
  --sku "S0" \
  --location "eastus"

# Get the endpoint and key
az cognitiveservices account show \
  --name "cs-azure-ai-demos" \
  --resource-group "rg-azure-ai-demos" \
  --query "properties.endpoint"

az cognitiveservices account keys list \
  --name "cs-azure-ai-demos" \
  --resource-group "rg-azure-ai-demos"
```

## 4. Environment Configuration

Create a `.env` file in your project directory with your Azure credentials:

```bash
# Copy the template
cp .env.template .env

# Edit the .env file with your actual values
```

## 5. Jupyter Notebook Setup

### Install Jupyter Kernel
```bash
# With your virtual environment activated
python -m ipykernel install --user --name=azure_ai_demos --display-name="Azure AI Demos"
```

### Start Jupyter
```bash
# Start Jupyter Notebook
jupyter notebook

# Or use Jupyter Lab
jupyter lab
```

### VS Code Setup
1. Open the project folder in VS Code
2. Install Python and Jupyter extensions
3. Select the correct Python interpreter (your virtual environment)
4. Open any `.ipynb` file and select "Azure AI Demos" kernel

## 6. Verify Installation

Run this test script to verify everything is working:

```python
# test_setup.py
import sys
print(f"Python version: {sys.version}")

try:
    from azure.ai.textanalytics import TextAnalyticsClient
    from azure.cognitiveservices.speech import SpeechConfig
    from azure.ai.vision.imageanalysis import ImageAnalysisClient
    from azure.ai.formrecognizer import DocumentAnalysisClient
    import pandas as pd
    import matplotlib.pyplot as plt
    import numpy as np
    print("✅ All Azure AI packages imported successfully!")
except ImportError as e:
    print(f"❌ Import error: {e}")

# Test environment variables
import os
from dotenv import load_dotenv
load_dotenv()

required_vars = [
    'AZURE_COGNITIVE_SERVICES_ENDPOINT',
    'AZURE_COGNITIVE_SERVICES_KEY'
]

for var in required_vars:
    if os.getenv(var):
        print(f"✅ {var} is set")
    else:
        print(f"❌ {var} is not set")
```

## 7. Troubleshooting

### Common Issues

#### Virtual Environment Not Activating (Windows)
```powershell
# Check execution policy
Get-ExecutionPolicy

# Set execution policy if needed
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
```

#### Package Installation Errors
```powershell
# Upgrade pip first
python -m pip install --upgrade pip

# Install build dependencies for Windows
pip install setuptools wheel

# Clear pip cache
pip cache purge

# Install with no cache and verbose output for debugging
pip install --no-cache-dir --verbose -r requirements.txt

# For specific Azure SDK issues, try installing individually:
pip install azure-ai-textanalytics azure-identity azure-core
pip install pandas numpy matplotlib
```

#### Python 3.12+ Compatibility Issues
```powershell
# If you get "No module named 'distutils'" error
pip install setuptools

# For numpy build issues, use pre-compiled wheels
pip install --only-binary=all numpy pandas matplotlib
```

#### Audio Processing Issues (Speech Services)
```bash
# Windows: Install Microsoft Visual C++ Redistributable
# macOS: Install homebrew and portaudio
brew install portaudio

# Linux: Install system dependencies
sudo apt-get update
sudo apt-get install portaudio19-dev python3-pyaudio
```

#### Import Errors
```powershell
# Check if packages are installed correctly
pip list | Select-String azure

# Reinstall specific package
pip uninstall azure-ai-textanalytics
pip install azure-ai-textanalytics==5.3.0

# Check package installation and verify environment
python -c "import azure.ai.textanalytics; print('Azure Text Analytics imported successfully')"
```

#### Virtual Environment Issues
```powershell
# Verify you're in the correct environment
Get-Command python
# Should show path to your virtual environment

# If activation doesn't work, try:
# 1. Check execution policy
Get-ExecutionPolicy
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser

# 2. Manual activation
& ".\azure_ai_env\Scripts\Activate.ps1"

# 3. Recreate environment if needed
Remove-Item -Recurse -Force azure_ai_env
python -m venv azure_ai_env
& ".\azure_ai_env\Scripts\Activate.ps1"
```

### Getting Help

1. Check the troubleshooting sections in each notebook
2. Verify your Azure resource configuration
3. Ensure your subscription has quota for the services
4. Check [Azure Cognitive Services documentation](https://docs.microsoft.com/azure/cognitive-services/)

## 8. Next Steps

1. Open `01_Azure_AI_Language_Services.ipynb` to start with language processing
2. Follow the notebooks in order:
   - Language Services → Speech Services → Vision Services → Document Intelligence
3. Each notebook includes detailed explanations and interactive examples
4. Experiment with your own data and use cases

## 9. Cleanup

When you're done:

```bash
# Deactivate virtual environment
deactivate

# Delete Azure resources (optional)
az group delete --name "rg-azure-ai-demos" --yes --no-wait
```

Happy coding with Azure AI! 🚀
