# Pull base image
FROM python:3.10.2-slim-bullseye

# Install make command
RUN apt-get update && apt-get install -y make

# Set environment variables
ENV PIP_DISABLE_PIP_VERSION_CHECK 1
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

# Set work directory
WORKDIR /code

# Install dependencies
COPY ./requirements.txt .
COPY Makefile ./Makefile

EXPOSE 8000

RUN pip install -r requirements.txt

# Copy project
COPY . .