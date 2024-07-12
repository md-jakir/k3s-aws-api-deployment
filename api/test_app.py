import pytest
from app import app

@pytest.fixture
def client():
    app.config['TESTING'] = True
    with app.test_client() as client:
        yield client

def test_hello_world(client):
    """Test the hello_world route"""
    rv = client.get('/')
    assert rv.status_code == 200
    assert rv.get_json() == {"message": "Hello, World!"}

def test_echo(client):
    """Test the echo route"""
    rv = client.post('/echo', json={"message": "Hello, Echo!"})
    assert rv.status_code == 200
    assert rv.get_json() == {"message": "Hello, Echo!"}