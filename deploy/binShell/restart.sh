#!/bin/sh

SCRIPT_PATH=`dirname $0`
cd $SCRIPT_PATH && chmod u+x *.sh

if [ ! $1 ]; then 
	echo "not exits args" && exit 10
elif [ "$1" != "all" ]; then
	cd $SCRIPT_PATH
	./stop.sh $1; ./start.sh $1 $2
fi
