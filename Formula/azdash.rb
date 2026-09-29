class Azdash < Formula
  desc "Azure cost, trend, and waste diagnostics CLI"
  homepage "https://github.com/stescobedo92/az-dashboard"
  url "https://github.com/stescobedo92/az-dashboard/archive/refs/tags/v0.3.0.tar.gz"
  sha256 "f47346e585e95728fe1c84b934ebe252db3be269c133ca7f558e704f52bdcec0"
  license "MIT"

  depends_on "cmake" => :build
  depends_on "ninja" => :build
  depends_on "ftxui"
  depends_on "nlohmann-json"

  def install
    system "cmake", "-S", ".", "-B", "build", "-G", "Ninja",
      "-DAZ_DASHBOARD_BUILD_TESTS=OFF",
      *std_cmake_args
    system "cmake", "--build", "build"
    system "cmake", "--install", "build"
  end

  test do
    system "#{bin}/azdash", "version"
  end
end
