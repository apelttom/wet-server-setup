#!/usr/bin/env bash

linux32 /srv/wet/etded.x86 \
    +set dedicated 2 \
    +set net_port 27960 \
    +set fs_game etpro \
    +set fs_homepath servers/27960 \
    +set sv_punkbuster 0 \
    +map tc_base \
    +exec serverconfigs/etpro.cfg


