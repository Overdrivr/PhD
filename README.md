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

In the current workflow, figures are drawn with inkscape in vector format.
Figures should preferably be imported from `.pdf` files to get the best render, rather than direct svg import which is broken at the moment.
To generate `.pdf` from `.svg`, the inkscape command line can be used.

With Inkscape, to get a clean output of the figure, it is required to set the page size and position properly before converting to `.pdf`.
Once a figure drawing is done:

1. Unselect everything
2. Go to `File`->`Document Properties`.
3. In the custom size tab, click on `resize page to content`.
4. Eventually set some margin, then click `resize page to drawing or selection`.

At this point the drawing should be properly surrounded by the page.

The `.svg` file can now be converted manually to `.pdf` with the following command.

```
inkscape --file=myImage.svg --export-pdf=image.pdf
```

To regenerate at once all `.pdf` from all `.svg`

```
node figs.js
```
or
```
grunt execute:figs
```
Grunt will watch for changes and new files and will regenerate automatically `.pdf` for modified files.

# Gotchas

When changing glossary related stuff, glossary generation can fail if the makeglossaries executable is not found.

# Cheat-sheet

## Figures

To leave figure as-is (works well with pdf)

```
\begin{figure}[!htbp]
  \centering
  \includegraphics{src/1/figures/iso10605_waveform.pdf}
  \caption{All waveforms defined in ISO 10605 standard}
  \label{iso_pulse}
\end{figure}
```

To clamp figure width to text width

```
\begin{figure}[!htbp]
  \centering
  \includegraphics[width=\textwidth]{src/1/figures/iso10605_waveform.pdf}
  \caption{All waveforms defined in ISO 10605 standard}
  \label{iso_pulse}
\end{figure}
```

See [here](http://tex.stackexchange.com/a/1527/105955) to why `!htbp`

## Greek letters

Using `textgreek` package (see [here](http://texblog.org/2012/03/15/greek-letters-in-text-without-changing-to-math-mode/)).
`textgreek` requires `cbgreek` package, you should install it with your package manager.

```
\textOmega
```

Append a `\` afterward to get a trailing space afterward. Example:

```
\textOmega\ foo
```

## External tools

For viewing the generated `phd.pdf`, consider using the amazing [Sumatra pdf reader](http://www.sumatrapdfreader.org/free-pdf-reader.html).
It is free, extremely fast, portable, small and is packed with good features.
