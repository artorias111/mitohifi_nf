#!/usr/bin/env nextflow

process runMitoHiFi {
    conda '/data2/work/local/miniconda/envs/mitohifi_env'
    publishDir 'results/Mitohifi_local', mode: 'copy'
    
    input:
    path readsDir
    path refFasta
    path refGbk

    output:
    path "*"

    script:
    """
    export PATH="${params.mitofinder_singularity_path}:\$PATH"

    # Verify MitoFinder is accessible
    which mitofinder || echo "ERROR: MitoFinder not found in PATH"

    python ${params.mitohifi_local_repo}/mitohifi.py \
    -r ${readsDir} \
    -f ${refFasta} \
    -g ${refGbk} \
    -t ${params.nthreads} \
    -o 5
    """
}
