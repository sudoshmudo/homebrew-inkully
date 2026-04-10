class Inkully < Formula
  desc "Inkully app"
  homepage "https://github.com"

  # macOS ARM64 bottle
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/sudoshmudo/inkully/releases/download/v0.1.0/inkully-osx-arm64.tar.gz"
      sha256 "f57df469998b8da1289805210e7c1673ae6e2779d8f5376bc8296ddd43d54c3e"
    else
      odie "Only ARM64 macOS is supported"
    end
  end

  # Linux ARM64 bottle
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/sudoshmudo/inkully/releases/download/v0.1.0/inkully-linux-arm64.tar.gz"
      sha256 "db775cbda02302af9b2f5464c266410f41effaa989982fbbae2c5b8522d5b740"
    else
      odie "Only ARM64 Linux is supported"
    end
  end

  def install
    # Install everything into libexec
    libexec.install Dir["*"]

    # Symlink the CLI into bin
    bin.install_symlink libexec/"inkully"
  end

  test do
    # Basic test: ensure CLI runs and prints help
    assert_match "help", shell_output("#{bin}/inkully --help")
  end
end

