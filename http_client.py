#!/usr/bin/env python3
import socket
import argparse
from urllib.parse import urlparse

BUFFER_SIZE = 4096

def main():
    parser = argparse.ArgumentParser(description="Simple HTTP/1.0 client")
    parser.add_argument("-u", "--url", required=True, help="URL of the file to download")
    parser.add_argument("-o", "--output", required=True, help="Output file name")
    args = parser.parse_args()

    # Parse the URL
    parsed_url = urlparse(args.url)
    if parsed_url.scheme != "http":
        raise ValueError("Only http:// URLs are supported (not https://)")

    host = parsed_url.hostname
    port = parsed_url.port if parsed_url.port else 80
    path = parsed_url.path if parsed_url.path else "/"

    
    sock = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
    sock.connect((host, port))

    
    request = (
        f"GET {path} HTTP/1.0\r\n"
        f"Host: {host}\r\n"
        f"User-Agent: http_client/1.0\r\n"
        f"Connection: close\r\n"
        f"\r\n"
    )
    print(">>> Sending request:\n", request)
    sock.sendall(request.encode())

    
    response = b""
    header_done = False
    with open(args.output, "wb") as f:
        while True:
            data = sock.recv(BUFFER_SIZE)
            if not data:
                break

            if not header_done:
                
                header_end = data.find(b"\r\n\r\n")
                if header_end != -1:
                    header_done = True
                    headers = data[:header_end].decode(errors="ignore")
                    body = data[header_end+4:]
                    print(">>> Response headers:\n", headers, "\n")
                    f.write(body)
                
            else:
                f.write(data)

    sock.close()
    print(f"Downloaded {args.url} -> {args.output}")


if __name__ == "__main__":
    main()
