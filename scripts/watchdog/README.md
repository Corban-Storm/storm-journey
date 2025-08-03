🧩 ChatGPT Challenge: "Guardian of the Logs"
Objective: Build a script that watches system logs in real-time and alerts you when suspicious behavior happens (e.g. failed logins, sudo attempts, kernel warnings, USB mounts, etc.)
🔍 Why This Rocks
    • You’ll learn how to tap into journalctl, dmesg, and log monitoring.
    • It's practical sysadmin knowledge (real-world skills).
    • You can integrate it with email, notifications, or a text file log.
    • You could later pipe it into a fancy dashboard or CLI report.
  

🪓 Base Challenge (Level 1 – Apprentice Blacksmith):
Write a Bash script that:
    • Monitors journalctl -f for:
        ◦ Failed password
        ◦ sudo
        ◦ usb or mount
        ◦ Any line containing error or warning
    • Appends alerts to a file like ~/security.log and others log files

    The assignment was by ChatGPT but I finally did my own script today!
