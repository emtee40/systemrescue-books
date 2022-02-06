# SystemRescue

## Project website
Homepage: https://www.system-rescue.org/

## About these sources
This repository contains the asciidoc source code that is used to build
books related to the SystemRescue project in formats such as PDF, EPUB, MOBI.

These books are based on the asciidoc language, as it allows to use plain
text files to produce good quality books, without having to manually go
through a complicated process for formatting the books. Having the contents
in plain text allows people to contribute to the book by raising merge
requests in git, just as for other projects based on git.

## Building the book
The book requires asciidoctor and additional modules such as `asciidoctor-epub3`
and `asciidoctor-pdf`. A docker image which contains everything required
to build the book is available. The sources of the docker image are
included in this repository. This book can be built on a linux system
where docker is installed so the docker image with these dependencies
are present. The book can be built by running `build.sh` and the book
will be produced in multiple formats in the `output` directory.

## Guidelines
These books should be readable on any time of decent device, including
black and write e-readers with 6 inch screens, as well as tablets with
LCD screens, or computer screens. All screenshots included in the book
should be low-resolution images, such as 640x480, so they are readable
on devices with small screens. Also screenshots should be looking good
on black and white screens.
