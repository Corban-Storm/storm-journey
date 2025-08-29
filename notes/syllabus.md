# Linux Learning Syllabus — Month 1

This syllabus consolidates the assignments, drills, and tools we’ve set up so far.  
Keep it in `~/drills/syllabus.md` as your master doc. Push it to GitHub for safekeeping.

---

## 📅 Month 1 — Weekly Study Plan

### Week 1: Files & Permissions (Basics)
- Read: *Linux Command Line* (Ch. 1–6)
- Skim: *Linux Bible* Part I
- Practice project:
  - Create `drills/week1/` with sample files.
  - Adjust file permissions for user, group, and world.

### Week 2: Users, Processes & Services
- Read: *Linux Command Line* (Ch. 7–10)
- Read: *Linux Bible* Ch. 6–7
- Optional dip: *How Linux Works* (Ch. 1–2)
- Practice project:
  - Create fake users & groups.
  - Use `systemctl` to manage services.
  - Inspect logs with `journalctl`.

### Week 3: Networking & Logs
- Read: *Linux Command Line* (Ch. 11–14)
- Read: *Linux Bible* Ch. 8–9
- Optional dip: *How Linux Works* (Ch. 3)
- Practice project:
  - Spin up a simple local server.
  - Configure firewall rules.
  - Monitor logs with `journalctl` and `dmesg`.

### Week 4: Scripting & Automation
- Read: *Linux Command Line* (Ch. 15–19)
- Read: *Linux Bible* Ch. 10–11
- Optional dip: *How Linux Works* (Ch. 4)
- Practice project:
  - Write a backup script (tarball with timestamp).
  - Schedule via cron.
  - Push script to GitHub.

---

## 🥋 Daily Drills

### Week 1 — Files & Permissions
- Commands: `cd`, `pwd`, `ls -l`, `touch`, `cp`, `mv`, `rm`, `mkdir -p`, `chmod`, `chown`
- Drill: Create files `a.txt`, `b.txt`, `c.txt` with distinct permission sets.

### Week 2 — Processes & Users
- Commands: `ps aux`, `top`, `kill`, `killall`, `id`, `who`, `groups`, `usermod`, `passwd`, `su`, `sudo`
- Drill: Create test users, assign groups, restrict shared folder access. Kill a runaway process.

### Week 3 — Networking & Logs
- Commands: `ip a`, `ping`, `ss -tulpn`, `curl`, `wget`, `journalctl -xe`, `dmesg | tail`, `tail -f`
- Drill: Run a Python HTTP server, confirm it with `ss`, fetch with `curl`, read logs.

### Week 4 — Scripting & Automation
- Concepts: variables, loops, conditionals, redirection
- Drill: Script prints today’s date, username, and file count in `~/drills/week4`. Cron job logs output.

---

## 📝 Feedback Template (weekly)

### 1. Wins (What went well)
- …

### 2. Sticking Points (Tough/confusing)
- …

### 3. Time & Energy
- …

### 4. Usefulness
- …

### 5. Suggestions for next week
- …

### 6. Quick self-rating (1–5)
- Mastery:
- Confidence:
- Fun:

---

## ⚙️ Feedback Script Setup

Create `~/.local/bin/feedback-week`:

```bash
#!/usr/bin/env bash
set -euo pipefail

pick_editor() {
  for ed in "${VISUAL:-}" "${EDITOR:-}" kate code nano vi; do
    [[ -n "$ed" ]] || continue
    command -v "${ed%% *}" &>/dev/null && { echo "$ed"; return; }
  done
  echo "nano"
}

YEAR=$(date +%G)
WEEK=$(date +%V)
MON=$(date -d "monday this week" +%F)
SUN=$(date -d "sunday this week" +%F)

DIR="$HOME/drills"
mkdir -p "$DIR"

FILE="$DIR/${YEAR}-W${WEEK}-feedback.md"

if [[ -e "$FILE" ]]; then
  exec "$(pick_editor)" "$FILE"
fi

cat > "$FILE" <<EOF
# Weekly Feedback — ${YEAR}-W${WEEK} (${MON} → ${SUN})

## 1) Wins
…
## 2) Sticking Points
…
## 3) Time & Energy
…
## 4) Usefulness
…
## 5) Suggestions
…
## 6) Quick self-rating (1–5)
…

*(Created by \`feedback-week\` on $(date -Is))*
EOF

exec "$(pick_editor)" "$FILE"
```

Make executable:
```bash
chmod +x ~/.local/bin/feedback-week
```

Run it weekly:
```bash
feedback-week
```

---

✅ End of Month 1 Goal: Comfortable with Linux basics, first automation script in GitHub, and a rhythm of practice + reflection.
