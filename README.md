# wavcat - Sound file concatenator and player

## Dependencies

-   perl
-   sox

## Usage

    ./concat_and_play.pl < in.tx

## What happens

The script will look for a .wav file corresponding to each word in the input file. Any non-letter characters will be stripped. If a .wav file is not found for a particular word, a warning is printed.

The .wav files found for a line will be concatenated into a new file prefixed with `out-` followed by the line number. A pause will be added to the beginning and end of every file, the pause is expected to be in the special file `_.wav`.

## Example

If the following `in.txt` is provided,

    Hello world.

the utility will attempt to merge the files `_.wav` `hello.wav` `world.wav` `_.wav` into the new file `out-0.wav`. The new file is then played.
