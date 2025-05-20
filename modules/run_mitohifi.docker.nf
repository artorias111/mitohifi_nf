#!/usr/bin/env nextflow

process runMitoHiFi {
    publishDir 'results/MitoHiFi', mode: 'copy'
    container "${params.mitohifi_docker_container}"
    
    // containerOptions "--bind /data2/work:/mnt"

    input:
    path readsDir // Reads Directory
    path refFasta // Reference fasta file
    path refGbk // Reference Genbank file

    output: 
    path "final_mitogenome.fasta"
    path "final_mitogenome.gb"
    path "final_mitogenome.annotation.png"

    script:
    
    """
    mitohifi.py \
    -r ${readsDir} \
    -f ${refFasta} \
    -g ${refGbk} \
    -t ${params.nthreads} \
    -o 5
    """

}
