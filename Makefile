.PHONY: help clean build lint isort test freeze-requirements docker-build docker-run

bin = .env/bin
python = $(bin)/python
pip = $(bin)/pip
tox = $(bin)/tox

PYPI_TOKEN ?= $PYPI_TOKEN

help:
	@echo "test - run tox"
	@echo "build - build the wheel"

.env:
	virtualenv .env --clear
	$(pip) install --upgrade pip
	$(pip) install --upgrade wheel setuptools tox pip-tools twine

clean:
	rm -rf build/
	rm -rf dist/
	rm -rf *.egg-info
	find . -name '__pycache__' -type d -exec rm -rf {} +
	find . -name '*.pyc' -exec rm -f {} +
	find . -name '*.pyo' -exec rm -f {} +

build: .env clean
	$(python) setup.py bdist_wheel

release: build
	$(python) -m twine upload -r pypitest -p $(PYPI_TOKEN) dist/*

test: .env
	$(tox)
