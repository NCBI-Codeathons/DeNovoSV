# Rank_SV


## Draft workflow

Structural variant VCF files from programs like sniffles produce many thousands of SV calls that need filtering and prioritizing. We will have a pipeline that does this based on these steps


1) comparison of a trio of nanopore SV to find de-novo SV in the proband,
1) filter out population SV to find clinically relevant SV
1) compare with callset from proband pacbio SV
1) validate against a small set of known CNV called with array
1) add mosdepth to get read depth on nanopore to classify SV


![](img/slide_project_draft.png)


