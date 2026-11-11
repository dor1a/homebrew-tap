class Aibus < Formula
  desc "Status board on disk for tools that run next to AI agents"
  homepage "https://github.com/dor1a/aibus"
  url "https://github.com/dor1a/aibus/archive/refs/tags/v0.1.1.tar.gz"
  sha256 "672896c17e6f3ceee9bd35030975b754399d7db5d5cba71da2437cea2e8a41a8"
  license "MIT"

  uses_from_macos "python"

  def install
    bin.install "aibus"
  end

  test do
    ENV["AIBUS_HOME"] = testpath/"aibus"
    assert_match version.to_s, shell_output("#{bin}/aibus --version")
    system bin/"aibus", "put", "test", "one", "--now", "hello"
    assert_match "hello", shell_output("#{bin}/aibus ls")
  end
end
