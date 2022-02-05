#!/bin/bash
CURDATE="$(date +%Y%m%d)"
DOCKERIMG="fdupoux/asciidoctor:20220205-1049"
BASEDIR="$(dirname $(readlink -f $0))"
OUTDIR="${BASEDIR}/output"
PARAMS="--attribute revdate=${CURDATE}"

# Prepare
mkdir -p ${OUTDIR}
rm -rf ${OUTDIR}/*

echo "========================================================================="

# Versions
echo "Show asciidoctor modules versions ..."
docker run --rm -v ${BASEDIR}:/documents/ ${DOCKERIMG} asciidoctor --version
docker run --rm -v ${BASEDIR}:/documents/ ${DOCKERIMG} asciidoctor-pdf --version
docker run --rm -v ${BASEDIR}:/documents/ ${DOCKERIMG} asciidoctor-epub3 --version

echo "========================================================================="

for curbook in "SystemRescue-Getting-started"
do
    echo "Building files ..."
    echo "-------------------------------------------------------------------------"
    set -x
    docker run --rm -v ${BASEDIR}:/documents/ ${DOCKERIMG} asciidoctor-pdf --out-file - ${PARAMS} -a media=prepress -a pdf-theme=themes/pdf-theme.yml ${curbook}/book.asc | gs -dBATCH -dNOPAUSE -sDEVICE=pdfwrite -dPDF -dPDFSETTINGS=/prepress -sOutputFile=${OUTDIR}/${curbook}-${CURDATE}.pdf -
    set +x
    echo "-------------------------------------------------------------------------"
    set -x
    docker run --rm -v ${BASEDIR}:/documents/ ${DOCKERIMG} asciidoctor-epub3 -a toclevels=0 -D output --out-file ${curbook}-${CURDATE}.epub ${PARAMS} ${curbook}/book.asc
    set +x
    echo "-------------------------------------------------------------------------"
done

echo "========================================================================="

# Results
echo "Showing resulting files ..."
ls -lh ${OUTDIR}
