easley-test.swpd

openssl genrsa -out easley-test.swpd.key 2048
openssl req -new -x509 -key easley-test.swpd.key -out easley-test.swpd.crt -days 365 -subj "/CN=easley-test.swpd"