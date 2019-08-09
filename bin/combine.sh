#!/bin/bash

# there are two separate locales types - 1 that will need a caps version 2 - just needs to use the associated msgid 

LOCALES_WITH_UPPERCASE=(fr tl)
LOCALES_WITHOUT_UPPERCASE=(ar ko pa zh_CN zh_TW)
explore_pot_file='./explore/explore.pot'
explore_path='./explore'

combine_with_uppercase() {
    echo 
    for locale in "${LOCALES_WITHOUT_UPPERCASE[@]}"
    do 
        echo "combing uppercase msgid and msgstr with origin explore po files"
        append_to_explore_copy $locale
        remove_explore_copy $locale
    done    
}

append_to_explore_copy() {
    locale=$1
    echo
    cat $explore_path/$locale/explore-copy.po >> $explore_path/$locale/explore.po
}

remove_explore_copy() {
    locale=$1
    echo
    rm -rf $explore_path/$locale/explore-copy.po
}

help() {
    echo "$0 ----combine-explore-files   this will combine explore-copy with explore"
}


if [ "$1" == "--combine-explore-files" ]; then
    combine_with_uppercase
else 
    help

fi