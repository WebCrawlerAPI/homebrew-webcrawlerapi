class Webcr < Formula
  desc "Turn websites into LLM-ready markdown from the command line with WebCrawlerAPI"
  homepage "https://webcrawlerapi.com"
  url "https://github.com/webCrawlerAPI/webcr/archive/refs/tags/v0.0.2.tar.gz"
  sha256 "a710d75198efe65a2b083702cb4cdefdccc191f0c67196e23397c1f721e4ab8b"
  license "MIT"

  depends_on "node"

  def install
    libexec.install "webcr.js", "src", "README.md", "LICENSE", "package.json"

    (bin/"webcr").write_env_script libexec/"webcr.js", PATH: ENV["PATH"]
  end

  test do
    output = shell_output("#{bin}/webcr --help")
    assert_match "webcr <url> [options]", output
    assert_match "Turn websites into LLM-ready markdown", (prefix/"libexec/package.json").read
  end
end
