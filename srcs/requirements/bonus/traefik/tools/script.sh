#!/bin/bash

exec /tools/traefik --configFile=/tools/traefik.toml --api.insecure=true --providers.docker