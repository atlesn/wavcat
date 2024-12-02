# wavcat - Sound file concatenator and player

Concatenate pre-recorded wav files together based on an input file with phrases.

## Dependencies

-   perl
-   sox

## Usage

    ./concat_and_play.pl < INPUT FILE

## What happens

The script will look for `.wav` files corresponding to each word in the input file. Any non-letter characters will be stripped. If a file is not found for a particular word, a warning is printed. This should then be recorded and saved before the script is re-run.

The files found for a line will be concatenated into a new file prefixed with `out-` followed by the line number. A pause will be added to the beginning and end of every new file, the pause is retrieved from the special file `_.wav`.

## Example

If the following `in.txt` is provided,

    Hello world.

And the utility is run like

    ./concat_and_play.pl < in.txt

the utility will attempt to concatenate the files `_.wav`, `hello.wav`, `world.wav` and `_.wav` into the new file `out-0.wav`. The new file is then played.
