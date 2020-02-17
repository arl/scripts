# Sort a csv file by a given column

',' separator, sort on the 2nd column (numerically)

    sort -t',' -k2n file.csv


# Pretty-print a CSV file

    perl -pe 's/((?<=,)|(?<=^)),/ ,/g;' "$@" | column -t -s,

Or use `csvpretty` script
