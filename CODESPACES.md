# Azure AI Services - GitHub Codespaces Setup

This repository is fully compatible with GitHub Codespaces! You can run all Azure AI demos directly in your browser without any local setup.

## 🚀 Quick Start with GitHub Codespaces

### 1. Launch Codespace
- Click the **Code** button on the GitHub repository
- Select **Codespaces** tab
- Click **Create codespace on main**
- Wait for the environment to build (2-3 minutes)

### 2. Set Azure Credentials
Once your Codespace is ready, set up your Azure AI service credentials:

```bash
# Language Services
export AZURE_LANGUAGE_ENDPOINT="https://your-language-resource.cognitiveservices.azure.com/"
export AZURE_LANGUAGE_KEY="your-language-api-key"

# Speech Services  
export AZURE_SPEECH_KEY="your-speech-api-key"
export AZURE_SPEECH_REGION="your-region"

# Vision Services
export AZURE_COMPUTER_VISION_ENDPOINT="https://your-vision-resource.cognitiveservices.azure.com/"
export AZURE_COMPUTER_VISION_KEY="your-vision-api-key"

# Document Intelligence
export AZURE_DOCUMENT_INTELLIGENCE_ENDPOINT="https://your-document-resource.cognitiveservices.azure.com/"
export AZURE_DOCUMENT_INTELLIGENCE_KEY="your-document-api-key"
```

### 3. Start Jupyter Lab
```bash
jupyter lab --ip=0.0.0.0 --port=8888 --no-browser --allow-root
```

### 4. Access Jupyter
- Click on the **PORTS** tab in VS Code
- Find port 8888 and click the globe icon
- Or visit: `https://YOUR-CODESPACE-NAME-8888.app.github.dev`

## 📚 Available Notebooks

1. **01_Azure_AI_Language_Services.ipynb** 📝
   - Sentiment analysis
   - Key phrase extraction
   - Named entity recognition
   - Language detection

2. **02_Azure_AI_Speech_Services.ipynb** 🎤
   - Speech-to-text conversion
   - Text-to-speech synthesis
   - Speech translation
   - Audio processing

3. **03_Azure_AI_Vision_Services.ipynb** 👁️
   - Image analysis and description
   - OCR (Optical Character Recognition)
   - Object and face detection
   - Thumbnail generation

4. **04_Azure_AI_Document_Intelligence.ipynb** 📄
   - Invoice and receipt processing
   - Business card extraction
   - Document layout analysis
   - Custom form processing

## 🔧 Codespaces Features

### Pre-installed
- ✅ Python 3.11 with all Azure AI SDKs
- ✅ Jupyter Lab/Notebook
- ✅ Azure CLI
- ✅ All required system dependencies
- ✅ Audio processing libraries (for Speech Services)
- ✅ Image processing libraries (for Vision Services)

### VS Code Extensions
- Python development tools (Pylance, Black formatter, Flake8)
- Jupyter support (notebook editing, execution)
- Azure tools (Account, Resource Groups, Functions, CLI)
- GitHub Copilot (if available in your account)

### Port Forwarding
- **8888**: Jupyter Lab (automatically forwarded)
- **8080**: Development server
- **5000**: Flask/API server
- **3000**: Frontend server

## 🌐 Accessing Your Codespace

### From Web Browser
1. Navigate to [github.com/codespaces](https://github.com/codespaces)
2. Find your Azure AI Services codespace
3. Click **Open in browser**

### From VS Code Desktop
1. Install the **GitHub Codespaces** extension
2. Open Command Palette (`Ctrl+Shift+P`)
3. Select **Codespaces: Connect to Codespace**
4. Choose your Azure AI Services codespace

## 💰 Codespaces Usage

### Free Tier
- GitHub provides free Codespaces hours monthly
- 2-core machine: 60 hours/month free
- 4-core machine: 30 hours/month free

### Machine Types
- **2-core, 8GB RAM**: Good for basic demos
- **4-core, 16GB RAM**: Better for intensive processing
- **8-core, 32GB RAM**: Best for large datasets

## 🔒 Security Best Practices

### Environment Variables
```bash
# Create a .env file (gitignored)
echo "AZURE_LANGUAGE_KEY=your-key" >> .env
echo "AZURE_SPEECH_KEY=your-key" >> .env
# ... etc
```

### GitHub Secrets (Recommended)
1. Go to repository **Settings** → **Secrets and variables** → **Codespaces**
2. Add your Azure credentials as secrets
3. They'll be automatically available as environment variables

## 🚨 Troubleshooting

### Codespace Won't Start
- Check your GitHub Codespaces quota
- Try creating a new codespace
- Contact GitHub Support if issues persist

### Jupyter Not Accessible
- Ensure port 8888 is forwarded
- Check the PORTS tab in VS Code
- Try restarting Jupyter: `jupyter lab --ip=0.0.0.0 --port=8888 --no-browser --allow-root`

### Audio Issues (Speech Services)
- Note: Microphone access is limited in browser-based Codespaces
- Use provided sample audio files for testing
- Real-time speech features work better in VS Code Desktop connected to Codespace

### Package Installation Issues
```bash
# Reinstall packages if needed
pip install -r requirements.txt

# Update system packages
sudo apt-get update && sudo apt-get upgrade
```

### Extension Compatibility Warnings (June 2025)
**Common Messages You Might See:**

```
extension 'ms-vsliveshare.vsliveshare' wants API proposal 'notebookCellExecutionState' but that proposal DOES NOT EXIST
extension 'ms-python.vscode-pylance' wants API proposal 'mcpConfigurationProvider' but that proposal DOES NOT EXIST
navigator is now a global in nodejs
```

**Status:** ✅ **SAFE TO IGNORE** - These are informational warnings only.

**Explanation:**
- VS Code extensions trying to use newer APIs that don't exist in Codespaces environment
- Extensions automatically fall back to supported functionality
- No impact on Azure AI demo functionality
- Normal behavior in GitHub Codespaces

**Solution Applied:**
- Removed problematic extensions (`ms-vsliveshare`, `github.copilot`) from default install
- Added extension update prevention settings
- Created minimal configuration option (`devcontainer-minimal.json`)

## 🛠️ Troubleshooting

### JSON Syntax Errors (June 2025)
**Issue:** If you see "Invalid character after parsing property name" error during Codespace creation:

```
Invalid character after parsing property name. Expected ':' but got: ,. 
Path 'customizations.vscode.settings', line 30, position 26.
```

**Solution:** This issue has been **RESOLVED** ✅. The devcontainer JSON files have been fixed to remove:
- Invalid JSON comments (`//`)
- Missing commas in object definitions
- Malformed array declarations

**Current Status:** All JSON files are now valid and Codespaces should launch successfully.

### Container Creation Issues
If the container fails to build:
1. Wait for the recovery container to start
2. Check the creation logs in the Terminal
3. Try rebuilding the container: Command Palette → "Codespaces: Rebuild Container"

### Environment Variables Not Set
If Azure services return authentication errors:
1. Ensure all required environment variables are set (see Quick Start section)
2. Variables are session-specific - set them each time you start a new Codespace
3. Consider using Codespaces Secrets for persistent storage of API keys

## 📖 Additional Resources

- [GitHub Codespaces Documentation](https://docs.github.com/en/codespaces)
- [Azure AI Services Documentation](https://docs.microsoft.com/azure/cognitive-services/)
- [Jupyter in Codespaces Guide](https://docs.github.com/en/codespaces/developing-in-codespaces/using-jupyter-notebooks-in-github-codespaces)

## 🎯 Quick Commands

```bash
# Start Jupyter Lab
jupyter lab --ip=0.0.0.0 --port=8888 --no-browser --allow-root

# Install additional packages
pip install package-name

# Check Azure CLI
az account show

# List running processes
ps aux | grep jupyter

# Check port forwarding
curl localhost:8888
```

---

**Happy coding with Azure AI Services in GitHub Codespaces!** 🚀☁️
