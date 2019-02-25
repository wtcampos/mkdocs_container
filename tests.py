import requests

"""
  Test if the page is up. 
"""
def test_get_home():
    "GET request to url returns a 200"
    url = 'http://localhost:8000'
    resp = requests.get(url)
    assert resp.status_code == 200

