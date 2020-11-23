#!/bin/bash
# Enable Conda environment for tests
#source ${CONDAPATH}/bin/activate ${CONDAENV}

# Package Python library to wheel
cd ${LIBRARYPATH}/python/dbxdemo
python setup.py sdist bdist_wheel