#!/bin/bash
export LIBS=$(find ${BUILDPATH}/Libraries/python/ -name '*.whl' | sed 's#.*/##' | paste -sd " ")


#Script to uninstall, reboot if needed & instsall library
python ${SCRIPTPATH}/installWhlLibrary.py --workspace=${DBURL}\
            --token=$DBTOKEN\
            --clusterid=${CLUSTERID}\
            --libs=$LIBS\
            --dbfspath=${DBFSPATH}