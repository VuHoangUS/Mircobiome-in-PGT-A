#!/bin/bash

# ==== Cấu hình ====
OUT_DIR="/mnt/data20tb/core_nt_database/core_nt_small/PGT-A_sample/result_virus/20240820"
MIN_PIDENT=95
MIN_LENGTH=32

mkdir -p "$OUT_DIR/2_filtered"

# ==== Lọc kết quả ====
for tsv_file in "$OUT_DIR/1_raw"/*.tsv; do
sample_name=$(basename "$tsv_file" .tsv)

echo "👉 Filtering: $sample_name"

awk -F '\t' -v pid="$MIN_PIDENT" -v len="$MIN_LENGTH" '
  ($11 >= pid) && ($12 >= len) && !(qid_seen[$1]++) 

' "$tsv_file" > "$OUT_DIR/2_filtered/${sample_name}.tsv"
echo "✅ Finished filtering: $sample_name"
done

echo "🎯 Lọc hoàn tất. Kết quả ở: $OUT_DIR/2_filtered"

