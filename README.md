# Market Monitor

Final project for *Linux, Git & Python* (MSc Financial Engineering): a Dash dashboard
that fetches market data, computes risk and refreshes itself, deployed on Linux.

## Run it

On a clean Linux machine:

```bash
git clone https://github.com/sawee4/python-git-linux-projet-final.git
cd python-git-linux-projet-final
./scripts/run.sh
```

Then open http://localhost:8050.

For local development:

```bash
python -m venv .venv && source .venv/bin/activate   # Windows: .venv\Scripts\activate
pip install -r requirements.txt
python -m src.app.main
```

## Layout

```
src/
  data/       # PriceSource interface, Bloomberg + fallback sources, cache
  analytics/  # returns, volatility, drawdown, Sharpe, VaR, correlation
  app/        # Dash layout + callbacks
tests/        # pytest, run by CI on every push
scripts/      # run.sh: one command from clone to dashboard
```

## How we work

- GitHub flow: `main` is protected and always deployable.
- One short branch per change (`feat/...`, `fix/...`), then a pull request.
- Every PR needs one approval and a green CI (ruff, then pytest).
- Commit messages: imperative, under 50 characters, `feat:` / `fix:` / `chore:` prefixes.
- No secrets and no data in the repo: use `.env` (see `.env.example`).
