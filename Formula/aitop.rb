class Aitop < Formula
  desc "Live view of what Claude Code and Codex are running on this machine"
  homepage "https://github.com/dor1a/aitop"
  url "https://github.com/dor1a/aitop/archive/refs/tags/v0.1.1.tar.gz"
  sha256 "825422a29f84e1821a9975a98f312ad6af86e2fa2974e5a84dc97f84df11651c"
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
