# Azure AI Demos - Windows PowerShell Setup Script
# This script automates the setup process for Windows users

[CmdletBinding()]
param(
    [string]$ProjectPath = "C:\Raju\Training\AOAI\AzureAIDemos",
    [string]$PythonVersion = "3.11",
    [switch]$SkipAzureCLI,
    [switch]$Force
)

Write-Host "🚀 Azure AI Demos - Windows Setup Script" -ForegroundColor Cyan
Write-Host "==========================================" -ForegroundColor Cyan

# Function to check if running as administrator
function Test-Administrator {
    $currentUser = [Security.Principal.WindowsIdentity]::GetCurrent()
    $principal = New-Object Security.Principal.WindowsPrincipal($currentUser)
    return $principal.IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)
}

# Function to install chocolatey if not present
function Install-Chocolatey {
    if (!(Get-Command choco -ErrorAction SilentlyContinue)) {
        Write-Host "📦 Installing Chocolatey package manager..." -ForegroundColor Yellow
        Set-ExecutionPolicy Bypass -Scope Process -Force
        [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072
        iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))
        refreshenv
    } else {
        Write-Host "✅ Chocolatey is already installed" -ForegroundColor Green
    }
}

# Function to install Python if not present
function Install-Python {
    $pythonCmd = Get-Command python -ErrorAction SilentlyContinue
    if (!$pythonCmd) {
        Write-Host "🐍 Installing Python $PythonVersion..." -ForegroundColor Yellow
        if (Test-Administrator) {
            choco install python --version=$PythonVersion -y
        } else {
            Write-Host "⚠️  Admin rights required to install Python. Please run as administrator or install manually." -ForegroundColor Red
            return $false
        }
    } else {
        $version = python --version
        Write-Host "✅ Python is installed: $version" -ForegroundColor Green
    }
    return $true
}

# Function to install Azure CLI
function Install-AzureCLI {
    if (!(Get-Command az -ErrorAction SilentlyContinue)) {
        Write-Host "☁️  Installing Azure CLI..." -ForegroundColor Yellow
        if (Test-Administrator) {
            choco install azure-cli -y
        } else {
            Write-Host "⚠️  Admin rights required to install Azure CLI. Please run as administrator or install manually." -ForegroundColor Red
            Write-Host "    Alternative: Download from https://aka.ms/installazurecliwindows" -ForegroundColor Yellow
            return $false
        }
    } else {
        Write-Host "✅ Azure CLI is already installed" -ForegroundColor Green
    }
    return $true
}

# Function to setup virtual environment
function Setup-VirtualEnvironment {
    param([string]$Path)
    
    Write-Host "🔧 Setting up virtual environment..." -ForegroundColor Yellow
    
    # Navigate to project directory
    if (!(Test-Path $Path)) {
        Write-Host "📁 Creating project directory: $Path" -ForegroundColor Yellow
        New-Item -ItemType Directory -Path $Path -Force | Out-Null
    }
    
    Set-Location $Path
    
    # Create virtual environment
    $venvPath = Join-Path $Path "azure_ai_env"
    if ((Test-Path $venvPath) -and $Force) {
        Write-Host "🗑️  Removing existing virtual environment..." -ForegroundColor Yellow
        Remove-Item $venvPath -Recurse -Force
    }
    
    if (!(Test-Path $venvPath)) {
        Write-Host "🔨 Creating virtual environment..." -ForegroundColor Yellow
        python -m venv azure_ai_env
    } else {
        Write-Host "✅ Virtual environment already exists" -ForegroundColor Green
    }
    
    # Activate virtual environment
    $activateScript = Join-Path $venvPath "Scripts\Activate.ps1"
    if (Test-Path $activateScript) {
        Write-Host "🔄 Activating virtual environment..." -ForegroundColor Yellow
        & $activateScript
        
        # Upgrade pip
        Write-Host "⬆️  Upgrading pip..." -ForegroundColor Yellow
        python -m pip install --upgrade pip
        
        return $true
    } else {
        Write-Host "❌ Failed to create virtual environment" -ForegroundColor Red
        return $false
    }
}

# Function to install Python packages
function Install-PythonPackages {
    param([string]$Path)
    
    $requirementsPath = Join-Path $Path "requirements.txt"
    if (Test-Path $requirementsPath) {
        Write-Host "📦 Installing Python packages from requirements.txt..." -ForegroundColor Yellow
        pip install -r requirements.txt
        
        if ($LASTEXITCODE -eq 0) {
            Write-Host "✅ All packages installed successfully" -ForegroundColor Green
            return $true
        } else {
            Write-Host "❌ Some packages failed to install" -ForegroundColor Red
            return $false
        }
    } else {
        Write-Host "⚠️  requirements.txt not found at $requirementsPath" -ForegroundColor Red
        return $false
    }
}

# Function to setup Jupyter kernel
function Setup-JupyterKernel {
    Write-Host "📓 Setting up Jupyter kernel..." -ForegroundColor Yellow
    python -m ipykernel install --user --name=azure_ai_demos --display-name="Azure AI Demos"
    
    if ($LASTEXITCODE -eq 0) {
        Write-Host "✅ Jupyter kernel installed successfully" -ForegroundColor Green
        return $true
    } else {
        Write-Host "❌ Failed to install Jupyter kernel" -ForegroundColor Red
        return $false
    }
}

# Function to create .env file from template
function Setup-EnvironmentFile {
    param([string]$Path)
    
    $envTemplate = Join-Path $Path ".env.template"
    $envFile = Join-Path $Path ".env"
    
    if ((Test-Path $envTemplate) -and !(Test-Path $envFile)) {
        Write-Host "📄 Creating .env file from template..." -ForegroundColor Yellow
        Copy-Item $envTemplate $envFile
        Write-Host "✅ .env file created. Please edit it with your Azure credentials." -ForegroundColor Green
        Write-Host "    File location: $envFile" -ForegroundColor Cyan
        return $true
    } elseif (Test-Path $envFile) {
        Write-Host "✅ .env file already exists" -ForegroundColor Green
        return $true
    } else {
        Write-Host "⚠️  .env.template not found" -ForegroundColor Yellow
        return $false
    }
}

# Function to check execution policy
function Check-ExecutionPolicy {
    $policy = Get-ExecutionPolicy
    if ($policy -eq "Restricted") {
        Write-Host "🔓 Current execution policy is Restricted. Updating to RemoteSigned..." -ForegroundColor Yellow
        try {
            Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser -Force
            Write-Host "✅ Execution policy updated to RemoteSigned" -ForegroundColor Green
        } catch {
            Write-Host "❌ Failed to update execution policy. Please run as administrator." -ForegroundColor Red
            return $false
        }
    } else {
        Write-Host "✅ Execution policy is acceptable: $policy" -ForegroundColor Green
    }
    return $true
}

# Function to test the setup
function Test-Setup {
    param([string]$Path)
    
    Write-Host "🧪 Testing setup..." -ForegroundColor Yellow
    
    $testScript = @"
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
    sys.exit(1)

print("🎉 Setup verification completed successfully!")
"@
    
    $testFile = Join-Path $Path "test_setup.py"
    $testScript | Out-File -FilePath $testFile -Encoding UTF8
    
    python $testFile
    $success = $LASTEXITCODE -eq 0
    
    Remove-Item $testFile -Force
    return $success
}

# Main execution
try {
    Write-Host "🔍 Checking prerequisites..." -ForegroundColor Yellow
    
    # Check execution policy
    if (!(Check-ExecutionPolicy)) {
        throw "Execution policy check failed"
    }
    
    # Install chocolatey if admin
    if (Test-Administrator) {
        Install-Chocolatey
        
        # Install Python
        if (!(Install-Python)) {
            throw "Python installation failed"
        }
        
        # Install Azure CLI
        if (!$SkipAzureCLI -and !(Install-AzureCLI)) {
            Write-Host "⚠️  Azure CLI installation failed, but continuing..." -ForegroundColor Yellow
        }
    } else {
        Write-Host "⚠️  Not running as administrator. Some installations may be skipped." -ForegroundColor Yellow
        Write-Host "    For full automated setup, please run as administrator." -ForegroundColor Yellow
    }
    
    # Setup virtual environment
    if (!(Setup-VirtualEnvironment -Path $ProjectPath)) {
        throw "Virtual environment setup failed"
    }
    
    # Install Python packages
    if (!(Install-PythonPackages -Path $ProjectPath)) {
        throw "Python package installation failed"
    }
    
    # Setup Jupyter kernel
    if (!(Setup-JupyterKernel)) {
        Write-Host "⚠️  Jupyter kernel setup failed, but continuing..." -ForegroundColor Yellow
    }
    
    # Setup environment file
    Setup-EnvironmentFile -Path $ProjectPath
    
    # Test the setup
    if (Test-Setup -Path $ProjectPath) {
        Write-Host "🎉 Setup completed successfully!" -ForegroundColor Green
        Write-Host ""
        Write-Host "Next steps:" -ForegroundColor Cyan
        Write-Host "1. Edit the .env file with your Azure credentials" -ForegroundColor White
        Write-Host "2. Open VS Code or Jupyter in the project directory" -ForegroundColor White
        Write-Host "3. Start with 01_Azure_AI_Language_Services.ipynb" -ForegroundColor White
        Write-Host ""
        Write-Host "To activate the virtual environment manually:" -ForegroundColor Cyan
        Write-Host "  $ProjectPath\azure_ai_env\Scripts\Activate.ps1" -ForegroundColor White
    } else {
        throw "Setup verification failed"
    }
    
} catch {
    Write-Host "❌ Setup failed: $($_.Exception.Message)" -ForegroundColor Red
    Write-Host "Please check the README.md for manual setup instructions." -ForegroundColor Yellow
    exit 1
}

Write-Host "✨ Happy coding with Azure AI! ✨" -ForegroundColor Magenta
