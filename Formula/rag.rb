class Rag < Formula
  desc "Vault-based RAG indexer & search (local SQLite + sqlite-vec + bge-m3)"
  homepage "https://github.com/mario-vanhecke/rag"
  version "0.1.2"
  license "MIT"

  # Optional — DOCX, PDF, and EPUB extraction shells out to pandoc.
  # Markdown and plaintext vaults work without it.
  depends_on "pandoc" => :recommended

  on_macos do
    on_arm do
      url "https://github.com/mario-vanhecke/rag/releases/download/v0.1.2/rag-aarch64-apple-darwin.tar.gz"
      sha256 "566cc305bd26dbd04dfc00ca3a5795ddfa11c8d45ad1c69ca20134e1eae39b97"
    end
    on_intel do
      url "https://github.com/mario-vanhecke/rag/releases/download/v0.1.2/rag-x86_64-apple-darwin.tar.gz"
      sha256 "c296141cf1f971a42d00bc4410d348b495617ec380ed490c74ecb03d9f2705da"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/mario-vanhecke/rag/releases/download/v0.1.2/rag-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "4b3196240993b340d926cb8023658f62049fcd92e387a24887b6a7b745b822cd"
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
