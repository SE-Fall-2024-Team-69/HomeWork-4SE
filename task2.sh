# Count "CSC510" occurrences in files containing "sample"
grep -rl "sample" . | while read file; do
    count=$(grep -o "CSC510" "$file" | wc -l)
    # MacOS does not support -c%s to get this file size.
    size=$(stat -f%z "$file")
    if [ "$count" -ge 3 ]; then
        echo "$count $size $file"
    fi
done | sort -k1,1nr -k2,2nr | gawk '{sub(/file_/, "filtered_", $3); print $3}'
