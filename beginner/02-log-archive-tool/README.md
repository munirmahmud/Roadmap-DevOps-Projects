# 📦 log-archive

A lightweight CLI tool to archive logs on Linux systems by compressing them into `.tar.gz` format. Perfect for system administrators and DevOps engineers who want to automate log rotation and keep logs clean and backed up.

---

## 🚀 Features

- 📁 Accepts any log directory as input (e.g., `/var/log`)
- 📦 Archives all files inside it into a timestamped `.tar.gz`
- 🗂 Stores the compressed archive in `/var/log_archives`
- 📝 Logs each archive operation to `/var/log/log-archive.log`
- 💥 Handles invalid inputs and permission errors gracefully

---

### How to Run (Basic Script Usage)

1. **Download the script:**

   ```bash
   wget https://github.com/munirmahmud/roadmapsh-devops-projects/blob/main/01-beginner/02-log-archive-tool/log-archive.sh -O log-archive.sh


2. **Make it executable:**

   ```bash
   chmod +x log-archive.sh
   ```

3. **Run the script:**

   ```bash
   ./log-archive.sh
   ```

   OR

   ```bash
   bash log-archive.sh
   ```

## 📞 Support

Need help packaging, extending, or deploying this in production? Feel free to reach out or create an issue.


This project is part of [Roadmap DevOps Projects](https://roadmap.sh) [Project URL](https://roadmap.sh/projects/server-stats)

