FROM rocker/verse:latest
LABEL maintainer="Ignacio Martinez <ignacio@protonmail.com>"
RUN apt-get update \
    && apt-get install -y --no-install-recommends \
           libsodium-dev \
	   libxml2-dev \
           libssl-dev \
           libcurl4-openssl-dev \
    && install2.r --error --deps TRUE \
    remotes \
    remoter \
    sodium  \
    drat    \
    StanHeaders \
    rstan \
    rstanarm \
    KernSmooth \
    ggjoy \
    tictoc \
    bayesplot \
    && R -e "drat::addRepo(account = 'Ignacio', alturl = 'https://drat.ignacio.website/') ; install.packages('IMS3')"

COPY R/Makevars /root/.R/Makevars

RUN mkdir -p /root/.ssh
VOLUME [ "/root/.ssh" ]

CMD ["R", "-e", "remoter::server(port = 49152, secure = T, password=Sys.getenv('api_key'))"]

