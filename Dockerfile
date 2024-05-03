FROM ghcr.io/sphr2k/ubuntu:latest

# Update the package list and install necessary packages
RUN apt-get update && \
    apt-get install -y wget ca-certificates && \
    rm -rf /var/lib/apt/lists/*

# Download tty2web and set execute permissions
RUN wget https://github.com/kost/tty2web/releases/download/v3.0.3/tty2web_linux_amd64 -O /usr/local/bin/tty2web && \
    chmod +x /usr/local/bin/tty2web

# Set environment variable PORT with a default value
ENV PORT=8080

# Set the entrypoint to the tty2web executable
ENTRYPOINT ["/usr/local/bin/tty2web"]

# Set default parameters for the entrypoint
CMD ["--port", "$PORT", "-c", "admin:Ekelfernsehen2323", "-w", "/bin/bash"]
