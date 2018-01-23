FROM mangothecat/minicondabuild:latest

RUN conda install -y \
        pandas \
        xlrd \
        openpyxl \
        scipy \
        statsmodels \
        matplotlib \
        seaborn \
        pytest \
        pytest-cov \
        setuptools_scm \
    && conda uninstall --force -y qt pyqt \
    && conda clean --all
