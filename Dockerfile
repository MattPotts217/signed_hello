ARG ALPINE_VERSION=3.22

FROM alpine:${ALPINE_VERSION} AS build
RUN apk add --no-cache build-base
WORKDIR /src
COPY hello.c .
mkdir -p /out
RUN gcc -static -Os -s -o /out/hello hello.c

FROM scratch

ARG VERSION=0.1.0-dev
ARG VCS_REF=unknown
ARG CREATED=unknown

LABEL org.opencontainers.image.title="signed_hello" \
      org.opencontainers.image.description="Minimal C hello-world container with OCI metadata, SBOM, provenance, and keyless Sigstore signing" \
      org.opencontainers.image.version="${VERSION}" \
      org.opencontainers.image.revision="${VCS_REF}" \
      org.opencontainers.image.created="${CREATED}" \
      org.opencontainers.image.licenses="MIT" \
      org.opencontainers.image.vendor="West Chester University demo" \
      org.opencontainers.image.source="https://github.com/REPLACE_ME/REPLACE_ME"

COPY --from=build /out/hello /hello

USER 65532:65532
ENTRYPOINT ["/hello"]
