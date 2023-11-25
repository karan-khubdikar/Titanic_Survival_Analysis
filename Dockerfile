# Copyright (c) Jupyter Development Team.
# Distributed under the terms of the Modified BSD License.
ARG REGISTRY=quay.io
ARG OWNER=jupyter
ARG BASE_CONTAINER=$REGISTRY/$OWNER/minimal-notebook
FROM $BASE_CONTAINER

LABEL maintainer="Jupyter Project <jupyter@googlegroups.com>"

# Fix: https://github.com/hadolint/hadolint/wiki/DL4006
# Fix: https://github.com/koalaman/shellcheck/wiki/SC3014
SHELL ["/bin/bash", "-o", "pipefail", "-c"]

USER root

# R pre-requisites
RUN apt-get update --yes && \
    apt-get install --yes --no-install-recommends \
    fonts-dejavu \
    unixodbc \
    unixodbc-dev \
    r-cran-rodbc \
    gfortran \
    gcc && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

USER ${NB_UID}

# R packages including IRKernel which gets installed globally.
# r-e1071: dependency of the caret R package
RUN mamba install --yes \
    'python' \
    'pip' \
    'ipykernel' \
    'nb_conda_kernels' \
    'panel' \
    'r-base' \
    'r-essentials' \
    'r-devtools' \
    'r-gert' \
    'r-usethis' \
    'r-testthat' \
    'r-startup' \
    'r-rmarkdown' \
    'r-stringi' \
    'r-tidyverse' \
    'r-hmisc' \
    'r-rjson' \
    'r-ggally' \
    'r-ggthemes' \
    'r-cowplot' \
    'r-irkernel' \
    'r-titanic' \
    'r-knitr' \
    'r-gridExtra' \
    'r-dplyr' \
    'unixodbc' && \
    mamba clean --all -f -y && \
    fix-permissions "${CONDA_DIR}" && \
    fix-permissions "/home/${NB_USER}"