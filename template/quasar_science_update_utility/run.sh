#!/bin/sh

run ()
{

	file='./quasar_science_update_utility'
	echo "Entering directory $1"
	cd "$1"
	echo "Running $file"
	$file

}

dir=$(dirname "$(readlink -f "$0")")

run "$dir"

