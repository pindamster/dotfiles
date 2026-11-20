# Personal workflow

## Private agent skills

- Author or edit reusable private skills in `~/agent-skills/<skill-id>/SKILL.md`, with any supporting files beside it. Keep the Git checkout as the source of truth.
- Authored skills are trackable by default; don't add per-skill `.gitignore` exceptions. Keep third-party installs and agent-discovery links outside the checkout.
- Enable the skill on this machine by symlinking the individual skill directory into `~/.agents/skills/<skill-id>`. Keep `~/.agents/skills/` a real directory, and check for an existing file or link before creating one. Verify that the active agent discovers the skill.
- Keep credentials and work-specific hostnames or project details out of the skills repo. Don't commit or push unless I ask.
