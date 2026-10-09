---
name: promote
description: Verify the dev branch and promote it to main
disable-model-invocation: true
argument-hint: [dev-branch, optional]
---

Promote the dev branch to `main`. `main` is the current working version, so stop at any problem and tell me instead of pushing on.

1. **Pick the branches.** The dev branch is $ARGUMENTS if given, otherwise the current branch. It must not be `main`. Fetch `origin` first. If `main` has commits the dev branch lacks, merge `main` into the dev branch and resolve any conflicts there, never on `main`.
2. **Verify.** Run the repo's tests, linter and build. Check the diff for secrets and for real personal data. If this is a personal project, confirm `PRIVACY.md` exists and still matches what the code does. Report every result, including failures.
3. **Show me what is going to `main`.** The commits (`git log main..<dev> --oneline`), a short summary of the files changed, and the verification results.
4. **Ask for an explicit go-ahead** and wait. Do not merge before I say yes.
5. **On yes:** merge the dev branch into `main` and push `main`. No force-pushes and no history rewriting. If `main` is protected or the push is refused, open a pull request from the dev branch to `main` instead and give me the link.
6. **Keep the dev branch.** Do not delete it, and switch back to it afterwards so new work starts there.
