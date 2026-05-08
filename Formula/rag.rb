class Rag < Formula
  desc "Vault-based RAG indexer & search (local SQLite + sqlite-vec + bge-m3)"
  homepage "https://github.com/mario-vanhecke/rag"
  version "0.1.0"
  license "MIT"

  # Optional — DOCX and PDF extraction shells out to pandoc. Markdown and
  # plaintext vaults work without it.
  depends_on "pandoc" => :recommended

  on_macos do
    on_arm do
      url "https://github.com/mario-vanhecke/rag/releases/download/v0.1.0/rag-aarch64-apple-darwin.tar.gz"
      sha256 "abdd6c0f4cd406bdc9fe275092eacc2ac40f1274231065fa130a8a318b3e33aa"
    end
    on_intel do
      url "https://github.com/mario-vanhecke/rag/releases/download/v0.1.0/rag-x86_64-apple-darwin.tar.gz"
      sha256 "e67526d9b741389748946e87e1254e865904567edd8299ef4914c7364e04f92f"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/mario-vanhecke/rag/releases/download/v0.1.0/rag-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "f7b3f7f1d637a80f696b309eebddae4e9ab772852d51860fa28fb8e9e4c515bb"
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
