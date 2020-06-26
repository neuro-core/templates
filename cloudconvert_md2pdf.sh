#!/usr/bin/env bash

# you need to install https://github.com/cloudconvert/cloudconvert-cli

alias bmd2pdf='cloudconvert_md_to_pdf'

cloudconvert_md_to_pdf (){
    export CLOUDCONVERT_API_KEY=TOKEN_HERE

    filename=${1%.*}

    cloudconvert convert -f docx ${filename}.md
    cloudconvert convert -f pdf ${filename}.docx

    gio trash ${filename}.docx
}
