#!/usr/bin/perl

my $filename = shift;

while(<STDIN>)
{
	my($line) = $_;
	chomp($line);

	#skip empty lines
	if ($line !~ /^\s*$/) {
		#prefix error lines with filename
		if ($line =~ /^Lint/) {
		
			print $filename . ":" . $line . "\n";

		} elsif ($line =~ /jslint: No problems found\./) {
			#no news is good news
			#print $filename . ":" . $line . "\n";
		} else {
			#echo any other lines
			print $line . "\n";

		}

	}
}

