class Apppass < Formula
  desc "Generate secure passwords for your applications."
  homepage "https://github.com/stescobedo92/apppass"
  url "https://github.com/stescobedo92/releases/download/v1.0.0/apppass-aarch64-apple-darwin.tar.gz"
  sha256 "9e89d6c86a4b3013d1faddfb68137c15424d23b0d1e10c2c0757ada8bdd0cbae"
  license "MIT"

  depends_on "rust" => :build

  option "without-tui", "Build without TUI support"
  option "without-console", "Build without CLI console support"

  def install
    args = []
    if build.without? "tui"
      args << "--no-default-features" << "--features" << "console"
    elsif build.without? "console"
      args << "--no-default-features" << "--features" << "tui"
    end

    system "cargo", "install", *std_cargo_args(args: args)
  end

  test do
    system "#{bin}/apppass", "--version"
  end
end
