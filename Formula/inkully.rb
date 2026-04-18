class Inkully < Formula
  desc "Inkully app"
  homepage "https://github.com"
  version "0.1.3"

  # macOS ARM64 bottle
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/sudoshmudo/homebrew-inkully/releases/download/v0.1.3/inkully-osx-arm64.tar.gz"
      sha256 "727e34cafec5e321e4fad21a3539cfe2fa133f563f0ac4883f167c4025466ef8"
    else
      odie "Only ARM64 macOS is supported"
    end
  end

  # Linux ARM64 bottle
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/sudoshmudo/homebrew-inkully/releases/download/v0.1.3/inkully-linux-arm64.tar.gz"
      sha256 "a48b74c80b6dfd339fdec1f15744f986318f71588c7d15f5fe40e4ea7d64c3f2"
    else
      odie "Only ARM64 Linux is supported"
    end
  end

  def install
    # Install everything into libexec
    libexec.install Dir["*"]

    # Symlink the CLI into bin
    bin.install_symlink libexec/"Inkully.Cli" => "inkully"
  end

  test do
    # Basic test: ensure CLI runs and prints help
    assert_match "help", shell_output("#{bin}/inkully --help")
  end
end

