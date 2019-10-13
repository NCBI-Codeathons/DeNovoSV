# DeNovoSV


## Workflow

This is a pipeline designed to help identify and validate de novo structural variants (SVs) in genomics datasets from trios (i.e. samples from biological father, mother, and child = proband). Based on SVs called from Oxford Nanopore long-read sequences and Illumina whole genome sequencing (WGS) short-reads, high confidence de novo SVs are called by comparison with other datasets such as comparative genome hybridization arrays. This pipeline includes custom scripts to filter the variant call file (VCFs) generated from SV callers such as Sniffles, and includes identification of de novo copy number variants (CNVs) found using mosdepth. 

![Schematic](Denovo_Pipeline.png)
