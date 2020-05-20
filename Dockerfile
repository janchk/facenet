# Dockerfile
# Pull base image
FROM tensorflow/tensorflow:latest-gpu-py3

# Set environment variables
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

# Set work directory
RUN mkdir /code
RUN mkdir /home/default_user/home_host
WORKDIR /code
ADD requirements.txt /code/


# Install dependencies
RUN pip install -r requirements.txt

RUN adduser --disabled-password --gecos '' default_user
# Copy project
COPY . /code/
USER default_user
RUN bash