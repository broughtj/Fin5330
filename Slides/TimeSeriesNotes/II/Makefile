all:
	Rscript -e 'rmarkdown::render("Time-Series-Notes-2.Rmd")'


pdf:
	Rscript -e 'rmarkdown::render("Time-Series-Notes-2.Rmd", output_format="beamer_presentation")'


ioTime-Series-Notes-2:
	Rscript -e 'rmarkdown::render("Time-Series-Notes-2.Rmd", output_format="ioTime-Series-Notes-2_presentation")'

slidy:
	Rscript -e 'rmarkdown::render("Time-Series-Notes-2.Rmd", output_format="slidy_presentation")'


clean:
	rm Time-Series-Notes-2.pdf Time-Series-Notes-2.html
