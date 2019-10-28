#!/bin/sh

if [ ! -d /etc/tinc/x/hosts ]; then
    mkdir -p /etc/tinc/x/hosts
    cat << EOF > /etc/tinc/x/tinc.conf
Name = x
Interface = tinc0
Mode = switch
EOF
    cat << EOF > /etc/tinc/x/tinc-up
#!/bin/sh
ip link set \$INTERFACE up
EOF
    cat << EOF > /etc/tinc/x/tinc-down
#!/bin/sh
ip link set \$INTERFACE down
EOF
    tincd -n x -K < /dev/null
    chmod +x /etc/tinc/x/tinc-up /etc/tinc/x/tinc-down
fi

if ! [[ -c /dev/net/tun ]]
then
    mkdir -p /dev/net
    mknod /dev/net/tun c 10 200
fi

/usr/sbin/tincd -n x

tail -f /dev/null