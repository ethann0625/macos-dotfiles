#!/bin/bash
GAP=$(yabai -m config window_gap)
if [ "$GAP" -eq 0 ]; then
    yabai -m config window_gap 24 && \
    yabai -m config top_padding 30 && \
    yabai -m config bottom_padding 30 && \
    yabai -m config left_padding 20 && \
    yabai -m config right_padding 20; \
else \
    yabai -m config window_gap 0 && \
    yabai -m config top_padding 0 && \
    yabai -m config bottom_padding 0 && \
    yabai -m config left_padding 0 && \
    yabai -m config right_padding 0; \
fi
