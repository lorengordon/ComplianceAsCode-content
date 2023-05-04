# platform = multi_platform_all
# reboot = false
# strategy = configure
# complexity = low
# disruption = low



find -H /var/log/ -maxdepth 1 -type d -exec chown 0 {} \;
