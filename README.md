# DeNovoSV


## Workflow

This is a pipeline designed to help identify and validate de novo structural variants (SVs) from genomics datasets studying trios , including Oxford Nanopore long-read sequences and Illumina whole genome sequencing (WGS) short-reads, and compare the high confidence de novo SVs against those identified with other methods such as comparative genome hybridization arrays. This pipeline includes custom scripts to filter the variant call file (VCFs) generated from SV callers such as Sniffles, and includes identification of de novo copy number variants (CNVs) found using mosdepth. 

