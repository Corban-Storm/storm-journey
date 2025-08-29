# 🧭 Git Cheatsheet (Daily Use — storm-journey)

## Core Loop (add → commit → push)
```bash
git status                                # see what's changed
git add <file>                            # add a single file
git add scripts/                          # add a whole folder
git add -A                                # add everything (new/modified/deleted)
git commit -m "message"                   # snapshot your changes
git push                                  # publish to GitHub
```

## Pull the latest (before you start or when switching machines)
```bash
git pull --ff-only                        # fast-forward only; safer
# or, if you have local changes:
git stash push -m "WIP"
git pull --ff-only
git stash pop
```

## Branch basics (do cleanup safely on a branch)
```bash
git checkout -b cleanup-last-commit       # create & switch
git switch main                           # go back to main (newer git)
git push -u origin cleanup-last-commit    # push branch to GitHub
```

## See what changed
```bash
git diff                                  # unstaged changes
git diff --staged                         # what will be committed
git log --oneline --decorate -n 10        # recent history
```

## Remotes & auth quick checks
```bash
git remote -v                             # see HTTPS vs SSH
git remote set-url origin git@github.com:Corban-Storm/storm-journey.git   # switch to SSH
# If HTTPS:
git config --global credential.helper store
# then push once and paste your token as password
```

## Common fixes
```bash
git push -u origin HEAD                   # push current branch & set upstream
git restore --staged <file>               # unstage
git restore <file>                        # discard local changes to a file
git reset --soft HEAD~1                   # undo last commit (keep staged)
git revert <commit>                       # make a new commit that undoes another
```

## Clean up untracked files (be careful)
```bash
git clean -nd                             # preview what would be removed
git clean -fd                             # delete untracked files
```

### Golden Rules
- Commit small, focused changes with clear messages.
- Pull before you start; push when you finish.
- When in doubt: `git status`, `git log --oneline`, and branch on a side branch.
