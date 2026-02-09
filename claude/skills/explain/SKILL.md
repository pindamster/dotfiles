---
name: explain
description: Write a detailed explanation of the work just completed and save it to the Obsidian vault
argument-hint: "[project-slug or 'general']"
---

Write a detailed explanation of the work just completed and save it to the Obsidian vault.

## Target Detection
- If $ARGUMENTS contains a project slug or "general", use that
- Otherwise, classify based on **what the session work was about**, not just the working directory:
  - If the work modified vault templates, skills, `~/.claude/` config, or general tooling -> use `general`
  - If the work was on project-specific code, features, or bugs -> detect from working directory using the project slug mapping in CLAUDE.md
- If no mapping matches, default to `general`

## Steps
1. Read the relevant template at `~/AIVault/_templates/explanation.md`
2. Determine a kebab-case slug for the filename based on the work done
3. Write to `~/AIVault/projects/{project-slug}/explanations/{slug}.md`
   (or `~/AIVault/general/explanations/{slug}.md` for general work)
4. Fill in YAML frontmatter: date, tags, status (complete), project, type (explanation)
5. Use **full-path wiki-links with display names**: `[[path/to/file|Display Name]]`
6. Add a `## Related` section at the end with cross-links to related vault documents
7. Update the relevant `{scope}-home.md` MOC with a link to the new document
   - Project: `~/AIVault/projects/{project-slug}/sfdb-home.md` (or equivalent)
   - General: `~/AIVault/general/general-home.md`
   - Root: `~/AIVault/vault-home.md`

## Formatting
Reference the `obsidian-markdown` skill for Obsidian-flavored markdown conventions (callouts, embeds, etc.).

## Content
Walk through what was built, how it works, key design decisions, and lessons learned.
Act like a senior engineer teaching the code.
