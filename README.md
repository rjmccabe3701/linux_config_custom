## My ``linux_config`` customizations

This is a plugin for the [linux_config](https://github.com/rjmccabe3701/linux_config) repository

## Install

```bash
git clone https://github.com/rjmccabe3701/linux_config.git
git clone https://github.com/rjmccabe3701/linux_config_custom.git
linux_config/install.sh linux_config_custom
```

## SSH Key setup

I now support multiple git contexts

1. Repos under the `~/repos/personal` directory use the
   [.gitconfig-persional](dot_files/gitconfig-personal) gitconfig. These are mapped to my
   personal github.

2. Repos under the `~/repos/work` directory use the
   [.gitconfig-persional](dot_files/gitconfig-work) gitconfig. These are mapped to my work
   github. *NOTE: my employer enforces SSO, so I needed to "Configure SSO" for the SSH I add
   to the github UI.*

To generate an SSH key do this

```bash
ssh-keygen -t ed25519 -C "rob.mccabe@optm.com"
```

Then add to Github (``Settings/SSH and GPG keys``)
