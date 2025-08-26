# Mircobiome-in-PGT-A

- Data input: FASTA FILE chứa reads.
- Data output: TSV FILE chứa số reads của các con virus được map trúng.

## Create enviroment
conda create -n blast conda activate blast conda install -c bioconda -c conda-forge blast samtools seqkit fastp art -y

## BLAST
Thực hiện lần lượt các file .sh từ 1 - 5 như đã đính kèm
