# Azure AI Services Demo - DevContainer Setup

This directory contains the DevContainer configuration for the **complete Azure AI Services demo project**. The DevContainer provides a fully configured development environment with all necessary dependencies pre-installed for all four major Azure AI services:

- 🗣️ **Language Services**: Text analytics, sentiment analysis, entity recognition
- 🎤 **Speech Services**: Speech-to-text, text-to-speech, translation  
- 👁️ **Vision Services**: Image analysis, OCR, object detection, face detection
- 📄 **Document Intelligence**: Document processing, form recognition, invoice analysis

## 🚀 Quick Start

### Prerequisites
- [Visual Studio Code](https://code.visualstudio.com/)
- [Docker Desktop](https://www.docker.com/products/docker-desktop/)
- [Dev Containers extension](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.remote-containers) for VS Code

### Getting Started

1. **Clone the repository** (if not already done):
   ```bash
   git clone <your-repo-url>
   cd AzureAIDemos
   ```

2. **Open in DevContainer**:
   - Open VS Code
   - Press `Ctrl+Shift+P` (or `Cmd+Shift+P` on Mac)
   - Type "Dev Containers: Reopen in Container"
   - Select the command and wait for the container to build

3. **Set up Azure credentials for all services**:
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

4. **Start Jupyter Lab**:
   ```bash
   jupyter lab --ip=0.0.0.0 --port=8888 --no-browser --allow-root
   ```

5. **Explore the notebooks**: 
   - 📝 `01_Azure_AI_Language_Services.ipynb` - Text analysis and NLP
   - 🎤 `02_Azure_AI_Speech_Services.ipynb` - Speech processing
   - 👁️ `03_Azure_AI_Vision_Services.ipynb` - Image analysis and computer vision
   - 📄 `04_Azure_AI_Document_Intelligence.ipynb` - Document processing

## 🛠 What's Included

### Pre-installed Software
- **Python 3.11** with essential development tools
- **Azure CLI** for Azure resource management
- **Jupyter Lab/Notebook** for interactive development
- **Git** for version control

### Python Packages
- **Azure AI Services**:
  - `azure-ai-textanalytics` - Language Services SDK
  - `azure-cognitiveservices-speech` - Speech Services SDK
  - `azure-ai-vision-imageanalysis` - Vision Services SDK
  - `azure-ai-formrecognizer` - Document Intelligence SDK
  - `azure-identity` - Azure authentication
  - `azure-core` - Core Azure SDK functionality

- **Audio Processing** (for Speech Services):
  - `soundfile` - Audio file I/O
  - `librosa` - Audio analysis and processing
  - `pydub` - Audio manipulation
  - `pyaudio` - Real-time audio I/O

- **Data Science & Visualization**:
  - `pandas` - Data manipulation and analysis
  - `numpy` - Numerical computing
  - `matplotlib`, `seaborn`, `plotly` - Data visualization
  - `scikit-learn`, `scipy` - Machine learning and scientific computing

- **Image Processing**:
  - `pillow` - Image processing
  - `opencv-python` - Computer vision

- **Utilities**:
  - `python-dotenv` - Environment variable management
  - `requests`, `aiohttp`, `httpx` - HTTP clients
  - `tabulate` - Pretty-print tabular data
  - `tqdm` - Progress bars
  - `wordcloud` - Text visualization

### VS Code Extensions
- **Python Development**:
  - Python extension with IntelliSense
  - Pylance for enhanced Python support
  - Black formatter for code formatting
  - Flake8 for linting

- **Jupyter Support**:
  - Jupyter extension for notebook support
  - Jupyter Keymap for familiar shortcuts
  - Jupyter Renderers for rich output

- **Azure Integration**:
  - Azure Account extension
  - Azure Resource Groups extension
  - Azure Functions extension
  - Azure CLI extension

- **Development Tools**:
  - GitHub Copilot (if available)
  - JSON and YAML support
  - PowerShell extension

## 📁 Container Structure

```
/workspace/
├── .devcontainer/
│   ├── devcontainer.json      # DevContainer configuration
│   ├── Dockerfile             # Container image definition
│   ├── setup.sh              # Environment setup script
│   └── README.md             # This file
├── data/                     # Sample data directory
│   ├── audio/               # Audio files for speech demos
│   ├── images/              # Images for vision demos
│   ├── text/                # Text files for language demos
│   └── documents/           # Documents for intelligence demos
├── output/                   # Output files directory
│   ├── speech/              # Speech processing outputs
│   ├── vision/              # Vision processing outputs
│   ├── language/            # Language processing outputs
│   └── documents/           # Document processing outputs
├── sample_documents/         # Sample documents for demos
├── sample_images/           # Sample images for demos
├── 01_Azure_AI_Language_Services.ipynb      # Language Services demo
├── 02_Azure_AI_Speech_Services.ipynb        # Speech Services demo
├── 03_Azure_AI_Vision_Services.ipynb        # Vision Services demo
├── 04_Azure_AI_Document_Intelligence.ipynb  # Document Intelligence demo
└── requirements.txt          # Python dependencies
```

## 🔧 Configuration Details

### Port Forwarding
- **8888**: Jupyter Lab/Notebook server
- **8080**: Additional development server
- **5000**: Flask/API development server
- **3000**: Frontend development server

### Environment Variables
- `PYTHONPATH`: Set to workspace folder
- `JUPYTER_ENABLE_LAB`: Enables Jupyter Lab by default
- `AZURE_AI_WORKSPACE`: Points to workspace directory
- **Azure Service Endpoints and Keys**: (to be set by user)

### Volume Mounts
- Project files are synchronized with the container
- Persistent storage for:
  - `.vscode` settings
  - `data` directory  
  - `output` directory
  - `sample_images` directory
  - `sample_documents` directory

## 🔐 Setting Up Azure Credentials

### Option 1: Environment Variables (Recommended for development)
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

### Option 2: .env File
Create a `.env` file in the workspace root:
```env
# Language Services
AZURE_LANGUAGE_ENDPOINT=https://your-language-resource.cognitiveservices.azure.com/
AZURE_LANGUAGE_KEY=your-language-api-key

# Speech Services  
AZURE_SPEECH_KEY=your-speech-api-key
AZURE_SPEECH_REGION=your-region

# Vision Services
AZURE_COMPUTER_VISION_ENDPOINT=https://your-vision-resource.cognitiveservices.azure.com/
AZURE_COMPUTER_VISION_KEY=your-vision-api-key

# Document Intelligence
AZURE_DOCUMENT_INTELLIGENCE_ENDPOINT=https://your-document-resource.cognitiveservices.azure.com/
AZURE_DOCUMENT_INTELLIGENCE_KEY=your-document-api-key
```

### Option 3: Azure CLI Authentication
```bash
az login
az account set --subscription "your-subscription-id"
```

## 🎯 Usage Examples

### Start Jupyter Lab
```bash
jupyter lab --ip=0.0.0.0 --port=8888 --no-browser --allow-root
```

### Install Additional Packages
```bash
pip install your-package-name
```

### Run Azure CLI Commands
```bash
az cognitiveservices account list
az cognitiveservices account list-kinds
```

### Test Audio Processing (Speech Services)
```bash
# Test audio recording capabilities
python -c "import soundfile; print('Audio processing ready!')"
```

## 🚨 Troubleshooting

### Container Build Issues
- Ensure Docker Desktop is running
- Try rebuilding the container: `Dev Containers: Rebuild Container`

### Permission Issues
- The container runs as user `vscode` (UID 1000)
- Files are mounted with appropriate permissions

### Jupyter Access Issues
- Check that port 8888 is properly forwarded
- Verify Jupyter is running: `jupyter lab list`

### Azure Authentication Issues
- Verify your endpoints and API keys are correct for each service
- Check Azure resource permissions and quotas
- Ensure the resources are in the correct regions
- Verify service-specific requirements (e.g., Speech region vs endpoint)

### Audio/Speech Issues
- Ensure audio drivers are properly configured in the container
- Check microphone permissions (if using real-time speech)
- Verify audio file formats are supported
- Test with provided sample audio files first

# 🛠️ Troubleshooting

## Recent Fixes Applied

### JSON Syntax Error (June 2025)
**Issue:** "Invalid character after parsing property name. Expected ':' but got: ,. Path 'customizations.vscode.settings'"

**Solution:** Fixed JSON syntax errors in devcontainer configuration files:
- Removed invalid JSON comments (`//`) from `.devcontainer/devcontainer.json`
- Fixed missing comma after git feature configuration
- Fixed malformed extensions array declaration
- Validated all JSON files for proper syntax

**Status:** ✅ **RESOLVED** - All devcontainer JSON files now have valid syntax

## 📚 Additional Resources

- [VS Code DevContainer Documentation](https://code.visualstudio.com/docs/remote/containers)
- [Azure AI Services Documentation](https://docs.microsoft.com/azure/cognitive-services/)
- [Azure AI Language Services](https://docs.microsoft.com/azure/cognitive-services/language-service/)
- [Azure AI Speech Services](https://docs.microsoft.com/azure/cognitive-services/speech-service/)
- [Azure AI Vision Services](https://docs.microsoft.com/azure/cognitive-services/computer-vision/)
- [Azure AI Document Intelligence](https://docs.microsoft.com/azure/applied-ai-services/form-recognizer/)
- [Azure SDK for Python](https://docs.microsoft.com/python/api/overview/azure/)

## 🤝 Contributing

When modifying the DevContainer configuration:

1. Test changes locally
2. Update this README if needed
3. Ensure all dependencies are properly documented
4. Verify the container builds successfully

---

**Happy coding with Azure AI Services - Complete Suite!** 🚀🗣️👁️📄
