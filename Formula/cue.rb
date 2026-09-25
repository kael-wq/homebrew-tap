class Cue < Formula
  desc "macOS clipboard history manager (CLI/TUI/daemon)"
  homepage "https://github.com/kael-wq/cue"
  url "https://github.com/kael-wq/cue/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "71d119ec086672416f1eec9828c519c96fb6655ff140d87cccbc1c50b2e93ae8"
  license "MIT"

  bottle do
    root_url "https://raw.githubusercontent.com/kael-wq/homebrew-tap/main/bottles"
    rebuild 1
    sha256 cellar: :any_skip_relocation, arm64_golden_gate: "977c90fa4a4b4675e9f30209467adcbe3d28562d7e37e78e9abfb22ddc966dbe"
  end

  depends_on :macos

  def install
    system "swift", "build", "-c", "release", "--disable-sandbox"
    bin.install ".build/release/cue"
  end

  test do
    assert_match "cue 0.1.0", shell_output("#{bin}/cue --version")
  end
end
