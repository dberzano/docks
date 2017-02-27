Portable Aurora client
======================

Run with:

    ./run-aurora.sh [--rebuild]

The `--rebuild` option rebuilds the container.

Requirement: `userkey.pem` and `usercert.pem` in your `~/.globus` directory.

Example
-------

    aurora job inspect build/mesosci/devel/aliphysics_github_ci continuos-integration.aurora
    aurora job inspect build/mesosci/devel/aliroot_github_ci continuos-integration.aurora
