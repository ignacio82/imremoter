FROM rocker/r-base:latest
LABEL maintainer="Ignacio Martinez <ignacio@protonmail.com>"
RUN apt-get update \
    && apt-get install -y --no-install-recommends \
           libsodium-dev 
RUN R -e "install.packages('remotes')" 
RUN R -e "remotes::install_cran('remoter')" 
RUN R -e "remotes::install_cran('sodium')" 
EXPOSE 49152 
CMD ["R", "-e", "remoter::server(port = 49152, secure = T, password=Sys.getenv('api_key'))"]

