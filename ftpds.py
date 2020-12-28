"""
An RFC-4217 asynchronous FTPS server supporting both SSL and TLS.
Requires PyOpenSSL module (http://pypi.python.org/pypi/pyOpenSSL).

Connect via:
lftp -u ftps -p 1025 localhost

Connect to dockerimage via:
lftp -u ftps -p 1025 172.17.0.1

Local Secure Certificate Verification
https://serverfault.com/questions/411970/how-to-avoid-lftp-certificate-verification-error

How to create a Self Signed Certificate
https://httpd.apache.org/docs/2.4/ssl/ssl_faq.html#selfcert
"""

from pyftpdlib.servers import FTPServer
from pyftpdlib.authorizers import DummyAuthorizer
from pyftpdlib.handlers import TLS_FTPHandler


def main():
    authorizer = DummyAuthorizer()
    authorizer.add_user('ftps', 'password', '.', perm='elradfmwMT')
    authorizer.add_anonymous('.')
    handler = TLS_FTPHandler
    handler.certfile = 'keycert.pem'
    handler.authorizer = authorizer
    # requires SSL for both control and data channel
    handler.tls_control_required = True
    handler.tls_data_required = True
    server = FTPServer(('', 21), handler)
    server.serve_forever()

if __name__ == '__main__':
    main()