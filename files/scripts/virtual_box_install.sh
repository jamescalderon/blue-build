#!/usr/bin/env bash

set -oue pipefail

# Get Fedora version from the system
FEDORA_VERSION=$(rpm -E %fedora)

# VirtualBox download base URL
BASE_URL="https://download.virtualbox.org/virtualbox/rpm/fedora"
RPM_FILE_URL="https://download.virtualbox.org/virtualbox/rpm/fedora/40/x86_64/VirtualBox-7.1-7.1.6_167084_fedora40-1.x86_64.rpm"

# # Construct the directory URL
# FEDORA_URL="${BASE_URL}/${FEDORA_VERSION}/x86_64/"

# echo "Fetching package list from ${FEDORA_URL}..."

# # Fetch the HTML listing and extract the latest VirtualBox RPM link
# RPM_URL=$(curl -s ${FEDORA_URL} | grep -oP 'VirtualBox-[0-9.]+-[0-9._]+_fedora'${FEDORA_VERSION}'-[0-9]+\.x86_64\.rpm' | sort -V | tail -n 1)

# if [[ -z "$RPM_URL" ]]; then
#     echo "Error: Could not find a VirtualBox RPM for Fedora ${FEDORA_VERSION}."
#     exit 1
# fi

# # Full URL of the RPM package
# FULL_RPM_URL="${FEDORA_URL}${RPM_URL}"

# echo "VirtualBox package URL: ${FULL_RPM_URL}..."


# Install the VirtualBox RPM package
echo "Installing VirtualBox from ${RPM_FILE_URL}..."
wget -O virtualbox.rpm $RPM_FILE_URL
rpm-ostree install virtualbox.rpm
# rpm-ostree search virtualbox

# # Check if the installation was successful
# if [[ $? -ne 0 ]]; then
#     echo "Error: VirtualBox installation failed."
#     exit 1
# else
#     echo "VirtualBox installation completed successfully."
# fi

# Install guest additions
echo "Installing VirtualBox guest additions..."

rpm-ostree install virtualbox-guest-additions

# rpm-ostree search virtualbox-guest-additions

# if [[ $? -ne 0 ]]; then
#     echo "Error: VirtualBox guest additions installation failed."
#     exit 1
# else
#     echo "VirtualBox guest additions installation completed successfully."
# fi

rm virtualbox.rpm
echo "Install complete!"
