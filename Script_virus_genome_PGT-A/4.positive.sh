#!/bin/bash

# ==== Đường dẫn ====
INPUT_DIR="/mnt/data20tb/core_nt_database/core_nt_small/PGT-A_sample/result_virus/20240814/2_filtered"
OUTPUT_DIR="/mnt/data20tb/core_nt_database/core_nt_small/PGT-A_sample/result_virus/20240814/3_positive"

# Tạo thư mục output nếu chưa có
mkdir -p "$OUTPUT_DIR"

# ==== Xử lý từng file .tsv trong thư mục input ====
for input_file in "$INPUT_DIR"/*.tsv; do
    # Lấy tên file không có đuôi
    filename=$(basename "$input_file" .tsv)
    
    # Đặt đường dẫn output
    output_file="$OUTPUT_DIR/${filename}.tsv"
    
    echo "👉 Đang xử lý: $filename"

    # Xử lý: đếm số lần xuất hiện của mỗi taxid (cột 2) và lấy tên virus tương ứng (cột 8)
    awk -F'\t' '{
        count[$2]++;
        name[$2] = $8;
    }
    END {
        print "NumReads\tVirus";
        for (id in count) {
            print count[id] "\t" name[id];
        }
    }' "$input_file" > "$output_file"

    echo "✅ Đã tạo: $output_file"
done

echo "🎯 Đã hoàn tất xử lý tất cả file!"
