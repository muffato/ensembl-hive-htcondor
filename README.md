
HTCondor Meadow for eHive
=========================

[![Build Status](https://travis-ci.org/muffato/ensembl-hive-htcondor.svg?branch=master)](https://travis-ci.org/muffato/ensembl-hive-htcondor)

[eHive](https://github.com/Ensembl/ensembl-hive) is a system for running computation pipelines on distributed computing resources - clusters, farms or grids.
This repository is the implementation of eHive's _Meadow_ interface for the [HTCondor](https://research.cs.wisc.edu/htcondor/) job scheduler.


Version numbering and compatibility
-----------------------------------

This repository is versioned the same way as eHive itself, and both
checkouts are expected to be on the same branch name to function properly.
* `master` is the development branch and follows eHive's `master`. We
  primarily maintain eHive, so both repos may sometimes go out of sync
  until we upgrade the HTCondor module too
When future stable versions of eHive will be released (named `version/2.5`
etc) we'll create such branches here as well.


Testing the HTCondor meadow
---------------------------

The module is continuously tested under HTCondor 8.0.5 as shipped in
Ubuntun 14.04 (Trusty) thanks to the Docker infrastructure.
We ship several Dockerfiles, two of them being available on the Docker Hub.

1. [muffato/docker-htcondor](https://hub.docker.com/r/muffato/docker-htcondor/)
   This container only adds HTCondor to a service-oriented Ubuntu.
2. [muffato/ensembl-hive-htcondor](https://hub.docker.com/r/muffato/ensembl-hive-htcondor/)
   This container extends muffato/docker-htcondor by adding the
   ensembl-hive and ensembl-hive-htcondor repositories (and their
   dependencies)
3. [scripts/docker-ehive-htcondor-test/Dockerfile](scripts/docker-ehive-htcondor-test/Dockerfile)
   defines a container that is more suitable for development and testing of
   the present repository.

To build the latter, you first need to edit the `HIVE_CONDOR_LOCATION` and
`EHIVE_LOCATION` variables in
`scripts/docker-ehive-htcondor-test/Dockerfile`.
The configuration assumes that you have existing checkouts of both
ensembl-hive and ensembl-hive-htcondor on the host (somewhere under your
home directory), and shares the host filesystem with the container.

Run this from the root directory of this repo:

```
# To build the image (only the first time)
docker build -t docker-ehive-htcondor-test scripts/docker-ehive-htcondor-test/

# To run a new container
./scripts/docker-ehive-htcondor-test/start_docker.sh
# which actually does this (run one or the other)
docker run -it -v "$HOME:$HOME" docker-ehive-htcondor-test
```

Contributors
------------

This module has been written by [Matthieu Muffato](https://github.com/muffato) (EMBL-EBI).


Contact us
----------

eHive is maintained by the [Ensembl](http://www.ensembl.org/info/about/) project.
We (Ensembl) are only using Platform LSF to run our computation
pipelines, and can only test HTCondor on the Docker image indicated above.

There is eHive users' mailing list for questions, suggestions, discussions and announcements.
To subscribe to it please visit [this link](http://listserver.ebi.ac.uk/mailman/listinfo/ehive-users)

