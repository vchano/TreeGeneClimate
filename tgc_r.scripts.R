# This code has been generated for the analysis and plotting for the project TGC - TreeGeneClimate, 
# which focuses on the exome-capture and target-bisulfite sequencing (EC-Seq and TB-Seq) of 620 Norway spruce samples.

###################################################################################################
### CODE CHUNK 1: CUMULATIVE DISTRIBUTION OF COVERAGE DEPTH OF CAPTURED TARGET BASES: 1A AND 1B ###
###################################################################################################

# This script will generate a figure for the cumulative distribution of coverage for the captured bases by both EC-Seq and TB-Seq
# Input files are the *.hist files from 'bedtools coverage' (see bash script) after doing grep'd '^all'  
# The bash file for running 'bedtools coverage' can be found at TreeGeneClimate/bash/tgc.bedtools.coverage.sh
# A tutorial can be found at https://gettinggeneticsdone.blogspot.com/2014/03/visualize-coverage-exome-targeted-ngs-bedtools.html

# FIGURE 1. CUMULATIVE DISTRIBUTION OF COVERAGE DEPTH OF CAPTURED TARGET BASES
# 1A) EC-Seq IN 615 NORWAY SPRUCE TREES

# Set the directory where the input files are, list the hist files, and label files with sample names
setwd("/home/uni01/UFFF/chano/TGC_WES/4.TGC.WES.COVERAGE/ALL")
print(files.ecs <- list.files(pattern="all.txt$"))
print(labs.ecs <- c( # blocks represent the plates from sequencing, and missing wells are failed samples
  "CT_1610","CT_1612","CT_1616","CT_1619","CT_1621","CT_1622","CT_1624","CT_1626","CT_1630","CT_1637","CT_2718", # sample P001_WA01 failed"
  "CT_2721","CT_2723","CT_2725","CT_2726","CT_2733","CT_2734","CT_2736","CT_2741","CT_3205","CT_3214","CT_3215", # sample P001_WB01 failed"
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
  
  "UT_001","UT_002","UT_003","UT_004","UT_005","UT_006","UT_007","UT_008","UT_009","UT_010","UT_011","UT_012",
  "UT_013","UT_014","UT_015","UT_016","UT_017","UT_018","UT_019","UT_020","UT_021","UT_022","UT_023","UT_024",
  "UT_025","UT_026","UT_027","UT_028","UT_029","UT_030","UT_031","UT_032","UT_033","UT_034","UT_035","UT_036",
  "UT_037","UT_038","UT_039","UT_040","UT_041","UT_042","UT_043","UT_044","UT_045","UT_046","UT_047","UT_048",
  "UT_049","UT_050","UT_051","UT_052","UT_053","UT_054","UT_055","UT_056","UT_057","UT_058","UT_059","UT_060",
  "UT_061","UT_062","UT_063","UT_064","UT_065","UT_066","UT_067","UT_068","UT_069","UT_070","UT_071","UT_072",
  "UT_073","UT_074","UT_075","UT_076","UT_077","UT_078","UT_079","UT_080","UT_081","UT_082","UT_083","UT_084",
  "UT_085","UT_086","UT_087","UT_088","UT_089","UT_090","UT_091","UT_092","UT_093","UT_094","UT_095","UT_096",
  
  "UT_097","UT_098","UT_099","UT_100","UT_101","UT_102","UT_103","UT_104","UT_105","UT_106","UT_107","UT_108",
  "UT_109","UT_110","UT_111","UT_112","UT_113","UT_114","UT_115","UT_116","UT_117","UT_118","UT_119","UT_120",
  "UT_121","UT_122","UT_123","UT_124","UT_125","UT_126","UT_127","UT_128","UT_129","UT_130","UT_131","UT_132",
  "UT_133","UT_134","UT_135","UT_136","UT_137","UT_138","UT_139","UT_140","UT_141","UT_142","UT_143","UT_144",
  "UT_145","UT_146","UT_147","UT_148","UT_149","UT_150","UT_151","UT_152","UT_153","UT_154","UT_155","UT_156",
  "UT_157","UT_158","UT_159","UT_160","UT_161","UT_162","UT_163","UT_164","UT_165","UT_166","UT_167","UT_168",
  "UT_169","UT_170","UT_171","UT_172","UT_173","UT_174","UT_175","UT_176","UT_177","UT_178","UT_179","UT_180",
  "UT_181","UT_182","UT_183","UT_184","UT_185","UT_186","UT_187","UT_188","UT_189","UT_190","UT_191","UT_192",
  
  "UT_193","UT_194","UT_195","UT_196","UT_197","UT_198","UT_199","UT_200","UT_201","UT_202","UT_203","UT_204",
  "UT_205","UT_206","UT_207","UT_208","UT_209","UT_210","UT_211","UT_212","UT_213","UT_214","UT_215","UT_216",
  "UT_217","UT_218","UT_219","UT_220","UT_221","UT_222","UT_223","UT_224","UT_225","UT_226","UT_227","UT_228",
  "UT_229","UT_230","UT_231","UT_232","UT_233","UT_234","UT_235","UT_236","UT_237","UT_238","UT_239","UT_240",
  "UT_241","UT_242","UT_243","UT_244","UT_245","UT_246","UT_247","UT_248","UT_249","UT_250","UT_251","UT_252",
  "UT_253","UT_254","UT_255","UT_256","UT_257","UT_258","UT_259","UT_260","UT_261","UT_262","UT_263","UT_264",
  "UT_265","UT_266","UT_267","UT_268","UT_269","UT_270","UT_271","UT_272","UT_273","UT_274","UT_275","UT_276",
  "UT_277","UT_278","UT_279","UT_280","UT_281","UT_282","UT_283","UT_284","UT_285","UT_286","UT_287","UT_288",
  
  "UT_289","UT_290","UT_291","UT_292","UT_293","UT_294","UT_296","UT_297","UT_298","UT_299","UT_300", # sample P007_WA07 failed
  "UT_301","UT_302","UT_303","UT_304","UT_305","UT_306","UT_307","UT_308","UT_309","UT_310","UT_311","UT_312",
  "UT_313","UT_314","UT_315","UT_316","UT_317","UT_318","UT_319","UT_320","UT_321","UT_322","UT_323","UT_324",
  "UT_325","UT_326","UT_327","UT_328","UT_329","UT_330","UT_333","UT_334","UT_335","UT_336", # samples P007_WD07 and P007_WD08 failed
  "UT_337","UT_338","UT_339","UT_340","UT_341","UT_342","UT_343","UT_344","UT_345","UT_346","UT_347","UT_348",
  "UT_349","UT_350","UT_351","UT_352","UT_353","UT_354","UT_355","UT_356","UT_357","UT_358","UT_359","UT_360",
  "UT_361","UT_362","UT_363","UT_364","UT_365","UT_366","UT_367","UT_368","UT_369","UT_370","UT_371","UT_372",
  "UT_373","UT_374","UT_375","UT_376","UT_377","UT_378","UT_379","UT_380","UT_381","UT_382","UT_383","UT_384",
  
  "UT_385","UT_386","UT_387","UT_388","UT_389","UT_390","UT_391","UT_392","UT_393","UT_394","UT_395","UT_396",
  "UT_397","UT_398","UT_399","UT_400","UT_401","UT_402"))


# Read coverage data and cumulative coverage for each alignment in lists objects.
cov.ecs <- list()
cov_cumul.ecs <- list()
for (i in 1:length(files.ecs)) {
  cov.ecs[[i]] <- read.table(files.ecs[i])
  cov_cumul.ecs[[i]] <- 1-cumsum(cov.ecs[[i]][,5])}

# Save the plot as tiff file, 8 in x 8 in, 300 dpi
tiff(file="/home/uni01/UFFF/chano/TGC_WES/MS_SCI_DATA/tgc_figure.1a.tiff",width=8,height=8,units="in",res=300)
# Create area
plot(cov.ecs[[1]][2:613, 2], cov_cumul.ecs[[1]][1:612], 
     type='n', xlab="Depth", ylab="Fraction of capture target bases \u2265 depth", 
     ylim=c(0,1.0), xlim=c(0,10),cex.axis=1.5,cex.lab=1.5)
# Create plot and add gridlines
for (i in 1:length(cov.ecs)) points(cov.ecs[[i]][2:613, 2], cov_cumul.ecs[[i]][1:612], type='l', lwd=1, col="cornflowerblue")
title("a)", adj = 0, line = 1,cex.main=2)
abline(v = 0, col = "gray60")
abline(v = 1, col = "gray60")
abline(v = 2, col = "gray60")
abline(v = 40, col = "gray60")
abline(v = 60, col = "gray60")
abline(v = 80, col = "gray60")
abline(v = 100, col = "gray60")
abline(h = 0, col = "gray60")
abline(h = 0.20, col = "gray60")
abline(h = 0.40, col = "gray60")
abline(h = 0.60, col = "gray60")
abline(h = 0.80, col = "gray60")
abline(h = 1.00, col = "gray60")
dev.off()

# 1B) TB-Seq IN 620 NORWAY SPRUCE TREES
# NOW FOR TBSEQ, set the directory where the input files are, list the hist files, and label files with sample names

setwd("/home/uni01/UFFF/chano/TGC_WES/4.TGC.WES.COVERAGE/TGC_TBS_COVERAGE")
print(files.tbs <- list.files(pattern="all.txt$"))
print(labs.tbs <- c( # no sample failed during sequencing
  "CT_1601","CT_1610","CT_1612","CT_1616","CT_1619","CT_1621","CT_1622","CT_1624","CT_1626","CT_1630","CT_1637","CT_2718",
  "CT_2719","CT_2721","CT_2723","CT_2725","CT_2726","CT_2733","CT_2734","CT_2736","CT_2741","CT_3205","CT_3214","CT_3215",
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
  "CT_5222","CT_5224",  "CT_5227","CT_5233","CT_5301","CT_5302","CT_5303","CT_5308","CT_5319","CT_5320","CT_5321","CT_5325",
  "CT_5326","CT_5331",
  
  "UT_001","UT_002","UT_003","UT_004","UT_005","UT_006","UT_007","UT_008","UT_009","UT_010","UT_011","UT_012",
  "UT_013","UT_014","UT_015","UT_016","UT_017","UT_018","UT_019","UT_020","UT_021","UT_022","UT_023","UT_024",
  "UT_025","UT_026","UT_027","UT_028","UT_029","UT_030","UT_031","UT_032","UT_033","UT_034","UT_035","UT_036",
  "UT_037","UT_038","UT_039","UT_040","UT_041","UT_042","UT_043","UT_044","UT_045","UT_046","UT_047","UT_048",
  "UT_049","UT_050","UT_051","UT_052","UT_053","UT_054","UT_055","UT_056","UT_057","UT_058","UT_059","UT_060",
  "UT_061","UT_062","UT_063","UT_064","UT_065","UT_066","UT_067","UT_068","UT_069","UT_070","UT_071","UT_072",
  "UT_073","UT_074","UT_075","UT_076","UT_077","UT_078","UT_079","UT_080","UT_081","UT_082","UT_083","UT_084",
  "UT_085","UT_086","UT_087","UT_088","UT_089","UT_090","UT_091","UT_092","UT_093","UT_094","UT_095","UT_096",
  
  "UT_097","UT_098","UT_099","UT_100","UT_101","UT_102","UT_103","UT_104","UT_105","UT_106","UT_107","UT_108",
  "UT_109","UT_110","UT_111","UT_112","UT_113","UT_114","UT_115","UT_116","UT_117","UT_118","UT_119","UT_120",
  "UT_121","UT_122","UT_123","UT_124","UT_125","UT_126","UT_127","UT_128","UT_129","UT_130","UT_131","UT_132",
  "UT_133","UT_134","UT_135","UT_136","UT_137","UT_138","UT_139","UT_140","UT_141","UT_142","UT_143","UT_144",
  "UT_145","UT_146","UT_147","UT_148","UT_149","UT_150","UT_151","UT_152","UT_153","UT_154","UT_155","UT_156",
  "UT_157","UT_158","UT_159","UT_160","UT_161","UT_162","UT_163","UT_164","UT_165","UT_166","UT_167","UT_168",
  "UT_169","UT_170","UT_171","UT_172","UT_173","UT_174","UT_175","UT_176","UT_177","UT_178","UT_179","UT_180",
  "UT_181","UT_182","UT_183","UT_184","UT_185","UT_186","UT_187","UT_188","UT_189","UT_190","UT_191","UT_192",
  
  "UT_193","UT_194","UT_195","UT_196","UT_197","UT_198","UT_199","UT_200","UT_201","UT_202","UT_203","UT_204",
  "UT_205","UT_206","UT_207","UT_208","UT_209","UT_210","UT_211","UT_212","UT_213","UT_214","UT_215","UT_216",
  "UT_217","UT_218","UT_219","UT_220","UT_221","UT_222","UT_223","UT_224","UT_225","UT_226","UT_227","UT_228",
  "UT_229","UT_230","UT_231","UT_232","UT_233","UT_234","UT_235","UT_236","UT_237","UT_238","UT_239","UT_240",
  "UT_241","UT_242","UT_243","UT_244","UT_245","UT_246","UT_247","UT_248","UT_249","UT_250","UT_251","UT_252",
  "UT_253","UT_254","UT_255","UT_256","UT_257","UT_258","UT_259","UT_260","UT_261","UT_262","UT_263","UT_264",
  "UT_265","UT_266","UT_267","UT_268","UT_269","UT_270","UT_271","UT_272","UT_273","UT_274","UT_275","UT_276",
  "UT_277","UT_278","UT_279","UT_280","UT_281","UT_282","UT_283","UT_284","UT_285","UT_286","UT_287","UT_288",
  
  "UT_289","UT_290","UT_291","UT_292","UT_293","UT_294","UT_295","UT_296","UT_297","UT_298","UT_299","UT_300",
  "UT_301","UT_302","UT_303","UT_304","UT_305","UT_306","UT_307","UT_308","UT_309","UT_310","UT_311","UT_312",
  "UT_313","UT_314","UT_315","UT_316","UT_317","UT_318","UT_319","UT_320","UT_321","UT_322","UT_323","UT_324",
  "UT_325","UT_326","UT_327","UT_328","UT_329","UT_330","UT_331","UT_332","UT_333","UT_334","UT_335","UT_336",
  "UT_337","UT_338","UT_339","UT_340","UT_341","UT_342","UT_343","UT_344","UT_345","UT_346","UT_347","UT_348",
  "UT_349","UT_350","UT_351","UT_352","UT_353","UT_354","UT_355","UT_356","UT_357","UT_358","UT_359","UT_360",
  "UT_361","UT_362","UT_363","UT_364","UT_365","UT_366","UT_367","UT_368","UT_369","UT_370","UT_371","UT_372",
  "UT_373","UT_374","UT_375","UT_376","UT_377","UT_378","UT_379","UT_380","UT_381","UT_382","UT_383","UT_384",
  
  "UT_385","UT_386","UT_387","UT_388","UT_389","UT_390","UT_391","UT_392","UT_393","UT_394","UT_395","UT_396",
  "UT_397","UT_398","UT_399","UT_400","UT_401","UT_402"))

# Read coverage data and cumulative coverage for each alignment in lists objects.
cov.tbs <- list()
cov_cumul.tbs <- list()
for (j in 1:length(files.tbs)) {
  cov.tbs[[j]] <- read.table(files.tbs[j])
  cov_cumul.tbs[[j]] <- 1-cumsum(cov.tbs[[j]][,5])
}

# Save the plot as tiff file, 8 in x 8 in, 300 dpi
tiff(file="/home/uni01/UFFF/chano/TGC_WES/MS_SCI_DATA/tgc_figure.1b.tiff",width=8,height=8,units="in",res=300)
# Create area
plot(cov.tbs[[1]][2:617, 2], cov_cumul.tbs[[1]][1:616], 
     type='n', xlab="Depth", ylab="Fraction of capture target bases \u2265 depth", 
     ylim=c(0,1.0), xlim=c(0,250),cex.lab=1.5, cex.axis=1.5)
# Create plot and add gridlines
for (j in 1:length(cov.tbs)) points(cov.tbs[[j]][2:617, 2], cov_cumul.tbs[[j]][1:616], type='l', lwd=1, col="coral")
title("b)", adj = 0, line = 1,cex.main=2)
abline(v = 0, col = "gray60")
abline(v = 50, col = "gray60")
abline(v = 100, col = "gray60")
abline(v = 150, col = "gray60")
abline(v = 200, col = "gray60")
abline(v = 250, col = "gray60")
abline(h = 0, col = "gray60")
abline(h = 0.20, col = "gray60")
abline(h = 0.40, col = "gray60")
abline(h = 0.60, col = "gray60")
abline(h = 0.80, col = "gray60")
abline(h = 1.00, col = "gray60")
dev.off()

# To extract the cumulative coverage up to 20x for all the samples and both EC-Seq and TB-Seq

ecs<-lapply(cov_cumul.ecs,head,n=20)
ecs <- as.data.frame(ecs)
ecs<-t(ecs)
write.table(ecs,file="/home/uni01/UFFF/chano/TGC_WES/MS_SCI_DATA/cov_cumul.ecs.txt",col.names=FALSE,dec=".",sep="\t")

tbs<-lapply(cov_cumul.tbs,head,n=20)
tbs <- as.data.frame(tbs)
tbs<-(t(tbs))
write.table(tbs,file="/home/uni01/UFFF/chano/TGC_WES/MS_SCI_DATA/cov_cumul.tbs.txt",col.names=FALSE,dec=".",sep="\t")

###################################################################################################
### CODE CHUNK 2: FILTERING STEPS TO GET THE FINAL SET OF HIGH-QUALITY SNPs (EC-SEQ)            ###
###################################################################################################

# This script generate six figures about SNP filtering for the supplementary material 
# Input files are the results from different filtering steps applied in all samples (breeding/clones and candidates/unrelated) after variant calling by using vcftools
# Filtering steps included keeping only biallelic sites, max missingness per site 20%, min and max depth 9 and 40, quality score > 30, and MAF < 0.01 
# The initial 91497488 variant sites was reduced to 79293 high-quality SNPs
# The bash file for running 'bedtools coverage' was $SCRATCH/TGC_WES/0.APPS/5.2.tgc.wes.all.samples.snv.filtering.sh

# The tutorial is extracted from Physalia course "Speciation & Population Genomics: a how-to-guide"
# by Mark Ravinet and Joana Meier
# url: https://speciationgenomics.github.io/

# FIGURE S1. DENSITIES OF SITE MEAN DEPTH AND MISSINGNESS, SAMPLE MEAN DEPTH AND MISSINGNESS, MAF AND HETEROZYGOSITY
# 1A-F) 
#@PORAKI
setwd("/home/uni01/UFFF/chano/TGC_WES/5.SNV.CALLING/TGC.WES.STATS") # new directory with three subfolders for ALL, CLONES and UNRELATED
library(tidyverse)
library(gridExtra)

# 1. MEAN DEPTH PER SITE 
# This is essentially the number of reads that have mapped to this position. 
# Read data
mdepth.9 <- read_delim("STATS_ALL/tgc.wes.all.stats.filtered4.snvs.ldepth.mean", delim = "\t",col_names = c("chr", "pos", "mean_depth", "var_depth"), skip = 1) # All samples filtered by min depth 9
# Ploting the distribution of quality using ggplot
p.mdepth.9 <- ggplot(mdepth.9, aes(mean_depth)) + geom_histogram(fill = "coral", colour = "black", alpha = 0.8) + theme_light() + xlim(0,50)
p.mdepth.9
summary(mdepth.9$mean_depth)

# 2. VARIANT MISSINGNESS 
# Proportion of missingness at each variant, a measure of how many individuals lack a genotype at a call site
# Read data
lmiss.9 <- read_delim("STATS_ALL/tgc.wes.all.stats.filtered4.snvs.lmiss", delim = "\t",col_names = c("chr", "pos", "nchr", "nfiltered", "nmiss", "fmiss"), skip = 1) # All samples filtered
# Ploting the distribution of quality using ggplot
p.lmiss.9 <- ggplot(lmiss.9, aes(fmiss)) + geom_histogram(fill = "coral", colour = "black", alpha = 0.8) + theme_light()
summary(lmiss.9$fmiss)

# 3. MINOR ALLELE FREQUENCY (MAF)
# Read data
freq.9 <- read_delim("STATS_ALL/tgc.wes.all.stats.filtered4.snvs.frq", delim = "\t",col_names = c("chr", "pos", "nalleles", "nchr", "a1", "a2"), skip = 1) # All samples filtered
# These are just allele frequencies, to find the MAF dplyr based code is used 
freq.9$maf <- freq.9 %>% select(a1, a2) %>% apply(1, function(z) min(z))
# Ploting the distribution of quality using ggplot
p.freq.9 <- ggplot(freq.9, aes(maf)) + geom_density(fill = "coral", colour = "black", alpha = 0.8) + theme_light()
summary(freq.9$maf)

# 4. MIN DEPTH PER INDIVIDUAL
# Read data
idepth.9 <- read_delim("STATS_ALL/tgc.wes.all.stats.filtered4.snvs.idepth", delim = "\t",col_names = c("ind", "nsites", "depth"), skip = 1) # All samples filtered
# Ploting the distribution of quality using ggplot
p.idepth.9 <- ggplot(idepth.9, aes(depth)) + geom_histogram(fill = "coral", colour = "black", alpha = 0.8) + theme_light()

# 5. PROPORTION OF MISSING DATA PER SAMPLE
# Read data
imiss.9 <- read_delim("STATS_ALL/tgc.wes.all.stats.filtered4.snvs.imiss", delim = "\t",col_names = c("ind", "ndata", "nfiltered", "nmiss", "fmiss"), skip = 1) # All samples filtered
# Ploting the distribution of quality using ggplot
p.imiss.9 <- ggplot(imiss.9, aes(fmiss)) + geom_histogram(fill = "coral", colour = "black", alpha = 0.8) + theme_light()

# 6. HETEROZYGOSITY AND INBREEDING COEFFICIENT PER SAMPLE
# Read data
het.9 <- read_delim("STATS_ALL/tgc.wes.all.stats.filtered4.snvs.het", delim = "\t",col_names = c("ind","ho", "he", "nsites", "f"), skip = 1) # All samples filtered
# Ploting the distribution of quality using ggplot
p.het.9 <- ggplot(het.9, aes(f)) + geom_histogram(fill = "coral", colour = "black", alpha = 0.8) + theme_light()

## PLOTS IN ONE PANEL (2X3)
# 1. MEAN DEPTH PER SITE 
p.mdepth.9 <- 
ggplot(mdepth.9, aes(mean_depth)) + 
  geom_histogram(aes(y= ..density..),fill = "#0099F8", colour = "black", alpha = 0.8) +
  geom_density(color = "#000000", fill = "#F85700", alpha = 0.4) +
  ylab("Density") + xlab("Mean depth per site") + theme_light() + ggtitle("a)") + xlim(0,50) +
  theme(axis.title = element_text(size = 15),
        axis.text=element_text(size=15),  
        plot.title = element_text(size=20),
        legend.title=element_text(size=15), 
        legend.text=element_text(size=12))
hist(mdepth.9$mean_depth,breaks=122)
# 2. MISSINGNESS PER SITE 
p.lmiss.9 <- 
ggplot(lmiss.9, aes(fmiss)) + 
  geom_histogram(aes(y= ..density..),fill = "#0099F8", colour = "black", alpha = 0.8) + 
  ylab("Density") + xlab("Frequency of missingness per site") + theme_light() + ggtitle("b)") + 
  theme(axis.title = element_text(size = 15),
        axis.text=element_text(size=15),  
        plot.title = element_text(size=20),
        legend.title=element_text(size=15), 
        legend.text=element_text(size=12))
# 3. MIN DEPTH PER INDIVIDUAL
p.idepth.9 <- 
ggplot(idepth.9, aes(depth)) + 
  geom_histogram(aes(y= ..density..),fill = "#0099F8", colour = "black", alpha = 0.8) + 
  geom_density(color = "#000000", fill = "#F85700", alpha = 0.4) +
  ylab("Density") + xlab("Minimum depth per sample") + theme_light() + ggtitle("c)") + 
  theme(axis.title = element_text(size = 15),
        axis.text=element_text(size=15),  
        plot.title = element_text(size=20),
        legend.title=element_text(size=15), 
        legend.text=element_text(size=12))
# 4. MISSINGNESS PER INDIVIDUAL
p.imiss.9 <- 
ggplot(imiss.9, aes(fmiss)) + 
  geom_histogram(aes(y= ..density..),fill = "#0099F8", colour = "black", alpha = 0.8) + 
  ylab("Density") + xlab("Frequency of missingness per sample") + theme_light() + ggtitle("d)") + 
  theme(axis.title = element_text(size = 15),
        axis.text=element_text(size=15),  
        plot.title = element_text(size=20),
        legend.title=element_text(size=15), 
        legend.text=element_text(size=12))
# 5. MINOR ALLELE FREQUENCY (MAF)
p.freq.9 <- 
ggplot(freq.9, aes(maf)) + 
  geom_density(aes(y= ..density..),fill = "#F85700", colour = "black", alpha = 0.8) + 
  ylab("Density") + xlab("Minimum Allele Frequency (MAF)") + theme_light() + ggtitle("e)") + 
  theme(axis.title = element_text(size = 15),
        axis.text=element_text(size=15),  
        plot.title = element_text(size=20),
        legend.title=element_text(size=15), 
        legend.text=element_text(size=12))
# 6. HETEROZYGOSITY AND INBREEDING COEFFICIENT PER SAMPLE
p.het.9 <-
ggplot(het.9, aes(f)) + 
  geom_histogram(aes(y= ..density..),fill = "#0099F8", colour = "black", alpha = 0.8) + 
  geom_density(color = "#000000", fill = "#F85700", alpha = 0.4) +
  ylab("Density") + xlab("Frequency of heterozygosity") + theme_light() + ggtitle("f)") + 
  theme(axis.title = element_text(size = 15),
        axis.text=element_text(size=15),  
        plot.title = element_text(size=20),
        legend.title=element_text(size=15), 
        legend.text=element_text(size=12))

tiff(file="/home/uni01/UFFF/chano/TGC_WES/MS_SCI_DATA/tgc_supplementary.figure.1.tiff",width=16,height=24,units="in",res=300)
grid.arrange(p.mdepth.9,p.lmiss.9,p.idepth.9,p.imiss.9,p.freq.9,p.het.9,ncol=2, nrow=3)
dev.off()

summary(mdepth.9$mean_depth)
sd(mdepth.9$mean_depth)
summary(lmiss.9$fmiss)
sd(lmiss.9$fmiss)
summary(idepth.9$depth)
sd(idepth.9$depth)
summary(imiss.9$fmiss)
sd(imiss.9$fmiss)
summary(freq.9$maf)
sd(freq.9$maf)
summary(het.9$f)
sd(het.9$f)

#########################################################################
### CODE CHUNK 3: SCREEPLOTS FOR BREEDING AND CANDIDATE SAMPLES       ###
#########################################################################

setwd("~/TGC_WES/6.PCA.ADMIXTURE")
library(tidyverse)
library(scales)

# This script will generate the two screeplots to see the contribution of different PCs to the variance

# The tutorial is extracted from Physalia course "Speciation & Population Genomics: a how-to-guide"
# by Mark Ravinet and Joana Meier
# url: https://speciationgenomics.github.io/

# FIGURE S2A. SCREEPLOT FOR BREEDING SAMPLES (CLONES)
# Using readr and scan to read the data
clones <- read_table2("2.CLONES/tgc.wes.clones.pca.eigenvec", col_names = FALSE)
# Set names
names(clones)[1]<-"ind"
names(clones)[2:ncol(clones)]<-paste0("PC",1:(ncol(clones)-1))
#write.table(data,"table.clones.txt",dec=".",row.names = TRUE, col.names = T, sep="\t")
# I have saved the table and edited externally to include family groups
# Now I load the new table as pca
pca.clones<-read.csv("2.CLONES/table.clones.fam.txt",dec = ".",sep=",", header = TRUE)
eigenval.clones<-scan("2.CLONES/tgc.wes.clones.pca.eigenval")
# Sorting out the PCA data and removing useless column
pca.clones<-pca.clones[,-1]
# Convert to percentage variance explained
pve.clones <- data.frame(PC = 1:20, pve.clones = eigenval.clones/sum(eigenval.clones)*100)
# Calculate the cumulative sum of the percentage variance explained
cumsum(pve.clones$pve)
# Make plot
tiff(file="/home/uni01/UFFF/chano/TGC_WES/MS_SCI_DATA/tgc_supplementary.figure.2a.tiff",width=8,height=8,units="in",res=300)
ggplot(pve.clones, aes(x=factor(PC), y=pve.clones)) + geom_bar(stat = "identity") + 
  ylab("Percentage variance explained") + xlab("Principal Components") + theme_light() + ggtitle("a)") +
  theme(axis.title = element_text(size = 15),
        axis.text=element_text(size=15),  
        plot.title = element_text(size=20),
        legend.title=element_text(size=15), 
        legend.text=element_text(size=12),
        panel.grid.major = element_blank(), 
        panel.grid.minor = element_blank())
dev.off()

# FIGURE S2B. SCREEPLOT FOR CANDIDATE SAMPLES (UNRELATED)
# Using readr and scan to read the data
unrelated <- read_table2("3.UNRELATED/tgc.wes.unrelated.pca.eigenvec", col_names = FALSE)
# Set names
names(unrelated)[1]<-"ind"
names(unrelated)[2:ncol(unrelated)]<-paste0("PC",1:(ncol(unrelated)-1))
#write.table(data,"table.unrelated.txt",dec=".",row.names = TRUE, col.names = T, sep="\t")
# I have saved the table and edited in excel to include groups of origins (from mother trees)
# Now I load the new table as pca
pca.unrel<-read.csv("3.UNRELATED/table.unrelated.ori.txt",dec = ".",sep=",", header = TRUE)
eigenval.unrel<-scan("3.UNRELATED/tgc.wes.unrelated.pca.eigenval")
# Sorting out the PCA data and removing useless column
pca.unrel<-pca.unrel[,-1]
# Convert to percentage variance explained
pve.unrel <- data.frame(PC = 1:20, pve.unrel = eigenval.unrel/sum(eigenval.unrel)*100)
# Calculate the cumulative sum of the percentage variance explained
cumsum(pve.unrel$pve)
# Make plot
tiff(file="/home/uni01/UFFF/chano/TGC_WES/MS_SCI_DATA/tgc_supplementary.figure.2b.tiff",width=8,height=8,units="in",res=300)
ggplot(pve.unrel, aes(x=factor(PC), y=pve.unrel)) + geom_bar(stat = "identity") + 
  ylab("Percentage variance explained") + xlab("Principal Components") + theme_light() + ggtitle("b)") +
  theme(axis.title = element_text(size = 15),
        axis.text=element_text(size=15),  
        plot.title = element_text(size=20),
        legend.title=element_text(size=15), 
        legend.text=element_text(size=12),
        panel.grid.major = element_blank(), 
        panel.grid.minor = element_blank())
dev.off()

###################################################################################################
### CODE CHUNK 4: PCAs FOR BREEDING SAMPLES. PC1 v. PC2 v. PC3 IN 3-2D PLOTS OR 3D?             ###
###################################################################################################

# This script will generate the PCA plots for breeding samples

# The tutorial is extracted from Physalia course "Speciation & Population Genomics: a how-to-guide"
# by Mark Ravinet and Joana Meier
# url: https://speciationgenomics.github.io/

# FIGURE 2A-C. PLOTTING PCAs FOR BREEDING SAMPLES (CLONES)

# As many PCs are involved in variation for breeding trees, three PCs will be contrasted (PC1 v. PC2 v. PC3)
# PC1 v. PC2
tiff(file="/home/uni01/UFFF/chano/TGC_WES/MS_SCI_DATA/tgc_figure.2a.tiff",width=8,height=8,units="in",res=300)
ggplot(pca.clones, aes(PC1, PC2, col = FAMILY)) + 
  scale_colour_manual(values = c("dodgerblue2","#E31A1C","green4","#6A3D9A","#FF7F00","black","gold1","skyblue2","#FB9A99",
                                 "palegreen2","gray70","khaki2","orchid1","deeppink1","blue1","steelblue4","darkturquoise")) +
  xlab(paste0("PC1 (", signif(pve.clones$pve[1], 3), "%)")) + 
  ylab(paste0("PC2 (", signif(pve.clones$pve[2], 3), "%)")) +
  geom_point(size = 3) +
  coord_equal() + ggtitle("a)") + theme_light() + 
  theme(axis.title = element_text(size = 15),
        axis.text=element_text(size=15),  
        plot.title = element_text(size=20),
        legend.title=element_text(size=15), 
        legend.text=element_text(size=12))
dev.off()
# PC1 vs PC3
tiff(file="/home/uni01/UFFF/chano/TGC_WES/MS_SCI_DATA/tgc_figure.2b.tiff",width=8,height=8,units="in",res=300)
ggplot(pca.clones, aes(PC1, PC3, col = FAMILY)) + 
  scale_colour_manual(values = c("dodgerblue2","#E31A1C","green4","#6A3D9A","#FF7F00","black","gold1","skyblue2","#FB9A99",
                                 "palegreen2","gray70","khaki2","orchid1","deeppink1","blue1","steelblue4","darkturquoise")) +
  xlab(paste0("PC1 (", signif(pve.clones$pve[1], 3), "%)")) + 
  ylab(paste0("PC3 (", signif(pve.clones$pve[3], 3), "%)")) +
  geom_point(size = 3) +
  coord_equal() + ggtitle("b)") + theme_light() + 
  theme(axis.title = element_text(size = 15),
        axis.text=element_text(size=15),  
        plot.title = element_text(size=20),
        legend.title=element_text(size=15), 
        legend.text=element_text(size=12))
dev.off()
# PC2 vs PC3
tiff(file="/home/uni01/UFFF/chano/TGC_WES/MS_SCI_DATA/tgc_figure.2c.tiff",width=8,height=8,units="in",res=300)
ggplot(pca.clones, aes(PC2, PC3, col = FAMILY)) + 
  scale_colour_manual(values = c("dodgerblue2","#E31A1C","green4","#6A3D9A","#FF7F00","black","gold1","skyblue2","#FB9A99",
                                 "palegreen2","gray70","khaki2","orchid1","deeppink1","blue1","steelblue4","darkturquoise")) +
  xlab(paste0("PC2 (", signif(pve.clones$pve[2], 3), "%)")) + 
  ylab(paste0("PC3 (", signif(pve.clones$pve[3], 3), "%)")) +
  geom_point(size = 3) + #geom_point(shape = 1,size = 3,colour = "black") +
  coord_equal() + ggtitle("c)") + theme_light() + 
  theme(axis.title = element_text(size = 15),
        axis.text=element_text(size=15),  
        plot.title = element_text(size=20),
        legend.title=element_text(size=15), 
        legend.text=element_text(size=12))
dev.off()

########################################################################
### CODE CHUNK 5: PCAs FOR CANDIDATE SAMPLES. PC1 v. PC2             ###
########################################################################

# This script will generate the PCA plot for candidate samples

# The tutorial is extracted from Physalia course "Speciation & Population Genomics: a how-to-guide"
# by Mark Ravinet and Joana Meier
# url: https://speciationgenomics.github.io/

# FIGURE 2D. PLOTTING PCA FOR CANDIDATE SAMPLES (UNRELATED)

# Although many PCs are also involved in variation for candidate trees, only one PCA is plotted (PC1 v. PC2)
# PC1 v. PC2
c26 <- c("red","dodgerblue2","darkred","green4", "#6A3D9A", "#FF7F00","black", "gold1", "skyblue2", "#FB9A99", "palegreen2", 
         "#CAB2D6","#FDBF6F", "gray70", "khaki2","maroon", "orchid1", "deeppink1","blue1", "steelblue4", "darkturquoise", 
         "green1",  "yellow4", "yellow3", "darkorange4","brown") 
pie(rep(1, 26), col = c26)
tiff(file="/home/uni01/UFFF/chano/TGC_WES/MS_SCI_DATA/tgc_figure.2d.tiff",width=8,height=8,units="in",res=300)
ggplot(pca.unrel, aes(PC1, PC2, col = ORIGIN)) + 
  scale_colour_manual(values = c26) +
  xlab(paste0("PC1 (", signif(pve.unrel$pve[1], 3), "%)")) + 
  ylab(paste0("PC2 (", signif(pve.unrel$pve[2], 3), "%)")) +
  geom_point(size = 3) + #geom_point(shape = 1,size = 3,colour = "black") +
  coord_equal() + ggtitle("d)") + theme_light() + 
  theme(axis.title = element_text(size = 15),
        axis.text=element_text(size=15),  
        plot.title = element_text(size=20),
        legend.title=element_text(size=15), 
        legend.text=element_text(size=12))
dev.off()

#########################################################
### CODE CHUNK 6: ADMIXTURE PLOT FOR BREEDING SAMPLES ###
#########################################################

# This script will generate the admixture plot for breeding samples (clones)

# FIGURE 3A. PLOTTING ADMIXTURE FOR BREEDING SAMPLES (CLONES)
indTable.clones = read.table("2.CLONES/tgc.wes.pops.clones2.txt",
                             col.names = c("FAMILY", "SAMPLE", "ID","GROUP","POP_N","FAM"))
size_pop.c<-table(factor(indTable.clones$FAMILY, levels=unique(indTable.clones$FAMILY))) #factor and levels used to keep order as in data
size_pop.c<-cumsum(size_pop.c)
c17=c("dodgerblue2","#E31A1C","green4","#6A3D9A","#FF7F00","black","gold1","skyblue2","#FB9A99",
"palegreen2","gray70","khaki2","orchid1","deeppink1","blue1","steelblue4","darkturquoise")

# K2
k2.c=read.table("2.CLONES/tgc.wes.clones.2.Q")
k2.c = cbind(k2.c, indTable.clones)
barplot(t(as.matrix(k2.c[,1:2])),beside = F,border = NA,col=c17,space=c(0,0),las = 2,cex.names = 0.7)
abline(v=size_pop.c+0.25)
# K3
k3.c=read.table("2.CLONES/tgc.wes.clones.3.Q")
k3.c = cbind(k3.c, indTable.clones)
barplot(t(as.matrix(k3.c[,1:3])),beside = F,border = NA,col=c17,space=c(0,0),las = 2,cex.names = 0.7)
abline(v=size_pop.c+0.25)
# K4
k4.c=read.table("2.CLONES/tgc.wes.clones.4.Q")
k4.c = cbind(k4.c, indTable.clones)
barplot(t(as.matrix(k4.c[,1:4])),beside = F,border = NA,col=c17,space=c(0,0),las = 2,cex.names = 0.7)
abline(v=size_pop.c+0.25)
# K5
k5.c=read.table("2.CLONES/tgc.wes.clones.5.Q")
k5.c = cbind(k5.c, indTable.clones)
barplot(t(as.matrix(k5.c[,1:5])),beside = F,border = NA,col=c17,space=c(0,0),las = 2,cex.names = 0.7)
abline(v=size_pop.c+0.25)
# K6
k6.c=read.table("2.CLONES/tgc.wes.clones.6.Q")
k6.c = cbind(k6.c, indTable.clones)
barplot(t(as.matrix(k6.c[,1:6])),beside = F,border = NA,col=c17,space=c(0,0),las = 2,cex.names = 0.7)
abline(v=size_pop.c+0.25)
# K7
k7.c=read.table("2.CLONES/tgc.wes.clones.7.Q")
k7.c = cbind(k7.c, indTable.clones)
barplot(t(as.matrix(k7.c[,1:7])),beside = F,border = NA,col=c17,space=c(0,0),las = 2,cex.names = 0.7)
abline(v=size_pop.c+0.25)
# K8
k8.c=read.table("2.CLONES/tgc.wes.clones.8.Q")
k8.c = cbind(k8.c, indTable.clones)
barplot(t(as.matrix(k8.c[,1:8])),beside = F,border = NA,col=c17,space=c(0,0),las = 2,cex.names = 0.7)
abline(v=size_pop.c+0.25)
# K9
k9.c=read.table("2.CLONES/tgc.wes.clones.9.Q")
k9.c = cbind(k9.c, indTable.clones)
barplot(t(as.matrix(k9.c[,1:9])),beside = F,border = NA,col=c17,space=c(0,0),las = 2,cex.names = 0.7)
abline(v=size_pop.c+0.25)
# K10
k10.c=read.table("2.CLONES/tgc.wes.clones.10.Q")
k10.c = cbind(k10.c, indTable.clones)
barplot(t(as.matrix(k10.c[,1:10])),beside = F,border = NA,col=c17,space=c(0,0),las = 2,cex.names = 0.7)
abline(v=size_pop.c+0.25)
# K11
k11.c=read.table("2.CLONES/tgc.wes.clones.11.Q")
k11.c = cbind(k11.c, indTable.clones)
barplot(t(as.matrix(k11.c[,1:11])),beside = F,border = NA,col=c17,space=c(0,0),las = 2,cex.names = 0.7)
abline(v=size_pop.c+0.25)
# K12
k12.c=read.table("2.CLONES/tgc.wes.clones.12.Q")
k12.c = cbind(k12.c, indTable.clones)
barplot(t(as.matrix(k12.c[,1:12])),beside = F,border = NA,col=c17,space=c(0,0),las = 2,cex.names = 0.7)
abline(v=size_pop.c+0.25)
# K13
k13.c=read.table("2.CLONES/tgc.wes.clones.13.Q")
k13.c = cbind(k13.c, indTable.clones)
barplot(t(as.matrix(k13.c[,1:13])),beside = F,border = NA,col=c17,space=c(0,0),las = 2,cex.names = 0.7)
abline(v=size_pop.c+0.25)
# K14
k14.c=read.table("2.CLONES/tgc.wes.clones.14.Q")
k14.c = cbind(k14.c, indTable.clones)
barplot(t(as.matrix(k14.c[,1:14])),beside = F,border = NA,col=c17,space=c(0,0),las = 2,cex.names = 0.7)
abline(v=size_pop.c+0.25)
# K15
k15.c=read.table("2.CLONES/tgc.wes.clones.15.Q")
k15.c = cbind(k15.c, indTable.clones)
barplot(t(as.matrix(k15.c[,1:15])),beside = F,border = NA,col=c17,space=c(0,0),las = 2,cex.names = 0.7)
abline(v=size_pop.c+0.25)
# K16
k16.c=read.table("2.CLONES/tgc.wes.clones.16.Q")
k16.c = cbind(k16.c, indTable.clones)
barplot(t(as.matrix(k16.c[,1:16])),beside = F,border = NA,col=c17,space=c(0,0),las = 2,cex.names = 0.7)
abline(v=size_pop.c+0.25)
# K17
k17.c=read.table("2.CLONES/tgc.wes.clones.17.Q")
k17.c = cbind(k17.c, indTable.clones)
tiff(file="/home/uni01/UFFF/chano/TGC_WES/MS_SCI_DATA/tgc_figure.3a.tiff",width=16,height=8,units="in",res=300)
barplot(t(as.matrix(k17.c[,1:17])),beside = F,border = NA,col=c17,space=c(0,0),las = 2,cex.names = 0.7,cex=1.5)
abline(v=size_pop.c+0.15) 
dev.off()

##########################################################
### CODE CHUNK 7: ADMIXTURE PLOT FOR CANDIDATE SAMPLES ###
##########################################################

# This script will generate the admixture plot for candidate samples (unrelated)

# FIGURE 3B. PLOTTING ADMIXTURE FOR CANDIDATE SAMPLES (UNRELATED)
indTable.unrel = read.table("3.UNRELATED/tgc.wes.pops.unrelated.txt",
                            col.names = c("FAMILY", "SAMPLE", "ID","GROUP","POP_N","FAM"))
size_pop.unrel<-table(factor(indTable.unrel$FAM, levels=unique(indTable.unrel$FAM))) #factor and levels used to keep order as in data
size_pop.unrel<-cumsum(size_pop.unrel)
c10=c("#E31A1C","green4","#6A3D9A","#FF7F00","gold1","skyblue2","palegreen2","gray70","deeppink1","blue1")

# K2
k2.u=read.table("3.UNRELATED/tgc.wes.unrelated.2.Q")
k2.u = cbind(k2.u, indTable.unrel)
tiff(file="/home/uni01/UFFF/chano/TGC_WES/MS_SCI_DATA/tgc_figure.3b.tiff",width=16,height=8,units="in",res=300)
barplot(t(as.matrix(k2.u[,1:2])),beside = F,border = NA,col=c10,space=c(0,0),las = 2,cex.names = 0.7)
abline(v=size_pop.unrel+0.25)
dev.off()
# K3
k3.u=read.table("3.UNRELATED/tgc.wes.unrelated.3.Q")
k3.u = cbind(k3.u, indTable.unrel)
# K4
k4.u=read.table("3.UNRELATED/tgc.wes.unrelated.4.Q")
k4.u = cbind(k4.u, indTable.unrel)
# K5
k5.u=read.table("3.UNRELATED/tgc.wes.unrelated.5.Q")
k5.u = cbind(k5.u, indTable.unrel)
# K6
k6.u=read.table("3.UNRELATED/tgc.wes.unrelated.6.Q")
k6.u = cbind(k6.u, indTable.unrel)
# K7
k7.u=read.table("3.UNRELATED/tgc.wes.unrelated.7.Q")
k7.u = cbind(k7.u, indTable.unrel)
# K8
k8.u=read.table("3.UNRELATED/tgc.wes.unrelated.8.Q")
k8.u = cbind(k8.u, indTable.unrel)
# K9
k9.u=read.table("3.UNRELATED/tgc.wes.unrelated.9.Q")
k9.u = cbind(k9.u, indTable.unrel)
# K10
k10.u=read.table("3.UNRELATED/tgc.wes.unrelated.10.Q")
k10.u = cbind(k10.u, indTable.unrel)

########################################################################
### CODE CHUNK 8: METHYLATION EXTRACTOR DATA FROM ALL THE SAMPLES    ###
########################################################################

# This script will load methylation extractor data from all the samples and plot the percentages of methylated cytosines

stats<-read.table("~/TGC/PUBLICATION/TBSEQ.STATS/TGC_methyl_extractor_bismark.txt",header=TRUE,sep="\t",dec=".")
hist(stats$EFFICIENCY,
     col="peachpuff",
     prob = TRUE, # show densities instead of frequencies
     xlab = "Mapping Efficiency (%)",
     main = "Bismark Mapping Efficiency",
     breaks = seq(from=0, to=100, by=2))

lines(density(stats$EFFICIENCY), # density plot
      lwd = 3, # thickness of line
      col = "chocolate3")
stats$NUMBER <- seq.int(nrow(stats))

tiff(file="/home/uni01/UFFF/chano/TGC/PUBLICATION/figure4a.tbseq.methperc.all.tiff",width=24,height=8,units="in",res=300)
ggplot(stats, aes(NUMBER)) + 
  geom_line(aes(y = PERCENT_METHYLATED_CpGs, colour = "Methylated in CpGs context")) + 
  geom_line(aes(y = PERCENT_METHYLATED_CHGs, colour = "Methylated in CHGs context")) + 
  geom_line(aes(y = PERCENT_METHYLATED_CHHs, colour = "Methylated in CHHs context")) + 
  theme_bw() + labs(title = "a)") +
  ylab("Methylated cytosines (%)") + xlab("Breeding samples                    Open-pollinated samples") +
  geom_vline(xintercept = 218.5,linetype="dashed")+
  geom_vline(xintercept = c(11.5,21.5,36.5,51.5,66.5,79.5,94.5,109.5,124.5,139.5,148.5,163.5,178.5,193.5,201.5,208.5,
                            224.5,254.5,269.5,283.5,305.5,309.5,327.5,360.5,384.5,407.5,409.5,417.5,426.5,477.5,506.5,
                            521.5,528.5,550.5,559.5,560.5,565.5,590.5,598.5,608.5,614.5),linetype="dotted")+
  scale_x_continuous(
    breaks=c( 6,16,28.5,43.5,58.5,72.5,86.5,101.5,116.5,131.5,143.5,155.5,170.5,185.5,197,204.5,213,
              221,239,261.5,276,294,307,318,343.5,372,395.5,408,415,421.5,
              451.5,491.5,513.5,524.5,539,551.5,559.5,565.5,577.5,594,603,611,617),
    labels=c( "6"="16", "16"="27", "28.5"="32", "43.5"="33", "58.5"="38", "72.5"="39", "86.5"="40",
              "101.5"="41","116.5"="42","131.5"="43","143.5"="44","155.5"="47","170.5"="48","185.5"="50",
              "197"="51","204.5"="52","213"="53",
              "221"="Asikkala","239"="Jämsä","261.5"="Kauhajoki","276"="Koski",
              "294"="Kuopio","307"="Laihia","318"="Lammi","343.5"="Leppävirta",
              "372"="Loppi","395.5"="Luopioinen","408"="Mäntyharju","415"="Marttila",
              "421.5"="Miehikkälä","451.5"="Mikkeli","491.5"="Multia","513.5"="Muurame",
              "524.5"="Orivesi","539"="Pälkäne","551.5"="Petäjävesi","559.5"="Pieksämäen",
              "565.5"="Punkaharju","577.5"="Punkalaidun","594"="Puumala","603"="Rautalampi",
              "611"="Savonlinna","617"="Somero")) +
  scale_color_manual(
    values = c("Methylated in CpGs context" = "cornflowerblue", "Methylated in CHGs context" = "limegreen", "Methylated in CHHs context" = "firebrick"),  # Define colors
    breaks = c("Methylated in CpGs context","Methylated in CHGs context","Methylated in CHHs context")) +
  theme(plot.title = element_text(size=20),
        axis.title = element_text(size = 15),
        axis.title.x = element_text(size=15),
        axis.title.y = element_text(size=15),
        axis.text.x=element_text(size=12, angle=270, vjust = 0.5, hjust=0),
        axis.text=element_text(size=15),
        legend.title=element_blank())
dev.off()

################################################################################
### CODE CHUNK 9: LOAD AND INSPECT METHYLATION DATA FROM BREEDING SAMPLES    ###
################################################################################

# This script will load methylation data from breeding samples using methylKit

library(methylKit)
setwd("/home/uni01/UFFF/chano/TGC/PUBLICATION/TBSEQ.STATS")

# To use multithreding and monitor the loading
library(parallel)
library(pbapply)
## Define the number of cores to use
#num_cores <- 16
num_cores <- detectCores() - 4
#rm(num_cores)

# Read deduplicated bam files from bismark alignment (sample list with TBSEQ plates from P001 to P003)
## Define the file paths and sample IDs
#clones.list=list(
file_paths <- c( # Four samples failed during loading, so I filtered them out by commenting. The same for samples_ids and treatments below
  "/home/uni01/UFFF/chano/TGC_TBS/3.MAPPING/BISMARK/P001_WA01_psrt.bam","/home/uni01/UFFF/chano/TGC_TBS/3.MAPPING/BISMARK/P001_WA02_psrt.bam","/home/uni01/UFFF/chano/TGC_TBS/3.MAPPING/BISMARK/P001_WA03_psrt.bam","/home/uni01/UFFF/chano/TGC_TBS/3.MAPPING/BISMARK/P001_WA04_psrt.bam","/home/uni01/UFFF/chano/TGC_TBS/3.MAPPING/BISMARK/P001_WA05_psrt.bam","/home/uni01/UFFF/chano/TGC_TBS/3.MAPPING/BISMARK/P001_WA06_psrt.bam",
  "/home/uni01/UFFF/chano/TGC_TBS/3.MAPPING/BISMARK/P001_WA07_psrt.bam","/home/uni01/UFFF/chano/TGC_TBS/3.MAPPING/BISMARK/P001_WA08_psrt.bam","/home/uni01/UFFF/chano/TGC_TBS/3.MAPPING/BISMARK/P001_WA09_psrt.bam","/home/uni01/UFFF/chano/TGC_TBS/3.MAPPING/BISMARK/P001_WA10_psrt.bam","/home/uni01/UFFF/chano/TGC_TBS/3.MAPPING/BISMARK/P001_WA11_psrt.bam","/home/uni01/UFFF/chano/TGC_TBS/3.MAPPING/BISMARK/P001_WA12_psrt.bam",
  "/home/uni01/UFFF/chano/TGC_TBS/3.MAPPING/BISMARK/P001_WB01_psrt.bam","/home/uni01/UFFF/chano/TGC_TBS/3.MAPPING/BISMARK/P001_WB02_psrt.bam","/home/uni01/UFFF/chano/TGC_TBS/3.MAPPING/BISMARK/P001_WB03_psrt.bam","/home/uni01/UFFF/chano/TGC_TBS/3.MAPPING/BISMARK/P001_WB04_psrt.bam","/home/uni01/UFFF/chano/TGC_TBS/3.MAPPING/BISMARK/P001_WB05_psrt.bam","/home/uni01/UFFF/chano/TGC_TBS/3.MAPPING/BISMARK/P001_WB06_psrt.bam",
  "/home/uni01/UFFF/chano/TGC_TBS/3.MAPPING/BISMARK/P001_WB07_psrt.bam","/home/uni01/UFFF/chano/TGC_TBS/3.MAPPING/BISMARK/P001_WB08_psrt.bam","/home/uni01/UFFF/chano/TGC_TBS/3.MAPPING/BISMARK/P001_WB09_psrt.bam","/home/uni01/UFFF/chano/TGC_TBS/3.MAPPING/BISMARK/P001_WB10_psrt.bam","/home/uni01/UFFF/chano/TGC_TBS/3.MAPPING/BISMARK/P001_WB11_psrt.bam","/home/uni01/UFFF/chano/TGC_TBS/3.MAPPING/BISMARK/P001_WB12_psrt.bam",
  "/home/uni01/UFFF/chano/TGC_TBS/3.MAPPING/BISMARK/P001_WC01_psrt.bam","/home/uni01/UFFF/chano/TGC_TBS/3.MAPPING/BISMARK/P001_WC02_psrt.bam","/home/uni01/UFFF/chano/TGC_TBS/3.MAPPING/BISMARK/P001_WC03_psrt.bam","/home/uni01/UFFF/chano/TGC_TBS/3.MAPPING/BISMARK/P001_WC04_psrt.bam","/home/uni01/UFFF/chano/TGC_TBS/3.MAPPING/BISMARK/P001_WC05_psrt.bam","/home/uni01/UFFF/chano/TGC_TBS/3.MAPPING/BISMARK/P001_WC06_psrt.bam",
  "/home/uni01/UFFF/chano/TGC_TBS/3.MAPPING/BISMARK/P001_WC07_psrt.bam","/home/uni01/UFFF/chano/TGC_TBS/3.MAPPING/BISMARK/P001_WC08_psrt.bam","/home/uni01/UFFF/chano/TGC_TBS/3.MAPPING/BISMARK/P001_WC09_psrt.bam","/home/uni01/UFFF/chano/TGC_TBS/3.MAPPING/BISMARK/P001_WC10_psrt.bam","/home/uni01/UFFF/chano/TGC_TBS/3.MAPPING/BISMARK/P001_WC11_psrt.bam","/home/uni01/UFFF/chano/TGC_TBS/3.MAPPING/BISMARK/P001_WC12_psrt.bam",
  "/home/uni01/UFFF/chano/TGC_TBS/3.MAPPING/BISMARK/P001_WD01_psrt.bam","/home/uni01/UFFF/chano/TGC_TBS/3.MAPPING/BISMARK/P001_WD02_psrt.bam","/home/uni01/UFFF/chano/TGC_TBS/3.MAPPING/BISMARK/P001_WD03_psrt.bam","/home/uni01/UFFF/chano/TGC_TBS/3.MAPPING/BISMARK/P001_WD04_psrt.bam","/home/uni01/UFFF/chano/TGC_TBS/3.MAPPING/BISMARK/P001_WD05_psrt.bam","/home/uni01/UFFF/chano/TGC_TBS/3.MAPPING/BISMARK/P001_WD06_psrt.bam",
  "/home/uni01/UFFF/chano/TGC_TBS/3.MAPPING/BISMARK/P001_WD07_psrt.bam","/home/uni01/UFFF/chano/TGC_TBS/3.MAPPING/BISMARK/P001_WD08_psrt.bam","/home/uni01/UFFF/chano/TGC_TBS/3.MAPPING/BISMARK/P001_WD09_psrt.bam","/home/uni01/UFFF/chano/TGC_TBS/3.MAPPING/BISMARK/P001_WD10_psrt.bam","/home/uni01/UFFF/chano/TGC_TBS/3.MAPPING/BISMARK/P001_WD11_psrt.bam","/home/uni01/UFFF/chano/TGC_TBS/3.MAPPING/BISMARK/P001_WD12_psrt.bam",
  "/home/uni01/UFFF/chano/TGC_TBS/3.MAPPING/BISMARK/P001_WE01_psrt.bam","/home/uni01/UFFF/chano/TGC_TBS/3.MAPPING/BISMARK/P001_WE02_psrt.bam","/home/uni01/UFFF/chano/TGC_TBS/3.MAPPING/BISMARK/P001_WE03_psrt.bam","/home/uni01/UFFF/chano/TGC_TBS/3.MAPPING/BISMARK/P001_WE04_psrt.bam","/home/uni01/UFFF/chano/TGC_TBS/3.MAPPING/BISMARK/P001_WE05_psrt.bam","/home/uni01/UFFF/chano/TGC_TBS/3.MAPPING/BISMARK/P001_WE06_psrt.bam",
  "/home/uni01/UFFF/chano/TGC_TBS/3.MAPPING/BISMARK/P001_WE07_psrt.bam","/home/uni01/UFFF/chano/TGC_TBS/3.MAPPING/BISMARK/P001_WE08_psrt.bam","/home/uni01/UFFF/chano/TGC_TBS/3.MAPPING/BISMARK/P001_WE09_psrt.bam","/home/uni01/UFFF/chano/TGC_TBS/3.MAPPING/BISMARK/P001_WE10_psrt.bam","/home/uni01/UFFF/chano/TGC_TBS/3.MAPPING/BISMARK/P001_WE11_psrt.bam","/home/uni01/UFFF/chano/TGC_TBS/3.MAPPING/BISMARK/P001_WE12_psrt.bam",
  "/home/uni01/UFFF/chano/TGC_TBS/3.MAPPING/BISMARK/P001_WF01_psrt.bam","/home/uni01/UFFF/chano/TGC_TBS/3.MAPPING/BISMARK/P001_WF02_psrt.bam","/home/uni01/UFFF/chano/TGC_TBS/3.MAPPING/BISMARK/P001_WF03_psrt.bam","/home/uni01/UFFF/chano/TGC_TBS/3.MAPPING/BISMARK/P001_WF04_psrt.bam","/home/uni01/UFFF/chano/TGC_TBS/3.MAPPING/BISMARK/P001_WF05_psrt.bam","/home/uni01/UFFF/chano/TGC_TBS/3.MAPPING/BISMARK/P001_WF06_psrt.bam",
  "/home/uni01/UFFF/chano/TGC_TBS/3.MAPPING/BISMARK/P001_WF07_psrt.bam","/home/uni01/UFFF/chano/TGC_TBS/3.MAPPING/BISMARK/P001_WF08_psrt.bam","/home/uni01/UFFF/chano/TGC_TBS/3.MAPPING/BISMARK/P001_WF09_psrt.bam","/home/uni01/UFFF/chano/TGC_TBS/3.MAPPING/BISMARK/P001_WF10_psrt.bam","/home/uni01/UFFF/chano/TGC_TBS/3.MAPPING/BISMARK/P001_WF11_psrt.bam","/home/uni01/UFFF/chano/TGC_TBS/3.MAPPING/BISMARK/P001_WF12_psrt.bam",
  "/home/uni01/UFFF/chano/TGC_TBS/3.MAPPING/BISMARK/P001_WG01_psrt.bam","/home/uni01/UFFF/chano/TGC_TBS/3.MAPPING/BISMARK/P001_WG02_psrt.bam","/home/uni01/UFFF/chano/TGC_TBS/3.MAPPING/BISMARK/P001_WG03_psrt.bam","/home/uni01/UFFF/chano/TGC_TBS/3.MAPPING/BISMARK/P001_WG04_psrt.bam","/home/uni01/UFFF/chano/TGC_TBS/3.MAPPING/BISMARK/P001_WG05_psrt.bam","/home/uni01/UFFF/chano/TGC_TBS/3.MAPPING/BISMARK/P001_WG06_psrt.bam",
  "/home/uni01/UFFF/chano/TGC_TBS/3.MAPPING/BISMARK/P001_WG07_psrt.bam","/home/uni01/UFFF/chano/TGC_TBS/3.MAPPING/BISMARK/P001_WG08_psrt.bam","/home/uni01/UFFF/chano/TGC_TBS/3.MAPPING/BISMARK/P001_WG09_psrt.bam","/home/uni01/UFFF/chano/TGC_TBS/3.MAPPING/BISMARK/P001_WG10_psrt.bam","/home/uni01/UFFF/chano/TGC_TBS/3.MAPPING/BISMARK/P001_WG11_psrt.bam","/home/uni01/UFFF/chano/TGC_TBS/3.MAPPING/BISMARK/P001_WG12_psrt.bam",
  "/home/uni01/UFFF/chano/TGC_TBS/3.MAPPING/BISMARK/P001_WH01_psrt.bam","/home/uni01/UFFF/chano/TGC_TBS/3.MAPPING/BISMARK/P001_WH02_psrt.bam","/home/uni01/UFFF/chano/TGC_TBS/3.MAPPING/BISMARK/P001_WH03_psrt.bam","/home/uni01/UFFF/chano/TGC_TBS/3.MAPPING/BISMARK/P001_WH04_psrt.bam","/home/uni01/UFFF/chano/TGC_TBS/3.MAPPING/BISMARK/P001_WH05_psrt.bam","/home/uni01/UFFF/chano/TGC_TBS/3.MAPPING/BISMARK/P001_WH06_psrt.bam",
  "/home/uni01/UFFF/chano/TGC_TBS/3.MAPPING/BISMARK/P001_WH07_psrt.bam","/home/uni01/UFFF/chano/TGC_TBS/3.MAPPING/BISMARK/P001_WH08_psrt.bam","/home/uni01/UFFF/chano/TGC_TBS/3.MAPPING/BISMARK/P001_WH09_psrt.bam","/home/uni01/UFFF/chano/TGC_TBS/3.MAPPING/BISMARK/P001_WH10_psrt.bam","/home/uni01/UFFF/chano/TGC_TBS/3.MAPPING/BISMARK/P001_WH11_psrt.bam","/home/uni01/UFFF/chano/TGC_TBS/3.MAPPING/BISMARK/P001_WH12_psrt.bam",
  
  "/home/uni01/UFFF/chano/TGC_TBS/3.MAPPING/BISMARK/P002_WA01_psrt.bam","/home/uni01/UFFF/chano/TGC_TBS/3.MAPPING/BISMARK/P002_WA02_psrt.bam","/home/uni01/UFFF/chano/TGC_TBS/3.MAPPING/BISMARK/P002_WA03_psrt.bam","/home/uni01/UFFF/chano/TGC_TBS/3.MAPPING/BISMARK/P002_WA04_psrt.bam","/home/uni01/UFFF/chano/TGC_TBS/3.MAPPING/BISMARK/P002_WA05_psrt.bam","/home/uni01/UFFF/chano/TGC_TBS/3.MAPPING/BISMARK/P002_WA06_psrt.bam",
  "/home/uni01/UFFF/chano/TGC_TBS/3.MAPPING/BISMARK/P002_WA07_psrt.bam","/home/uni01/UFFF/chano/TGC_TBS/3.MAPPING/BISMARK/P002_WA08_psrt.bam","/home/uni01/UFFF/chano/TGC_TBS/3.MAPPING/BISMARK/P002_WA09_psrt.bam","/home/uni01/UFFF/chano/TGC_TBS/3.MAPPING/BISMARK/P002_WA10_psrt.bam","/home/uni01/UFFF/chano/TGC_TBS/3.MAPPING/BISMARK/P002_WA11_psrt.bam","/home/uni01/UFFF/chano/TGC_TBS/3.MAPPING/BISMARK/P002_WA12_psrt.bam",
  "/home/uni01/UFFF/chano/TGC_TBS/3.MAPPING/BISMARK/P002_WB01_psrt.bam","/home/uni01/UFFF/chano/TGC_TBS/3.MAPPING/BISMARK/P002_WB02_psrt.bam","/home/uni01/UFFF/chano/TGC_TBS/3.MAPPING/BISMARK/P002_WB03_psrt.bam","/home/uni01/UFFF/chano/TGC_TBS/3.MAPPING/BISMARK/P002_WB04_psrt.bam","/home/uni01/UFFF/chano/TGC_TBS/3.MAPPING/BISMARK/P002_WB05_psrt.bam","/home/uni01/UFFF/chano/TGC_TBS/3.MAPPING/BISMARK/P002_WB06_psrt.bam",
  "/home/uni01/UFFF/chano/TGC_TBS/3.MAPPING/BISMARK/P002_WB07_psrt.bam","/home/uni01/UFFF/chano/TGC_TBS/3.MAPPING/BISMARK/P002_WB08_psrt.bam","/home/uni01/UFFF/chano/TGC_TBS/3.MAPPING/BISMARK/P002_WB09_psrt.bam","/home/uni01/UFFF/chano/TGC_TBS/3.MAPPING/BISMARK/P002_WB10_psrt.bam","/home/uni01/UFFF/chano/TGC_TBS/3.MAPPING/BISMARK/P002_WB11_psrt.bam","/home/uni01/UFFF/chano/TGC_TBS/3.MAPPING/BISMARK/P002_WB12_psrt.bam",
  "/home/uni01/UFFF/chano/TGC_TBS/3.MAPPING/BISMARK/P002_WC01_psrt.bam","/home/uni01/UFFF/chano/TGC_TBS/3.MAPPING/BISMARK/P002_WC02_psrt.bam","/home/uni01/UFFF/chano/TGC_TBS/3.MAPPING/BISMARK/P002_WC03_psrt.bam","/home/uni01/UFFF/chano/TGC_TBS/3.MAPPING/BISMARK/P002_WC04_psrt.bam","/home/uni01/UFFF/chano/TGC_TBS/3.MAPPING/BISMARK/P002_WC05_psrt.bam","/home/uni01/UFFF/chano/TGC_TBS/3.MAPPING/BISMARK/P002_WC06_psrt.bam",
  "/home/uni01/UFFF/chano/TGC_TBS/3.MAPPING/BISMARK/P002_WC07_psrt.bam","/home/uni01/UFFF/chano/TGC_TBS/3.MAPPING/BISMARK/P002_WC08_psrt.bam","/home/uni01/UFFF/chano/TGC_TBS/3.MAPPING/BISMARK/P002_WC09_psrt.bam","/home/uni01/UFFF/chano/TGC_TBS/3.MAPPING/BISMARK/P002_WC10_psrt.bam","/home/uni01/UFFF/chano/TGC_TBS/3.MAPPING/BISMARK/P002_WC11_psrt.bam","/home/uni01/UFFF/chano/TGC_TBS/3.MAPPING/BISMARK/P002_WC12_psrt.bam",
  "/home/uni01/UFFF/chano/TGC_TBS/3.MAPPING/BISMARK/P002_WD01_psrt.bam","/home/uni01/UFFF/chano/TGC_TBS/3.MAPPING/BISMARK/P002_WD02_psrt.bam","/home/uni01/UFFF/chano/TGC_TBS/3.MAPPING/BISMARK/P002_WD03_psrt.bam","/home/uni01/UFFF/chano/TGC_TBS/3.MAPPING/BISMARK/P002_WD04_psrt.bam","/home/uni01/UFFF/chano/TGC_TBS/3.MAPPING/BISMARK/P002_WD05_psrt.bam","/home/uni01/UFFF/chano/TGC_TBS/3.MAPPING/BISMARK/P002_WD06_psrt.bam",
  "/home/uni01/UFFF/chano/TGC_TBS/3.MAPPING/BISMARK/P002_WD07_psrt.bam","/home/uni01/UFFF/chano/TGC_TBS/3.MAPPING/BISMARK/P002_WD08_psrt.bam","/home/uni01/UFFF/chano/TGC_TBS/3.MAPPING/BISMARK/P002_WD09_psrt.bam","/home/uni01/UFFF/chano/TGC_TBS/3.MAPPING/BISMARK/P002_WD10_psrt.bam","/home/uni01/UFFF/chano/TGC_TBS/3.MAPPING/BISMARK/P002_WD11_psrt.bam","/home/uni01/UFFF/chano/TGC_TBS/3.MAPPING/BISMARK/P002_WD12_psrt.bam",
  "/home/uni01/UFFF/chano/TGC_TBS/3.MAPPING/BISMARK/P002_WE01_psrt.bam","/home/uni01/UFFF/chano/TGC_TBS/3.MAPPING/BISMARK/P002_WE02_psrt.bam","/home/uni01/UFFF/chano/TGC_TBS/3.MAPPING/BISMARK/P002_WE03_psrt.bam","/home/uni01/UFFF/chano/TGC_TBS/3.MAPPING/BISMARK/P002_WE04_psrt.bam","/home/uni01/UFFF/chano/TGC_TBS/3.MAPPING/BISMARK/P002_WE05_psrt.bam","/home/uni01/UFFF/chano/TGC_TBS/3.MAPPING/BISMARK/P002_WE06_psrt.bam",
  "/home/uni01/UFFF/chano/TGC_TBS/3.MAPPING/BISMARK/P002_WE07_psrt.bam","/home/uni01/UFFF/chano/TGC_TBS/3.MAPPING/BISMARK/P002_WE08_psrt.bam","/home/uni01/UFFF/chano/TGC_TBS/3.MAPPING/BISMARK/P002_WE09_psrt.bam","/home/uni01/UFFF/chano/TGC_TBS/3.MAPPING/BISMARK/P002_WE10_psrt.bam","/home/uni01/UFFF/chano/TGC_TBS/3.MAPPING/BISMARK/P002_WE11_psrt.bam","/home/uni01/UFFF/chano/TGC_TBS/3.MAPPING/BISMARK/P002_WE12_psrt.bam",
  "/home/uni01/UFFF/chano/TGC_TBS/3.MAPPING/BISMARK/P002_WF01_psrt.bam","/home/uni01/UFFF/chano/TGC_TBS/3.MAPPING/BISMARK/P002_WF02_psrt.bam","/home/uni01/UFFF/chano/TGC_TBS/3.MAPPING/BISMARK/P002_WF03_psrt.bam","/home/uni01/UFFF/chano/TGC_TBS/3.MAPPING/BISMARK/P002_WF04_psrt.bam","/home/uni01/UFFF/chano/TGC_TBS/3.MAPPING/BISMARK/P002_WF05_psrt.bam","/home/uni01/UFFF/chano/TGC_TBS/3.MAPPING/BISMARK/P002_WF06_psrt.bam",
  "/home/uni01/UFFF/chano/TGC_TBS/3.MAPPING/BISMARK/P002_WF07_psrt.bam","/home/uni01/UFFF/chano/TGC_TBS/3.MAPPING/BISMARK/P002_WF08_psrt.bam","/home/uni01/UFFF/chano/TGC_TBS/3.MAPPING/BISMARK/P002_WF09_psrt.bam","/home/uni01/UFFF/chano/TGC_TBS/3.MAPPING/BISMARK/P002_WF10_psrt.bam","/home/uni01/UFFF/chano/TGC_TBS/3.MAPPING/BISMARK/P002_WF11_psrt.bam","/home/uni01/UFFF/chano/TGC_TBS/3.MAPPING/BISMARK/P002_WF12_psrt.bam",
  "/home/uni01/UFFF/chano/TGC_TBS/3.MAPPING/BISMARK/P002_WG01_psrt.bam","/home/uni01/UFFF/chano/TGC_TBS/3.MAPPING/BISMARK/P002_WG02_psrt.bam","/home/uni01/UFFF/chano/TGC_TBS/3.MAPPING/BISMARK/P002_WG03_psrt.bam","/home/uni01/UFFF/chano/TGC_TBS/3.MAPPING/BISMARK/P002_WG04_psrt.bam","/home/uni01/UFFF/chano/TGC_TBS/3.MAPPING/BISMARK/P002_WG05_psrt.bam","/home/uni01/UFFF/chano/TGC_TBS/3.MAPPING/BISMARK/P002_WG06_psrt.bam",
  "/home/uni01/UFFF/chano/TGC_TBS/3.MAPPING/BISMARK/P002_WG07_psrt.bam","/home/uni01/UFFF/chano/TGC_TBS/3.MAPPING/BISMARK/P002_WG08_psrt.bam","/home/uni01/UFFF/chano/TGC_TBS/3.MAPPING/BISMARK/P002_WG09_psrt.bam","/home/uni01/UFFF/chano/TGC_TBS/3.MAPPING/BISMARK/P002_WG10_psrt.bam","/home/uni01/UFFF/chano/TGC_TBS/3.MAPPING/BISMARK/P002_WG11_psrt.bam","/home/uni01/UFFF/chano/TGC_TBS/3.MAPPING/BISMARK/P002_WG12_psrt.bam",
  "/home/uni01/UFFF/chano/TGC_TBS/3.MAPPING/BISMARK/P002_WH01_psrt.bam","/home/uni01/UFFF/chano/TGC_TBS/3.MAPPING/BISMARK/P002_WH02_psrt.bam","/home/uni01/UFFF/chano/TGC_TBS/3.MAPPING/BISMARK/P002_WH03_psrt.bam","/home/uni01/UFFF/chano/TGC_TBS/3.MAPPING/BISMARK/P002_WH04_psrt.bam","/home/uni01/UFFF/chano/TGC_TBS/3.MAPPING/BISMARK/P002_WH05_psrt.bam","/home/uni01/UFFF/chano/TGC_TBS/3.MAPPING/BISMARK/P002_WH06_psrt.bam",
  "/home/uni01/UFFF/chano/TGC_TBS/3.MAPPING/BISMARK/P002_WH07_psrt.bam","/home/uni01/UFFF/chano/TGC_TBS/3.MAPPING/BISMARK/P002_WH08_psrt.bam","/home/uni01/UFFF/chano/TGC_TBS/3.MAPPING/BISMARK/P002_WH09_psrt.bam","/home/uni01/UFFF/chano/TGC_TBS/3.MAPPING/BISMARK/P002_WH10_psrt.bam","/home/uni01/UFFF/chano/TGC_TBS/3.MAPPING/BISMARK/P002_WH11_psrt.bam","/home/uni01/UFFF/chano/TGC_TBS/3.MAPPING/BISMARK/P002_WH12_psrt.bam",
  
  "/home/uni01/UFFF/chano/TGC_TBS/3.MAPPING/BISMARK/P003_WA01_psrt.bam","/home/uni01/UFFF/chano/TGC_TBS/3.MAPPING/BISMARK/P003_WA02_psrt.bam","/home/uni01/UFFF/chano/TGC_TBS/3.MAPPING/BISMARK/P003_WA03_psrt.bam","/home/uni01/UFFF/chano/TGC_TBS/3.MAPPING/BISMARK/P003_WA04_psrt.bam","/home/uni01/UFFF/chano/TGC_TBS/3.MAPPING/BISMARK/P003_WA05_psrt.bam","/home/uni01/UFFF/chano/TGC_TBS/3.MAPPING/BISMARK/P003_WA06_psrt.bam",
  "/home/uni01/UFFF/chano/TGC_TBS/3.MAPPING/BISMARK/P003_WA07_psrt.bam","/home/uni01/UFFF/chano/TGC_TBS/3.MAPPING/BISMARK/P003_WA08_psrt.bam","/home/uni01/UFFF/chano/TGC_TBS/3.MAPPING/BISMARK/P003_WA09_psrt.bam","/home/uni01/UFFF/chano/TGC_TBS/3.MAPPING/BISMARK/P003_WA10_psrt.bam","/home/uni01/UFFF/chano/TGC_TBS/3.MAPPING/BISMARK/P003_WA11_psrt.bam","/home/uni01/UFFF/chano/TGC_TBS/3.MAPPING/BISMARK/P003_WA12_psrt.bam",
  "/home/uni01/UFFF/chano/TGC_TBS/3.MAPPING/BISMARK/P003_WB01_psrt.bam","/home/uni01/UFFF/chano/TGC_TBS/3.MAPPING/BISMARK/P003_WB02_psrt.bam","/home/uni01/UFFF/chano/TGC_TBS/3.MAPPING/BISMARK/P003_WB03_psrt.bam","/home/uni01/UFFF/chano/TGC_TBS/3.MAPPING/BISMARK/P003_WB04_psrt.bam","/home/uni01/UFFF/chano/TGC_TBS/3.MAPPING/BISMARK/P003_WB05_psrt.bam","/home/uni01/UFFF/chano/TGC_TBS/3.MAPPING/BISMARK/P003_WB06_psrt.bam",
  "/home/uni01/UFFF/chano/TGC_TBS/3.MAPPING/BISMARK/P003_WB07_psrt.bam","/home/uni01/UFFF/chano/TGC_TBS/3.MAPPING/BISMARK/P003_WB08_psrt.bam","/home/uni01/UFFF/chano/TGC_TBS/3.MAPPING/BISMARK/P003_WB09_psrt.bam","/home/uni01/UFFF/chano/TGC_TBS/3.MAPPING/BISMARK/P003_WB10_psrt.bam","/home/uni01/UFFF/chano/TGC_TBS/3.MAPPING/BISMARK/P003_WB11_psrt.bam","/home/uni01/UFFF/chano/TGC_TBS/3.MAPPING/BISMARK/P003_WB12_psrt.bam",
  "/home/uni01/UFFF/chano/TGC_TBS/3.MAPPING/BISMARK/P003_WC01_psrt.bam","/home/uni01/UFFF/chano/TGC_TBS/3.MAPPING/BISMARK/P003_WC02_psrt.bam")

# Create methyRawList object with CpGs (breeding samples)
#cpg.clones.rawlist=processBismarkAln(location=clones.list,sample.id=list(
sample_ids <- c(
  "CT_1601","CT_1610","CT_1612","CT_1616","CT_1619","CT_1621","CT_1622","CT_1624","CT_1626","CT_1630","CT_1637","CT_2718",
  "CT_2719","CT_2721","CT_2723","CT_2725","CT_2726","CT_2733","CT_2734","CT_2736","CT_2741","CT_3205","CT_3214","CT_3215",
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
  "CT_5326","CT_5331")

treatments <-  c(16,16,16,16,16,16,16,16,16,16,16,27,27,27,27,27,27,27,27,27,27,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,
                 33,33,33,33,33,33,33,33,33,33,33,33,33,33,33,38,38,38,38,38,38,38,38,38,38,38,38,38,38,38,
                 39,39,39,39,39,39,39,39,39,39,39,39,39,40,40,40,40,40,40,40,40,40,40,40,40,40,40,40,
                 41,41,41,41,41,41,41,41,41,41,41,41,41,41,41,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,
                 43,43,43,43,43,43,43,43,43,43,43,43,43,43,43,44,44,44,44,44,44,44,44,44,
                 47,47,47,47,47,47,47,47,47,47,47,47,47,47,47,48,48,48,48,48,48,48,48,48,48,48,48,48,48,48,
                 50,50,50,50,50,50,50,50,50,50,50,50,50,50,50,51,51,51,51,51,51,51,51,52,52,52,52,52,52,52,
                 53,53,53,53,53,53,53,53,53,53)

## Define a function to process each file with progress messages
process_single_file <- function(file, sample_id, treatment, assembly, read_context, 
                                mincov, minqual, phred64, nolap, save_context, save_folder) {
  message(paste("Processing file:", file, "Sample ID:", sample_id, "Treatment:", treatment))
  result <- processBismarkAln(location = file,
                              sample.id = sample_id,
                              assembly = assembly,
                              read.context = read_context,
                              treatment = treatments,
                              mincov = mincov,
                              minqual = minqual,
                              phred64 = phred64,
                              nolap = nolap,
                              save.context = save_context,
                              save.folder = save_folder)
  message(paste("Completed processing file:", file))
  return(result)
}


# Process the files in parallel using pblapply for CpG context
cpg_list <- pblapply(seq_along(file_paths), function(i) {
  process_single_file(file_paths[i], sample_ids[i], treatments[i], "Pabies01", "CpG", 1, 5, FALSE, FALSE, NULL, getwd())
}, cl = num_cores)

# Combine the results into a methylRawList object
cpg.clones.rawlist <- methylRawList(cpg_list, treatment=treatments)

# Save the project: environment and history
save.image("/home/uni01/UFFF/chano/TGC/PUBLICATION/TBSEQ.STATS/.RData")
savehistory("/home/uni01/UFFF/chano/TGC/PUBLICATION/TBSEQ.STATS/.Rhistory")

# Save the methylRawList object to a file
saveRDS(cpg.unrel, file = "/home/uni01/UFFF/chano/TGC/PUBLICATION/TBSEQ.STATS/cpg.clones.rawlist.rds")


# Check the updated methylation data
print(cpg.clones.rawlist)

# Example of bimodal Histogram of % methylation per sample (CpG context)
getMethylationStats(cpg.clones.rawlist[[1]],plot=FALSE, both.strands = FALSE, labels=TRUE) # Plot percent methylation statistics for sample 1
getMethylationStats(cpg.clones.rawlist[[2]],plot=TRUE , both.strands = FALSE, labels=TRUE) # Plot percent methylation statistics for sample 2

## Ploting bimodal distribution of methylated Cs for all the samples (CpG context)
# Extract the methylation data for sample 1
sample1 <- cpg.clones.rawlist[[1]]

# Calculate the methylation percentages
methylation_percentages <- (sample1$numCs / (sample1$numCs + sample1$numTs)) * 100

# Create a density plot using ggplot2
df <- data.frame(methylation_percentages)
ggplot(df, aes(x = methylation_percentages)) +
  geom_density(colour = "blue", alpha = 0.5) +
  labs(title = "Density Plot of Methylation Percentages for Sample 1",
       x = "Methylation Percentage",
       y = "Density") +
  theme_minimal()

# Initialize an empty data frame to store methylation percentages and sample labels
all_samples_df <- data.frame(methylation_percentages = numeric(), sample = character())

# Loop through each sample in the methylRawList object
for (i in seq_along(cpg.clones.rawlist)) {
  sample <- cpg.clones.rawlist[[i]] # Extract the methylation data for the current sample
  methylation_percentages <- (sample$numCs / (sample$numCs + sample$numTs)) * 100 # Calculate the methylation percentages
  sample_df <- data.frame(methylation_percentages = methylation_percentages,sample = paste("Sample", i)) # Create a data frame for the current sample
  all_samples_df <- rbind(all_samples_df, sample_df) # Combine with the main data frame
}

# Save the graph to a file
tiff(file="/home/uni01/UFFF/chano/TGC/PUBLICATION/figure4b.tbseq.methperc.breeding.tiff",width=12,height=8,units="in",res=300)
# Create a density plot using ggplot2 with different colors for each sample
ggplot(all_samples_df, aes(x = methylation_percentages, group = sample)) +
  geom_density(color = "cornflowerblue") +
  labs(title = "b)",
       x = "Methylation Percentage",
       y = "Density") +
  theme_minimal()+
  theme(legend.position = "none") +
  theme(axis.title = element_text(size = 15),
        axis.text=element_text(size=15),  
        plot.title = element_text(size=20))
dev.off()
rm(all_samples_df) # To free space
