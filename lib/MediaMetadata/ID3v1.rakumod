use MediaMetadata::Type;

unit class MediaMetadata::ID3v1 does MetadataInterface;

has IO::Handle $.handle;
has $!data;

submethod TWEAK {
    $!handle.seek(-128, SeekFromEnd);
    $!data = $!handle.read(128);

    my Str $header = $!data.subbuf(0, 3).decode('utf-8');
    if $header ne 'TAG' {
        die 'Invalid ID3v1 header'
    }
}

method title {
    $!data.subbuf(3,  30).decode('utf-8').subst(/\x[0000]+/, '');
}

method artist {
    $!data.subbuf(33,  30).decode('utf-8').subst(/\x[0000]+/, '');
}

method album {
    $!data.subbuf(63, 30).decode('utf-8').subst(/\x[0000]+/, '');
}

method year {
    $!data.subbuf(93, 4).decode('utf-8').subst(/\x[0000]+/, '');
}

method comment {
    my $comment-bytes = $!data.subbuf(97, 30);
    $comment-bytes[28] == 0
    ?? $comment-bytes.subbuf(0, 28).decode('utf-8').subst(/\x[0000]+/, '')
    !! $comment-bytes.decode('utf-8').subst(/\x[0000]+/, '');
}

method track {
    my $comment-bytes = $!data.subbuf(97, 30);
    $comment-bytes[28] == 0 ?? ($comment-bytes[29], 0) !! (0, 0)
}

method genre {
    my $GENRES;
    my $genre-idx = $!data.subbuf(127, 1)[0];
    $genre-idx < $GENRES.elems ?? $GENRES[$genre-idx] !! 255
}

method composer { '' }

method disc { 0, 0 }

method lyrics { '' }

method format {
    my $comment-bytes = $!data.subbuf(97, 30);
    $comment-bytes[28] == 0 ?? ID3v1_1 !! ID3v1
}

method filetype { MP3 }

