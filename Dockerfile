############################################################################
# Copyright 2024 Ramon Fischer                                             #
#                                                                          #
# Licensed under the Apache License, Version 2.0 (the "License");          #
# you may not use this file except in compliance with the License.         #
# You may obtain a copy of the License at                                  #
#                                                                          #
#     http://www.apache.org/licenses/LICENSE-2.0                           #
#                                                                          #
# Unless required by applicable law or agreed to in writing, software      #
# distributed under the License is distributed on an "AS IS" BASIS,        #
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. #
# See the License for the specific language governing permissions and      #
# limitations under the License.                                           #
############################################################################

FROM debian:12.7-slim

    ARG DEBIAN_FRONTEND="noninteractive"

    RUN apt-get update && \
        apt-get install --no-install-recommends --assume-yes \
            coreutils \
            ghostscript \
            imagemagick \
            make \
            poppler-utils \
            python3 \
            python3-tk && \
        rm --recursive --force "/var/lib/apt/lists/"
    WORKDIR "/app"
    RUN update-alternatives --install "/usr/local/bin/python" python "/usr/bin/python3" 3
    RUN sed --in-place 's#<policy domain="coder" rights="none" pattern="PS" />##' "/etc/ImageMagick-6/policy.xml" && \
        sed --in-place 's#<policy domain="coder" rights="none" pattern="PS2" />##' "/etc/ImageMagick-6/policy.xml" && \
        sed --in-place 's#<policy domain="coder" rights="none" pattern="PS3" />##' "/etc/ImageMagick-6/policy.xml" && \
        sed --in-place 's#<policy domain="coder" rights="none" pattern="EPS" />##' "/etc/ImageMagick-6/policy.xml" && \
        sed --in-place 's#<policy domain="coder" rights="none" pattern="PDF" />##' "/etc/ImageMagick-6/policy.xml" && \
        sed --in-place 's#<policy domain="coder" rights="none" pattern="XPS" />##' "/etc/ImageMagick-6/policy.xml"
    COPY "." "/app"
