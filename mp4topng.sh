#!/bin/bash

usage()
{
    echo "usage: mp4topng [[[-i --input input_video ] [-o --output output_dir]] | [-h]]"
}

while [ "$1" != "" ]; do
    case $1 in
        -i | --input )
            shift
            input=$1
            ;;
        -o | --output )
            shift
            out_dir=$1
                                ;;
        -h | --help )
            usage
            exit
            ;;
        * )
            usage
            exit 1
    esac
    shift
done

if [[ "$out_dir" != */ ]]; then
    out_dir="${out_dir}/"
fi

# input_dir=$(dirname "${input}")

input_filename=$(basename "${input}")
input_filename="${input_filename%.*}"

gif_out="${out_dir}${input_filename}.gif"

ffmpeg \
    -i "${input}" \
    -r 15 \
    -vf "scale=512:-1,split[s0][s1];[s0]palettegen[p];[s1][p]paletteuse" \
    -ss 00:00:03 -to 00:00:06 \
    $gif_out


gif_dir="${out_dir}${input_filename}/"
mkdir $gif_dir

convert -coalesce $gif_out "${gif_dir}/images.png"

rm $gif_out
