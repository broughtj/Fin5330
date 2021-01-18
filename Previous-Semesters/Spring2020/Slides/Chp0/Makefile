all:
	Rscript -e 'rmarkdown::render("Chapter0.Rmd")'


pdf:
	Rscript -e 'rmarkdown::render("Chapter0.Rmd", output_format="beamer_presentation")'


ioChapter0:
	Rscript -e 'rmarkdown::render("Chapter0.Rmd", output_format="ioChapter0_presentation")'

slidy:
	Rscript -e 'rmarkdown::render("Chapter0.Rmd", output_format="slidy_presentation")'


clean:
	rm Chapter0.pdf Chapter0.html
