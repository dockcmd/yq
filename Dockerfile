FROM buildpack-deps:18.10-curl as build
ARG YQ=2.4.1
RUN curl -Lo yq https://github.com/mikefarah/yq/releases/download/${YQ}/yq_linux_amd64 \
    && chmod +x ./yq

FROM alpine:3.11.2
COPY --from=build yq /usr/local/bin
ENTRYPOINT ["yq"]