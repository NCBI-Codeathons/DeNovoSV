library("tidyr")
library("dplyr")

read_bed_region <- read.table("/Users/chunhsuanlojason/Desktop/2019_ASHG_Hackathon/excluded_region/regions_centromeres_telemeres_MHC_KIR.bed.txt", header = FALSE, col.names = c("chrom", "chromStart", "chromEnd", "name"), stringsAsFactors = FALSE)
VCFfile1 <- read.table("/Users/chunhsuanlojason/Desktop/2019_ASHG_Hackathon/download_vcf/BAB963_FAM_denovo.vcf", header = FALSE, col.names = c("CHROM", "POS",	"ID",	"REF",	"ALT",	"QUAL",	"FILTER",	"INFO",	"FORMAT", "1", "2", "3"), stringsAsFactors = FALSE)

check_SNPs <- VCFfile1
for(count1 in c(1:nrow(VCFfile1))){
  #print(count1)
  #  check_SNPs$CHROM <- paste("chr" ,temp_SNPs$CHROM, sep="")
  for(count2 in c(2:nrow(read_bed_region))){
    #print(count2)
    checkrange <- read_bed_region[count2, ]
    if((check_SNPs[count1, 1] == checkrange[1, 1]) && (check_SNPs[count1, 2] > checkrange[1, 2]) && (check_SNPs[count1, 2] < checkrange[1, 3])){
      check_SNPs[count1, 7] <- "ignored"
      print(check_SNPs[count1, ])
    }
  }
}
write.table(check_SNPs, "/Users/chunhsuanlojason/Desktop/2019_ASHG_Hackathon/download_vcf/final_BAB963_FAM_denovo.vcf", col.names=FALSE, row.names=FALSE, quote=FALSE)



read_bed_region <- read.table("/Users/chunhsuanlojason/Desktop/2019_ASHG_Hackathon/excluded_region/regions_centromeres_telemeres_MHC_KIR.bed.txt", header = FALSE, col.names = c("chrom", "chromStart", "chromEnd", "name"), stringsAsFactors = FALSE)
VCFfile2 <- read.table("/Users/chunhsuanlojason/Desktop/2019_ASHG_Hackathon/download_vcf/L005_illumina_survivormin2_denovo.vcf", header = FALSE, col.names = c("CHROM", "POS",	"ID",	"REF",	"ALT",	"QUAL",	"FILTER",	"INFO",	"FORMAT", "HK2LHCCXY-5_S0_L005_bwamemmapped_full38.sort",	"HK2LHCCXY-6_S0_L006_bwamemmapped_full38.sort",	"HK2LHCCXY-7_S0_L007_bwamemmapped_full38.sort"), stringsAsFactors = FALSE)

check_SNPs <- VCFfile2
for(count1 in c(1:nrow(VCFfile2))){
  #print(count1)
  #  check_SNPs$CHROM <- paste("chr" ,temp_SNPs$CHROM, sep="")
  for(count2 in c(2:nrow(read_bed_region))){
    #print(count2)
    checkrange <- read_bed_region[count2, ]
    if((check_SNPs[count1, 1] == checkrange[1, 1]) && (check_SNPs[count1, 2] > checkrange[1, 2]) && (check_SNPs[count1, 2] < checkrange[1, 3])){
      check_SNPs[count1, 7] <- "ignored"
      print(check_SNPs[count1, ])
    }
  }
}
write.table(check_SNPs, "/Users/chunhsuanlojason/Desktop/2019_ASHG_Hackathon/download_vcf/final_L005_illumina_survivormin2_denovo.vcf", col.names=FALSE, row.names=FALSE, quote=FALSE)
