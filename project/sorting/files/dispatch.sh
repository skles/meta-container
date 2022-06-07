#!/bin/bash

echo "Dispatching ..."
Rscript sort.r
pdflatex --output-directory=output/ paper.tex
