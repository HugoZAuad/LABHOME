from __future__ import annotations

import re
import sys
import xml.etree.ElementTree as ET
from pathlib import Path
from urllib.parse import unquote, urlsplit

import yaml


ROOT = Path(__file__).resolve().parents[1]
SKIPPED_DIRECTORIES = {".git", ".venv", "dist", "site", "node_modules"}


def iter_files(suffix: str):
    for path in ROOT.rglob(f"*{suffix}"):
        if not any(part in SKIPPED_DIRECTORIES for part in path.parts):
            yield path


def validate_yaml():
    errors = []
    for path in list(iter_files(".yml")) + list(iter_files(".yaml")):
        if path.parts[-1] == "mkdocs.yml":
            continue
        try:
            with path.open("r", encoding="utf-8") as handle:
                yaml.safe_load(handle)
        except yaml.YAMLError as exc:
            errors.append(f"{path.relative_to(ROOT)}: YAML inválido: {exc}")
    return errors


def validate_xml():
    errors = []
    for path in iter_files(".xml"):
        try:
            ET.parse(path)
        except ET.ParseError as exc:
            errors.append(f"{path.relative_to(ROOT)}: XML inválido: {exc}")
    return errors


def validate_markdown_links():
    errors = []
    link_pattern = re.compile(r"!?\[[^\]]*\]\(([^)]+)\)")
    for path in iter_files(".md"):
        content = path.read_text(encoding="utf-8")
        for match in link_pattern.finditer(content):
            target = match.group(1).strip().strip("<>")
            if target.startswith(("http://", "https://", "mailto:", "#")):
                continue
            target = unquote(urlsplit(target).path)
            if not target:
                continue
            resolved = (path.parent / target).resolve()
            if not resolved.exists():
                errors.append(
                    f"{path.relative_to(ROOT)}: link local inexistente: {target}"
                )
    return errors


def main() -> int:
    errors = validate_yaml() + validate_xml() + validate_markdown_links()
    if errors:
        for error in errors:
            print(error, file=sys.stderr)
        return 1
    print("Validações de YAML, XML e links locais: OK")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
