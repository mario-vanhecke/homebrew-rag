class Rag < Formula
  desc "Vault-based RAG indexer & search (local SQLite + sqlite-vec + bge-m3)"
  homepage "https://github.com/mario-vanhecke/rag"
  version "0.1.1"
  license "MIT"

  # Optional — DOCX, PDF, and EPUB extraction shells out to pandoc.
  # Markdown and plaintext vaults work without it.
  depends_on "pandoc" => :recommended

  on_macos do
    on_arm do
      url "https://github.com/mario-vanhecke/rag/releases/download/v0.1.1/rag-aarch64-apple-darwin.tar.gz"
      sha256 "830f467d0b81fe062d4a4963412ab626a2522b2aaf694c676fb91aecd9a82509"
    end
    on_intel do
      url "https://github.com/mario-vanhecke/rag/releases/download/v0.1.1/rag-x86_64-apple-darwin.tar.gz"
      sha256 "17777eaf03250b9f3161335ec3d89428ffeb4ef39b31d44192422cf714139d0e"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/mario-vanhecke/rag/releases/download/v0.1.1/rag-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "18c48318b0d9f55bd14cfec5bbc30b8118d61cd4d0496de25d6addd296863d32"
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
