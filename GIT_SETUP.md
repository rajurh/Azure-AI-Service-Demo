# Git Repository Setup for Azure AI Service Demo

## Repository Information
- **GitHub Repository**: https://github.com/rajurh/Azure-AI-Service-Demo
- **Local Branch**: main
- **Remote**: origin

## Current Status
✅ Repository initialized and connected to GitHub
✅ Initial commit pushed with all project files
✅ .gitignore properly configured to exclude:
   - Virtual environments (azure_ai_env/, venv/, env/)
   - Environment files (.env, .env.local)
   - Output directories (output/, temp/, tmp/)
   - Generated content and sensitive files

## Useful Git Commands

### Check Status
```bash
git status
git log --oneline
```

### Adding and Committing Changes
```bash
git add .
git commit -m "Your commit message"
git push
```

### Pull Latest Changes
```bash
git pull
```

### View Remote Information
```bash
git remote -v
git branch -a
```

### Common Workflow
1. Make changes to files
2. `git add .` - Stage changes
3. `git commit -m "Description of changes"` - Commit changes
4. `git push` - Push to GitHub

## Files Included in Repository
- **Notebooks**: 4 Azure AI service demonstration notebooks
- **Documentation**: README.md, PROJECT_SUMMARY.md
- **Configuration**: requirements.txt, .env.template, .gitignore
- **Setup Scripts**: setup.bat, setup.ps1
- **Sample Data**: data/README.md (sample generation scripts excluded for security)
- **Test Files**: test_vision_auth.py

## Files Excluded (via .gitignore)
- Virtual environment directories
- .env files with credentials
- Generated output files
- Cache and temporary files
- IDE-specific files
- Large media files

## Next Steps
- Clone the repository on other machines using: `git clone https://github.com/rajurh/Azure-AI-Service-Demo.git`
- Use setup scripts to configure environment on new machines
- Continue development with regular commits and pushes
