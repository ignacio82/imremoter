FROM rocker/r-ubuntu:18.04
LABEL maintainer="Ignacio Martinez <imartinez@mathematica-mpr.com>"

# Install dependencies
RUN apt-get update -qq && apt-get install -y \
    libsodium-dev \
	libxml2-dev \
    libssl-dev \
    libcurl4-openssl-dev \
    r-cran-tidyverse \
    r-cran-remotes \
    r-cran-remoter \
    r-cran-sodium \
    r-cran-drat \
    r-cran-rstan \
    r-cran-rstanarm \
    r-cran-rstan \
    && install.r \
    RcppArmadillo \
    RcppEigen \
    StanHeaders \
    aws.signature \
    aws.s3 

COPY R/Makevars /root/.R/Makevars

RUN mkdir -p /root/.ssh
VOLUME [ "/root/.ssh" ]

CMD ["R", "-e", "remoter::server(port = 49152, secure = T, password=Sys.getenv('api_key'))"]

