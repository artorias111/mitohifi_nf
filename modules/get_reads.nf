#!/usr/bin/env nextflow

process getReads {
    conda '/data2/work/local/miniconda/envs/seqkit'

    input: 
    path fastq_reads

    output:
    path 'reads.fasta.gz'

    script:
    """
    seqkit fq2fa $fastq_reads/*.fastq.gz \
    -o reads.fasta.gz
    """

}
