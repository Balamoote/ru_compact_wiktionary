#!/bin/bash

 infile="ru1022.gz"
#infile="test.txt.gz"

 zgrep -E -v '^{"word": "-' $infile | \


  jq -c 'del( .lang, .lang_code, .sounds, .translations, .etymology_text, .categories, .topics,
              .senses,
 #            .senses[].examples, .senses[].raw_glosses, .senses[].notes,
              .derived, .related,
              .coordinate_terms, .variants,
 #            .coordinate_terms, .variants, .word, .pos, .senses, .tags, .forms,
              .meronyms, .hyponyms, .homonyms, .hypernyms, .synonyms, .anagrams, .antonyms, .holonyms, .metagrams )' |\

 sed -rf compact.sed | gzip > ru_compact.wik.gz
#sed -rf compact.sed | sort -u > ru_compact.wik


