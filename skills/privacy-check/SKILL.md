---
name: privacy-check
description: Privacy review for anything personal that is being built. Asks whether private information is involved, then lays out the project's privacy features. Use at the start of a personal project or feature, and before shipping one.
argument-hint: [project or feature, optional]
---

Run the privacy check for $ARGUMENTS, or for the project in this repo if none was given.

## Part 1: Ask, don't assume

Ask me these, briefly, and wait for the answers before designing or coding anything:

1. Is this personal? (About me, family, friends, health, money, location, messages, photos, accounts, documents, habits.)
2. Will it read, store or process private information? Whose, and what exactly?
3. Who will use it: only me, or other people?

If the answers are that no private information is involved, say so in one line and carry on. Check again if the scope changes.

## Part 2: Lay out the privacy features

Present this as a table for the project, with a concrete answer in each row. Where something is not decided yet, say "not decided" and give a recommended default.

| Area | Answer |
| --- | --- |
| Data it touches | Each kind of data, why it is needed, and the minimum that would do |
| Where it lives | Local only or remote; encryption at rest and in transit |
| What leaves the device | Every external call that carries personal data, including AI APIs, analytics and third-party services |
| Who can access it | Users, services, collaborators, and what each can see |
| Retention and deletion | How long it is kept and how I delete it completely |
| Secrets | Where keys and tokens live (environment or secret manager, never committed) |
| Logging | Confirm personal data stays out of logs, error reports and analytics |
| Dev and test data | Synthetic only; no real personal data in the repo, fixtures, screenshots or prompts |
| Open risks | What could still go wrong, and what would reduce it |

## Part 3: Get my sign-off and record it

Ask whether I want anything stronger. Once I agree, save the agreed version to `PRIVACY.md` in the repo root (create it if missing) so later sessions can see what was decided. Keep it up to date as features change. Do not build until I have signed off.
