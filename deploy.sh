is_docker_installed() {
  # Check for older version (`docker-compose`) or newer plugin-based (`docker compose`) version
  if docker compose version >/dev/null 2>&1; then
    return 1 # installed
  else
    return 0 # not installed
  fi
}

echo is_docker_installed

# install_docker_compose() {
#     # https://docs.docker.com/engine/install/ubuntu/#install-using-the-repository
#     # Add Docker's official GPG key:
#     sudo apt-get update
#     sudo apt-get install ca-certificates curl
#     sudo install -m 0755 -d /etc/apt/keyrings
#     sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
#     sudo chmod a+r /etc/apt/keyrings/docker.asc

#     # Add the repository to Apt sources:
#     echo \
#     "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
#     $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
#     sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
#     sudo apt-get update
#     sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
# }

# if is_docker_installed  ; then
#     install_docker_compose
# fi

# git 