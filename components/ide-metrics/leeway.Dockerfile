# Copyright (c) 2022 Gitpod GmbH. All rights reserved.
# Licensed under the GNU Affero General Public License (AGPL).
# See License.AGPL.txt in the project root for license information.

FROM cgr.dev/chainguard/wolfi-base:latest@sha256:5dcb7597e50978fc9dea77d96665bcd47ab0600386710c6e8dab35adf1102122

# Ensure latest packages are present, like security updates.
RUN  apk upgrade --no-cache \
  && apk add --no-cache ca-certificates

COPY components-ide-metrics--app/ide-metrics /app/ide-metrics

ARG __GIT_COMMIT
ARG VERSION

ENV GITPOD_BUILD_GIT_COMMIT=${__GIT_COMMIT}
ENV GITPOD_BUILD_VERSION=${VERSION}
ENTRYPOINT [ "/app/ide-metrics" ]
