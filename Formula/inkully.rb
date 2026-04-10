class Inkully < Formula
  desc "Inkully app"
  homepage "https://github.com"
  version "0.1.2"

  # macOS ARM64 bottle
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/sudoshmudo/homebrew-inkully/releases/download/v0.1.2/inkully-osx-arm64.tar.gz"
      sha256 "ec63d2cb68e68f032ef6f37b242a58517182fd65ffc9288ec610b906fac0b182"
    else
      odie "Only ARM64 macOS is supported"
    end
  end

  # Linux ARM64 bottle
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/sudoshmudo/homebrew-inkully/releases/download/v0.1.2/inkully-linux-arm64.tar.gz"
      sha256 "3684dd70230fb78de62261f0a55a5180cad64918060f4086fb42c0fa4c7a7155"
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

