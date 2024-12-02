#!/usr/bin/perl -w

use strict;

my $SUFFIX = "wav";
my $PAUSE_FILE = "_.$SUFFIX";
my $CONCAT = "sox";
my $PLAY = "play";

my @outs;
while (<STDIN>) {
	chomp;
	my @words = map(lc, split /\s+/);
	my @wavs;
	foreach my $word (@words) {
		my $wav = "$word.$SUFFIX";
		$word = s/[^a-zA-ZæøåÆØÅ]//g;
		unless (-f $wav) {
			print STDERR "Warning: File $wav not found!\n";
			next;
		}
		push @wavs, $wav;
	}

	if (-f $PAUSE_FILE) {
		push @wavs, $PAUSE_FILE;
		unshift @wavs, $PAUSE_FILE;
	}
	else {
		print STDERR "Warning: Pause file $PAUSE_FILE not found!\n";
	}

	my $out = "out-" . scalar @outs . ".$SUFFIX";
	push @outs, $out;

	my $cmd = "$CONCAT @wavs $out";
	system("$CONCAT @wavs $out") and die ("Failed to run '\$ $cmd': ($?) $!\n")
}

foreach my $out (@outs) {
	system("$PLAY $out") and die ("Failed to run $PLAY: $!\n");
}
