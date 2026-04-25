class Webcr < Formula
  desc "Turn websites into LLM-ready markdown from the command line with WebCrawlerAPI"
  homepage "https://webcrawlerapi.com"
  url "https://github.com/webCrawlerAPI/webcr/archive/refs/tags/v0.1.1.tar.gz"
  sha256 "e5349ea6352d3d6abb238d87ba91b3f24f51f3319284dda19ac0d047d5f99fa9"
  license "MIT"

  depends_on "node"

  def install
    libexec.install "webcr.js", "src", "README.md", "LICENSE", "package.json"
    (libexec/"webcr.js").chmod 0555

    (bin/"webcr").write_env_script libexec/"webcr.js", PATH: ENV["PATH"]
  end

  test do
    output = shell_output("#{bin}/webcr --help")
    assert_match "webcr <url> [options]", output
    assert_match "Turn websites into LLM-ready markdown", (prefix/"libexec/package.json").read
  end
end
