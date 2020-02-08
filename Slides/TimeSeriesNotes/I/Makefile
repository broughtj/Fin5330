all:
	Rscript -e 'rmarkdown::render("Time-Series-Notes-1.Rmd")'


pdf:
	Rscript -e 'rmarkdown::render("Time-Series-Notes-1.Rmd", output_format="beamer_presentation")'


ioTime-Series-Notes-1:
	Rscript -e 'rmarkdown::render("Time-Series-Notes-1.Rmd", output_format="ioTime-Series-Notes-1_presentation")'

slidy:
	Rscript -e 'rmarkdown::render("Time-Series-Notes-1.Rmd", output_format="slidy_presentation")'


clean:
	rm Time-Series-Notes-1.pdf Time-Series-Notes-1.html
