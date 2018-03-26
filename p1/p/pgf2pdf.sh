#!/bin/bash

inf="$1"

if [[ ( ! -f "$inf" ) && ( ! -L "$inf" ) ]] ; then
  echo "Input file required" 1>&2
  exit 1
fi

base="${inf%.pgf}"
if [[ "$base" == "$inf" ]] ; then
  echo "Suffix .pgf required" 1>&2
  exit 2
fi

b0="${base}_$$"
f="${b0}.tex"

cat _in.tex > "$f"

echo '\input{'"${inf}"'}' >> "$f"
echo '\end{document}' >> "$f"

pdflatex "$f" && {
  mv "${b0}.pdf" "${base}.pdf"
}
rm "${b0}".*


