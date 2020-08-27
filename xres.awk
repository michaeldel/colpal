/^\w/ {
    printf "color%d: %s\n", NR, toupper($2)
}
