
# Welcome to the Repository of My Personal Webpage!

Link to the webpage: [https://serigra.github.io/Webpage_Quarto/]( https://serigra.github.io/Webpage_Quarto/)

## How Did I Customize the Styling of My Personal Quarto-based Webpage?

Quarto offers great default options to build a website, with some nicely pre-designed themes and layouts. 
However, when it comes to customizing it according to your own styles and ideas, 
I found myself very quickly diving into CSS, HTML, and JavaScript code.

Since I didn`t know anything about these languages, I figured out most of the things
by trial & error and by consulting LLMs (ChatGPT, Claude or Perplexity).
In hindsight, I would probably recommend to my younger self to do a short introduction course, especially on CSS and HTML.
I like the following overview given by Sam Csik: https://samanthacsik.github.io/talks_workshops/2023-08-03-just-enough-css/

Since I still don't know much about these languages, I tried to document 
as much as possible to avoid getting lost again. 
The following is a list of the things I found worth noting down during the process of customizing my webpage.

Because my coding is probably still far from elegant, I'm happy to receive any tips, tricks, and suggestions for improvement.


## Selectively Ignoring Content for Rendering

In my root directory, I have one folder named `x_not_published` where I store unfinished
content and notes that are not yet ready for publication. To explicitly exclude 
the given folder with the stuff I don't want rendered, I added ` - "!x_not_published/" ` 
under the  `project:render:` in the `_quarto.yml` file.


## Layout, Fonts and Colors

### Page Layout,  Widths of Margins/ Sidebars

In `_quarto.yml`, `grid:` with `sidebar-width: 200px` etc. defines the dimensions
, however, only the ones on the "HOME"-page. The layouts of the other subpages (PUBLICATIONS; TALKS, BLOG) are
defined in `styles_publications.css`, `styles_talks.css` and `styles_blog.css` within
`.quarto-listing { ... }`. See further info below.


### Background Color

- To apply the background color universally on the whole webpage, I used `backgroundcolor: "#f8f8f6"` in the 
`_quarto.yml`-file in the root folder. Alternatively one could also define it in the `styles.css` file
using `background-color: #f8f8f6!important;` within `body {}`. Additionally the background color of the `page-footer` can also be set 
in the same file (`_quarto.yml`) using `background: "#f8f8f6"`.
- Important: (matching) background colors for `R` plots need to be set in the corresponding 
`R`-code of the figure itself, e.g. in the `theme()` of the `ggplot`-figure.
- to make sure a newly set background color applies properly, or in general other 
styling: delete `_site` folder in the root and render the page again.


### Customize Individual Subpages

The webpage and each subpage can be customized/ formatted using `.css` and `.ejs` (embedded java script) files.
In these files you define things like the size, the font and color of your titles, subtitles, links, etc., 
the width and position of your text body and everything else you want to customize according to your own ideas.

For each subpage I created a separate`.css` and/ or `.ejs` file. These files need to be
referenced in the yaml-header of the corresponding `index.qmd` file, using e.g. `css: styles.css`.

  - **HOME**-subpage: in the `styles.css` file located in the root folder, I’ve defined specific 
styles for titles, subtitles, and other elements (social links, "About Me"-Arrow) used on the HOME subpage. 
Also it includes globally applicable styles such as for the appearance of `R` code and output,
as well as definitions of vertical spacing to enhance readability, e.g. in blog posts. The file needs to be referenced in 
the `index.qmd` file in the root directory.
  - **ABOUT**-subpage: has a separate style file `about/styles_about.css`, which also must be referenced in the `about.qmd` file using `css: styles_about.css`.
  - **PUBLICATIONS/ TALKS**-subpages: 
    - on these sites, all of my publications and talks are listed based on a "listing"-layout. 
    Instead of using one of the three [Quarto built-in types of listings](https://quarto.org/docs/websites/website-listings.html#:~:text=By%20default%2C%20listings%20will%20appear,provides%20a%20traditional%20tabular%20layout.), I customized the display of
    the items using `.ejs` files (ejs = embedded java script). See further info below. 
    - the `.ejs` files are saved in the folder `_ejs` in `publications/` and `talks/`, respectively.
    - the style, fonts and colors of the overview listing pages are defined in
    `publications/styles_publications.css` and `talks/styles_talks.css`.
  - **BLOG**-subpage: here I created two separate style files: `styles_blog.css` for the overview 
  blog page, and `styles_blog_individualc.css` containing definitions for the separate/ individual blog posts.
  The files are referenced in the `blog/index.qmd` and in each of the blogs posts `index.qmd` files by 
  `css: "../styles_blog_individual.css"`.

### Responsive Design with CSS Media Queries

To ensure compatibility with smaller screens, all .css files include additional specifications using media queries. 
For example:

``` 
@media screen and (max-width: 768px) {
  /* Styles for screens 768px wide or smaller */
}
``` 
These media queries allow your webpage to adapt its design and layout dynamically based on the size of the user’s screen, providing an optimized experience on devices of all sizes.
See also notes on Chrome DevTools Device Mode further down.

### Customized Listing Layout (Publications, Talks)

Quarto offers 3 types of [built-in listings](https://quarto.org/docs/websites/website-listings.html#:~:text=By%20default%2C%20listings%20will%20appear,provides%20a%20traditional%20tabular%20layout.). However, none of these fit my needs for the publications and talks sites of my webpage. 
Therefore, I built a [custom display listing](https://quarto.org/docs/websites/website-listings-custom.html) using `.ejs` templates. 
`.ejs` stands for embedded java script, and these files offer a possbility  to loop through a list of files and display 
them all in the same mamner. These files are located under `publications/_ejs/pulbications.ejs` and `talks/_ejs/talks.ejs`.
I did not build these files from scratch but rather browsed through the [quarto gallery](https://quarto.org/docs/gallery/#websites) and 
let myself inspire by different websites and looked up the underlying code, and used support from LLMs (ChatGPT, Claude and Perplexity).

Here are few things I want to point out for the styling of the publications listing layout:


The **category filter buttons** at the top of the Publications subpage: The styling of those buttons is defined
in `styles_publications.css` and the buttons and the corresponding filter functionality are implemented in the `ejs`-template
`_ejs/publications.ejs`.

In the `ejs`-template `_ejs/publications.ejs` I added a function to **bold my own 
name in the author list** of each publication.


The **HTML/ PDF-icons** for linking the underlying HTML or PDF file of the talks are included, for pdf for example:
``` 
<a href="<%- item.pdf %>">
<p style="color:#FA2FBD;">PDF <i class="bi bi-filetype-pdf"></i></p>
</a>
``` 
Please note that these links (PDF, HTML) are thereby embedded with fixed styling. 
As a result, modifying link styles in the `.css` file will not affect these specific links.
More items and their codes can be found here: [https://icons.getbootstrap.com/](https://icons.getbootstrap.com/)


### References in Blog Posts

In the blog posts I want the references in the text to show the whole citation only by hovering over it,
but without an automatic reference list at the end of the document - which is normally achieved by 
using `suppress-bibliography: true` in the yaml-header. 
However, as soon as using `suppress-bibliography: true` in the YAML-header, the citation hover functionality does not work anymore.
Therefore, I removed the `suppress-bibliography: true` from the meta-data, and I instead included a corresponding 
definition in the `styles_blog_individual.css`:

```
#quarto-bibliography {
  display: none;
}

#quarto-appendix {
  background-color: #FBFAF9!important; 
  border-color: #FBFAF9!important;
}
```

I found the names of the attributes/ CSS-selectors - `#quarto-bibliography` and `#quarto-appendix` - 
by inspecting the site, which shows the raw html-code underneath.
By disabling only the `#quarto-bibliography` and not the whole 
[Quarto Appendix](https://quarto.org/docs/authoring/appendices.html) (`#quarto-appendix`), 
footnotes and attribution information would still show, in case there are any.
Since the [Quarto Appendix](https://quarto.org/docs/authoring/appendices.html)
somehow still appears as a white box, I managed to hide it by matching its color to the 
website`s background color.


### Possiblity to Comment on Blog-Posts

Quarto enables [commenting](https://quarto.org/docs/output-formats/html-basics.html#commenting) via 3 options.
I decided to go with [Utterances](https://utteranc.es/) commenting for my blog posts. To do so, first, 
I needed to make my Webpage_Quarto repository public. Second, I installed the utterances app on the repo.
Third, I added a `_metadata.yml` file with the following lines of codes:
```
comments:
  utterances:
    repo: serigra/Webpage_Quarto
```
To make sure that the comments are only allowed for the individual blog posts, 
but not on the overview blog page, I added `comments: false` in metadata of the file `blog/index.qmd`.

## General 

### Inspect your Wepage

To customize very specific elements of your webpage using CSS - for instance I wanted
to suppress the References section at the end of my blog posts (see further down) - you 
first need to identify the exact name of that element. These identifiers, known as [*CSS selectors*](https://www.w3schools.com/css/css_selectors.asp),
can be found by inspecting the underlying HTML code (right click -> Inspect).

### Chrome DevTools Device Mode

A helpful tool for web development, especially when testing your website on smaller screens, is the [Chrome DevTools device mode](https://developer.chrome.com/docs/devtools/device-mode).

To access it:
	1.	Click the three dots in the top-right corner of Chrome.
	2.	Navigate to More Tools → Developer Tools.
	3.	Click the icon that looks like two overlapping screens (this toggles the device toolbar).

This mode lets you adjust the screen size and see how your webpage design responds to different dimensions. 
It’s a quick and convenient way to ensure your site is mobile-friendly and responsive.

### Vertical Spacing

Adjusting vertical spacing between paragraphs and images in a document can enhance 
its overall appearance and readability. Todo so in a quarto document, one option is
using `<br>`, which, however results in quite a large space.  
To allow for more flexibility in choosing various spacing options, I added some functionalities in `styles.css`, such as:

```
.small-space {
  margin-bottom: 1em; 
}
```


### Icons

#### Font Awesome Icons Extension for Quarto

Follow the instructions here: [https://github.com/quarto-ext/fontawesome#readme](https://github.com/quarto-ext/fontawesome#readme)


#### Academicons

To be able to use non-built-in ["academicons"](https://jpswalsh.github.io/academicons/)--\> 
navigate to your root folder of your webpage and install the extension in the particular project:

In terminal:

```         
cd 07_Webpage_Quarto     
quarto install extension schochastics/academicons
```

This adds a new folder `_extensions/stochastics/academicons` in the root folder of the quarto (webpage) project.

Example to add Icon:

```         
- text: "{{< ai researchgate >}}"      
  aria-label: ResearchGate
  href: https://www.researchgate.net/profile/Sereina-Graber
```

#### Icons in the .ejs files

For icons embedded in the .ejs files (e.g. pdf, html or link item): look up code 
here [https://icons.getbootstrap.com/](https://icons.getbootstrap.com/)








