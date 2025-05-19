#!/usr/bin/env nextflow

include { runMitoHiFi } from './modules/run_mitohifi.docker.nf'
// include { runMitoHiFi } from './modules/run_mitohifi.local.nf'

workflow {
    runMitoHiFi(params.readsDir, params.refFasta, params.refGbk) 
}
