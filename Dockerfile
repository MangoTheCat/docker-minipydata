FROM mangothecat/minicondabuild:latest

RUN conda install -y \
    flake8=3.5.0 \
    matplotlib=2.2.3 \
    openpyxl=2.5.6 \
    pandas=0.23.4 \
    pytest=3.8.0 \
    pytest-cov=2.6.0 \
    scipy=1.1.0 \
    seaborn=0.9.0 \
    setuptools_scm=3.1.0 \
    statsmodels=0.9.0 \
    xlrd=1.1.0 \
    && conda uninstall --force -y qt pyqt \
    && conda clean --all