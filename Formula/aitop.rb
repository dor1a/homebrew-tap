class Aitop < Formula
  desc "Live view of what Claude Code and Codex are running on this machine"
  homepage "https://github.com/dor1a/aitop"
  url "https://github.com/dor1a/aitop/archive/refs/tags/v0.1.2.tar.gz"
  sha256 "204515eb78723c5ecd40409997888c1d1eb59beede72d4c7f4af573fb39190a4"
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
