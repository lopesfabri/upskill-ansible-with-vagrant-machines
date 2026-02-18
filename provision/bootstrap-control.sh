#Install Ansible and Python on the control node. This script will be executed by Vagrant during the provisioning of the control node machine.

#!/usr/bin/env bash
set -euo pipefail

echo "*** [control] Updating apt cache"
export DEBIAN_FRONTEND=noninteractive
apt-get update -y

echo "*** [control] Installing Ansible + Python"
apt-get install -y ansible python3 python3-apt

echo "*** [control] Ansible version:"
ansible --version | head -n 1 || true

echo "*** [control] Done"