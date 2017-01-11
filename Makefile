.PHONY: help clean build lint isort test freeze-requirements docker-build docker-run

bin = .env/bin
python = $(bin)/python
pip = $(bin)/pip
tox = $(bin)/tox

help:
	@echo "test - run tox"
	@echo "build - build the wheel"

.env:
	python3 -m venv .env --clear
	$(pip) install --upgrade pip
	$(pip) install --upgrade wheel setuptools tox pip-tools

clean:
	rm -rf build/
	rm -rf dist/
	rm -rf *.egg-info
	find . -name '__pycache__' -type d -exec rm -rf {} +
	find . -name '*.pyc' -exec rm -f {} +
	find . -name '*.pyo' -exec rm -f {} +

build: .env clean
	$(python) setup.py bdist_wheel

test: .env
	$(tox)
