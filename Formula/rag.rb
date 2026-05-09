class Rag < Formula
  desc "Vault-based RAG indexer & search (local SQLite + sqlite-vec + bge-m3)"
  homepage "https://github.com/mario-vanhecke/rag"
  version "0.1.3"
  license "MIT"

  # Optional — DOCX, PDF, and EPUB extraction shells out to pandoc.
  # Markdown and plaintext vaults work without it.
  depends_on "pandoc" => :recommended

  on_macos do
    on_arm do
      url "https://github.com/mario-vanhecke/rag/releases/download/v0.1.3/rag-aarch64-apple-darwin.tar.gz"
      sha256 "948169be51dca825c44dd4ecee309eb39ebbe9b0305db625b9970fa3d3ccafa4"
    end
    on_intel do
      url "https://github.com/mario-vanhecke/rag/releases/download/v0.1.3/rag-x86_64-apple-darwin.tar.gz"
      sha256 "4b9ee49c268b76b2db493bd019550f480d9e5b05c1605f742f268ba8aa76b0d2"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/mario-vanhecke/rag/releases/download/v0.1.3/rag-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "a21f9c79ff6ceb3b79994e60ea633d75e6f22ed074d45793d1366778e3a4b672"
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
