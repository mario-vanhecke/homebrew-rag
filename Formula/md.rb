class Md < Formula
  desc "Anything-to-markdown converter with a vault lifecycle (companion to rag)"
  homepage "https://github.com/mario-vanhecke/tools"
  version "0.2.2"
  license "MIT"

  depends_on "pandoc"  => :recommended
  depends_on "poppler" => :recommended

  on_macos do
    on_arm do
      url "https://github.com/mario-vanhecke/tools/releases/download/v0.2.2/md-aarch64-apple-darwin.tar.gz"
      sha256 "81d437a82eaba803004e1f2166defb2e7833b27c43d626521962fc2c18ef24c5"
    end
    on_intel do
      url "https://github.com/mario-vanhecke/tools/releases/download/v0.2.2/md-x86_64-apple-darwin.tar.gz"
      sha256 "255f18fb942820a39da621f0a08e417a3539d50d1d9d0e94ca5bc39f803552a4"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/mario-vanhecke/tools/releases/download/v0.2.2/md-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "b620b72433dadf3b48c115a23bc7de8e0f08e70e66c5aa8cadf969641caf0d67"
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
