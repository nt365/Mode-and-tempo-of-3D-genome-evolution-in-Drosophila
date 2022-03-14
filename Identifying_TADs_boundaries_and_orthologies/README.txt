Versions:
python: 3.6.13
bwa: 0.7.17
Trimmomatic: 0.39
samtools: 1.12
bedtools: 2.30.0
hicexplorer (rules build_matrix and correct_matrix): 2.2
hicexplorer (rule find_TADs): 3.6
halLiftover: 2.1
(halLiftover requires gcc 5.4 and java 14.0.1 to be loaded to run)



Notes:
- pipeline is written so accomodate lack of replicates. For datasets without replicates, put the species name in "nd" in the .json and omit from "d2" list.
- if you need to rerun the pipeline, delete the ENTIRE domain_hal folder first otherwise it will not rerun correctly. 
