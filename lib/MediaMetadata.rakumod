unit class MediaMetadata:ver<0.0.1>;

class MP3 {

}

=begin pod

=head1 NAME

MediaMetadata - read metadata from media files such as MP3, MP4, etc.

=head1 SYNOPSIS

=begin code :lang<raku>

use MediaMetadata;

my $mp3 = MediaMetadata::MP3.new('football-head--flamingosis.mp3');
given $mp3 {
    say .title;  #=> «Football Head␤»
    say .artist; #=> «Flamingosis␤»
    say .album;  #=> «Pleasure Palette␤»
    say .year;   #=> «2015␤»
}

=end code

=head1 DESCRIPTION

=head1 AUTHOR

=item Luis F. Uceta

=head1 COPYRIGHT AND LICENSE

Copyright 2021 Luis F. Uceta

This library is free software; you can redistribute it and/or modify it under the Artistic License 2.0.

=end pod
