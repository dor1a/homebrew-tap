class Aitop < Formula
  desc "Live view of what Claude Code and Codex are running on this machine"
  homepage "https://github.com/dor1a/aitop"
  url "https://github.com/dor1a/aitop/archive/refs/tags/v0.1.5.tar.gz"
  sha256 "2eb7fc16a819f0cd42a5afd05cd374028b5e33d34edd2f080bf8de67a6761f95"
  license "MIT"

  uses_from_macos "python"

  def install
    bin.install "aitop"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/aitop --version")
    assert_match "No ongoing or uncertain records", shell_output("#{bin}/aitop --plain")
  end
end
