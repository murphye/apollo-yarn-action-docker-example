FROM node:20.11.1 AS build
RUN apt update -y
RUN apt upgrade -y

# Copy the project to the builder image
COPY . .
# Remove pre-existing node_modules; need to build specifically for Linux
RUN rm -R node_modules
# Install the dependencies and run the build
RUN yarn install
RUN yarn run build

#############

FROM node:20.11.1
RUN apt update -y
RUN apt upgrade -y

# below line as a temporary workaround to fix CVE-2022-25881
RUN rm -Rf /usr/local/lib/node_modules/npm/node_modules/http-cache-semantics

COPY --from=build dist/ app/
COPY --from=build node_modules/ app/node_modules

WORKDIR /app

CMD node index.js
