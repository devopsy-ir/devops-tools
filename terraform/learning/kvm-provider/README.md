Step1.
Run:
`mkdir ~/.local/share/terraform/plugins/registry.terraform.io/dmacvicar/libvirt/0.6.14/linux_amd64/ && cd mkdir ~/.local/share/terraform/plugins/registry.terraform.io/dmacvicar/libvirt/0.6.14/linux_amd64/`
`wget https://github.com/dmacvicar/terraform-provider-libvirt/releases/download/v0.6.14/terraform-provider-libvirt_0.6.14_linux_amd64.zip`
`unzip terraform-provider-libvirt_0.6.14_linux_amd64.zip`

Step2.
Add the kvm provider to your tf file:

`terraform {
  required_providers {
    libvirt = {
      source  = "dmacvicar/libvirt"
      version = "0.6.14"
    }
  }
}`

