# I'm going to use Python 3.8 for this to begin with, built on Debian 10 Buster, although the instructor tells us to use 3.7.
FROM python3.8.5-buster

MAINTAINER Brandon Doyle

# https://github.com/awslabs/amazon-sagemaker-examples/issues/319#issuecomment-405749895
ENV PYTHONUNBUFFERED 1

# Adding my pip freeze.
COPY ./requirements.txt requirements.txt

# Install my required packages.
RUN pip install -r /requirements.txt

# Create a new layer, set our working  directory, and copy my application into the container image.
RUN mkdir /app
WORKDIR /app
COPY ./app /app

# ? interesting. Here we're adding a new user and setting the user's creation to defaults. Prevents us from running the app as the root user?
RUN adduser -D user
USER user
