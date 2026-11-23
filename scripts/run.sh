#!/usr/bin/env bash
# Start the dashboard on a clean Linux box: ./scripts/run.sh
set -euo pipefail

cd "$(dirname "$0")/.."               # project root, from any folder

if [ ! -d .venv ]; then
    python3 -m venv .venv
fi
source .venv/bin/activate

pip install -q --upgrade pip
pip install -q -r requirements.txt

if [ ! -f .env ]; then
    cp .env.example .env
fi
set -a; source .env; set +a

pytest -q                              # stop here if something is broken

mkdir -p logs
exec gunicorn --bind "0.0.0.0:${DASH_PORT:-8050}" --workers 2 \
    --access-logfile logs/access.log --error-logfile logs/error.log \
    src.app.main:server
