# DeNovoSV


## Workflow

DeNovoSV is a pipeline designed to help identify and validate de novo structural variants (SVs) in genomics datasets from trios (i.e. samples from biological father, mother, and child = proband). Based on SVs called from Oxford Nanopore long-read sequences and Illumina whole genome sequencing (WGS) short-reads, high confidence de novo SVs are called by comparison with other datasets such as comparative genome hybridization arrays. This pipeline includes custom scripts to filter the variant call file (VCFs) generated from SV callers such as Sniffles, and includes identification of de novo copy number variants (CNVs) found using mosdepth. 

![Schematic](Denovo_Pipeline.png)

## Abstract

The goal of DeNovoSV is to identify and validate structural variants that arose de novo in the postzygotic development of a child with a developmental disorder. Available data from the child and parents (forming a trio) include CGH array data, PacBio Sequel II long read sequences, Nanopore long read sequences and Illumina whole genome sequencing data available from the affected trio. At the start of this hackathon, we lacked an integrated bioinformatics pipeline to identify and prioritize de novo structural variants, so that such genomics datasets could be combined, compared and validated. 

## Inputs

## Outputs

## Authors

