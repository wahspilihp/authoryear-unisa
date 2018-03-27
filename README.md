# authoryear-unisa
Biblatex style to comply with the  [Harvard UniSA referencing guide](https://lo.unisa.edu.au/pluginfile.php/438774/mod_book/chapter/39173/HRG%20January%202015%20final%20version.pdf), which is also explained [here](https://roadmap.unisa.edu.au)

# Bibliography Style
The BBX file meets many of the examples, complete with corrections which I assumed were intended (it standardises on British-format dates, for example).

There are some aspects of the specification which are ambiguous or unclear. These are, so far:
* exactly what the rules are for using short and long names in the biblography. THe guide uses short names in publishers and so on, but does not introduce them with the long name and brackets when they appear as an author. I have treated their appearance as a publisher as though it were a repeatedly-cited author, but I am not sure I've judged the rules correctly.
* the year is missing in their example of a TV news item. I assume that's erroneous.
* I am not sure how to reference a whole issue of a periodical, or @stdmodel

## Known Limitations
* Translated classics are not correctly shown without dates
* The compiler '(comp.)' annotation is not used: the editortype is ignored and it is always shown as "(ed.)" or "(eds.)"
* Supplement issues are specified by using issue titles, which means that any issue title appears in the bibliography. There doesn't appear to be a suitable field for a series add-on or subtitle.
* Types which should not produce a bibligraphy entry produce blank lines if cited. I can't find a way to make the BibliographyDriver delete the list entry it sits inside.
* Eprint handling is decidedly wobbly - the official guide doesn't use them, most of the time, but I can't figure out a general automatable rule to follow.
* Videos use author for both corporate authors and directors. This appears to be convention, but it means that the driver is forced to guess whether the name should be tagged "(dir.)". It does this based on whether the last author has a given name. I will at some point add support for single-named directors.

## Missing Types
* ABS reports (given in the guide as a special type)
* Hansard (online and offline)
* @Legislation and @Jurisdiction — these appear to be the same as the AGLC format, so I'll incorporate them later
* @Standard
* @Misc
* @Image is not supported — it should not appear in the bibliography, but the citation command ought to rewrite itself to specify the location and cite the containing work.
* @Set is not implemented


# Citation Style
The CBX file is barely modified from the biblatex standard file. Users are warned that it is not compliant in many instances.