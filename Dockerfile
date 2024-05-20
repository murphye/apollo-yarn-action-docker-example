FROM node:20.11.1 AS base
RUN apt update -y
RUN apt upgrade -y

COPY . .
RUN rm -R node_modules
RUN yarn install
RUN yarn run build

#############

FROM base as runner

# below line as a temporary workaround to fix CVE-2022-25881
RUN rm -Rf /usr/local/lib/node_modules/npm/node_modules/http-cache-semantics

COPY --from=base dist/ app/

WORKDIR /app

CMD node index.js
