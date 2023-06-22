#!/bin/bash

sed -i 's/#PermitEmptyPasswords no/PermitEmptyPasswords yes/g' /etc/ssh/sshd_config # Allow empty password login via ssh
passwd -d vagrant # empty the existing password for vagrant user
sed -i 's/nullok_secure/nullok/g' /etc/pam.d/common-auth # Allow empty passwords without checking for valid TTY value within /etc/securetty: that way /etc/securetty is not consulted
# echo 'ssh' > /etc/securetty # Alternatively we could do that
systemctl restart sshd.service # Restarting the service is necessary so that the sshd_config file is reread
