class Aibus < Formula
  desc "Status board on disk for tools that run next to AI agents"
  homepage "https://github.com/dor1a/aibus"
  url "https://github.com/dor1a/aibus/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "2bb6538a951cbb8299749734b8386ed7c4f2bd82b03677de8abc3fa61f924d1b"
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
