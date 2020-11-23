#!/bin/bash

python ${SCRIPTPATH}/executenotebook.py --workspace=${DBURL}\
                      --token=$TOKEN\
                      --clusterid=${CLUSTERID}\
                      --localpath=${NOTEBOOKPATH}/VALIDATION\
                      --workspacepath=${WORKSPACEPATH}/VALIDATION\
                      --outfilepath=${OUTFILEPATH}

sed -i -e 's #ENV# ${OUTFILEPATH} g' ${SCRIPTPATH}/evaluatenotebookruns.py

python3 -m pytest --junit-xml=${TESTRESULTPATH}/TEST-notebookout.xml ${SCRIPTPATH}/evaluatenotebookruns.py || true
     