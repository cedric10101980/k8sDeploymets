# Docker and Kubernetes Setup

This guide provides instructions for setting up Docker and Kubernetes on Ubuntu. Additionally, it includes links to detailed documentation.

## Prerequisites

- Ubuntu 20.04 or later
- Internet connection

## Install Docker

Follow these steps to install Docker on your Ubuntu system:

1. Update the package list and install required dependencies:
    ```sh
    sudo apt-get update 
    sudo apt-get -y install apt-transport-https ca-certificates curl gnupg lsb-release 
    ```

2. Add Docker’s official GPG key:
    ```sh
    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg 
    ```

3. Add Docker APT repository:
    ```sh
    echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null 
    ```

4. Install Docker:
    ```sh
    sudo apt-get update 
    sudo apt-get -y install docker-ce docker-ce-cli containerd.io 
    ```

5. Add your user to the Docker group:
    ```sh
    sudo groupadd docker 
    sudo usermod -aG docker $USER
    ```

6. Log out and log back in to apply the group membership.

## Install Kubernetes

For Kubernetes installation, please refer to the detailed steps in the [Kubeadm/README.md](Kubeadm/README.md) file.

## Documentation

For more detailed instructions, refer to the following documents:

- [Docker Installation Guide](Docker/Docker%20Installation.docx)
- [Kubernetes: kubeadm Deployment Guide](Kubeadm/Kubernetes%20:%20kubeadm%20Deployment.docx)

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.