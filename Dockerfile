FROM mangothecat/minicondabuild:latest

RUN conda install -y \
        pandas=0.22 \
        scipy=1.0 \
        statsmodels=0.8 \
        matplotlib=2.1 \
        pytest=3.3 \
        pytest-cov=2.5 \
        setuptools_scm=1.15 \
    && conda uninstall --force -y qt pyqt \
    && conda clean --all
