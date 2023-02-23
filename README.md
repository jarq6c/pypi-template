# Generic Python Project

This template can be used as a starting point for building distributable Python packages. It includes a Makefile with targets to setup, run, test, and build a final installable PyPI compatible package. To learn more about packaging in Python see the [Python Packaging User Guide](https://packaging.python.org/).

## Build

```bash
$ make
```
Running `make` in this directory will build the default target "build". The chain of dependencies for the default target includes targets that build a docker image with development dependencies. This target will also run `pytest` and `build`, and copy the resulting `dist` directory with `.whl` and `.tar.gz` packages into the currect directory.

## Installation

After running build, you can install the default package by running

```
python -m pip install dist/my_package-0.1.0-py3-none-any.whl
```

## Other targets

```bash
$ make setup
```
This target builds the docker image.

```bash
$ make run
```
This target runs the CLI application from a docker container indicated in `setup.cfg` with the arguments specified by `ARGUMENTS` in the `Makefile`.

```bash
$ make tests
```
This target runs `pytest` on the code in the image created by `setup` in a docker container.