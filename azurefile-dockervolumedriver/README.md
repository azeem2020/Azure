# Docker Volume Driver for Azure File Storage (File Share)
This is a Docker Volume Driver which uses <b>Azure Storage File Storage</b> to mount file shares on the cloud to Docker containers as volumes. It uses network file sharing [(SMB/CIFS protocols)](https://docs.microsoft.com/en-gb/windows/win32/fileio/microsoft-smb-protocol-and-cifs-protocol-overview?redirectedfrom=MSDN) capabilities of Azure File Storage.

## Original Content
This is originally taken from the Azure ['azurefile-dockervolumedriver'](https://github.com/Azure/azurefile-dockervolumedriver) repository.

#### <i>DEPRECATION NOTICE FROM MICROSOFT</i>
<i>Please note this driver is no longer supported and will not be maintained moving forwards. We recommend users use CloudStor for Docker native solutions.</i>

## Why this driver?
* Share volume among multiple containers
* Control (edit, modify, delete) files directly from file explorer

## Prerequisites
* Storage Account on Azure...
* The server process must be running on the host machine where Docker engine is installed on at all times for volumes to work properly.

## Installation

Before we start, it would be useful to know that what Docker plugins are.  Docker plugins extends the Docker capabilities to use external services available for storage and networking. There are several volumes and networking plugins are out there. In this article, we will see how to use azure file storage Docker volume plugin to deal with persisting storage with Docker.

This plugin enables you to use the same storage accounts across different Docker hosts or in a swarm cluster. Now let's see it in action.

### Start volume driver daemon
* “cifs-utils” package must be installed on the host system as Azure Files use SMB protocol. For Debian/Ubuntu, run the following command on your host:

``` 
sudo apt-get install -y cifs-utils
```

### Config AzureFileStorageVolumePlugin

Detailed Ubuntu (systemd) [installation instructions](https://github.com/Azure/azurefile-dockervolumedriver/blob/master/contrib/init/systemd/README.md)

```
config=$1

wget -qO /usr/bin/azurefile-dockervolumedriver https://github.com/Azure/azurefile-dockervolumedriver/releases/download/0.2.1/azurefile-dockervolumedriver

chmod +x /usr/bin/azurefile-dockervolumedriver

wget -qO /etc/systemd/system/azurefile-dockervolumedriver.service https://raw.githubusercontent.com/Azure/azurefile-dockervolumedriver/master/contrib/init/systemd/azurefile-dockervolumedriver.service

wget -qO /etc/default/azurefile-dockervolumedriver https://raw.githubusercontent.com/azeem2020/Azure/main/azurefile-dockervolumedriver/azurefile-dockervolumedriver.default
```

#### Reload and Start daemon
```
systemctl daemon-reload

systemctl enable azurefile-dockervolumedriver

systemctl start azurefile-dockervolumedriver

systemctl status azurefile-dockervolumedriver
```

### Create volumes and containers

create volumes and containers as follows:

``` 
docker volume create --name my_volume -d azurefile -o share=myshare

docker run -i -t -v my_volume:/data busybox
```

## License
``` 
Copyright 2016 Microsoft Corporation
```
