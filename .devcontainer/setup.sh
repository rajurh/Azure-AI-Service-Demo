#!/bin/bash

# Setup script for Azure AI Services Development Environment - Complete Suite

echo "🚀 Setting up Azure AI Services development environment..."

# Create necessary directories for all Azure AI services
mkdir -p /workspace/sample_documents
mkdir -p /workspace/sample_images  
mkdir -p /workspace/output/speech
mkdir -p /workspace/output/vision
mkdir -p /workspace/output/language
mkdir -p /workspace/output/documents
mkdir -p /workspace/data

# Set up Jupyter environment variables
export JUPYTER_ENABLE_LAB=yes
export JUPYTER_TOKEN=""
export JUPYTER_ALLOW_ROOT=1

# Create sample data directories structure
mkdir -p /workspace/data/audio
mkdir -p /workspace/data/images
mkdir -p /workspace/data/text
mkdir -p /workspace/data/documents

echo "✅ Environment setup complete!"
echo ""
echo "📝 Azure AI Services Demo Suite - Next steps:"
echo ""
echo "🔐 1. Set your Azure AI services credentials:"
echo "   # Language Services"
echo "   export AZURE_LANGUAGE_ENDPOINT='https://your-language-resource.cognitiveservices.azure.com/'"
echo "   export AZURE_LANGUAGE_KEY='your-language-api-key'"
echo ""
echo "   # Speech Services"  
echo "   export AZURE_SPEECH_KEY='your-speech-api-key'"
echo "   export AZURE_SPEECH_REGION='your-region'"
echo ""
echo "   # Vision Services"
echo "   export AZURE_COMPUTER_VISION_ENDPOINT='https://your-vision-resource.cognitiveservices.azure.com/'"
echo "   export AZURE_COMPUTER_VISION_KEY='your-vision-api-key'"
echo ""
echo "   # Document Intelligence"
echo "   export AZURE_DOCUMENT_INTELLIGENCE_ENDPOINT='https://your-document-resource.cognitiveservices.azure.com/'"
echo "   export AZURE_DOCUMENT_INTELLIGENCE_KEY='your-document-api-key'"
echo ""
echo "🚀 2. Start Jupyter Lab:"
echo "   jupyter lab --ip=0.0.0.0 --port=8888 --no-browser --allow-root"
echo ""
echo "📚 3. Available Azure AI Demo Notebooks:"
echo "   📝 01_Azure_AI_Language_Services.ipynb     - Text analysis, sentiment, entities"
echo "   🎤 02_Azure_AI_Speech_Services.ipynb       - Speech-to-text, text-to-speech"
echo "   👁️  03_Azure_AI_Vision_Services.ipynb       - Image analysis, OCR, object detection"
echo "   📄 04_Azure_AI_Document_Intelligence.ipynb - Document processing, forms, invoices"
echo ""
echo "🎯 Happy coding with Azure AI Services - Complete Suite!"
