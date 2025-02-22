#!/bin/sh
set -e

while getopts "s:f:o:" optarg
do
	case "${optarg}" in
		s)
			export source="${OPTARG}"
		;;
		f)
			export file="${OPTARG}"
		;;
		o)
			export out="${OPTARG}"
		;;
	esac
done

octave "${source:-logo.m}"
convert "${file:-pearl.png}" -alpha set -channel A -evaluate multiply 0.95 \
    -gravity center -fill white -pointsize 260 -stroke black -strokewidth 3 \
    -font "moonless.otf" -annotate +90+245 "Pearl Language" "${out:-pearl_logo.png}"
[ -f "${file:-pearl.png}" ] && rm -vf "${file:-pearl.png}"
[ -f "${out:-pearl_logo.png}" ] && echo "logo: \"${out:-pearl_logo.png}\""
