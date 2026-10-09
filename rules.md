# Dev rules

Standing rules for every project. They apply in every session without being asked.

## 1. Privacy is everything

This applies whenever what we are building is personal: about me, someone I know, or anyone's private information (health, finances, location, messages, photos, accounts, documents, habits).

Before designing or writing code for it:
- Ask me whether it will look at private information, whose, and for what use. Do not assume the answer either way.
- Lay out the project's privacy features: what data it touches, where it is stored, what leaves the device or goes to a third party (AI APIs included), who can access it, how long it is kept and how it is deleted, and how secrets are handled. `/privacy-check` is the full checklist.
- Wait for my OK on that before building.

For every project, personal or not:
- Never put real personal data, secrets or tokens in the repo, tests, fixtures, logs, screenshots or commit messages. Use synthetic data.
- Prefer the option that keeps data local and sends the least.
- If a change would send private data somewhere new, stop and ask.

## 2. There is always a dev branch

- `main` is the current working version. Never commit or push to `main` directly.
- Everything new or experimental goes on a dev branch. If the repo has no `dev` branch, create it from `main` before starting.
- If a session assigns a specific working branch, that branch is the dev branch for the session. It is still never `main`.
- Once the dev branch is verified (checks pass and I have confirmed it), it gets promoted to `main`. Ask me before promoting. `/promote` does this.
- No force-pushes, and no rewriting history on `main`.

## Commands

- `/get-issue <number>` picks up a GitHub issue and works it through on a dev branch.
- `/privacy-check` runs the privacy review from rule 1.
- `/promote` verifies the dev branch and promotes it to `main`.
