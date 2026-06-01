class Webcr < Formula
  desc "Turn websites into LLM-ready markdown from the command line with WebCrawlerAPI"
  homepage "https://webcrawlerapi.com"
  url "https://github.com/webCrawlerAPI/webcr/archive/refs/tags/v0.1.2.tar.gz"
  sha256 "86f47943318ddc0fc5a09c101f30b111f4895246d238fd2d4b0c48824a89921a"
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
