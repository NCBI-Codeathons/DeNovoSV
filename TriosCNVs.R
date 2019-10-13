##------------------------------------------------------------------------------
##' Calculate  from Trios files
##' NOTE: Index files (.bai) should be available for each BAM file
##' 
##' 
##' @param bedFiles    a vector of tab separeated bed file containing capture design probes with the following 4 columns:
##'                    - chromosme
##'                    - start
##'                    - stop
##'                    - gene name
##'                    with proband, parents
##' @param sampleNames	  vector of sample identifiers
##' @param outputDir	  output directory
##------------------------------------------------------------------------------
require(data.table)
require(DNAcopy)

TriosCNV <- function(bedFiles,sampleNames,outputDir){
  region.list <- lapply(bedFiles,fread)
  region.chr.list <- lapply(region.list,split, by="V1");rm(region.list);gc()
  for (i in 1:length(filename)) {
    region.chr.ratio <- rbindlist(lapply(region.chr.list[[i]], function(chr){
      chr$ratio=chr$V4/median(chr$V4)
      chr[,c(1:3,5)]
    }))
    write.table(region.chr.ratio,file =filename[i] ,quote = F,sep = "\t",row.names = F,col.names = F)
  }
  region.chr.ratio.list <- for (i in 1:length(filename)) {
    region.chr.ratio <- rbindlist(lapply(region.chr.list[[i]], function(chr){
      chr$ratio=chr$V4/median(chr$V4)
      chr[,c(1:3,5)]
    }))
  }
  child <- rbindlist(lapply(region.chr.list[[1]], function(chr){
    chr$ratio=chr$V4/median(chr$V4)
    chr[,c(1:3,5)]
  }))
  f <- rbindlist(lapply(region.chr.list[[2]], function(chr){
    chr$ratio=chr$V4/median(chr$V4)
    chr[,c(1:3,5)]
  }))
  m <- rbindlist(lapply(region.chr.list[[3]], function(chr){
    chr$ratio=chr$V4/median(chr$V4)
    chr[,c(1:3,5)]
  }))
  child$ratio_ref <- log2(child$ratio/((f$ratio+m$ratio)/2)+0.0001)
  region.CNA <- CNA(child$ratio_ref,child$V1,child$V2,data.type = "logratio",sampleid=filename[i])
  seg <- segment(region.CNA)
  out <- as.data.table(seg$output[,2:6])
  write.table(out[chrom%in%paste0("chr",seq(1:22)),c(1:3,5)],file =paste0(outputDir,"/",sampleNames[1],"_denovo.ratio.bed"),quote = F,sep = "\t",row.names = F,col.names = F)
}
