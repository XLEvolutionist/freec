#!usr/bin/perl
use strict;
use warnings;

# usage script.pl /path/to/the/bam/files
###
# Read in the .bam files
###
opendir my $dir, "$ARGV[0]" or die "Cannot open directory: $!";
my @files = readdir $dir;
closedir $dir;

@files = grep ( /.bam$/ , @files);

###
# now create a freec config script for each bam file.
###
foreach ( @files ) {
	mkdir /group/jrigrp4/freec/output/$_;
	open(OUT , ">config_$_.txt" ) || die;
	print OUT "[general]
	
chrLenFile = /group/jrigrp4/freec/chrLenFile.txt
coefficientOfVariation = 0.062
ploidy = 2
chrFiles=/group/jrigrp4/freec/maize3/
maxThreads=10
sex=XX
outputDir=/group/jrigrp4/freec/$_
#breakPointThreshold = -.002;
window = 1000
#degree=3
#intercept = 0

[sample]

mateFile = /group/jrigrp4/cn.mops/data/$_
inputFormat = BAM
mateOrientation = FR

#mateCopyNumberFile = HCC1143.arachne_sample.cpn

[control]

mateFile = HCC1143_BL.arachne
inputFormat = BAM
mateOrientation = FR

#mateCopyNumberFile = HCC1143_BL.arachne_control.cpn"
	close OUT;

} #foreach

exit;