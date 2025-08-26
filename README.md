# Mircobiome-in-PGT-A

[SLIDE PIPELINE](https://docs.google.com/presentation/d/1d2WFg5x-Rt7lxNffcPU7t_VxyPxcVsq2h_iFGM67HQ8/edit?usp=sharing)

- **Data input:**
    + **FASTA FILE chứa reads** (/mnt/data20tb/core_nt_database/core_nt_small/PGT-A_sample/fasta),
    + **DATABASE Virus genome** (/mnt/data20tb/core_nt_database/core_nt_small/Database).
- **Data output:** **TSV FILE** chứa số reads của các con virus được map trúng (/mnt/data20tb/core_nt_database/core_nt_small/PGT-A_sample/result_virus).

## Create enviroment
conda create -n blast conda activate blast conda install -c bioconda -c conda-forge blast samtools seqkit fastp art -y

## BLAST
- Thực hiện lần lượt các file .sh từ 1 - 5 trong thư mục Script_virus_genome_PGT-A.
- Có thể thay đổi đường dẫn output nhưng không thay đổi đường dẫn input **Fasta file** và **Database**.


## Tổng quan kết quả
- Với 82 mẫu PGT-A (gồm các mẫu phôi bình thường và bất thường về số lượng NST; không tính mẫu chứng âm, chứng dương, mẫu test) thì không phát hiện reads của bất kỳ virus nào (ngoại trừ phage).
- Ở mẫu chứng dương thì có 2 mẫu chứng dương phát hiện được tối đa 6 reads của Human betaherpesvirus 6A.
- Human betaherpesvirus 6A thuộc họ Retrovirus có khả năng endogenization: gắn chèn DNA bản thân vào DNA vật chủ.
