![Python](https://badgen.net/badge/language/Python/green)
![Python](https://badgen.net/badge/Python/3.10/green)
[![GitHub license](https://badgen.net/github/license/maxwai/external-ip-check)](LICENSE)

# External IP Check

The source code used to log when exactly (exact to the minute) the external IP changes

## Getting Started

This is only supposed to run in a docker container.

### Needed environment variables

- `PUID` : The User ID (UID gotten from `id`) that all files should be created as, this is so that there are no permission problems outside of the docker container
- `PGID` : The Group ID (GID gotten from `id`) that all files should be created as, this is so that there are no permission problems outside of the docker container.

### Paths

- `/usr/src/app/appdata`: the appdata Folder.