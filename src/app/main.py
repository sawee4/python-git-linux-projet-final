"""Entry point of the dashboard.

Local:  python -m src.app.main
Server: gunicorn --bind 0.0.0.0:8050 --workers 2 src.app.main:server
"""

from dash import Dash, html

app = Dash(__name__, title="Market Monitor")
server = app.server  # the Flask app that gunicorn serves

app.layout = html.Div(
    [
        html.H1("Market Monitor"),
        html.P("Under construction."),
    ]
)

if __name__ == "__main__":
    app.run(debug=True)
