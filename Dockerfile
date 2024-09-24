FROM debian:12.7-slim
    ARG DEBIAN_FRONTEND="noninteractive"
    RUN apt-get update && \
        apt-get install --no-install-recommends --assume-yes \
            coreutils \
            git \
            imagemagick \
            make \
            poppler-utils \
            python3 && \
        rm --recursive --force "/var/lib/apt/lists/"
    WORKDIR "/app"
    RUN update-alternatives --install "/usr/local/bin/python" python "/usr/bin/python3" 3
    RUN sed -i 's#<policy domain="coder" rights="none" pattern="PS" />##' "/etc/ImageMagick-6/policy.xml" && \
        sed -i 's#<policy domain="coder" rights="none" pattern="PS2" />##' "/etc/ImageMagick-6/policy.xml" && \
        sed -i 's#<policy domain="coder" rights="none" pattern="PS3" />##' "/etc/ImageMagick-6/policy.xml" && \
        sed -i 's#<policy domain="coder" rights="none" pattern="EPS" />##' "/etc/ImageMagick-6/policy.xml" && \
        sed -i 's#<policy domain="coder" rights="none" pattern="PDF" />##' "/etc/ImageMagick-6/policy.xml" && \
        sed -i 's#<policy domain="coder" rights="none" pattern="XPS" />##' "/etc/ImageMagick-6/policy.xml"
    COPY "." "/app"
