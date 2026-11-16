#!/bin/bash
# FOKUS deploy: nginx static site on fokus.89-208-113-147.sslip.io
set -e
cat > /etc/nginx/sites-available/fokus <<'EOF'
server {
    listen 80;
    server_name fokus.89-208-113-147.sslip.io;
    root /var/www/fokus;
    index index.html;
    location / {
        add_header Cache-Control "no-cache, must-revalidate";
        try_files $uri $uri/ =404;
    }
}
EOF
ln -sf /etc/nginx/sites-available/fokus /etc/nginx/sites-enabled/fokus
nginx -t && systemctl reload nginx
echo "OK: http://fokus.89-208-113-147.sslip.io"
