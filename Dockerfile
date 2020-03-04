FROM nixos/nix

RUN mv /nix /nix.orig

VOLUME /nix

COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
