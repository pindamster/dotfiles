---
name: topic
description: Create or update a research topic in the Obsidian vault for non-coding explorations (tech research, comparisons, life topics)
argument-hint: "<topic-slug> [new|update]"
---

Create or update a research topic document in the Obsidian vault.

Topics are non-coding explorations: tech comparisons, hardware research, life planning, etc. Each topic lives in its own subfolder under `~/AIVault/topics/`.

## Mode Detection

- If `$ARGUMENTS` contains a topic slug that matches an existing folder in `~/AIVault/topics/`, **update** the existing topic
- If the slug does not exist yet (or `new` is specified), **create** a new topic
- If no slug is provided, derive one from the conversation context (kebab-case)

## Create Mode

1. Read the template at `~/AIVault/_templates/topic.md`
2. Determine a kebab-case slug for the topic
3. Create the subfolder: `~/AIVault/topics/{topic-slug}/`
4. Write the main file: `~/AIVault/topics/{topic-slug}/{topic-slug}.md`
5. Fill in YAML frontmatter:
   - `date`: today's date
   - `tags`: `[topic, {topic-specific-tags}]`
   - `status`: `exploring` (options: `exploring`, `decided`, `parked`)
   - `language`: the language the conversation was conducted in (e.g., `de`, `en`)
   - `type`: `topic`
6. Fill in the **Goal** section based on what the user wants to research/decide
7. Fill in **Findings** with everything gathered so far in this session
8. Fill in **Open Questions** with unresolved items as a checkbox list
9. Add the first entry to the **Session Log** table
10. Add a `## Related` section with cross-links to related vault documents
11. Use **full-path wiki-links with display names**: `[[path/to/file|Display Name]]`
12. Update `~/AIVault/topics/topics-home.md` MOC:
    - Add entry under the appropriate section using format:
      `- **YYYY-MM-DD** [[topics/{slug}/{slug}|Display Name]] - One-line summary`
    - Insert newest entries at the top of their section
13. Update `~/AIVault/vault-home.md` if this is the first topic (should already have a Topics section)

## Update Mode

1. Read the existing topic file at `~/AIVault/topics/{topic-slug}/{topic-slug}.md`
2. **Merge** new findings into the **Findings** section (don't overwrite, append or restructure)
3. Update **Open Questions** (check off resolved ones, add new ones)
4. If a decision has been reached, fill in **Decision / Conclusion** and set `status` to `decided`
5. If the topic is being shelved, set `status` to `parked`
6. Append a new row to the **Session Log** table with today's date and a summary
7. Update `## Related` if new connections emerged
8. Update the MOC entry in `topics-home.md` if the summary or status changed

## Language Convention

Write the topic document in the language the conversation was conducted in. If the conversation switches languages across sessions, keep the document in the language it was started in, unless the user explicitly asks to switch.

## Formatting

Reference the `obsidian-markdown` skill for Obsidian-flavored markdown conventions (callouts, embeds, etc.).

## Additional Files

If a topic accumulates supplementary material (comparison tables, decision matrices, images), store them in the topic's subfolder alongside the main file. Link them from the main document.
