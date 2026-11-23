from src.app.main import app, server


def test_app_has_a_layout():
    assert app.layout is not None


def test_server_is_exposed_for_gunicorn():
    assert server is app.server
