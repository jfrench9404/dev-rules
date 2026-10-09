@rules.md

# About this repo

This repo is the source of truth for my rulebook and slash commands. Other repos get a synced copy.

- `rules.md` holds the always-on rules. Every line of it costs context in every project, so keep it short and only add rules that matter in all repos.
- `skills/<name>/SKILL.md` holds one slash command each. The folder name is the command name.
- `sync.sh` copies both into a target repo or into `~/.claude`. After changing a rule or command, tell me to re-sync; do not edit synced copies in other repos.
- Follow the rules above in this repo too: work on a dev branch, never on `main`.
