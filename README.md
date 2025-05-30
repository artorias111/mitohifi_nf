# mitohifi_nf

A wrapper of mitohifi that actually works. 
Example usage:

```
nextflow run mitohifi.nf --species '"Notothenia coriiceps"' --readsDir /absolute/path/to/hifi/reads --nthreads 10
```
Default `nthreads` is 18. \
Note: **Do NOT forget to add two sets of quotes** (a double quote **nested** in a single quote) (`'"species name"'`) in the `--species` flag. The pipeline will crash if ignored. This is due to the behavior of mitoHiFi's `findMitoReference.py`, which expects the species name in double quotes. 

`/path/to/hifi/reads` is the path to a directory that contains one or more HiFi reads in a `fastq.gz` format. `seqkit` is used to convert and combine the fastq reads to a single `fasta.gz` intermediate file that can be safely removed once the pipeline run is completed. 

## Output directory
You should see two new directories after a succesful run: 
- `results/MitoHiFi` contains 3 files from the mitohifi output directory. `final_mitogenome.annotation.png`, `final_mitogenome.fasta` and `final_mitogenome.gb`, which are all self-explanatory.
- `work`: Standard nextflow output directory, contains all the intermediate process outputs, and also all the files of mitohifi output, if you want to dig deeper into the output files.


### Tools used in the pipeline:
- MitoHiFi: https://github.com/marcelauliano/MitoHiFi
- seqkit: https://github.com/shenwei356/seqkit
