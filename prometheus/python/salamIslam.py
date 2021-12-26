import http.server
from prometheus_client import start_http_server
from prometheus_client import Counter
import random

REQUESTS = Counter('salam_islam_total', 'Salam Islam requested.')
EXCEPTIONS = Counter('salam_islam_exceptions_total', 'Exceptions serving Salam Islam.')

class MyHandler(http.server.BaseHTTPRequestHandler):
	def do_GET(self):
		REQUESTS.inc()
		with EXCEPTIONS.count_exceptions():
			if random.random() < 0.2:
				raise Exception
		self.send_response(200)
		self.end_headers()
		self.wfile.write(b"Salam Islam")
if __name__ == "__main__":
	start_http_server(8000)
	server = http.server.HTTPServer(('localhost',8001), MyHandler)
	server.serve_forever()

