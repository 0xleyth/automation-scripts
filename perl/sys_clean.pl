#!/usr/bin/perl

# Perl script to clean up installation packages
use strict;
use warnings;

# Define a subroutine to run commands and announce actions
sub run_command {
    my ($command, $message) = @_;
    print "$message\n";       # Print what is going to happen
    system($command);         # Execute the command
}

# Clean up obsolete .deb files from the package cache
run_command(
    "sudo apt-get autoclean",
    "Running autoclean: Removing obsolete package files..."
);

# Clear out the local repository of retrieved package files
run_command(
    "sudo apt-get clean",
    "Running clean: Clearing out the local repository of retrieved package files..."
);

# Remove packages that were automatically installed and are no longer needed
run_command(
    "sudo apt-get autoremove -y",
    "Running autoremove: Removing packages that are no longer needed..."
);

print "Cleanup of installation packages completed.\n";
