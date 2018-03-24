
FROM mangothecat/minicondabuild:latest

RUN conda install -y \
        flake8=3.5.0 \
        matplotlib=2.1.2 \
        openpyxl=2.4.10 \
        pandas=0.22.0 \
        pytest=3.3.2 \
        pytest-cov=2.5.1 \
        scipy=1.0.0 \
        seaborn=0.8.1 \
        setuptools_scm=1.15.6 \
        statsmodels=0.8.0 \
        xlrd=1.1.0 \
    && conda uninstall --force -y qt pyqt \
    && conda clean --all