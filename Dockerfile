# syntax=docker/dockerfile:1
FROM python:3.10-slim

RUN python3 -m pip install -U pip wheel setuptools

# Install dependencies
WORKDIR /project/install
COPY requirements.py requirements.py
COPY setup.cfg setup.cfg
RUN python requirements.py > requirements.txt
RUN pip3 install -r requirements.txt

# For more portability
# ENTRYPOINT [ "/bin/sh" ]

# For more features
ENTRYPOINT [ "/bin/bash" ]