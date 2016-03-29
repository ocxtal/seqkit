#!/bin/sh

echo Test: Rmdup

echo warm-up
for f in dataset_{A,B}_dup.fasta; do echo data: $f; cat $f > /dev/null; done


echo == fakit
for f in dataset_{A,B}_dup.fasta; do echo data: $f; time fakit rmdup -s -m $f > $f.rmdup.fakit.fa; done

echo == seqmagick
for f in dataset_{A,B}_dup.fasta; do echo data: $f; time seqmagick convert --deduplicate-sequences $f - > $f.rmdup.seqmagick.fa; done



echo Result summary
fakit stat dataset_{A,B}_dup.fasta.rmdup.*.fa

rm dataset_{A,B}_dup.fasta.rmdup.*.fa
