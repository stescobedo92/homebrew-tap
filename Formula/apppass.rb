class Apppass < Formula
  desc "Generate secure passwords for your applications."
  homepage "https://github.com/stescobedo92/apppass"
  url "https://github.com/stescobedo92/releases/download/v1.0.0/apppass"
  sha256 "0b4d7e97ef5d9d8481a5be86d12d2e5ebd9b48b50116c75330e88f61e6fbb635"
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
