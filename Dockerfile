
FROM mangothecat/minicondabuild:latest

RUN conda install -y \
        matplotlib=2.1.0 \
        openpyxl=2.4.8 \
        pandas=0.20.3 \
        pytest=3.2.1 \
        pytest-cov=2.5.1 \
        scipy=0.19.1 \
        seaborn=0.8.0 \
        setuptools_scm=1.15.6 \
        statsmodels=0.8.0 \
        xlrd=1.1.0 \
    && conda uninstall --force -y qt pyqt \
    && conda clean --all