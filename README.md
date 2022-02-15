# Minimal Hashistack Example

Learning is best achieved by example. This is a reference repository to help understand the implementation and usage of HashiCorp's Workflow Software:

- Terraform     (Deterministic - Shape Cloud Infrastructure)
- Packer        (Build Docker-like VM images)
- Nomad         (Orchestrate Workloads)
- Vault         (Manage Infrastructure Secrets)
- Consul        (Service Mesh - Automatically Detect Services and Connect Them)
- Boundary      (Manage Access Control for Users)

I added Ansible (Generic Infrastructure Shaping) since it is recommended to utilize the strength from both Ansible and Terraform as both have their respective strengths (VPS vs VPC).

# Config.sh

We will implement the VMware through `Vagrant` since it will provide a minimalistic interface to manage VMs.

```bash
./config.sh
```

This will setup 4 directories (2 servers and 2 clients) and implement a basic Vagrantfile. The following script are used to deal with managing all VMs at once:

- start.sh      (Start all VMs)
- suspend.sh    (Suspend all VMs)
- destroy.sh    (Destroy all VMs)

The scripts are meant to be called from the main directory (from which you can 'see' the subdirs server* and client*).

# Bootstrap.sh

The Vagrant files are purposely minimalistic since we only use it to configure the VMware settings, **nothing more**. The `bootstrap.sh` is used to start and configure the **inside** of every box.

**Note:** bootstrap will only run once the box is first starting. Enforcing the bootstrap can easily be done by passing `--provision` to `start.sh`:

```bash
./start.sh --provision
```