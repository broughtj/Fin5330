all:
	Rscript -e 'rmarkdown::render("Time-Series-Notes-4.Rmd")'


pdf:
	Rscript -e 'rmarkdown::render("Time-Series-Notes-4.Rmd", output_format="beamer_presentation")'


ioTime-Series-Notes-4:
	Rscript -e 'rmarkdown::render("Time-Series-Notes-4.Rmd", output_format="ioTime-Series-Notes-4_presentation")'

slidy:
	Rscript -e 'rmarkdown::render("Time-Series-Notes-4.Rmd", output_format="slidy_presentation")'


clean:
	rm Time-Series-Notes-4.pdf Time-Series-Notes-4.html
