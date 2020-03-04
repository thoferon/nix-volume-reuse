#!/bin/sh

# If the nix store volume is empty, initialise it with whatever is in the base
# image.
if [ -z "$(ls /nix)" ]; then
  cp -Tdar /nix.orig /nix
fi

exec "$@"
