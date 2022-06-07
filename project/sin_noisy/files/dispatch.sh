#!/bin/bash

echo "Dispatching ..."
Rscript sin_noisy.r 1 1024
pdflatex --output-directory=output/ paper.tex
