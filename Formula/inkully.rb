class Inkully < Formula
  desc "Inkully app"
  homepage "https://github.com"

  # macOS ARM64 bottle
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/sudoshmudo/homebrew-inkully/releases/download/v0.1.1/inkully-osx-arm64.tar.gz"
      sha256 "1cba24253cac072bf1aa2065de911e0df4385d00af4823ae3903251d84ca9cfb"
    else
      odie "Only ARM64 macOS is supported"
    end
  end

  # Linux ARM64 bottle
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/sudoshmudo/homebrew-inkully/releases/download/v0.1.1/inkully-linux-arm64.tar.gz"
      sha256 "e587752c23d3ec5019073fa0d5aa750d866cdff86cd8c7565deca5bf201b26a9"
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

