unit module MediaMetadata::Types;

enum Filetype is export <
    UnknownFiletype
    MP3
>;

enum Format is export <
    UnknownFormat
    ID3v1
    ID3v1_1
    ID3v2_2
    ID3v2_3
    ID3v2_4
>;

role MetadataInterface is export {
    #| Returns the metadata format used to encode the data.
    method format(--> Format) { ... }

    #| Returns the media file's filetype.
    method filetype(--> Filetype) { ... }

    #| Returns the track's title.
    method title(--> Str) { ... }

    #| Returns the track's artist.
    method artist(--> Str) { ... }

    #| Returns the track's album.
    method album(--> Str) { ... }

    #| Returns the track's composer.
    method composer(--> Str) { ... }

    #| Returns track's genre.
    method genre(--> Str) { ... }

    #| Returns the track's year.
    method year(--> Int) { ... }

    #| Returns the track number and total number of tracks.
    method track(--> List) { ... }

    #| Returns the disc number and total number of discs.
    method disc(--> List) { ... }

    #| Returns the comment if it exists. Otherwise, returns the empty string.
    method comment(--> Str) { ... }

    #| Returns the lyrics if it exists. Otherwise, returns the empty string.
    method lyrics(--> Str) { ... }
}
