#!/bin/bash

# Setup script for Azure AI Services in GitHub Codespaces

echo "🚀 Setting up Azure AI Services for GitHub Codespaces..."

# Install system dependencies for Azure AI services
echo "📦 Installing system dependencies..."
sudo apt-get update
sudo apt-get install -y build-essential pkg-config libssl-dev libffi-dev
sudo apt-get install -y portaudio19-dev python3-dev alsa-utils libasound2-dev
sudo apt-get install -y ffmpeg libjpeg-dev libpng-dev libtiff-dev libwebp-dev
sudo apt-get install -y libopencv-dev libgtk-3-dev libgstreamer1.0-dev

# Install Python dependencies
echo "🐍 Installing Python packages..."
pip install -r requirements.txt

# Create directory structure for all Azure AI services
echo "📁 Creating directory structure..."
mkdir -p /workspaces/$CODESPACE_NAME/sample_documents
mkdir -p /workspaces/$CODESPACE_NAME/sample_images  
mkdir -p /workspaces/$CODESPACE_NAME/output/speech
mkdir -p /workspaces/$CODESPACE_NAME/output/vision
mkdir -p /workspaces/$CODESPACE_NAME/output/language
mkdir -p /workspaces/$CODESPACE_NAME/output/documents
mkdir -p /workspaces/$CODESPACE_NAME/data/audio
mkdir -p /workspaces/$CODESPACE_NAME/data/images
mkdir -p /workspaces/$CODESPACE_NAME/data/text
mkdir -p /workspaces/$CODESPACE_NAME/data/documents

# Create Jupyter config optimized for Codespaces
echo "⚙️ Configuring Jupyter for Codespaces..."
mkdir -p ~/.jupyter
cat > ~/.jupyter/jupyter_notebook_config.py << EOF
# Jupyter configuration for GitHub Codespaces
c.NotebookApp.ip = '0.0.0.0'
c.NotebookApp.open_browser = False
c.NotebookApp.port = 8888
c.NotebookApp.allow_root = True
c.NotebookApp.token = ''
c.NotebookApp.password = ''
c.NotebookApp.allow_origin = '*'
c.NotebookApp.base_url = '/'
c.NotebookApp.notebook_dir = '/workspaces/$CODESPACE_NAME'
EOF

# Set up environment variables for Codespaces
echo "🔧 Setting up environment..."
echo 'export JUPYTER_ENABLE_LAB=yes' >> ~/.bashrc
echo 'export PYTHONPATH=/workspaces/$CODESPACE_NAME' >> ~/.bashrc
echo 'export AZURE_AI_WORKSPACE=/workspaces/$CODESPACE_NAME' >> ~/.bashrc

echo "✅ Environment setup complete!"
echo ""
echo "🎯 GitHub Codespaces - Azure AI Services Demo Suite"
echo "=" * 60
echo ""
echo "🔐 Set your Azure AI services credentials using these commands:"
echo ""
echo "# Language Services"
echo "export AZURE_LANGUAGE_ENDPOINT='https://your-language-resource.cognitiveservices.azure.com/'"
echo "export AZURE_LANGUAGE_KEY='your-language-api-key'"
echo ""
echo "# Speech Services"  
echo "export AZURE_SPEECH_KEY='your-speech-api-key'"
echo "export AZURE_SPEECH_REGION='your-region'"
echo ""
echo "# Vision Services"
echo "export AZURE_COMPUTER_VISION_ENDPOINT='https://your-vision-resource.cognitiveservices.azure.com/'"
echo "export AZURE_COMPUTER_VISION_KEY='your-vision-api-key'"
echo ""
echo "# Document Intelligence"
echo "export AZURE_DOCUMENT_INTELLIGENCE_ENDPOINT='https://your-document-resource.cognitiveservices.azure.com/'"
echo "export AZURE_DOCUMENT_INTELLIGENCE_KEY='your-document-api-key'"
echo ""
echo "🚀 Start Jupyter Lab with:"
echo "jupyter lab --ip=0.0.0.0 --port=8888 --no-browser --allow-root"
echo ""
echo "📚 Available Azure AI Demo Notebooks:"
echo "   📝 01_Azure_AI_Language_Services.ipynb     - Text analysis, sentiment, entities"
echo "   🎤 02_Azure_AI_Speech_Services.ipynb       - Speech-to-text, text-to-speech"
echo "   👁️  03_Azure_AI_Vision_Services.ipynb       - Image analysis, OCR, object detection"
echo "   📄 04_Azure_AI_Document_Intelligence.ipynb - Document processing, forms, invoices"
echo ""
echo "💡 Access Jupyter at: https://$CODESPACE_NAME-8888.app.github.dev"
echo ""
echo "🎉 Happy coding with Azure AI Services in GitHub Codespaces!"
