#/bin/bash

docker_not_installed() {
    if command -v docker compose >/dev/null 2>&1; then
        return 1 # installed
    else
        return 0 # not installed
    fi
}

install_docker_compose() {
    # https://docs.docker.com/engine/install/ubuntu/#install-using-the-repository
    # Add Docker's official GPG key:
    sudo apt-get update
    sudo apt-get install ca-certificates curl
    sudo install -m 0755 -d /etc/apt/keyrings
    sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
    sudo chmod a+r /etc/apt/keyrings/docker.asc

    # Add the repository to Apt sources:
    echo \
    "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
    $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
    sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
    sudo apt-get update
    sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
}

if docker_not_installed; then
    echo "Docker compose not installed, installing..."
    install_docker_compose
fi

git pull
git submodule update --init --recursive
git submodule update --recursive --remote

sudo docker compose up --build -d
sudo docker restart llmanipulate-server