#!/bin/bash

#SBATCH --partition=genetics_1    # Partition (job queue)
#SBATCH --job-name=align         # Assign an 8-character name to your job, no spaces
#SBATCH --nodes=1                # Number of compute nodes
#SBATCH --ntasks=1               # Processes (usually = cores) on each node
#SBATCH --cpus-per-task=28       # Threads per process (or per core)
#SBATCH --export=ALL             # Export you current environment settings to the job environment
#SBATCH --time=72:00:00
#SBATCH --mem=20G
#SBATCH --output=/scratch/nt365/gth/slurm-%A_%a.out

#GenomeThreader version 1.7.1
gth -v -genomic ../novogene_deep_HiC/references/dmel-all-chromosome-r6.22_extract_ABCDEF_renamed.fasta -protein ../drosophila_orthofinder_seqs/primary_transcripts/Dmel.faa -o dmel.gth
gth -v -skipalignmentout -gff3out -genomic ../novogene_deep_HiC/references/dmel-all-chromosome-r6.22_extract_ABCDEF_renamed.fasta -protein ../drosophila_orthofinder_seqs/primary_transcripts/Dmel.faa -o dmel.gff
gffread dsim.gff -g ../novogene_deep_HiC/references/dmel-all-chromosome-r6.22_extract_ABCDEF_renamed.fasta -y dmel_gff_protein.fasta -F
gffread dmel.gff -g ../novogene_deep_HiC/references/dmel-all-chromosome-r6.22_extract_ABCDEF_renamed.fasta -x dmel_gff_V.fasta -V 
