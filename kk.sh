#!/bin/bash
for i in $(cat /tmp/kk2)
do
	a=`cat ${i}/Gemfile | egrep -e "^gem 'puppet-lint'$"`
	if [ $? -eq 0 ]; then
		echo "$i"
	fi
done
