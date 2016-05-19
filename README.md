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

# Generate

To let grunt monitor changes in files and regenerate the output, run
```
grunt
```

# Resources

* Latex quick reference: https://latex-project.org/guides/usrguide.tex
* Latex cheat sheet: https://wch.github.io/latexsheet/latexsheet.pdf
* Bibliography management: https://fr.sharelatex.com/learn/Bibliography_management_with_bibtex

# Gotchas

When changing bibliography-related stuff, the build needs to run twice for references to be up-to-date.
See: http://tex.stackexchange.com/questions/63852/question-mark-instead-of-citation-number
