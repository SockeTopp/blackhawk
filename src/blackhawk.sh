#!/bin/bash

#Description
# ...

# FUNCTIONS

validate_args(){
    local URL=$1
    local KEYWORD=$2
    local REGEX='(https?|ftp|file)://[-A-Za-z0-9\+&@#/%?=~_|!:,.;]*[-A-Za-z0-9\+&@#/%=~_|]'

    if [ -z "$URL" ] && [ -z "$KEYWORD" ]; then
        printf "Url and keyword is missing.\nPlease invoke URL as first argument and keyword as second argument to search."
        return 1
    fi
    if [ -z "$KEYWORD" ]; then
        printf "Keyword is missing as second argument.\n"
        return 1
    fi
    if [[ ! $URL =~ $REGEX ]]; then
        printf "Link not valid\n"
        return 1
    fi
    return 0
}

validate_domain(){
    local URL=$1
    local status_code=`curl -s -o /dev/null -w "%{http_code}" \$URL`
    echo "status code" $status_code
    if (( $status_code == 301 )) || (( $status_code == 200 )); then
        return 0
    else
        printf "Failed validate \n$URL"
        return 1
    fi
}

scrape_files(){
    REGEX=$1
    KEYWORD=$2
    res=$(find . -iname "*.txt"  | wc -l)
    i=1
    for txt_file in txt_files/*.txt; do 

        # Display progress
        printf "Loading... "
        echo -n "["
        for ((j=0; j<i; j++)) ; do echo -n ' '; done
        echo -n '=>'
        for ((j=i; j<$res; j++)) ; do echo -n ' '; done
        echo -n "] $i / $res $txt_file" $'\r'
        ((i++))
        sleep 0.1

        filename=`echo "$txt_file" | sed -r $REGEX`
        text=`grep $KEYWORD $txt_file`
        if [ ! -z "$text" ]; then
            RESULT+=($filename)
        fi
    done

}

URL="$1"
KEYWORD="$2"

validate_args $URL $KEYWORD
exit_code_1=$?

validate_domain $URL
exit_code_2=$?


if (( $exit_code_1 == 0 )) && (( $exit_code_2 == 0 )); then
    echo "success"
    FILENAME_REGEX='s/.+\/(.+)\..+/\1/'
    FILENAME_PREFIX_REG='s/.*\///'

    wget -r -l 1 -A pdf $URL
 
    PDF_FILES=($(find . -iname "*.pdf" 2>/dev/null))
    mkdir txt_files
    for pdf_file in ${PDF_FILES[@]}; do 
        FILENAME=`echo "$pdf_file" | sed -r $FILENAME_REGEX`
        pdftotext $pdf_file txt_files/$FILENAME".txt"
    done

    RESULT=()
    scrape_files $FILENAME_REGEX $KEYWORD

    printf "\n"
    if [ -z "$RESULT" ]; then
        printf "\n$KEYWORD was not found in any of the pdf files on the website.\n"
    else
        printf "\n$KEYWORD was found in the following pdf files on the website:\n"
        for file in "${RESULT[@]}"; do
            echo $file
        done
    fi   

    rm -R -- */ 

fi

