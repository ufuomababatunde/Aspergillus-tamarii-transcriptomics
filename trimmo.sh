#!/bin/bash

cat /home_bif2/miguel.a/Asperg_rna/data_raw/sra/list.txt | parallel -j 4 \
        trimmomatic PE -threads 5 -phred33 \
        -trimlog /home_bif2/miguel.a/Asperg_rna/analysis/trimmo_output/trimlog_{}.txt \
        /home_bif2/miguel.a/Asperg_rna/data_raw/sra/{}_1.fastq \
        /home_bif2/miguel.a/Asperg_rna/data_raw/sra/{}_2.fastq \
        /home_bif2/miguel.a/Asperg_rna/analysis/trimmo_output/Paired/{}_1_P.fastq \
        /home_bif2/miguel.a/Asperg_rna/analysis/trimmo_output/unPaired/{}_1_unP.fastq \
        /home_bif2/miguel.a/Asperg_rna/analysis/trimmo_output/Paired/{}_2_P.fastq \
        /home_bif2/miguel.a/Asperg_rna/analysis/trimmo_output/unPaired/{}_2_unP.fastq \
        ILLUMINACLIP:/home_bif2/miguel.a/Asperg_rna/analysis/trimmo_output/TruSeq3-PE.fa:2:30:10 \
        LEADING:3 TRAILING:3 SLIDINGWINDOW:4:15 MINLEN:36
done
