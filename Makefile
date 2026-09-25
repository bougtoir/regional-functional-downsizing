PYTHON ?= .venv/bin/python

.PHONY: all analysis download download-analysis metadata preprocess analyze diagnostics robustness validate network-validation figures tables manuscript submission audit test lint clean

all: analysis $(if $(wildcard src/manuscript/build_submission.py),metadata manuscript submission audit,)

analysis: download-analysis preprocess analyze robustness diagnostics network-validation validate test lint figures tables

download: download-analysis metadata

download-analysis:
	$(PYTHON) -m src.download.public_data

metadata:
	$(PYTHON) -m src.download.reference_metadata
	$(PYTHON) -m src.download.journal_policies
	$(PYTHON) -m src.download.author_metadata

preprocess:
	$(PYTHON) -m src.preprocess.build_inputs

analyze:
	$(PYTHON) -m src.analysis.run_analysis

diagnostics:
	$(PYTHON) -m src.analysis.build_diagnostics

robustness:
	$(PYTHON) -m src.analysis.robustness_diagnostics

validate:
	$(PYTHON) -m src.validation.run_validation

network-validation:
	$(PYTHON) -m src.validation.network_travel_validation

figures:
	$(PYTHON) -m src.figures.build_figures

tables:
	$(PYTHON) -m src.tables.build_tables

manuscript:
	$(PYTHON) -m src.manuscript.build_submission

audit:
	$(PYTHON) -m src.validation.final_audit

submission:
	$(PYTHON) -m src.manuscript.package_submission

test:
	$(PYTHON) -m pytest -q

lint:
	$(PYTHON) -m ruff check src tests

clean:
	rm -rf data/interim/* data/processed/* outputs/* manuscript/build submission/*
