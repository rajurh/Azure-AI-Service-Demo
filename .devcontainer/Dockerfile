# Use the official Python image as base
FROM mcr.microsoft.com/devcontainers/python:3.11

# Set environment variables
ENV PYTHONUNBUFFERED=1 \
    PYTHONDONTWRITEBYTECODE=1 \
    PIP_NO_CACHE_DIR=1 \
    PIP_DISABLE_PIP_VERSION_CHECK=1

# Install system dependencies for Azure AI services
RUN apt-get update && apt-get install -y \
    build-essential \
    curl \
    software-properties-common \
    git \
    wget \
    unzip \
    libssl-dev \
    libffi-dev \
    python3-dev \
    pkg-config \
    # Audio processing dependencies (for Speech Services)
    portaudio19-dev \
    alsa-utils \
    libasound2-dev \
    # Video/audio processing
    ffmpeg \
    # Image processing dependencies
    libjpeg-dev \
    libpng-dev \
    libtiff-dev \
    libwebp-dev \
    # OpenCV dependencies
    libopencv-dev \
    libgtk-3-dev \
    libgstreamer1.0-dev \
    && rm -rf /var/lib/apt/lists/*

# Install Azure CLI
RUN curl -sL https://aka.ms/InstallAzureCLIDeb | bash

# Upgrade pip and install Python build tools
RUN python -m pip install --upgrade pip setuptools wheel

# Install Jupyter and common data science packages
RUN pip install \
    jupyter \
    jupyterlab \
    notebook \
    ipywidgets \
    ipykernel

# Install Azure AI packages - Complete Suite
RUN pip install \
    # Language Services
    azure-ai-textanalytics \
    # Speech Services  
    azure-cognitiveservices-speech \
    # Vision Services
    azure-ai-vision-imageanalysis \
    azure-cognitiveservices-vision-computervision \
    # Document Intelligence
    azure-ai-formrecognizer \
    # Core Azure packages
    azure-identity \
    azure-core \
    azure-common \
    azure-mgmt-cognitiveservices

# Install common data science and visualization packages
RUN pip install \
    numpy \
    pandas \
    matplotlib \
    seaborn \
    plotly \
    pillow \
    opencv-python \
    scikit-learn \
    scipy

# Install audio processing packages (for Speech Services)
RUN pip install \
    soundfile \
    librosa \
    pydub \
    pyaudio

# Install utility packages
RUN pip install \
    python-dotenv \
    requests \
    aiohttp \
    httpx \
    tabulate \
    tqdm \
    pyyaml \
    wordcloud \
    # Azure storage and additional services
    azure-storage-blob \
    azure-keyvault-secrets

# Create a non-root user
ARG USERNAME=vscode
ARG USER_UID=1000
ARG USER_GID=$USER_UID

# Create the user
RUN groupadd --gid $USER_GID $USERNAME \
    && useradd --uid $USER_UID --gid $USER_GID -m $USERNAME \
    && apt-get update \
    && apt-get install -y sudo \
    && echo $USERNAME ALL=\(root\) NOPASSWD:ALL > /etc/sudoers.d/$USERNAME \
    && chmod 0440 /etc/sudoers.d/$USERNAME

# Change ownership of the home directory
RUN chown -R $USERNAME:$USERNAME /home/$USERNAME

# Switch to non-root user
USER $USERNAME

# Set working directory
WORKDIR /workspace

# Expose Jupyter port
EXPOSE 8888

# Default command
CMD ["bash"]
