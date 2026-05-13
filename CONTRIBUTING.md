# Contributing to Cauchemar

Thanks for contributing. This guide covers the workflow expected for any change to the repository.

## New to Git?

If terms like *commit*, *branch*, *pull request*, *merge*, or *remote* are unclear, start here before reading the rest of this guide:

- **[GitHub — Get started with Git](https://docs.github.com/en/get-started/using-git/about-git)** — practical, workflow-oriented introduction. Covers what Git is, what a repository, commit, branch, and pull request are, and how they fit together. Best starting point since we use GitHub.
- **[Pro Git (free book)](https://git-scm.com/book/en/v2)** — the reference. Deeper, chapter-by-chapter. Read Chapters 1–3 for the fundamentals; come back to the rest when you need it.

You do not need to master Git before contributing. Skim the first link, then come back — the workflow below will make sense.

## Language

- **Code, comments, identifiers, commit messages, PR titles, issue titles, branch names**: English.
- **Design documentation** (everything under `docs/`): French. This is the only exception.

If you touch both, keep each file consistent with its own language rule.

## Workflow overview

1. Open (or pick) a GitHub issue.
2. Create a branch from `main`.
3. Push commits and open a pull request targeting `main`.
4. Get one review approval.
5. Squash-merge.

No direct pushes to `main`. Every change goes through a PR.

## Issues

GitHub Issues is the **single source of truth** for tracking work — bugs, features, design decisions, tasks. If it's not in an issue, it's not tracked.

- Before starting work, make sure there's an issue describing the change.
- One issue = one scoped problem or feature. Split if it grows too broad.
- Use labels and milestones to keep things findable.

## Branches

Always branch from an up-to-date `main`. Never work directly on `main`.

### Naming

```
<type>/<issue-number>-<short-slug>
```

- `type`: one of `feat`, `fix`, `docs`, `chore`, `refactor`, `test`, `perf`.
- `issue-number`: the GitHub issue this branch addresses.
- `short-slug`: a few kebab-case words describing the change.

Examples:

- `feat/42-suit-modules`
- `fix/17-hud-flicker-at-low-framerate`
- `docs/23-contributing-guide`
- `refactor/58-inventory-slot-model`

If a branch has no linked issue (rare — see below), drop the number: `<type>/<short-slug>`.

## Commits

Commits inside a branch are cheap and can be messy. What matters is the **final squash commit** on `main`.

- Commit as often as you want, with whatever messages help you work.
- Do not worry about rewriting history before review — the squash handles cleanup.
- Do not force-push to shared branches unless you're the sole author.

## Pull Requests

Every change reaches `main` through a PR.

### PR title

The PR title **becomes the squash commit message** on `main`, so it must follow [Conventional Commits](https://www.conventionalcommits.org/):

```
<type>(<scope>): <subject>
```

- `type`: same set as branch names (`feat`, `fix`, `docs`, `chore`, `refactor`, `test`, `perf`).
- `scope` (optional but encouraged): a short area tag — `game`, `player`, `creatures`, `docs`, `ci`, etc.
- `subject`: imperative mood, lowercase, no trailing period.

Examples:

- `feat(player): add modular suit visor states`
- `fix(game): correct Godot project path in VSCode launch config`
- `docs(design): clarify parasite possession stages`

### PR body

- Explain **what** changes and **why**.
- Link the issue: `Closes #42` (or `Refs #42` if it doesn't fully resolve it).
- If the PR has **no linked issue**, the body itself must carry the full context — rationale, scope, trade-offs. Use this only for self-contained changes (typo fixes, trivial chores). When in doubt, open an issue first.

### Review

- **One approving review** is required before merge.
- The ruleset on `main` allows Admin bypass, but use it only for genuine emergencies (broken `main`, blocked release). Normal work goes through review.
- Address review comments with follow-up commits; do not force-push during review.

### Merging

- **Squash merge only.** No merge commits, no rebase-merge.
- The PR title is the commit message on `main` — double-check it before squashing.
- Delete the branch after merge.

## Local formatting (recommended)

The repo uses [`gdformat`](https://github.com/Scony/godot-gdscript-toolkit) and `gdlint` (both from gdtoolkit). The CI rejects any PR whose `.gd` files are not formatted or fail lint. Setting up the pre-commit hook locally means you never have to think about it.

The toolchain is wired through [`uv`](https://docs.astral.sh/uv/), so the only prerequisite is `uv` itself.

```bash
# Once on your machine — installs pre-commit globally, managed by uv:
uv tool install pre-commit --with pre-commit-uv

# Once per repo clone — installs the git hook:
pre-commit install
```

From then on, `gdformat` and `gdlint` run on staged `.gd` files at every `git commit`. If formatting changes a file, the commit is aborted and you need to `git add` the formatted result and recommit.

To run the checks manually without committing:

```bash
pre-commit run --all-files
```

## Checklist before requesting review

- [ ] Branch name follows the convention.
- [ ] PR targets `main`.
- [ ] PR title follows Conventional Commits.
- [ ] PR is linked to an issue, or the body carries the full context.
- [ ] Code and comments are in English; design docs (if touched) remain in French.
- [ ] The change is scoped to one concern.
