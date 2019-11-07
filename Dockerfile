#################################################################################################################################
# 
# Copyright 2019 Ray Elenteny
#
# Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation
# files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy,
# modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software
# is furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
# OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
# LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR
# IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
#
#################################################################################################################################
#
# Based on the python base image (https://github.com/relenteny/python), create an image that supports Flask applications.
#
#################################################################################################################################
#
# Image path: relenteny/flask:1.1.1
#
#################################################################################################################################

FROM relenteny/python:3.7.4

LABEL relenteny.repository.url=https://github.com/relenteny/flask
LABEL relenteny.repository.tag=1.1.1
LABEL relenteny.flask.version=1.1.1

COPY build /opt/build

USER root

RUN set -x && \
    cp -r /opt/build/home/alpine/* /home/alpine && \
    chown -R alpine.alpine /home/alpine/* && \
    rm -rf /opt/build

USER alpine

RUN set -x && \
    cd /home/alpine && \
    bin/install-requirements.sh /home/alpine/requirements.txt && \
    rm /home/alpine/requirements.txt
