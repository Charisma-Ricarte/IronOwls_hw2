#!/usr/bin/env python3
import socket
import argparse
from urllib.parse import urlparse
import os 
import ssl

def download(url, output_file=None):
    parsed_url = urlparse(url)

    host = parsed_url.hostname
    path = parsed_url.path if parsed_url.path else "/"
    port = parsed_url.port

    use_ssl = False
    if parsed_url.scheme == "https":
        use_ssl = True
        port = port if port else 443
    else:
        port = port if port else 80

    if output_file is None:
        output_file is os.path.basename(path) if os.path.basename(path) else "index.html"

    sock = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
    
    if use_ssl:
        context = ssl.create_default_context()
        sock = context.wrap_socket(sock, server_hostname=host)

    sock.connect((host, port))

    request = f"GET {path} HTTP/1.0\r\nHost: {host}\r\n\r\n"
    sock.sendall(request.encode())

    response = b""
    while True:
        chunk = sock.recv(4096)
        if not chunk:
            break
        response += chunk
    sock.close()

    header_end = response.find(b"\r\n\r\n")
    if header_end == -1:
        raise Exception("Invalid HTTP response: no header-body separtor found")
    body = response[header_end+4:]

    with open(output_file, "wb") as f:
        f.write(body)
    
    print(f"Downloaded {url} -> {output_file}")

def main():
    parser = argparse.ArgumentParser(description="Simple HTTP/1.0 client")
    parser.add_argument("-u", "--url", required=True, help="URL of the file to download")
    parser.add_argument("-o", "--output", required=True, help="Output file name")
    args = parser.parse_args()

    download(args.url, args.output)

if __name__ == "__main__":
    main()
