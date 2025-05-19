#!/usr/bin/env nextflow


// Find reference mitochondrial genome


process findMitoRef {
    conda '/data2/work/local/miniconda/envs/mitohifi_env'

    output:
    path "refs"

    script:
    """
    python {}/findMitoReference.py \
    --species ${params.species} \
    --outfolder "refs"
    --min_length 14000
    """
