FROM python:3.9-slim-buster

#v1
LABEL Name="Python Flask Demo App" Version=1
LABEL org.opencontainers.image.source = "https://github.com/mochakri/python-monitoring-app"


# Install system dependencies
RUN apt-get update && \
    apt-get install -y gcc python3-dev

ARG srcDir=src
WORKDIR /app
COPY $srcDir/requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

COPY $srcDir/run.py .
COPY $srcDir/app ./app

EXPOSE 6000

CMD ["gunicorn", "-b", "0.0.0.0:6000", "run:app"]  
