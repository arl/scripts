# HTTP request without curl, wget nor netcat

    exec 88<>/dev/tcp/google.com/80
    echo -e "GET /index.html HTTP/1.1\nhost: www.google.com\nConnection: close\n\n" >&88
    sed 's/<[^>]*>/ /g' <&88
