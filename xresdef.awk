/^\w/ {
    defined[$1] = $2
    gsub(/\s/, "_", $1)
    printf "#define %s\t%s\n", $1, toupper($2)
    colors[i++] = $1
}

/^\/alias .+=.+$/ {
    split($0, a, "=")
    
    lhs = a[1]
    rhs = a[2]

    sub(/^\/alias\s+/, "", lhs)
    sub(/\s*$/, "", lhs)
    
    sub(/^\s*/, "", rhs)
    sub(/\s*$/, "", rhs)

    printf "#define %s\t%s\n", lhs, defined[rhs]
}

END {
    print
    for (i = 0; i < 16; i++) printf "*color%d: %s\n", i, colors[i]
}
