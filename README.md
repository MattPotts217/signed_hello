# signed_hello

1. a minimal C program in a container image,
2. OCI image metadata in the Dockerfile,
3. SBOM + provenance attestations during CI build,
4. keyless Sigstore signing in GitHub Actions.


This repository is intentionally small.

- `hello.c` is the application.
- `Dockerfile` builds a tiny static binary and adds OCI metadata labels.
- `.github/workflows/build-sign.yml` builds the image, pushes it to GHCR, attaches SBOM and provenance attestations, and signs the image digest with Cosign using GitHub Actions OIDC.

## Image location

By default, the workflow publishes to:

```text
ghcr.io/CSC468-WCU/signed_hello
```
