class Aibus < Formula
  desc "Status board on disk for tools that run next to AI agents"
  homepage "https://github.com/dor1a/aibus"
  url "https://github.com/dor1a/aibus/archive/refs/tags/v0.1.2.tar.gz"
  sha256 "3e7414bea91716d4b5e668a814b0780a4f770babd11b509654324a97a8bdaebf"
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
