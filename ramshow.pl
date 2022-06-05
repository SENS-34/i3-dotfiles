#!/usr/bin/perl
# RAM stuff

my $total = `grep -e "^MemTotal" -m 1 /proc/meminfo`;
$total =~ s/([^0-9]*)([0-9]*)(.*)$/$2/;

my $available = `grep -e "^MemAvailable" -m 1 /proc/meminfo`;
$available =~ s/([^0-9]*)([0-9]*)(.*)$/$2/;

my $memusage = 100 - ($available / $total * 100);
printf "%02d\n","$memusage";
