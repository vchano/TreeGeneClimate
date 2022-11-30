## VISUALIZE COVERAGE FOR TARGETED NGS (EXOME) EXPERIMENTS
# https://gettinggeneticsdone.blogspot.com/2014/03/visualize-coverage-exome-targeted-ngs-bedtools.html


setwd("/home/uni01/UFFF/chano/TGC_WES/4.TGC.WES.COVERAGE")

# This script accept as input the output .hist files from 'bedtools coverage' after grep'd '^all' 
# The bash file for running 'bedtools coverage' was $SCRATCH/TGC_WES/0.APPS/4.tgc.wes.bedtools.coverage.sh
# List the bedtools output files
print(files <- list.files(pattern="all.txt$"))

# Create -optimally short- sample names from the filenames 


print(labs <- c(
  "CT_1610","CT_1612","CT_1616","CT_1619","CT_1621","CT_1622","CT_1624","CT_1626","CT_1630","CT_1637","CT_2718",
  "CT_2721","CT_2723","CT_2725","CT_2726","CT_2733","CT_2734","CT_2736","CT_2741","CT_3205","CT_3214","CT_3215",
  "CT_3223","CT_3225","CT_3226","CT_3227","CT_3233","CT_3234","CT_3240","CT_3241","CT_3242","CT_3243","CT_3244","CT_3245",
  "CT_3308","CT_3309","CT_3310","CT_3311","CT_3312","CT_3313","CT_3319","CT_3322","CT_3324","CT_3325","CT_3326","CT_3327",
  "CT_3328","CT_3331","CT_3338","CT_3803","CT_3804","CT_3805","CT_3808","CT_3809","CT_3810","CT_3812","CT_3815","CT_3817",
  "CT_3827","CT_3828","CT_3834","CT_3835","CT_3841","CT_3844","CT_3901","CT_3902","CT_3904","CT_3905","CT_3906","CT_3907",
  "CT_3908","CT_3911","CT_3912","CT_3913","CT_3914","CT_3915","CT_3916","CT_4001","CT_4003","CT_4012","CT_4015","CT_4020",
  "CT_4024","CT_4032","CT_4034","CT_4040","CT_4041","CT_4043","CT_4047","CT_4049","CT_4050","CT_4051","CT_4104","CT_4105",
  
  "CT_4116","CT_4119","CT_4120","CT_4121","CT_4123","CT_4127","CT_4128","CT_4129","CT_4136","CT_4137","CT_4142","CT_4144",
  "CT_4146","CT_4201","CT_4208","CT_4209","CT_4212","CT_4213","CT_4214","CT_4216","CT_4222","CT_4224","CT_4226","CT_4229",
  "CT_4230","CT_4234","CT_4238","CT_4243","CT_4301","CT_4306","CT_4308","CT_4310","CT_4311","CT_4312","CT_4315","CT_4321",
  "CT_4322","CT_4325","CT_4326","CT_4327","CT_4329","CT_4332","CT_4336","CT_4405","CT_4407","CT_4410","CT_4414","CT_4415",
  "CT_4417","CT_4418","CT_4419","CT_4422","CT_4703","CT_4704","CT_4705","CT_4707","CT_4715","CT_4716","CT_4717","CT_4724",
  "CT_4725","CT_4731","CT_4735","CT_4738","CT_4741","CT_4743","CT_4748","CT_4802","CT_4803","CT_4805","CT_4818","CT_4819",
  "CT_4822","CT_4823","CT_4824","CT_4829","CT_4832","CT_4833","CT_4834","CT_4840","CT_4843","CT_4844","CT_5002","CT_5014",
  "CT_5019","CT_5022","CT_5024","CT_5025","CT_5029","CT_5031","CT_5032","CT_5033","CT_5034","CT_5035","CT_5036","CT_5038",
  
  "CT_5041","CT_5126","CT_5127","CT_5128","CT_5129","CT_5130","CT_5131","CT_5133","CT_5142","CT_5209","CT_5216","CT_5218",
  "CT_5222","CT_5224","CT_5227","CT_5233","CT_5301","CT_5302","CT_5303","CT_5308","CT_5319","CT_5320","CT_5321","CT_5325",
  "CT_5326","CT_5331",
  
  "UT_0001","UT_0002","UT_0003","UT_0004","UT_0005","UT_0006","UT_0007","UT_0008","UT_0009","UT_0010","UT_0011","UT_0012",
  "UT_0013","UT_0014","UT_0015","UT_0016","UT_0017","UT_0018","UT_0019","UT_0020","UT_0021","UT_0022","UT_0023","UT_0024",
  "UT_0025","UT_0026","UT_0027","UT_0028","UT_0029","UT_0030","UT_0031","UT_0032","UT_0033","UT_0034","UT_0035","UT_0036",
  "UT_0037","UT_0038","UT_0039","UT_0040","UT_0041","UT_0042","UT_0043","UT_0044","UT_0045","UT_0046","UT_0047","UT_0048",
  "UT_0049","UT_0050","UT_0051","UT_0052","UT_0053","UT_0054","UT_0055","UT_0056","UT_0057","UT_0058","UT_0059","UT_0060",
  "UT_0061","UT_0062","UT_0063","UT_0064","UT_0065","UT_0066","UT_0067","UT_0068","UT_0069","UT_0070","UT_0071","UT_0072",
  "UT_0073","UT_0074","UT_0075","UT_0076","UT_0077","UT_0078","UT_0079","UT_0080","UT_0081","UT_0082","UT_0083","UT_0084",
  "UT_0085","UT_0086","UT_0087","UT_0088","UT_0089","UT_0090","UT_0091","UT_0092","UT_0093","UT_0094","UT_0095","UT_0096",
  
  "UT_0097","UT_0098","UT_0099","UT_0100","UT_0101","UT_0102","UT_0103","UT_0104","UT_0105","UT_0106","UT_0107","UT_0108",
  "UT_0109","UT_0110","UT_0111","UT_0112","UT_0113","UT_0114","UT_0115","UT_0116","UT_0117","UT_0118","UT_0119","UT_0120",
  "UT_0121","UT_0122","UT_0123","UT_0124","UT_0125","UT_0126","UT_0127","UT_0128","UT_0129","UT_0130","UT_0131","UT_0132",
  "UT_0133","UT_0134","UT_0135","UT_0136","UT_0137","UT_0138","UT_0139","UT_0140","UT_0141","UT_0142","UT_0143","UT_0144",
  "UT_0145","UT_0146","UT_0147","UT_0148","UT_0149","UT_0150","UT_0151","UT_0152","UT_0153","UT_0154","UT_0155","UT_0156",
  "UT_0157","UT_0158","UT_0159","UT_0160","UT_0161","UT_0162","UT_0163","UT_0164","UT_0165","UT_0166","UT_0167","UT_0168",
  "UT_0169","UT_0170","UT_0171","UT_0172","UT_0173","UT_0174","UT_0175","UT_0176","UT_0177","UT_0178","UT_0179","UT_0180",
  "UT_0181","UT_0182","UT_0183","UT_0184","UT_0185","UT_0186","UT_0187","UT_0188","UT_0189","UT_0190","UT_0191","UT_0192",
  
  "UT_0193","UT_0194","UT_0195","UT_0196","UT_0197","UT_0198","UT_0199","UT_0200","UT_0201","UT_0202","UT_0203","UT_0204",
  "UT_0205","UT_0206","UT_0207","UT_0208","UT_0209","UT_0210","UT_0211","UT_0212","UT_0213","UT_0214","UT_0215","UT_0216",
  "UT_0217","UT_0218","UT_0219","UT_0220","UT_0221","UT_0222","UT_0223","UT_0224","UT_0225","UT_0226","UT_0227","UT_0228",
  "UT_0229","UT_0230","UT_0231","UT_0232","UT_0233","UT_0234","UT_0235","UT_0236","UT_0237","UT_0238","UT_0239","UT_0240",
  "UT_0241","UT_0242","UT_0243","UT_0244","UT_0245","UT_0246","UT_0247","UT_0248","UT_0249","UT_0250","UT_0251","UT_0252",
  "UT_0253","UT_0254","UT_0255","UT_0256","UT_0257","UT_0258","UT_0259","UT_0260","UT_0261","UT_0262","UT_0263","UT_0264",
  "UT_0265","UT_0266","UT_0267","UT_0268","UT_0269","UT_0270","UT_0271","UT_0272","UT_0273","UT_0274","UT_0275","UT_0276",
  "UT_0277","UT_0278","UT_0279","UT_0280","UT_0281","UT_0282","UT_0283","UT_0284","UT_0285","UT_0286","UT_0287","UT_0288",
  
  "UT_0289","UT_0290","UT_0291","UT_0292","UT_0293","UT_0294","UT_0296","UT_0297","UT_0298","UT_0299","UT_0300",
  "UT_0301","UT_0302","UT_0303","UT_0304","UT_0305","UT_0306","UT_0307","UT_0308","UT_0309","UT_0310","UT_0311","UT_0312",
  "UT_0313","UT_0314","UT_0315","UT_0316","UT_0317","UT_0318","UT_0319","UT_0320","UT_0321","UT_0322","UT_0323","UT_0324",
  "UT_0325","UT_0326","UT_0327","UT_0328","UT_0329","UT_0330","UT_0333","UT_0334","UT_0335","UT_0336",
  "UT_0337","UT_0338","UT_0339","UT_0340","UT_0341","UT_0342","UT_0343","UT_0344","UT_0345","UT_0346","UT_0347","UT_0348",
  "UT_0349","UT_0350","UT_0351","UT_0352","UT_0353","UT_0354","UT_0355","UT_0356","UT_0357","UT_0358","UT_0359","UT_0360",
  "UT_0361","UT_0362","UT_0363","UT_0364","UT_0365","UT_0366","UT_0367","UT_0368","UT_0369","UT_0370","UT_0371","UT_0372",
  "UT_0373","UT_0374","UT_0375","UT_0376","UT_0377","UT_0378","UT_0379","UT_0380","UT_0381","UT_0382","UT_0383","UT_0384",
  
  "UT_0385","UT_0386","UT_0387","UT_0388","UT_0389","UT_0390","UT_0391","UT_0392","UT_0393","UT_0394","UT_0395","UT_0396",
  "UT_0397","UT_0398","UT_0399","UT_0400","UT_0401","UT_0402"))


# Create lists to hold coverage and cumulative coverage for each alignment, and read the data into these lists.
cov <- list()
cov_cumul <- list()
for (i in 1:length(files)) {
  cov[[i]] <- read.table(files[i])
  cov_cumul[[i]] <- 1-cumsum(cov[[i]][,5])
}

# Pick some colors
# Ugly:
cols <- 1:length(cov)
# Prettier:
# ?colorRampPalette
# display.brewer.all()
library(RColorBrewer)
cols <- brewer.pal(length(cov),"Dark2")

# Save the graph to a file
#png("exome-coverage-plots.png", h=1000, w=1000, pointsize=20)

# Create plot area, but do not plot anything. Add gridlines and axis labels.
plot(cov[[1]][2:401, 2], cov_cumul[[1]][1:400], 
     type='n', xlab="Depth", ylab="Fraction of capture target bases \u2265 depth", 
     ylim=c(0,1.0), xlim=c(0,100), main="Target Region Coverage")



abline(v = 20, col = "gray60")
abline(v = 50, col = "gray60")
abline(v = 80, col = "gray60")
abline(v = 100, col = "gray60")
abline(h = 0.10, col = "gray60")
abline(h = 0.50, col = "gray60")
abline(h = 0.90, col = "gray60")
axis(1, at=c(20,50,80), labels=c(20,50,80))
axis(2, at=c(0.90), labels=c(0.90))
axis(2, at=c(0.50), labels=c(0.50))
axis(2, at=c(0.10), labels=c(0.10))

# Actually plot the data for each of the alignments (stored in the lists).
for (i in 1:length(cov)) points(cov[[i]][2:401, 2], cov_cumul[[i]][1:400], type='l', lwd=1, col=cols[i])

# Add a legend using the nice sample labeles rather than the full filenames.
legend("topright", legend=labs, col=cols, lty=1, lwd=4)

#dev.off()





