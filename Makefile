sdist:
	rm -f dist/*
	python setup.py sdist

cheesecake: sdist
	cheesecake_index --path dist/`ls -1 dist/`

README.rst: README.md
	pandoc --from=gfm --to=rst -o README.rst README.md

pypi: README.rst
	python setup.py clean
	twine upload --repository pypi dist/*

pypitest: README.rst
	python setup.py clean
	twine upload --repository pypitest dist/*
