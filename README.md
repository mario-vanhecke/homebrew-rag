# homebrew-rag

A [Homebrew](https://brew.sh) tap for [`rag`](https://github.com/mario-vanhecke/rag) —
a vault-based RAG indexer and search tool.

## Install

```sh
brew tap mario-vanhecke/rag
brew install rag
```

Or in one line:

```sh
brew install mario-vanhecke/rag/rag
```

`pandoc` is installed alongside by default (used for DOCX and PDF extraction).
Skip it with `brew install rag --without-pandoc` — Markdown and plaintext
vaults work without pandoc.

## Upgrade

```sh
brew update
brew upgrade rag
```

## Uninstall

```sh
brew uninstall rag
brew untap mario-vanhecke/rag
```

## What is `rag`?

See the main project: <https://github.com/mario-vanhecke/rag>.

## License

The formula in this repo is MIT-licensed (see `LICENSE`). `rag` itself is also
MIT-licensed.
