#!/bin/bash

# ==== Đường dẫn ====
INPUT_DIR="/mnt/data20tb/core_nt_database/core_nt_small/NIPT_pair_end/result/3_positive"
OUTPUT_FILE="${INPUT_DIR}/summary.tsv"

# Tạo lại file output với header
echo -e "Sample\tNumReads\tVirus" > "$OUTPUT_FILE"

# Duyệt từng file .tsv
for file in "$INPUT_DIR"/*.tsv; do
    sample_name=$(basename "$file" .tsv)

    # Kiểm tra nếu file có nhiều hơn 1 dòng (header + ít nhất 1 dòng dữ liệu)
    line_count=$(wc -l < "$file")
    if [[ "$line_count" -gt 1 ]]; then
        # Bỏ dòng header và ghi thêm vào summary
        tail -n +2 "$file" | awk -v name="$sample_name" -F'\t' '{
            print name "\t" $1 "\t" $2
        }' >> "$OUTPUT_FILE"
    else
        echo "⚠️ Bỏ qua: $sample_name (không có kết quả)"
    fi
done

echo "🎯 Đã tạo file tổng hợp: $OUTPUT_FILE"

