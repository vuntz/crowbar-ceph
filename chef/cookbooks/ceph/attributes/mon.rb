case node["platform"]
when "ubuntu"
  default["ceph"]["mon"]["init_style"] = "upstart"
when "suse", "opensuse"
  if node["platform_version"].to_f >= 12
    default["ceph"]["mon"]["init_style"] = "systemd"
  else
    default["ceph"]["mon"]["init_style"] = "sysvinit"
  end
else
  default["ceph"]["mon"]["init_style"] = "sysvinit"
end
default["ceph"]["mon"]["secret_file"] = "/etc/chef/secrets/ceph_mon"
