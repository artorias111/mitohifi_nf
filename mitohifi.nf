#!/usr/bin/env nextflow

include { runMitoHiFi } from './modules/run_mitohifi.docker.nf'
// include { runMitoHiFi } from './modules/run_mitohifi.local.nf'

include { findMitoRef } from './modules/find_mito_ref.nf'

include { getReads } from './modules/get_reads.nf'

workflow {

    // find mito reference from genbank
    findMitoRef(params.species)
    getReads(params.readsDir)

    // run mitohifi
    runMitoHiFi(getReads.out, 
        findMitoRef.out.ref_fa_file, 
        findMitoRef.out.ref_gb_file)

}
