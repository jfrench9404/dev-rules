# dev-rules

My rulebook and slash commands for Claude Code, kept in one place and copied into every other repo so I don't have to repeat them.

## What's here

| File | Purpose |
| --- | --- |
| `rules.md` | The always-on rules: privacy, and the dev branch workflow |
| `skills/<name>/SKILL.md` | One slash command each; the folder name is the command |
| `sync.sh` | Copies the rules and commands into a repo, or into `~/.claude` |
| `CLAUDE.md` | Loads the rules when working in this repo, and explains the layout to Claude |

## Commands

| Command | What it does |
| --- | --- |
| `/get-issue <number>` | Reads a GitHub issue, restates it, implements it on a dev branch, verifies it and reports back |
| `/privacy-check` | Asks whether private information is involved, then lays out the project's privacy features and records them in `PRIVACY.md` |
| `/promote` | Verifies the dev branch, shows what is going to `main`, and merges it once I say yes |

## Using it

Claude Code on the web only sees what is committed in the repo it cloned, so each repo needs its own synced copy.

**For a repo (works in cloud and local sessions):**

```bash
./sync.sh /path/to/other-repo
cd /path/to/other-repo
git add .claude CLAUDE.md && git commit -m "Sync dev-rules"
```

This writes `.claude/dev-rules.md` and `.claude/skills/*`, and adds one `@.claude/dev-rules.md` line to the repo's `CLAUDE.md` (creating it if needed). Existing contents of `CLAUDE.md` are left alone. Commit it on the repo's dev branch.

**For all local repos on one machine:**

```bash
./sync.sh --user
```

This installs into `~/.claude/`. Cloud sessions never see `~/.claude`, so it does not replace the per-repo sync.

## Changing it

- **A rule:** edit `rules.md`. Keep it short, because every line costs context in every project.
- **A command:** add `skills/<name>/SKILL.md`. Use `skills/get-issue/SKILL.md` as the template. Set `disable-model-invocation: true` if it should only run when I type it.
- **Then re-sync** each repo. The copies in other repos are overwritten, so edit here and never there. Commands removed from this repo are removed from the targets on the next sync.

## Not built yet

- Subagents (`.claude/agents/`), once there is a specialist worth having.
- A GitHub Action that opens a sync pull request in each repo whenever this one changes.
- A plugin marketplace, for local-only auto-updates. Cloud sessions ignore plugins that a repo turns on.
