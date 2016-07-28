.PHONY: install run

help:
	@echo "Please use 'make <target>' where <target> is one of"
	@echo "    install          to install lpug.github.io requirements"
	@echo "    run              to start lektor server"

install:
	pip install -r requirements.txt

run:
	lektor server
