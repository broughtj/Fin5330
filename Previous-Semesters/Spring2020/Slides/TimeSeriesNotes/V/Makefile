all:
	Rscript -e 'rmarkdown::render("Time-Series-Notes-5.Rmd")'


pdf:
	Rscript -e 'rmarkdown::render("Time-Series-Notes-5.Rmd", output_format="beamer_presentation")'


ioTime-Series-Notes-5:
	Rscript -e 'rmarkdown::render("Time-Series-Notes-5.Rmd", output_format="ioTime-Series-Notes-5_presentation")'

slidy:
	Rscript -e 'rmarkdown::render("Time-Series-Notes-5.Rmd", output_format="slidy_presentation")'


clean:
	rm Time-Series-Notes-5.pdf Time-Series-Notes-5.html
