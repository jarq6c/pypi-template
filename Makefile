REPOSITORY=https://repo.anaconda.com/miniconda
INSTALLER=Miniconda3-py38_4.9.2-Linux-x86_64.sh
HASH=1314b90489f154602fd794accfc90446111514a5a72fe1f71ab83e07de9504a7
HASHFILE=sha256sum.txt
PYENV=miniconda3
PYTHON=$(PYENV)/bin/python3

.PHONY: develop tests build checksum clean

develop: $(PYENV)/bin/activate
	$(PYTHON) -m pip install -e .[develop]

tests: develop
	$(PYTHON) -m pytest -s

build: $(PYENV)/bin/activate
	$(PYTHON) -m build

$(PYENV)/bin/activate: checksum
	test -d $(PYENV) || bash ./$(INSTALLER) -b -p $(PYENV)
	$(PYTHON) -m pip install -U pip wheel setuptools build
	touch $(PYENV)/bin/activate

checksum: $(INSTALLER) $(HASHFILE)
	sha256sum -c $(HASHFILE)

$(INSTALLER):
	wget $(REPOSITORY)/$(INSTALLER)

$(HASHFILE):
	echo "$(HASH) $(INSTALLER)" > $(HASHFILE)

clean:
	rm -rf dist/ $(PYENV) $(HASHFILE) $(INSTALLER)
