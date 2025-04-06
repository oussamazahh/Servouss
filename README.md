# 🐳 Servouss - Awesome Web Server Project 🔥

![Docker](https://img.shields.io/badge/Docker-Enabled-2496ED?logo=docker)
![Nginx](https://img.shields.io/badge/Web%20Server-Nginx-009639?logo=nginx)
![WordPress](https://img.shields.io/badge/CMS-WordPress-21759B?logo=wordpress)
![PHPMyAdmin](https://img.shields.io/badge/Admin-PHPMyAdmin-6C78AF?logo=phpmyadmin)

A powerful web server environment packed with modern tools and secured with SSL! 💪  
Perfect for web development, CMS projects, and database management. 🚀

## 🌟 Features

- 🛡️ **Secure Connections** (HTTPS with self-signed certificate)
- 🖥️ **Nginx Web Server** (High-performance HTTP server)
- 📝 **PHP 7.3** with essential extensions
- 🗃️ **MariaDB Database** (MySQL compatible)
- 🌐 **WordPress** pre-installed and configured
- 📊 **phpMyAdmin** for database management
- 🔄 **Autoindex Toggle** (On/Off with single command)
- 🐳 **Dockerized** for easy setup and reproducibility

## 📦 Included Services

| Service       | Version    | Port  | Access URL                  |
|---------------|------------|-------|-----------------------------|
| Nginx         | 1.14+      | 80    | `http://localhost`          |
| HTTPS         | TLS 1.2+   | 443   | `https://localhost`         |
| WordPress     | 5.4+       | 80    | `http://localhost/wordpress`|
| phpMyAdmin    | 5.0.4+     | 80    | `http://localhost/phpmyadmin`|
| MariaDB       | 10.3+      | 3306  | (Internal)                  |

## 🚀 Getting Started

### Prerequisites

- Docker 🐳 installed
- Basic terminal knowledge 💻
- 1024MB+ free memory 🧠

### Installation

1. **Clone the repository**  
   `git clone https://github.com/oussamazahh/Servouss.git`

2. **Navigate to project directory**  
   `cd Servouss`

3. **Build and start containers**  
   `make`

   _Sit back while Docker works its magic! ✨_  
   _This will:_  
   - 🏗️ Build the Docker image  
   - 🚢 Start containers for web server and database  
   - 🔒 Set up SSL certificates  
   - 🗃️ Configure WordPress and MariaDB

### Access the Services

- 🌍 **Website**: https://localhost
- 📚 **WordPress**: https://localhost/wordpress
- 🔑 **phpMyAdmin**: https://localhost/phpmyadmin
- 🔒 **HTTPS**: https://localhost

## 🛠️ Management Commands

```bash
# Start/Restart the server
make run

# Stop the server
make stop

# Full clean (remove containers and images)
make fclean

# Rebuild everything from scratch
make re