class Rag < Formula
  desc "Vault-based RAG indexer & search (local SQLite + sqlite-vec + bge-m3)"
  homepage "https://github.com/mario-vanhecke/rag"
  version "0.2.0"
  license "MIT"

  # Optional dependencies — the binary works without them, but adding them
  # expands what `rag` can index:
  #   pandoc:  DOCX and EPUB support
  #   poppler: higher-quality PDF extraction via `pdftotext`
  #            (without poppler, rag falls back to a pure-Rust extractor
  #            that handles most PDFs but panics on a few unusual font
  #            encodings)
  depends_on "pandoc"  => :recommended
  depends_on "poppler" => :recommended

  on_macos do
    on_arm do
      url "https://github.com/mario-vanhecke/rag/releases/download/v0.2.0/rag-aarch64-apple-darwin.tar.gz"
      sha256 "369f53fa65df45486b19cf728199381a6a1273c5b9ba8a6ab2bbf210db8621c9"
    end
    on_intel do
      url "https://github.com/mario-vanhecke/rag/releases/download/v0.2.0/rag-x86_64-apple-darwin.tar.gz"
      sha256 "9f649ff3d9c0b20a8c8d0426d15c276b21c037d98baeea6aa2c1da4a40752e92"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/mario-vanhecke/rag/releases/download/v0.2.0/rag-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "7c569220ae79cfff032e8f95da7951cfec2052b2dbb82e41108b306c53cf8586"
    end
  end

  def install
    bin.install "rag"
  end

  test do
    # Smoke test: version reports and a fresh vault initialises cleanly.
    assert_match(/rag #{version}/, shell_output("#{bin}/rag --version"))
    mkdir testpath/"vault"
    system bin/"rag", "init", testpath/"vault"
    assert_path_exists testpath/"vault/.vault/vault"
  end
end
