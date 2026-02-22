class Sipag < Formula
  desc "Sandbox launcher for Claude Code — turns GitHub issues into pull requests"
  homepage "https://github.com/Dorky-Robot/sipag"
  url "https://github.com/Dorky-Robot/sipag/archive/refs/tags/v2.1.0.tar.gz"
  sha256 "7ed8fed8e6b3db8d5c2e47c3c940d8c0bd0381ed42f4ea47c2dc67071e3e51df"
  license "MIT"

  depends_on "rust" => :build

  def install
    system "cargo", "install", "--path", "sipag", "--root", prefix
    system "cargo", "install", "--path", "tui", "--root", prefix

    # Install prompt templates and container scripts needed at runtime
    (share/"sipag/lib").install Dir["lib/*"]
  end

  test do
    assert_match "sipag #{version}", shell_output("#{bin}/sipag version")
  end
end
