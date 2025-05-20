# mitohifi_nf

A nextflow wrapper of mitohifi. \
Example usage:

```
nextflow run mitohifi.nf --species '"Notothenia coriiceps"' --ReadsDir "/absolute/path/to/hifi/reads" --nthreads 10
```
Default `nthreads` is 18. \
Note: Don't forget the double quotes (`'"species name"'`) in the `--species` flag. The pipeline will crash if ignored. This is due to the behavior of mitoHiFi's `findMitoReference.py`, which expects the species name in double quotes. 


