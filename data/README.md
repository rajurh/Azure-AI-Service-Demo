# Data Directory

This directory contains sample data files for all Azure AI demonstration notebooks.

## Sample Files Available

### Text Processing (Language Services)
- `sample_text.txt` - Multi-language text samples for sentiment analysis, language detection, and NER
- `sample_customer_reviews.csv` - Structured customer feedback data in multiple languages

### Speech Services
- `sample_audio.wav` - Audio file for speech-to-text testing (generated automatically)
- Audio generation script: `create_sample_audio.py`

### Computer Vision
- `sample_text_image.jpg` - Image with text for OCR testing
- `sample_objects_image.jpg` - Image with objects for detection
- `sample_chart_image.jpg` - Chart/graph for analysis
- `sample_faces_image.jpg` - Image with faces for detection
- Image generation script: `create_sample_images.py`

### Document Intelligence
- `sample_invoice.html` - Complete invoice for form processing
- `sample_receipt.txt` - Coffee shop receipt for analysis
- `sample_business_card.txt` - Professional business card data
- `sample_id_document.txt` - Driver's license sample (demo only)

### Generation Scripts
- `generate_all_samples.py` - Master script to create all sample data
- `create_sample_audio.py` - Generates audio files using TTS
- `create_sample_images.py` - Creates sample images using matplotlib
- `DATA_OVERVIEW.md` - Complete documentation of all sample files

## Quick Setup

1. **Automatic Generation**: Run `python generate_all_samples.py`
2. **Individual Scripts**: Run specific generators for audio/images
3. **Manual Setup**: Add your own files following the naming convention

## Notes

- Sample files are safe for demo purposes (no real personal data)
- Audio/image files are generated automatically if dependencies are available
- The notebooks will work without sample files (they include download functionality)
- Large files are ignored by git (see .gitignore)
- You can replace any sample file with your own data for testing

## Supported Formats

- **Text**: .txt, .csv, .html, .json
- **Audio**: .wav, .mp3, .m4a, .ogg, .flac
- **Images**: .jpg, .png, .gif, .bmp, .tiff, .webp
- **Documents**: .pdf, .docx, .xlsx, .pptx
