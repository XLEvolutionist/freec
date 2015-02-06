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
	my $dir ="/group/jrigrp4/freec/output/$ARGV[1]".$_;
	mkdir $dir;
	open(OUT , ">/group/jrigrp4/freec/config/config_$_.conf" ) || die;
	print OUT "[general]
	
chrLenFile = /group/jrigrp4/freec/chrLenFile.txt
#coefficientOfVariation = 0.062
ploidy = 2
chrFiles=/group/jrigrp4/freec/maize3/
maxThreads=10
sex=XX
BedGraphOutput=TRUE
outputDir=/group/jrigrp4/freec/output/$ARGV[1]$_
#breakPointThreshold = -.002;
window = 75000
#degree=3
#intercept = 0

[sample]

mateFile = $ARGV[0]$_
inputFormat = BAM
mateOrientation = FR

#mateCopyNumberFile = HCC1143.arachne_sample.cpn

[control]

#mateFile = HCC1143_BL.arachne
#inputFormat = BAM
#mateOrientation = FR

#mateCopyNumberFile = HCC1143_BL.arachne_control.cpn";
	close OUT;

} #foreach

exit;
