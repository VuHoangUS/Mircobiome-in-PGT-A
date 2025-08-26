#!/bin/bash

# ==== Cấu hình ====
OUT_DIR="/mnt/data20tb/core_nt_database/core_nt_small/PGT-A_sample/result_virus/20240820"
PHAGE_TAXID_FILE="/mnt/data20tb/core_nt_database/core_nt_small/Database/full_virus/phage_taxids.txt"

mkdir -p "$OUT_DIR/3_filtered_phage"

# ==== Lọc kết quả ====
for tsv_file in "$OUT_DIR/2_filtered"/*.tsv; do
  sample_name=$(basename "$tsv_file" .tsv)

  echo "👉 Filtering phage: $sample_name"

  awk -F '\t' -v OFS='\t' -v phage_list="$PHAGE_TAXID_FILE" '
    BEGIN {
      while ((getline line < phage_list) > 0) {
        phage[line] = 1
      }
    }
    !($7 in phage)  # cột 7 là staxids (taxid)
  ' "$tsv_file" > "$OUT_DIR/3_filtered_phage/${sample_name}.tsv"

  echo "✅ Finished filtering phage: $sample_name"
done

echo "🎯 Lọc phage hoàn tất. Kết quả ở: $OUT_DIR/3_filtered_phage"
