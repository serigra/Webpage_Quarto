# Instructions


## Styles, Fonts and Colors

Über .css Files kann die Website und jede Subsite beliebig angepasst/ formattiert werden.

- für "**HOME**"-Page: im root folder im File "styles.css"" können title, subtitles etc. formatiert werden.
- für "**ABOUT**"-Page: separates .css-File: "about/styles_about.css" --> muss ebenfalls im about.qmd file mit `css: styles_about.css` referenziert werden.
- "**PUBLICATIONS**": 
    - on this site, all publications are listed based on a "listing"-layout, as defined in the yaml-header. Instead of using one of the three build in type of listings, I used customized display of the items, which is defined in the publications/_ejs/publications.ejs (ejs = embedded java script). Here you arrange the displayed items (title, author, journal, URL Link, image, etc.) according to your own needs. It is important to refer to the .ejs file in the index.qmd file using `template: _ejs/publications.ejs` in the yaml-header under `listing`.
    - the style, fonts and colors of the listing page are defined in the `publications/styles_publications.css` file.
    - the style, fonts and colors of the individual sites of each publication (i.e. abstracts), are defined in `styles_publications_individual.css`



## Page Layout/ Widths of Columns

- in "_quarto.yml": see `grid:` with `sidebar-width: 200px` etc.



## Listing Layout (Publications, Talks)

Quarto offers 3 type of built in listings. However, none of these fit my needs for publications and talks site of my webpage. 
Therefore, I built a [custom display listing](https://quarto.org/docs/websites/website-listings-custom.html) using .ejs templates. Ejs stands for embedded java script, and these files offer a possbility 
to loop through a list of files and display them all in the same mamner.
These files are located `publications/_ejs/pulbications.ejs` and `talks/_ejs/talks.ejs`.
I did not build these files from scratch but rather browsed through the [quarto gallery](https://quarto.org/docs/gallery/#websites) and 
let myself inspire by different websites and looked up the underlying code.

Here are few things I wanna point out:

- the icons for linking the underlying HTML or PDF file of the talks are included, for pdf for example:
``` 
<a href="<%- item.pdf %>">
<p style="color:#FA2FBD;">PDF <i class="bi bi-filetype-pdf"></i></p>
</a>
``` 

More items and their codes can be found here: https://icons.getbootstrap.com/



## Icons

For icons embedded in the .ejs files (e.g. pdf, html or link item): look up code here https://icons.getbootstrap.com/



## Academicons

To be able to use non-built-in ["academicons"](https://jpswalsh.github.io/academicons/)--\> navigate to your root folder of website and install the extension in the particular project:

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


