#!/bin/sh

chrome \
    --allow-pre-commit-input \
    --disable-background-networking \
    --disable-background-timer-throttling \
    --disable-backgrounding-occluded-windows \
    --disable-breakpad \
    --disable-client-side-phishing-detection \
    --disable-component-update \
    --disable-dev-shm-usage \
    --disable-field-trial-config \
    --disable-hang-monitor \
    --disable-infobars \
    --disable-ipc-flooding-protection \
    --disable-popup-blocking \
    --disable-prompt-on-repost \
    --disable-renderer-backgrounding \
    --disable-search-engine-choice-screen \
    --disable-sync \
    --enable-automation \
    --export-tagged-pdf \
    --force-color-profile=srgb \
    --metrics-recording-only \
    --no-first-run \
    --password-store=basic \
    --use-mock-keychain \
    --disable-features=Translate,AcceptCHFrame,MediaRouter,OptimizationHints,ProcessPerSiteUpToMainFrameThreshold \
    --enable-features=NetworkServiceInProcess2 \
    --disable-blink-features=AutomationControlled \
    about:blank \
    --remote-debugging-port=9222 \
    --remote-allow-origins='*' \
    --remote-debugging-address=0.0.0.0 \
    --guest

