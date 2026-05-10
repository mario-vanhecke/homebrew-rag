# homebrew-tools

A [Homebrew](https://brew.sh) tap for the
[`tools` distribution](https://github.com/mario-vanhecke/tools) — a small
collection of CLI tools for working with knowledge:

| Formula | What it installs |
|---------|------------------|
| `rag`   | Vault-based RAG indexer & search (hybrid retrieval, Metal-accelerated bge-m3) |
| `md`    | Document-to-markdown converter with idempotent state tracking |

## Install

Tap once, then install whichever tools you want:

```sh
brew tap mario-vanhecke/tools
brew install rag    # the indexer/search tool
brew install md     # the converter
```

Or in one line:

```sh
brew install mario-vanhecke/tools/rag
brew install mario-vanhecke/tools/md
```

Both formulas pull in `pandoc` (DOCX/EPUB) and `poppler` (high-quality PDF
extraction via `pdftotext`) as recommended dependencies. Skip them with
`--without-pandoc` / `--without-poppler` if you don't want them — Markdown
and plaintext content works without either.

## Upgrade

```sh
brew update
brew upgrade rag md
```

## Uninstall

```sh
brew uninstall rag md
brew untap mario-vanhecke/tools
```

## Migrating from the old `mario-vanhecke/rag` tap

The tap was renamed `mario-vanhecke/rag` → `mario-vanhecke/tools` to better
reflect that it ships multiple tools. GitHub redirects the old URL for
~6 months, but for a clean state:

```sh
brew untap mario-vanhecke/rag
brew tap   mario-vanhecke/tools
brew upgrade rag md
```

## What's in the toolkit?

See the main project: <https://github.com/mario-vanhecke/tools>.

## License

The formulas in this repo are MIT-licensed (see `LICENSE`). The tools
themselves are also MIT-licensed.
