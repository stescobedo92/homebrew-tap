class Apppass < Formula
  desc "Generate secure passwords for your applications."
  homepage "https://github.com/stescobedo92/apppass"
  url "https://github.com/stescobedo92/apppass/archive/refs/tags/v1.0.1.tar.gz"
  sha256 "f6b01782e5bad8b8bb5be4535004d6eceec3e54479f8fe6e8601856a2581ef5c"
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
