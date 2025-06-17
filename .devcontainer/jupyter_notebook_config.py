# Jupyter Notebook Configuration for Azure AI Document Intelligence Demo
# This configuration is loaded when Jupyter starts

# Basic notebook server configuration
c.NotebookApp.ip = '0.0.0.0'
c.NotebookApp.port = 8888
c.NotebookApp.open_browser = False
c.NotebookApp.allow_root = True
c.NotebookApp.base_url = '/'
c.NotebookApp.token = ''
c.NotebookApp.password = ''
c.NotebookApp.allow_origin = '*'
c.NotebookApp.disable_check_xsrf = True
c.NotebookApp.notebook_dir = '/workspace'

# Enhanced plotting
c.InlineBackend.figure_format = 'retina'
