#!/bin/bash
if [ "foo" = "bar" ]; then
	echo "expression 1 is true"
elif [ "foo" = "foo" ]; then
	echo "expression 2 is true"
else
	echo "expression 3 is true"
fi
