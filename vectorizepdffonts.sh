#!/bin/sh

# Get the total number pages with pdfinfo
TOTALNUMBERPAGES=`pdfinfo $1| grep "Pages" | sed 's/Pages: *//'`


printf "Page [$TOTALNUMBERPAGES]: "
i=1
((TOTALNUMBERPAGES=TOTALNUMBERPAGES+1))
while [ "$i" != $TOTALNUMBERPAGES ]
do
	printf "$i, "
	pdftk $1 cat $i output temp.pdf # pdftk extract the curent page in the file temp.pdf
	pdf2svg temp.pdf temp.svg # The curent pdf page is converted to svg with pdf2svg. This operation vectorise the fonts.
	inkscape --export-pdf=temp.pdf temp.svg; # The svg version (with vectorised font) is again converted to pdf.
	if [ "$i" = 1 ]; then
		mv temp.pdf finale_vectorized.pdf # For the first page, the file `finale_vectorized.pdf` isn’t created. So we create it.
	else
		pdftk finale_vectorized.pdf temp.pdf output finale_vectorized_swap.pdf # In other cases, the current page is added to the finale file
		mv finale_vectorized_swap.pdf finale_vectorized.pdf
	fi

	((i=i+1))
done

# In the end, the final file is renamed to be like the name of the input file
mv finale_vectorized.pdf $1-vectorized
perl-rename "s/\.pdf-vectorized/_vectorized.pdf/" $1-vectorized
