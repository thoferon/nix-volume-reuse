FROM alpine

RUN apk add curl sudo xz git
RUN echo "nix ALL = NOPASSWD: ALL" > /etc/sudoers

RUN adduser -D nix
USER nix

ARG NIX_INSTALL_SCRIPT=https://github.com/numtide/nix-flakes-installer/releases/download/nix-2.4pre20210126_f15f0b8/install
RUN curl -L ${NIX_INSTALL_SCRIPT} | sh --no-daemon

RUN cp -r /nix /tmp/nix.orig

VOLUME /nix

COPY nix.conf /home/nix/.config/nix/nix.conf

COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
