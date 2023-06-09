# Sync Download and HPC
This ansible script synchronizes PUB and ACA downloadable content with /appl/data/kielipankki on CSC' HPC environment (Puhti)

## Usage

- cd Kielipankki/hpc_directory
- ansible-playbook -i inventories/hpc site.yml

## Adding new material

- cd Kielipankki/hpc_directory
- edit packages in group_vars/all, see examples and the small documentation

## How it works

The script adds md5 checksums to all zips to sync and downloads them also to the target directory into .checksum.
Checksums are recalculated if they are missing or the zip is newer than the checksumfile.
Syncing only happens with the checksum files on Download and HPC differ.