# simple ffmpg script to turn a video file into a kden live usable audio file

v2w() {
    if [ -z "$1" ]; then
        echo "Error: Please provide an input MP4 file."
        echo "Usage: v2w input.mp4 [output_name.wav]"
        return 1
    fi

    # If you don't provide a second argument, it auto-names it based on the input file
    local output="${2:-${1%.*}.wav}"

    ffmpeg -i "$1" -vn -c:a pcm_s16le -ar 48000 "$output"
    echo
    echo -e "\e[32mEncoding DONE\e[0m"
}
