#!/usr/bin/env python3
import datetime
import os
import re
import sys
from pathlib import Path


def slugify(title: str) -> str:
    s = title.lower()
    s = re.sub(r"[^a-z0-9]+", "-", s)
    return s.strip("-")


def main() -> int:
    title = " ".join(sys.argv[1:]).strip() or input("Title: ").strip()
    if not title:
        print("Title is required.", file=sys.stderr)
        return 1

    slug = slugify(title)
    if not slug:
        print("Could not derive a slug from the title.", file=sys.stderr)
        return 1

    repo_root = Path(__file__).resolve().parent.parent
    date = datetime.date.today().isoformat()
    file_path = repo_root / "_posts" / f"{date}-{slug}.md"

    if file_path.exists():
        print(f"{file_path} already exists.", file=sys.stderr)
        return 1

    front_matter = (
        "---\n"
        f'title: "{title}"\n'
        f"permalink: /blog/{slug}.html\n"
        "tags:\n"
        "---\n\n"
    )
    file_path.write_text(front_matter, encoding="utf-8")
    print(f"Created {file_path.relative_to(repo_root)}")
    return 0


if __name__ == "__main__":
    sys.exit(main())
