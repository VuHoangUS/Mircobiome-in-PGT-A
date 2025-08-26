#!/bin/bash

# ==== Cấu hình ====
FASTA_FOLDER="/mnt/data20tb/core_nt_database/core_nt_small/PGT-A_sample/fasta/20240806"
DB_PATH="/mnt/data20tb/core_nt_database/core_nt_small/Database/full_virus/viral.genomic"
OUT_DIR="/mnt/data20tb/core_nt_database/core_nt_small/PGT-A_sample/result_virus/20240806"
THREADS=40
EVALUE=1e-5
MAX_TARGET=5

mkdir -p "$OUT_DIR/1_raw"

# === Chạy BLAST cho từng file FASTA ====
for fasta_file in "$FASTA_FOLDER"/*.fasta; do
sample_name=$(basename "$fasta_file" .fasta)

echo "👉 Running BLAST for: $sample_name"

blastn -query "$fasta_file" \
       -db "$DB_PATH" \
       -outfmt '6 qseqid sseqid evalue bitscore sgi sacc staxids sscinames scomnames stitle pident length mismatch gapopen qstart qend sstart send qcovs' \
       -evalue "$EVALUE" \
       -max_target_seqs "$MAX_TARGET" \
       -num_threads "$THREADS" \
       -out "$OUT_DIR/1_raw/${sample_name}.tsv" \
       -dust yes \
       -soft_masking true

echo "✅ Finished BLAST for: $sample_name"

done

echo "🎯 BLAST hoàn tất. Kết quả ở: $OUT_DIR/1_raw"