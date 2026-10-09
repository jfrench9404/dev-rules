#!/usr/bin/env bash
# Install the dev-rules rulebook and commands into a repo, or into your user-level Claude config.
#
#   ./sync.sh /path/to/repo   installs into <repo>/.claude/ and <repo>/CLAUDE.md
#                             (commit the result; cloud sessions only see what is in the repo)
#   ./sync.sh --user          installs into ~/.claude/ and ~/.claude/CLAUDE.md
#                             (every local repo on this machine; not seen by cloud sessions)
#
# Safe to re-run. It never overwrites your own CLAUDE.md: it only adds one import line to it.
set -euo pipefail

src="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

usage() {
  echo "usage: $0 <path-to-repo> | --user" >&2
  exit 2
}

[ $# -eq 1 ] || usage

case "$1" in
  -h|--help)
    usage
    ;;
  --user)
    dest="$HOME/.claude"
    memory="$dest/CLAUDE.md"
    import="@dev-rules.md"
    mode="user"
    ;;
  *)
    if [ ! -d "$1" ]; then
      echo "not a directory: $1" >&2
      exit 1
    fi
    root="$(cd "$1" && pwd)"
    dest="$root/.claude"
    memory="$root/CLAUDE.md"
    import="@.claude/dev-rules.md"
    mode="repo"
    ;;
esac

mkdir -p "$dest/skills"
manifest="$dest/dev-rules.manifest"

# Remove commands this script installed earlier that no longer exist in the source.
if [ -f "$manifest" ]; then
  while IFS= read -r name; do
    if [ -n "$name" ] && [ ! -d "$src/skills/$name" ] && [ -d "$dest/skills/$name" ]; then
      rm -rf "$dest/skills/$name"
      echo "removed  skills/$name"
    fi
  done < "$manifest"
fi

# Install every command, replacing the old copy so deleted files do not linger.
: > "$manifest"
for dir in "$src"/skills/*/; do
  [ -d "$dir" ] || continue
  name="$(basename "$dir")"
  rm -rf "$dest/skills/$name"
  cp -R "${dir%/}" "$dest/skills/$name"
  echo "$name" >> "$manifest"
  echo "synced   skills/$name"
done

# Install the rulebook, marked so nobody edits the copy by hand.
{
  echo "<!-- Synced from the dev-rules repo by sync.sh. Edit it there, not here. -->"
  cat "$src/rules.md"
} > "$dest/dev-rules.md"
echo "synced   dev-rules.md"

# Make CLAUDE.md load the rulebook, adding the import line only once.
touch "$memory"
if ! grep -qxF "$import" "$memory"; then
  {
    if [ -s "$memory" ]; then echo; fi
    echo "$import"
  } >> "$memory"
  echo "added    $import to $memory"
fi

echo
if [ "$mode" = "repo" ]; then
  echo "Done. Commit .claude/ and CLAUDE.md in $root so cloud sessions pick them up."
else
  echo "Done. Local Claude Code sessions on this machine now load the rules and commands."
fi
