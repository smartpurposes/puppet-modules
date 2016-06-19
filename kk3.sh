#!/bin/bash
for i in $(cat /tmp/kk3)
do
	cp -a nodejs/Gemfile ${i}/Gemfile
done
