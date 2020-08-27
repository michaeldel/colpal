/^\w/ {
    defined[$1] = $2
    gsub(/\s/, "_", $1)
    printf "%s:\t'%s'\n", $1, toupper($2)
}

/^\/alias .+=.+$/ {
    split($0, a, "=")
    
    lhs = a[1]
    rhs = a[2]

    sub(/^\/alias\s+/, "", lhs)
    sub(/\s*$/, "", lhs)
    
    sub(/^\s*/, "", rhs)
    sub(/\s*$/, "", rhs)

    printf "%s:\t'%s'\n", lhs, defined[rhs]
}
