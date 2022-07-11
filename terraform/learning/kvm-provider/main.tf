terraform {
  required_providers {
    libvirt = {
      source  = "dmacvicar/libvirt"
      version = "0.6.14"
    }
  }
}

provider "libvirt" {
  uri = "qemu:///system"
}

resource "libvirt_volume" "centos7-qcow2" {
  name = "centos7.qcow2"
  pool = "default"
#  source = "https://cloud.centos.org/centos/7/images/CentOS-7-x86_64-GenericCloud.qcow2"
  source = "CentOS-7-x86_64-GenericCloud.qcow2"
  format = "qcow2"
}

resource "libvirt_domain" "vm_by_terraform" {
  name   = "vm_by_terraform"
  memory = "1024"
  vcpu   = 1
  network_interface {
    network_name = "default"
  }
  disk {
    volume_id = libvirt_volume.centos7-qcow2.id
  }
  console {
    type = "pty"
    target_type = "serial"
    target_port = "0"
  }
  graphics {
    type = "spice"
    listen_type = "address"
    autoport = true
  }

  xml {
    xslt = <<EOF
<?xml version="1.0" ?>
<xsl:stylesheet version="1.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output omit-xml-declaration="yes" indent="yes"/>
  <xsl:template match="node()|@*">
     <xsl:copy>
       <xsl:apply-templates select="node()|@*"/>
     </xsl:copy>
  </xsl:template>

	<xsl:template match="@type[. = 'kvm']">
		<xsl:attribute name="type">
			<xsl:value-of select="'qemu'"/>
		</xsl:attribute>
	</xsl:template>
</xsl:stylesheet>
EOF
  }
}

output "ip" {
  value = "libvirt_domain.myvm.network_interface.0.addresses.0"
}
