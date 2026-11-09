class Suzu < Formula
  desc "Send macOS notifications with Claude Code, Codex or suzu's own icon"
  homepage "https://github.com/dor1a/suzu"
  url "https://github.com/dor1a/suzu/archive/refs/tags/v0.1.1.tar.gz"
  sha256 "90635068052954651213e9eece41cef7e152e1940333fe4d583b49b6a49e5210"
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
      Run this and allow each notification prompt (Claude Code, Codex, suzu),
      also after an upgrade that adds an app:
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
