#Installing Python on the node machines, which is required for Ansible to work.

#!/usr/bin/env bash
set -euo pipefail

echo "*** [node] Updating apt cache"
export DEBIAN_FRONTEND=noninteractive
apt-get update -y

echo "*** [node] Installing Python (required for Ansible)"
apt-get install -y python3 python3-apt

echo "*** [node] Done"