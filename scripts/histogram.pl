use strict;
use GD::Graph::histogram;
use GD::Graph::Data;

my @data;
for (my $i = 0; $i < 100; $i++)
{
	push(@data, rand(50));
}

my $my_graph = GD::Graph::histogram->new;

my $name = 'histogram';

print STDERR "Processing $name\n";

$my_graph->set( 
	x_label         => 'X Label',
	y_label         => 'Count',
	title           => 'A Simple Histogram Chart',
	x_labels_vertical => 1,
	bar_spacing     => 0,
	shadow_depth    => 1,
	shadowclr       => 'dred',
	transparent     => 0,
	# histogram_bins => 4
	# histogram_type => 'percentage'
) 
or warn $my_graph->error;

$my_graph->plot(\@data) or die $my_graph->error;

my $ext = $my_graph->export_format;

open(OUT, ">$name.$ext") or die "Cannot open $name.$ext for write: $!";
binmode OUT;
print OUT $my_graph->gd->$ext();
close OUT;
