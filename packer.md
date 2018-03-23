# Tips for packer

# Enabling VNC on VMWare ESXI

```sh
   chmod 644 /etc/vmware/firewall/service.xml
   chmod +t /etc/vmware/firewall/service.xml
   vi /etc/vmware/firewall/service.xml
```

```xml
    <service id="new unique id within this file">
        <id>VNC</id>
        <rule id="0000">
            <direction>inbound</direction>
            <protocol>tcp</protocol>
            <porttype>dst</porttype>
            <port>
                <begin>5900</begin>
                <end>6199</end>
            </port>
        </rule>
    </service>
```


```sh
esxcli network firewall refresh
esxcli network firewall ruleset set --ruleset-id VNC --enabled true
esxcli network firewall ruleset list
esxcli network firewall ruleset rule list
```
