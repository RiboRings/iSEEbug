FROM bioconductor/bioconductor_docker:devel

MAINTAINER giulio.benedetti@utu.fi
LABEL authors="giulio.benedetti@utu.fi" \
    description="Docker image containing the iSEEbug package in a bioconductor/bioconductor_docker:devel container."

WORKDIR /home/rstudio/iseebug

COPY --chown=rstudio:rstudio . /home/rstudio/iseebug

RUN apt-get update && apt-get install -y libglpk-dev && apt-get clean && rm -rf /var/lib/apt/lists/*

ENV R_REMOTES_NO_ERRORS_FROM_WARNINGS=true

RUN Rscript -e "devtools::install('.', dependencies = TRUE, repos = BiocManager::repositories(), build_vignettes = TRUE)"
