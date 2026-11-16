class Aitop < Formula
  desc "Live view of what Claude Code and Codex are running on this machine"
  homepage "https://github.com/dor1a/aitop"
  url "https://github.com/dor1a/aitop/archive/refs/tags/v0.1.4.tar.gz"
  sha256 "dab162fe621a0adb0721ca1c7edb553e2656b83e82c621778531c866180bf65b"
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
