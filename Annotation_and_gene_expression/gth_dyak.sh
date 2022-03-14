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
gth -v -genomic ../chain/my_genomes/dsim_muller_o.fasta -protein ../drosophila_orthofinder_seqs/Dsim.faa -o dsim.gth
gth -v -skipalignmentout -gff3out -genomic ../chain/my_genomes/dyak_muller_o.fasta -protein ../drosophila_orthofinder_seqs/primary_transcripts/Dyak.faa -o dyak.gff
gffread dsim.gff -g ../chain/my_genomes/dsim_muller_o.fasta -y dsim_gff_protein.fasta -F
gffread dyak.gff -g ../chain/my_genomes/dyak_muller_o.fasta -x dyak_gff_V.fasta -V 
