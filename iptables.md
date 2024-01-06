
## Temporarily disable TCP traffic

Add an iptables rule that drops all incoming tcp packets on port 8080:

    sudo iptables -I INPUT -p tcp --dport 8080 -j DROP

Undo the above:

    sudo iptables -D INPUT -p tcp --dport 8080 -j DROP
