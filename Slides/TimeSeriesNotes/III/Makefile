all:
	Rscript -e 'rmarkdown::render("Time-Series-Notes-3.Rmd")'


pdf:
	Rscript -e 'rmarkdown::render("Time-Series-Notes-3.Rmd", output_format="beamer_presentation")'


ioTime-Series-Notes-3:
	Rscript -e 'rmarkdown::render("Time-Series-Notes-3.Rmd", output_format="ioTime-Series-Notes-3_presentation")'

slidy:
	Rscript -e 'rmarkdown::render("Time-Series-Notes-3.Rmd", output_format="slidy_presentation")'


clean:
	rm Time-Series-Notes-3.pdf Time-Series-Notes-3.html
