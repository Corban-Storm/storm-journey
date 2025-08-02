#!/bin/bash
# === Resume Summoner Script ===
# Compiles LaTeX resume with xelatex via latexmk

FILE="childers_resume_medieval.tex"
OUT="${FILE%.tex}.pdf"

echo "⚔️  Summoning your medieval resume..."
latexmk -xelatex "$FILE"

if [ -f "$OUT" ]; then
  echo "🏰  Done! Your resume has been forged: $OUT"
else
  echo "💀  Something went wrong! Check the LaTeX logs for details."
fi
