class Rag < Formula
  desc "Vault-based RAG indexer & search (local SQLite + sqlite-vec + bge-m3)"
  homepage "https://github.com/mario-vanhecke/rag"
  version "0.1.4"
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
      url "https://github.com/mario-vanhecke/rag/releases/download/v0.1.4/rag-aarch64-apple-darwin.tar.gz"
      sha256 "d88092f5d31ee23f9b7de12bd0282f69e0a90e47ec67764a25045aed2e454c7b"
    end
    on_intel do
      url "https://github.com/mario-vanhecke/rag/releases/download/v0.1.4/rag-x86_64-apple-darwin.tar.gz"
      sha256 "8375ea9eaeccc920bb6fc26a966f0983f56c9b3f3ae29e41bd41ebe18d09fb60"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/mario-vanhecke/rag/releases/download/v0.1.4/rag-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "7fcf7ed3566e7ccecdc1081262b23fda1478c392edfd769b505c08b8282cd8c0"
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
