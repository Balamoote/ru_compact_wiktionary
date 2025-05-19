#!/bin/bash
if command -v pigz >/dev/null 2>&1; then zipper="pigz"; else zipper="gzip"; fi

 infile="ru"$(cat version)".gz"

#md5sum $infile ru_compact.wik.gz compact.sed > compact.md5; exit 1

if [[ -s $infile ]] && md5sum -c --status compact.md5 >/dev/null 2>&1; then
   printf '\e[36m%s\e[0m\n' "Файлы словаря неизменны.";
else

 zgrep -E -v '^{"word": "-' $infile | \


  jq -c 'del( .lang, .lang_code, .sounds, .translations, .etymology_text, .categories, .topics,
              .senses,
 #            .senses[].examples, .senses[].raw_glosses, .senses[].notes,
              .derived, .related,
              .coordinate_terms, .variants, .hyphenation,
 #            .coordinate_terms, .variants, .word, .pos, .senses, .tags, .forms,
              .meronyms, .hyponyms, .homonyms, .hypernyms, .synonyms, .anagrams, .antonyms, .holonyms, .metagrams )' |\

 sed -rf compact.sed | $zipper > ru_compact.wik.gz

 md5sum $infile ru_compact.wik.gz compact.sed > compact.md5
fi;


