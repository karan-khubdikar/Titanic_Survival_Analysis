# Copyright (c) Jupyter Development Team.
# Distributed under the terms of the Modified BSD License.
# Base Image
ARG REGISTRY=quay.io
ARG OWNER=jupyter
ARG BASE_CONTAINER=$REGISTRY/$OWNER/minimal-notebook
FROM $BASE_CONTAINER

LABEL maintainer="Jupyter Project <jupyter@googlegroups.com>"

# Fix DL4006 and SC3014
SHELL ["/bin/bash", "-o", "pipefail", "-c"]

USER root

# R pre-requisites and system dependencies
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

# Install Conda packages from the YAML file
RUN conda install --yes \
    'python=3.11.6' \
    'pip=23.3.1' \
    'ipykernel=6.26' \
    'nb_conda_kernels=2.3.1' \
    'panel' \
    'r-base=4.3' \
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
    'jupyter-book=0.15.1' \
    'ipython=8.15.0' \
    'notebook=7.0.6' \
    'r-docopt' \
    'r-png' && \
    conda clean --all -f -y && \
    fix-permissions "${CONDA_DIR}" && \
    fix-permissions "/home/${NB_USER}"
