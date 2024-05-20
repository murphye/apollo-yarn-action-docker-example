FROM node:20.11.1 AS base
RUN apt update -y
RUN apt upgrade -y

FROM base as runner

# below line as a temporary workaround to fix CVE-2022-25881
RUN rm -Rf /usr/local/lib/node_modules/npm/node_modules/http-cache-semantics

WORKDIR /app

COPY . .
CMD node index.js
