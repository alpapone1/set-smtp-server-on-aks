#!/bin/bash

cp /tmp/tls/boots-ca.crt /usr/local/share/ca-certificates/
update-ca-certificates

sed -i "s/uid/cn/g" /etc/postfix/ldap-senders.cf

postconf 'virtual_alias_maps ='
postconf 'virtual_mailbox_domains = /etc/postfix/vhost'

postfix reload
