#!/bin/sh

script_dir=$(
    CDPATH= cd -- "$(dirname -- "$0")" && pwd
) || exit 1

usage() {
    printf 'Uso: %s GENE_ID\n' "$(basename "$0")" >&2
}

decode_solution() {
    awk -F '-' '
        {
            out = ""
            for (i = 1; i <= NF; i++) {
                out = out sprintf("%c", $i - 1)
            }
            print out
        }
    ' "$script_dir/.solution"
}

if [ "$#" -ne 1 ]; then
    usage
    exit 1
fi

case "$1" in
    ARG10)
        hit=$(decode_solution)
        printf '1 Hit: %s\n' "$hit"
        ;;
    *)
        printf '0 Hits\n'
        ;;
esac
