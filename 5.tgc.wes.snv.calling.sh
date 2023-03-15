#!/bin/bash
#-------------------------------------------------------------------------------

##################################################################
#                                                                #
#                     Script for SNV Calling                     #
#                                                                #
##################################################################

#-------------------------------------------------------------------------------
#
#    Forest Genetics and Forest Tree Breeding
#    Büsgenweg 2
#    Georg-August-Universtät Göttingen
#    https://github.com/vchano/
#
# Licence: GNU General Public Licence Version 3
#-------------------------------------------------------------------------------

#SBATCH -p medium
#SBATCH -A all
#SBATCH -n 6
#SBATCH -N 1
#SBATC --ntasks-per-socket 24
#SBATC --exclusive
#SBATC --qos long
#SBATCH --time=48:00:00
#SBATCH --begin=2022-11-27T11:00:00
#SBATCH --job-name=WES.CALL
#SBATCH --output=CALL_%J_out.txt
#SBATCH --error=CALL_%J_err.txt
#SBATCH --mail-type=BEGIN
#SBATCH --mail-type=END
#SBATCH --mail-user=vmchano.gaug@gmail.com
#SBATC -a 0-79%79

# load modules
module purge
module load bcftools/1.9
module load samtools/1.9
module load freebayes/1.2.0
module load anaconda3/2020.11
source activate vcftools

# Set PATHS to working directories
REF=$SCRATCH/PAB_GENOME/Pabies1.0-genome.fa
INPUT=$SCRATCH/TGC_WES/3.MAPPING.BOWTIE2
VCF_DIR=$SCRATCH/TGC_WES/5.SNV.CALLING

#BAM_LIST=$SCRATCH/TGC_ECSEQ/CALLING/bam.list # This is useful if we don't use regular expression
#WINDOWS=$SCRATCH/TGC_ECSEQ/CALLING/genome_windows.list # This is from D. Lazic script, to split chromosomes while working with whole genome sequencing

# This is extracted from Physalia course "Speciation & Popullation Genomics: a how-to-guide", by Mark Ravinet and Joana Meier
# url: https://speciationgenomics.github.io/
# Before, I was using a tutorial from The University of Texas at Austin. Both are basically the same, using bcftools, but maybe with different parameters

# First, we index the reference genome using Faidx. As this is already done, I comment these lines
# This creates a fasta index with .fai extension. Columns are chromosome name, chr length, offset of first base, fasta line lenght, fasta line length +1
#samtools faidx $REF/Pabies1.0-genome.fa
#head Pabies1.0-genome.fa.fai  

# Running BCFTOOLS for SNV CALLING 

# 1. We use samtools mpileup to pileup the BAM files, taking all reads at a given position and call variants from these reads, and from all samples 
# 2. We use bcftools call, which actually call the variants, with the output from 1. We use here a pipe with | 
# About parameters:
# For mpileup: -a annotate the vcf with allelic depth (AD), genotype depth (DP) and strand bias (SP), -O the output type, with u meaning no compression, and -f for the reference genome
# For call: -f for formating fields for the vcf file with genotype quality (GQ) and genotype probability (GP), -v for variant sites only, -m for multiallelic caller, -O for output type with z for gzipped vcf, and -o for output path
# I have changed a bit the code because seems it was calling all sites and not only variants, which is done with -v. So instead of '-mO z' I used '-mv -O z'

# Running bcftools mpileup and call
bcftools mpileup -a AD,DP,SP -Ou -f $REF \
$INPUT/*.psrt.dedup.bam | bcftools call -f GQ,GP \
-mv -O z -o $VCF_DIR/tgc.wes.call.unfilt.snvs.vcf.gz

# We uncompress the vcf.gz file and calculate with grep the number of variants in the unfiltered vcf file
gunzip -c $VCF_DIR/tgc.wes.call.unfilt.snvs.vcf.gz > $VCF_DIR/tgc.wes.call.unfilt.snvs.vcf
echo "Unfiltered SNVs"
grep -v '#' $VCF_DIR/tgc.wes.call.unfilt.snvs.vcf | wc -l # Counts the number of SNPs avoiding rows starting with #

# Now we use vcftools for filtering the vcf file with no indels, min coverage 10, MAF 0.05, biallelic, and max 50% of missing values
# We will do this first step by step, to know how many SNVs reduces each parameter

# Filter by NO INDELS
vcftools --vcf $VCF_DIR/tgc.wes.call.unfilt.snvs.vcf --recode --remove-indels --out $VCF_DIR/tgc.wes.call.filt.snvs.noindels 
echo "After filtering indels"
grep -v '#' $VCF_DIR/tgc.wes.call.filt.snvs.noindels.recode.vcf | wc -l # Counting SNPs from filtered vcf file

# Filter by BIALLELIC
vcftools --vcf $VCF_DIR/tgc.wes.call.filt.snvs.noindels.recode.vcf --recode --min-alleles 2 --max-alleles 2 --out $VCF_DIR/tgc.wes.call.filt.snvs.noindels.biallelic 
echo "Biallelic SNPs"
grep -v '#' $VCF_DIR/tgc.wes.call.filt.snvs.noindels.biallelic.recode.vcf | wc -l # Counting SNPs from filtered vcf file

# Filter by MISSING DATA 0.75 
vcftools --vcf $VCF_DIR/tgc.wes.call.filt.snvs.noindels.biallelic.recode.vcf --recode --max-missing 0.75 --out $VCF_DIR/tgc.wes.call.filt.snvs.noindels.biallelic.mis75
echo "Filtering 75% missing data out"
grep -v '#' $VCF_DIR/tgc.wes.call.filt.snvs.noindels.biallelic.mis75.recode.vcf | wc -l # Counting SNPs from filtered vcf file

# Filter by COVERAGE
vcftools --vcf $VCF_DIR/tgc.wes.call.filt.snvs.noindels.biallelic.mis75.recode.vcf  --recode --minDP 10 --out $VCF_DIR/tgc.wes.call.filt.snvs.noindels.biallelic.mis75.mdp10 
echo "Minimum coverage 10"
grep -v '#' $VCF_DIR/tgc.wes.call.filt.snvs.noindels.biallelic.mis75.mdp10.recode.vcf | wc -l # Counting SNPs from filtered vcf file

# Filter by MAF 0.05
vcftools --vcf $VCF_DIR/tgc.wes.call.filt.snvs.noindels.biallelic.mis75.mdp10.recode.vcf --recode --maf 0.05 --out $VCF_DIR/tgc.wes.call.filt.snvs.noindels.biallelic.mis75.mdp10.maf05 
echo "MAF < 0.05"
grep -v '#' $VCF_DIR/tgc.wes.call.filt.snvs.noindels.biallelic.mis75.mdp10.maf05.recode.vcf | wc -l # Counting SNPs from filtered vcf file

egrep -v "^##contig" $VCF_DIR/tgc.wes.call.filt.snvs.noindels.biallelic.mis75.mdp10.maf05.recode.vcf > $VCF_DIR/tgc.wes.call.filtered.snvs.vcf # Reducing file size by removing rows with ##contig from header

# Finally, we will do some statistics with the final vcf file and also the original unfiltered one
# But we will need both vcf files compressed as vcf.gz and indexing. The unfiltered we already have it, so we compress the filtered 
bgzip $VCF_DIR/tgc.wes.call.filtered.snvs.vcf 
bgzip $VCF_DIR/tgc.wes.call.filt.snvs.noindels.biallelic.mis75.mdp10.maf05.recode.vcf
bcftools index $VCF_DIR/tgc.wes.call.filtered.snvs.vcf.gz
bcftools index $VCF_DIR/tgc.wes.call.filt.snvs.noindels.biallelic.mis75.mdp10.maf05.recode.vcf.gz
bcftools index $VCF_DIR/tgc.wes.call.unfilt.snvs.vcf.gz

# First, we set some new variables with new directory and filtered and unfiltered vcf files
FILT_VCF=$VCF_DIR/tgc.wes.call.filt.snvs.noindels.biallelic.mis75.mdp10.maf05.recode.vcf.gz
FILT_STATS=$VCF_DIR/STATS/tgc.wes.stats.filtered.snvs
UNFILT_VCF=$VCF_DIR/tgc.wes.call.unfilt.snvs.vcf.gz
UNFILT_STATS=$VCF_DIR/STATS/tgc.wes.stats.unfiltered.snvs

# We run now the stats for the filtered one (which is smaller)
## We calculate allele frequency for each variant with --freq2 and excluding sites with more than two alleles with --max-alleles 2
vcftools --gzvcf $FILT_VCF --freq2 --out $FILT_STATS --max-alleles 2
## Now we calculate the mean depth of coverage per individual 
vcftools --gzvcf $FILT_VCF --depth --out $FILT_STATS
## The mean depth per site
vcftools --gzvcf $FILT_VCF --site-mean-depth --out $FILT_STATS
## The quality score per site
vcftools --gzvcf $FILT_VCF --site-quality --out $FILT_STATS
## The proportion of missing data per sample
vcftools --gzvcf $FILT_VCF --missing-indv --out $FILT_STATS
## The proportion of missing data per site
vcftools --gzvcf $FILT_VCF --missing-site --out $FILT_STATS
## And the heterozygosity and inbreeding values per sample
vcftools --gzvcf $FILT_VCF --het --out $FILT_STATS

# And now for the unfiltered vcf file

## We calculate allele frequency for each variant with --freq2 and excluding sites with more than two alleles with --max-alleles 2
vcftools --gzvcf $UNFILT_VCF --freq2 --out $UNFILT_STATS --max-alleles 2
## Now we calculate the mean depth of coverage per individual 
vcftools --gzvcf $UNFILT_VCF --depth --out $UNFILT_STATS
## The mean depth per site
vcftools --gzvcf $UNFILT_VCF --site-mean-depth --out $UNFILT_STATS
## The quality score per site
vcftools --gzvcf $UNFILT_VCF --site-quality --out $UNFILT_STATS
## The proportion of missing data per sample
vcftools --gzvcf $UNFILT_VCF --missing-indv --out $UNFILT_STATS
## The proportion of missing data per site
vcftools --gzvcf $UNFILT_VCF --missing-site --out $UNFILT_STATS
## And the heterozygosity and inbreeding values per sample
vcftools --gzvcf $UNFILT_VCF --het --out $UNFILT_STATS

conda deactivate

cp $FILT_STATS/ $HOME/TGC_WES/5.ECO.WES.SNV.CALLING/TGC.WES.STATS
#-------------------------------------------------------------------------------

# End
echo '**************************************************'
exit 0

#-------------------------------------------------------------------------------
# Excute this script as sbatch $SCRATCH/TGC_WES/0.APPS/5.tgc.wes.snv.calling.sh
#-------------------------------------------------------------------------------
