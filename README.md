# Tipps & Tricks


## Layout, Fonts and Colors

The website and each subsite can be customised/formatted as required using .css files as well as the .ejs (embedded java script files).

- **HOME**-subpage: in the root folder in the file ‘styles.css’’ title, subtitles etc. can be formatted.
- **ABOUT**-subpage: separate .css file: ‘about/styles_about.css’ --> must also be referenced in the about.qmd file with `css: styles_about.css`.
- **PUBLICATIONS**-subpage: 
    - on this site, all publications are listed based on a "listing"-layout, as defined in the yaml-header. Instead of using one of the three build in type of listings, I used customized display of the items .ejs files (ejs = embedded java script). See more below. 
    - the style, fonts and colors of the listing page are defined in the `publications/styles_publications.css` file.
    - the style, fonts and colors of the individual sites of each publication (i.e. abstracts), are defined in `styles_publications_individual.css`

## Listing Layout (Publications, Talks)

Quarto offers 3 type of built in listings. However, none of these fit my needs for publications and talks site of my webpage. 
Therefore, I built a [custom display listing](https://quarto.org/docs/websites/website-listings-custom.html) using .ejs templates. Ejs stands for embedded java script, and these files offer a possbility 
to loop through a list of files and display them all in the same mamner.
These files are located `publications/_ejs/pulbications.ejs` and `talks/_ejs/talks.ejs`.
I did not build these files from scratch but rather browsed through the [quarto gallery](https://quarto.org/docs/gallery/#websites) and 
let myself inspire by different websites and looked up the underlying code, and using help from LLMs (ChatGPT, Claude and Perplexity).

Here are few things I wanna point out:

- the icons for linking the underlying HTML or PDF file of the talks are included, for pdf for example:
``` 
<a href="<%- item.pdf %>">
<p style="color:#FA2FBD;">PDF <i class="bi bi-filetype-pdf"></i></p>
</a>
``` 

More items and their codes can be found here: https://icons.getbootstrap.com/


## Page Layout/ Widths of Columns

- in "_quarto.yml": see `grid:` with `sidebar-width: 200px` etc.


## Icons

### Icons in the .ejs files

For icons embedded in the .ejs files (e.g. pdf, html or link item): look up code here https://icons.getbootstrap.com/


### Font Awesome Icons Extension for Quarto

Follow the instructions here: https://github.com/quarto-ext/fontawesome#readme


### Academicons

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

## Comments

Quarto enables [commenting](https://quarto.org/docs/output-formats/html-basics.html#commenting) via 3 options.
I decided to go with [Utterances](https://utteranc.es/) commenting for my blog posts. To do so, first, 
I needed to make my Webpage_Quarto repository public. Second, I installed the utterances app on the repo.
Third, I added a `_metadata.yml` file with the codes lines below, and added in the `blog/index.qmd` `comments: false`. 
This makes sure that the comments are only allowed for individual blog posts, and not on the main blog page.

```
comments:
  utterances:
    repo: serigra/Webpage_Quarto
```