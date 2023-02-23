# syntax=docker/dockerfile:1
FROM python:3.10-slim AS builder
RUN python3 -m pip install -U pip wheel setuptools
WORKDIR /project/install
COPY requirements.py requirements.py
COPY setup.cfg setup.cfg
RUN python3 requirements.py > requirements.txt
RUN python3 -m pip install -r requirements.txt

FROM builder
COPY EXCLUDE EXCLUDE
COPY LICENSE LICENSE
COPY MANIFEST.in MANIFEST.in
COPY pyproject.toml pyproject.toml
COPY README.md README.md
COPY src src
COPY tests tests
RUN python3 -m pip install .[develop]
ENTRYPOINT [ "/usr/local/bin/python3", "-m", "build"]