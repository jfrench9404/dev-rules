---
name: get-issue
description: Pick up a GitHub issue and work it through on a dev branch
disable-model-invocation: true
argument-hint: [issue-number or URL]
---

Work on GitHub issue $ARGUMENTS in this repository. Follow the rules in CLAUDE.md throughout (privacy, dev branch).

1. **Read it.** Fetch the issue and all of its comments, using the GitHub tools if they are available and `gh issue view` otherwise. If no issue was given, list the open issues and ask me which one.
2. **Restate it.** In three or four lines: the goal, the acceptance criteria, and anything unclear. If something is ambiguous, ask me before writing code. If the issue involves personal or private data, run the `/privacy-check` steps and wait for my OK first.
3. **Get on a dev branch.** Confirm you are not on `main`. If there is no dev branch, create `dev` from `main`. If the session assigned a working branch, use that.
4. **Find where the change belongs.** Read the relevant code before editing it, and follow the conventions already there.
5. **Make the smallest change that satisfies the issue.** Do not refactor or tidy unrelated code; mention it to me instead.
6. **Verify.** Run the repo's tests, linter and type checks, and fix what fails. If the repo has none, say so rather than skipping silently.
7. **Commit and push the dev branch**, never `main`. Reference the issue in the message with `Refs #N`. Do not open a pull request unless I ask.
8. **Report back.** What changed, how you verified it, anything left open, and whether it is ready for `/promote`.
