class Md < Formula
  desc "Anything-to-markdown converter with a vault lifecycle (companion to rag)"
  homepage "https://github.com/mario-vanhecke/rag"
  version "0.2.0"
  license "MIT"

  # Optional dependencies — the binary works without them, but adding them
  # expands what `md` can convert:
  #   pandoc:  DOCX and EPUB support
  #   poppler: higher-quality PDF extraction via `pdftotext`
  depends_on "pandoc"  => :recommended
  depends_on "poppler" => :recommended

  on_macos do
    on_arm do
      url "https://github.com/mario-vanhecke/rag/releases/download/v0.2.0/md-aarch64-apple-darwin.tar.gz"
      sha256 "eb889bde71a02ae974abf3e43ce2a370073b7f86a0d71dc081ffd005c1f85701"
    end
    on_intel do
      url "https://github.com/mario-vanhecke/rag/releases/download/v0.2.0/md-x86_64-apple-darwin.tar.gz"
      sha256 "957e799e401bff47a62712a28e54ca1e39a8ea26c561ac82bb96312a9a090101"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/mario-vanhecke/rag/releases/download/v0.2.0/md-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "b3843108e0b8a1a688c92e38915191ce5b83bb85fba391c163c8fcd512afd047"
    end
  end

  def install
    bin.install "md"
  end

  test do
    # Smoke: version reports and a fresh vault initialises cleanly.
    assert_match(/md #{version}/, shell_output("#{bin}/md --version"))
    mkdir testpath/"vault"
    system bin/"md", "init", testpath/"vault"
    assert_path_exists testpath/"vault/.md/manifest"
  end
end
