class Sshfzf < Formula
  desc "Pick an SSH host from a tree generated from one hosts.yaml"
  homepage "https://github.com/dor1a/sshfzf"
  url "https://github.com/dor1a/sshfzf/archive/refs/tags/v0.2.0.tar.gz"
  sha256 "a4e376c4d2fed08f9bb99ab498502e0b1fbf4063576137a63c6a4f6dff3314cb"
  license "MIT"

  depends_on "fzf"

  uses_from_macos "python"
  uses_from_macos "zsh"

  def install
    libexec.install "sshfzf", "generate.py", "import-mobaxterm.py", "hosts.example.yaml"
    bin.install_symlink libexec/"sshfzf"
  end

  def caveats
    <<~EOS
      Put your hosts where sshfzf reads them, starting from the example:
        hosts="${SSHFZF_HOSTS_YAML:-${XDG_CONFIG_HOME:-$HOME/.config}/sshfzf/hosts.yaml}"
        mkdir -p -m 700 "$(dirname "$hosts")"
        install -m 600 #{opt_libexec}/hosts.example.yaml "$hosts"
      Then write ~/.ssh/config and the list sshfzf reads:
        sshfzf generate
    EOS
  end

  test do
    ENV["XDG_CONFIG_HOME"] = testpath/".config"
    (testpath/".config/sshfzf").install_symlink libexec/"hosts.example.yaml" => "hosts.yaml"
    assert_equal "3 hosts, no problems", shell_output("#{bin}/sshfzf generate --check").strip
    assert_match "unknown argument", shell_output("#{bin}/sshfzf bogus 2>&1", 2)
  end
end
