# Instructions


# Styles, Fonts and Colors

Über .css Files kann die Website und jede Subsite beliebig angepasst/ formattiert werden.

- für "HOME"-Page: im root folder im File "styles.css"" können title, subtitles etc. formatiert werden.
- für "ABOUT"-Page: separates .css-File: "about/styles_about.css" --> muss ebenfalls im about.qmd file mit `css: styles_about.css` referenziert werden.

# Page Layout/ Widths of Columns

- in "_quarto.yml": see `grid:` with `sidebar-width: 200px` etc.


## Academicons

To be able to use non-built-in "academicons" --\> navigate to your root folder of website and install the extension in the particular project:

In terminal:

```         
cd 07_Webpage_Quarto     
quarto install extension schochastics/academicons
```

This adds a new folder \_extensions/stochastics/acadeicons in the root folder of the quarto (website) project.

Example to add Icon:

```         
- text: "{{< ai researchgate >}}"      
  aria-label: ResearchGate
  href: https://www.researchgate.net/profile/Sereina-Graber
```


