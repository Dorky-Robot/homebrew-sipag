# This formula is auto-updated by the sipag release workflow.
# To update manually, run the release workflow or edit the sha256 hashes below.
class Sipag < Formula
  desc "Conversational agile for Claude Code — you talk, workers ship PRs"
  homepage "https://github.com/Dorky-Robot/sipag"
  version "2.0.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/Dorky-Robot/sipag/releases/download/v#{version}/sipag-aarch64-apple-darwin.tar.gz"
      sha256 "PLACEHOLDER_MACOS_ARM64"
    end
    on_intel do
      url "https://github.com/Dorky-Robot/sipag/releases/download/v#{version}/sipag-x86_64-apple-darwin.tar.gz"
      sha256 "PLACEHOLDER_MACOS_X86_64"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/Dorky-Robot/sipag/releases/download/v#{version}/sipag-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "PLACEHOLDER_LINUX_ARM64"
    end
    on_intel do
      url "https://github.com/Dorky-Robot/sipag/releases/download/v#{version}/sipag-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "PLACEHOLDER_LINUX_X86_64"
    end
  end

  def install
    # Install the Rust CLI binary as the primary 'sipag' command
    bin.install "sipag"

    # Install bash helper scripts to libexec with the original directory layout
    # so that bin/sipag can resolve its lib/ path via SIPAG_ROOT
    (libexec/"bin").install "bin/sipag" => "sipag"
    (libexec/"lib").install Dir["lib/*"]
  end

  def caveats
    <<~EOS
      The sipag Rust CLI is installed and available as 'sipag'.

      Bash helper scripts (sipag start, sipag work, sipag merge, sipag setup)
      are also included and installed to:
        #{opt_libexec}/bin/sipag

      To use the bash commands, add to your shell profile:
        export PATH="#{opt_libexec}/bin:$PATH"

      Then restart your shell. After that, 'sipag start <repo>' will use
      the bash entry point for conversational GitHub board sessions.
    EOS
  end

  test do
    system bin/"sipag", "version"
  end
end
