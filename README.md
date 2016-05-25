# Prepare
Install Latex, then type in a terminal
```
pdflatex
```
to check latex properly installed.

Then, make sure you have npm installed and run

```
npm install -g grunt-cli
grunt latex
```

Also install [Perl interpreter](https://www.perl.org/get.html) (required for generating the glossary)

# Generate

To let grunt monitor changes in files and regenerate the output, run
```
grunt
```

Run the `latex` task to generate the pdf file manually
```
grunt latex
```

# Resources

* Latex quick reference: https://latex-project.org/guides/usrguide.tex
* Latex cheat sheet: https://wch.github.io/latexsheet/latexsheet.pdf
* Bibliography management: https://fr.sharelatex.com/learn/Bibliography_management_with_bibtex
* Interesting info about Grunt and automation: https://jonsuh.com/blog/take-grunt-to-the-next-level/

# Figures

```
inskscape -D -z --file=myImage.svg --export-pdf=image.pdf --export-latex
```

# Gotchas

When changing bibliography related stuff, the build needs to run twice for references to be up-to-date.
See: http://tex.stackexchange.com/questions/63852/question-mark-instead-of-citation-number

When changing glossary related stuff, glossary generation can fail if the makeglossaries executable is not found.
