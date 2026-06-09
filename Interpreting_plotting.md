## interpreting the output of control freec
Sarek, configured as in our [params file] outputs various QC data, and pipeline info but, in the absence of a QC fail, we are primarily interested in variant_calling/controlfreec. 

Within this directory, sarek has generated subdirectories, named by sample number for each row of your sample_sheet.csv. 

For a quick overview of genome-wide CNVs, you can look at the ratio.png file which gives a dot plot per autosome, showing distance on the x axis and inferred copy number on the y axis. Each dot, represents a genomic bin (typically 50-200kb in length depending on the coverage of your sequencing). Points in red are copy number gains, points in blue are copy number losses (relative to a diploid sample). NB there will be gaps in coverage here, corresponding to repetitive or unmapped regions in your reference genome.

Information on genomic loci of CNVs can be found in the the CNVs file. Where columns are: Chromosome, start, end, clonal copy number. You can cross reference these loci with any genes you might be interested in, usin e.g.  a genome browser, but be sure to use the same reference genome for gene annotations (e.g. here we have used hg38/GRCh38). 

Control-FREEC also gives a fairly accurate estimation of subclonal CNV populations. The ratio.txt file contains "Subclone_CN" and "Subclone_Population" columns corresponding to inferred copy number and calculated fraction of a subclone within your population of cells, respectively. NB if >50% of cells in your population have a CNV, your WT becomes your subclone. 

For a beuatified, customizable plot see my R script.



Comprehensive details of the output of controlfreec can be found on the software's [manual page](https://boevalab.inf.ethz.ch/FREEC/tutorial.html)


