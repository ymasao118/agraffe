TARGETS := agraffe 

ISORT_OPT := -rc -m3 -tc
BLACK_OPT := -t py37 --skip-string-normalization
FLAKE8_OPT := --max-line-length 88
MYPY_OPT := --config-file mypy.ini

format:
	isort ${ISORT_OPT} ${TARGETS}
	black ${BLACK_OPT} ${TARGETS}

lint:
	isort --check-only ${ISORT_OPT} ${TARGETS}
	black --check ${BLACK_OPT} ${TARGETS}
	flake8 ${FLAKE8_OPT} ${TARGETS}
	mypy ${MYPY_OPT} ${TARGETS}

run:
	functions-framework --target=entry_point
