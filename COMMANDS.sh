
zcat BAB9637_ngmlr_0.2.7_sniffles_1.0.8_permissive.sorted.vcf.gz > BAB9637_raw.vcf;
zcat BAB9638_ngmlr_0.2.7_sniffles_1.0.8_permissive.sorted.vcf.gz > BAB9638_raw.vcf;
zcat BAB9639_ngmlr_0.2.7_sniffles_1.0.8_permissive.sorted.vcf.gz > BAB9639_raw.vcf;

SURVIVOR stats BAB9637_raw.vcf -1 -1 -1 BAB9637_raw.stats;
SURVIVOR stats BAB9638_raw.vcf -1 -1 -1 BAB9638_raw.stats;
SURVIVOR stats BAB9639_raw.vcf -1 -1 -1 BAB9639_raw.stats;

grep "#" BAB9637_raw.vcf > BAB9637.nanopore.vcf;
grep "#" BAB9638_raw.vcf > BAB9638.nanopore.vcf;
grep "#" BAB9639_raw.vcf > BAB9639.nanopore.vcf;

grep -v -E "0/0|GL|KI" BAB9637_raw.vcf >> BAB9637.nanopore.vcf; 
bcftools view -i 'INFO/RE[0] > 5' BAB9637.nanopore.vcf > BAB9637.nanopore.filtered.vcf;
SURVIVOR stats BAB9637.nanopore.filtered.vcf -1 -1 -1 BAB9637.stats;

grep -v -E "0/0|GL|KI" BAB9638_raw.vcf >> BAB9638.nanopore.vcf; 
bcftools view -i 'INFO/RE[0] > 5' BAB9638.nanopore.vcf > BAB9638.nanopore.filtered.vcf;
SURVIVOR stats BAB9638.nanopore.filtered.vcf -1 -1 -1 BAB9638.stats;

grep -v -E "0/0|GL|KI" BAB9639_raw.vcf >> BAB9639.nanopore.vcf; 
bcftools view -i 'INFO/RE[0] > 5' BAB9639.nanopore.vcf > BAB9639.nanopore.filtered.vcf;
SURVIVOR stats BAB9639.nanopore.filtered.vcf -1 -1 -1 BAB9639.stats;

ls *.nanopore.filtered.vcf > nanopore.list;

SURVIVOR merge nanopore.list 1000 1 1 1 1 30 BAB963_FAM.vcf;
SURVIVOR stats BAB963_FAM.vcf -1 -1 -1 BAB963_FAM.stats;
grep "SUPP_VEC=100" BAB963_FAM.vcf > BAB963_FAM_denovo.vcf;
SURVIVOR stats BAB963_FAM_denovo.vcf -1 -1 -1 BAB963_FAM.denovo.stats;