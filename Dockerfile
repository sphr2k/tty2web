FROM ghcr.io/sphr2k/ubuntu:latest

RUN apt-get update && \
    apt-get install -y wget ca-certificates && \
    rm -rf /var/lib/apt/lists/*

# Download tty2web from the provided URL and move it to /ulb
RUN wget https://github.com/kost/tty2web/releases/download/v3.0.3/tty2web_linux_amd64 -O /usr/local/bin/tty2web && \
    chmod +x /usr/local/bin/tty2web

# Set the entrypoint with specified flags
ENTRYPOINT ["/usr/local/bin/tty2web", "-c", "admin:Ekelfernsehen2323", "-w", "/bin/bash"]
