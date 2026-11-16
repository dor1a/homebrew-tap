class Aitop < Formula
  desc "Live view of what Claude Code and Codex are running on this machine"
  homepage "https://github.com/dor1a/aitop"
  url "https://github.com/dor1a/aitop/archive/refs/tags/v0.1.6.tar.gz"
  sha256 "2cfc3c863e11f046149e5482bbe68d4cb66556f80eafb32d50e8a886d2f98168"
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
