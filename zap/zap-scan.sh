#!/bin/bash
set -e

TARGET_URL=${1:-"https://practicetestautomation.com/"}
ZAP_PATH="./zap_home"

echo "[*] Starting Passive Scan..."
$ZAP_PATH/zap.sh -cmd -quickurl $TARGET_URL -quickout baseline-report.html -addonupdate -quickprogress -configfile zap/zap-baseline.conf

echo "[*] Starting Active Scan..."
$ZAP_PATH/zap.sh -cmd -quickurl $TARGET_URL -quickout fullscan-report.html -addonupdate -quickprogress -quickscan -configfile zap/zap-fullscan.conf

echo "[*] Reports generated:"
ls -l *.html
