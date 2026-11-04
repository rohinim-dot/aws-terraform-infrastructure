
#!/bin/bash
set -euo pipefail

mkdir -p /opt/webapp

cat > /opt/webapp/index.html <<'EOF'
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>AWS Secure Web Platform</title>
</head>
<body>
  <h1>Welcome to My AWS Cloud Project!</h1>
  <p>Powered by Terraform and Amazon EC2.</p>
</body>
</html>
EOF

cat > /etc/systemd/system/webapp.service <<'EOF'
[Unit]
Description=Simple Python Web Application
After=network.target

[Service]
Type=simple
WorkingDirectory=/opt/webapp
ExecStart=/usr/bin/python3 -m http.server 80 --bind 0.0.0.0
Restart=always
RestartSec=5

[Install]
WantedBy=multi-user.target
EOF

systemctl daemon-reload
systemctl enable --now webapp.service
