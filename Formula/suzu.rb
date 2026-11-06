class Suzu < Formula
  desc "Send macOS notifications with the sender's own icon for Claude Code and Codex"
  homepage "https://github.com/dor1a/suzu"
  url "https://github.com/dor1a/suzu/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "234b7fc68907423b8cfac69fb80797e26c8eb670b86fc986978edaa0b243b881"
  license "MIT"

  depends_on :macos

  def install
    # Homebrew replaces HOME while building; icons live in the real one.
    ENV["SUZU_HOME"] = Etc.getpwuid.dir
    system "scripts/build.sh", libexec
    inreplace "bin/suzu", "@LIBEXEC@", opt_libexec
    bin.install "bin/suzu"
  end

  def caveats
    <<~EOS
      Run this once and allow both notification prompts:
        suzu setup
      The Claude icon comes from /Applications/Claude.app and the Codex icon from
      the Codex app or its VS Code extension. If one was installed later, run:
        brew reinstall suzu
    EOS
  end

  test do
    assert_match "usage", shell_output("#{bin}/suzu 2>&1", 64)
  end
end
