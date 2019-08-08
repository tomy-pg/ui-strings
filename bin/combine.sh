#!/bin/bash

# there are two separate locales types - 1 that will need a caps version 2 - just needs to use the associated msgid 

LOCALES_WITH_UPPERCASE=(fr tl)
LOCALES_WITHOUT_UPPERCASE=(ar ko pa zh_CN zh_TW)
explore_pot_file='./explore/explore.pot'
explore_path='./explore'

combine_with_uppercase() {
    echo 
    for locale in "${LOCALES_WITH_UPPERCASE[@]}"
    do 
        echo "lots of stuff"
        create_explore_copy $locale
        remove_original_explore $locale
        rename_explore_copy $locale
    done    
}

create_explore_copy() {
    locale=$1
    echo
    msgcat $explore_pot_file $explore_path/$locale/explore.po -o $explore_path/$locale/explore-copy.po
}

remove_original_explore() {
    locale=$1
    echo
    rm -rf $explore_path/$locale/explore.po
}

rename_explore_copy() {
    locale=$1
    echo
    mv $explore_path/$locale/explore-copy.po $explore_path/$locale/explore.po 
}

help() {
    echo "$0 ----combine-with-uppercase            to do "
    echo "$0 --combine-no-uppercase          Nsgbto minimize diffs"
}


if [ "$1" == "--combine-with-uppercase" ]; then
    combine_with_uppercase
elif [ "$1" == "--combine-no-uppercase" ]; then
    help

else 
    help

fi