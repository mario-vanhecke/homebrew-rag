class Rag < Formula
  desc "Vault-based RAG indexer & search (local SQLite + sqlite-vec + bge-m3)"
  homepage "https://github.com/mario-vanhecke/tools"
  version "0.2.2"
  license "MIT"

  depends_on "pandoc"  => :recommended
  depends_on "poppler" => :recommended

  on_macos do
    on_arm do
      url "https://github.com/mario-vanhecke/tools/releases/download/v0.2.2/rag-aarch64-apple-darwin.tar.gz"
      sha256 "8d8ffe2e1e61844f17977344eb82ef6edad38a34105c5a0118143ff10f7df2e1"
    end
    on_intel do
      url "https://github.com/mario-vanhecke/tools/releases/download/v0.2.2/rag-x86_64-apple-darwin.tar.gz"
      sha256 "c27f94ac6f48d25ae91ca7a999772ea1f0224e9a843028d3f17cb7cdbc655da4"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/mario-vanhecke/tools/releases/download/v0.2.2/rag-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "ba7d6482f15a50a5cd5f8af7f224875bf10cff18a5c82b98e814c27e52f496c8"
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
