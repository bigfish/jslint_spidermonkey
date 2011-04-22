#!/usr/bin/perl
#correct(reduce) the line numbers given by lint using the given argument 
# - which is the number of lines in the options file used by jslint script

$decrement = shift;
$filename = shift;

while(<STDIN>)
{
	my($line) = $_;
	chomp($line);
	if($line =~ /Lint at line (\d*)/g ){
			$line_num = $1;
			$line_num = $line_num - $decrement;
			$line =~ s/Lint at line (\d*)/Lint at line $line_num/g;
            $line = "$filename:$line";
	}
	print $line."\n";
}

