# flask

This image builds upon the base Python image (<https://github.com/relenteny/python>) and installs the Python web service gateway application Flask (<https://palletsprojects.com/p/flask/>) and its associated requirements. In addition to the basic Flask install, the image is also configured with python-dotenv (<https://github.com/theskumar/python-dotenv>) for convenience in managing environment variables.

This image does nothing more than install Flask, its requirements, and python-dotenv. Applications are expected to extend this image, perform any additional configuration, and update the Docker ```ENTRYPOINT``` as required to start an application. For example:

```Dockerfile
FROM relenteny/flask:1.1.1

RUN set -x && \
    cd /home/alpine && \
    git clone https://github.com/miguelgrinberg/microblog.git && \
    cd microblog && \
    git checkout v0.1 && \
    echo "FLASK_APP=microblog.py" > .flaskenv

WORKDIR /home/alpine/microblog
ENTRYPOINT [ "/bin/sh", "-lc", "flask run --host 0.0.0.0"]
```
