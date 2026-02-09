---
name: commit
description: Stage relevant files, compose a conventional commit message, and create the commit
---

Stage the relevant files, compose a short one-line commit message following conventional commits, and create the commit.

## Steps
1. Run `git status` and `git diff` (staged + unstaged) to understand all changes
2. Determine which files belong to the current logical change -- only stage files that are part of this unit of work
3. Stage those files by name (never use `git add -A` or `git add .`)
4. Compose a single-line commit message following Conventional Commits that accurately describes the change
5. Present the message and the list of files to the user for confirmation before committing
6. Create the commit

## Rules
- Only pull the content of files that you didn't change during your work, so that you know what happened outside of your actions
- Never stage files that likely contain secrets (`.env`, credentials, tokens)
- If there are unrelated changes in the working tree, leave them unstaged
- If unsure which files belong together, ask the user
