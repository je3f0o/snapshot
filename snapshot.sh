#!/bin/bash

if [ -d "snapshots/snapshot01" ]; then

	PREVIOUS_SNAP_NAME=`ls snapshots | grep snapshot | tail -n 1`

	PREVIOUS_SNAP_NUMBER=`echo ${PREVIOUS_SNAP_NAME} | sed -e 's/snapshot//'`

	NEXT_SNAP_NUMBER=`echo ${PREVIOUS_SNAP_NUMBER} | awk '{print $1 + 1}'`

	NEXT_SNAP_NUMBER=`printf "%02d" ${NEXT_SNAP_NUMBER}`

	NEXT_SNAP_NAME="snapshot${NEXT_SNAP_NUMBER}"
else
	NEXT_SNAP_NAME="snapshot01"
fi

mkdir -p "snapshots/${NEXT_SNAP_NAME}"

for f in `ls | grep -v snapshot`; do
	cp -r $f "snapshots/${NEXT_SNAP_NAME}"
done
