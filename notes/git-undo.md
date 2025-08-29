# 🔄 Git Undo Cheatsheet

## Stage/Unstage
- **Unstage a file** (keep your edits):
```bash
git restore --staged path/to/file
# older git: git reset HEAD path/to/file
```

- **Unstage everything** (keep your edits):
```bash
git restore --staged .
```

## Working tree (your files)
- **Discard local changes in a file** (revert to last commit):
```bash
git restore path/to/file
# older git: git checkout -- path/to/file
```

- **Discard ALL local changes (tracked files)**:
```bash
git restore --worktree --source=HEAD -S :/
# simpler (but blunt):
git checkout -f
```

- **Stash work-in-progress** (save & clean tree):
```bash
git stash push -m "WIP: message"
git stash list
git stash pop                # re-apply latest and remove from stash
git stash apply stash@{2}    # apply a specific one
```

## Commits
- **Amend the *last* commit message or add more files** (not pushed yet):
```bash
git add more/files
git commit --amend
```

- **Undo the last commit but keep changes staged** (soft reset):
```bash
git reset --soft HEAD~1
```

- **Undo the last commit and unstage changes** (keep edits in working tree):
```bash
git reset --mixed HEAD~1     # default
```

- **Completely drop last commit and its changes** (⚠️ destructive):
```bash
git reset --hard HEAD~1
```

- **Make a new commit that reverses an older one** (safe for public history):
```bash
git revert <commit_sha>
# e.g.
git revert HEAD~2
```

## After you’ve pushed
- **Fix last commit message (already pushed)** → prefer a new commit:
```bash
git commit --amend              # changes local history...
git push --force-with-lease     # ⚠️ only if you're sure; coordinate if shared
```
*Safer option:*
```bash
git revert <bad_commit_sha>
git push
```

## File recovery magic
- **See where you were** (find “lost” commits/branches):
```bash
git reflog
```
- **Restore a deleted file from history**:
```bash
git checkout <commit_sha> -- path/to/file
# then commit it back on your branch
```

## Untracked files cleanup
- **Preview what would be removed**:
```bash
git clean -nd
```
- **Delete untracked files** (⚠️ irreversible):
```bash
git clean -fd
# add -x to also remove ignored files
```

---

### Quick safety rules
- If you’ve **pushed** it, prefer `git revert`.
- If you **haven’t pushed** it, `git reset --soft/mixed/hard` are fine (choose how much to keep).
- Use `--force-with-lease` instead of `--force` when you must rewrite remote history.
- When unsure: `git status`, `git log --oneline --graph`, and `git reflog` before you pull the trigger.
