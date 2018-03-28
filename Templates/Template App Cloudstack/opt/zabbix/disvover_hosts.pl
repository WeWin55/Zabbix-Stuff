#!/usr/bin/perl
use strict;
use warnings;
use JSON qw( decode_json encode_json );

my %output;

$output{'data'} = [];

my $json = `curl -s -k "https://localhost/client/api?apikey=##API-KEY##&command=listHosts&response=json&signature=##SIGNATUR##" | jq '.listhostsresponse'`;
my $decoded = decode_json($json);
my @host = @{ $decoded->{'host'} };

foreach my $f ( @host ) {
  my %hash;
  $hash{'{#PLNAME}'} = $f->{'name'};
  push( @{$output {'data'}}, \%hash);
}

print encode_json \%output;

