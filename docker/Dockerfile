FROM alpine:3.14

RUN apk add --no-cache bash curl ruby ruby-rake xz-libs ghostscript

RUN apk add --no-cache font-bakoma-ttf ttf-liberation ttf-dejavu

RUN apk add --no-cache --virtual .rubymakedepends build-base libxml2-dev ruby-dev \
  && gem install --no-document \
    "asciidoctor:2.0.17" \
    "asciidoctor-epub3:1.5.1" \
    "asciidoctor-pdf:1.6.2" \
    "epubcheck-ruby:4.2.6.0" \
  && apk del -r --no-cache .rubymakedepends

WORKDIR /documents
VOLUME /documents

CMD ["/bin/bash"]
