#!/usr/bin/env nextflow


// Find reference mitochondrial genome


process findMitoRef {
    container "${params.mitohifi_docker_container}"

    input:
    val species

    output:
    path 'refs/*.gb' , emit :ref_gb_file
    path 'refs/*.fa*' , emit :ref_fa_file

    script:

    """
    findMitoReference.py \
    --species ${species} \
    --outfolder "refs" \
    --min_length 14000
    """

}
