#!/usr/bin/perl
#use strict;
#use warnings;
#
# HOW TO USE: pass the name of your input file, your outputfile and the character string you want to remove from the file
#  as arguments when running this script
# (e.g. ./remove_commas.pl something.psv something_new.psv †¥ø )
#
# Date: September 4, 2015
#
# Written By: Bryan King | EMC Professional Services
#
#
my $input_file  = $ARGV[0];
my $output_file = $ARGV[1];
my $remove_char = $ARGV[2];
open (my $file_handle_out, '>', $output_file)
     or die "Cannot open file $output_file' $!";
     open(my $file_handle, '<:encoding(UTF-8)', $input_file)
       or die "Cannot open file '$input_file' $!";
     while (my $record = <$file_handle>)
    {
      chomp ($record);
      $record =~ s/$remove_char//g;
      print {$file_handle_out} "$record\n";
    }
close $file_handle_out;
close $file_handle;
