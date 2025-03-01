# Packer

#### Issue

When running inside a devcontainer, the HTTP server does not get an IP address on the host machine's subnet. For example, instead of 192.168.1.0/24, I'll get an IP address in the 192.168.65.0/24 subnet. 