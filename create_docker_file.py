""" Script to create docker file from dependencies in a version of anaconda distribution 

Usage:
    python create_docker_file.py path/to/output/Dockerfile

"""

import pandas as pd
import requests
from jinja2 import Template
import sys
from logzero import logger

# Key Variables
ANACONDA_VERSION = '5.0.1'
PYTHON_VERSION = '3.6'
LATEST_URL = 'https://docs.anaconda.com/anaconda/packages/py3.6_linux-64'

# Construct URL
packages = [
    'pandas', 
    'xlrd', 
    'openpyxl',
    'scipy', 
    'statsmodels', 
    'matplotlib', 
    'seaborn', 
    'pytest', 
    'pytest-cov', 
    'setuptools_scm'
]

url_template = (
    'https://docs.anaconda.com/anaconda/packages/old-pkg-lists/{ANACONDA_VERSION}/py{PYTHON_VERSION}_linux-64'
)
url = url_template.format(ANACONDA_VERSION=ANACONDA_VERSION, PYTHON_VERSION=PYTHON_VERSION)
response = requests.get(url)

if not response.ok:
    logger.warning('Version {} of Anaconda not found, defaulting to latest version.'.format(ANACONDA_VERSION))
    url = LATEST_URL

# Scrape Data 
package_table = pd.read_html(url, header=0)[0]
subset = package_table.query('Name in @packages')
package_versions = (subset.Name + '=' + subset.Version).tolist()

# Insert into a docker file using a jinja template 
template_string = r"""
FROM mangothecat/minicondabuild:latest

RUN conda install -y \
{%- for package in packages %}
        {{package}} \
{%- endfor %}
    && conda uninstall --force -y qt pyqt \
    && conda clean --all
"""
template = Template(template_string)

with open(sys.argv[1], 'w') as f:
    f.write(template.render(packages=package_versions))

