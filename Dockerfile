# syntax=docker/dockerfile:1

FROM python:3.10-slim

WORKDIR /project

RUN python3 -m pip install -U pip wheel setuptools

COPY EXCLUDE EXCLUDE
COPY LICENSE LICENSE
COPY MANIFEST.in MANIFEST.in
COPY pyproject.toml pyproject.toml
COPY README.md README.md
COPY setup.cfg setup.cfg
COPY src src
COPY tests tests

RUN python3 -m pip install -U .

ENTRYPOINT [ "my-cli" ]
CMD [ "-c", "2", "-r", "5" ]