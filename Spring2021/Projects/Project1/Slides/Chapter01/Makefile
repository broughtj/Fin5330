/ll:
	Rscript -e 'rmarkdown::render("Chapter01.Rmd")'


pdf:
	Rscript -e 'rmarkdown::render("Chapter01.Rmd", output_format="beamer_presentation")'


ioChapter01:
	Rscript -e 'rmarkdown::render("Chapter01.Rmd", output_format="ioChapter01_presentation")'

slidy:
	Rscript -e 'rmarkdown::render("Chapter01.Rmd", output_format="slidy_presentation")'


clean:
	rm Chapter01.pdf Chapter01.html Chapter01.tex
