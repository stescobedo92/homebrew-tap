class Azdash < Formula
  desc "Azure cost, trend, and waste diagnostics CLI"
  homepage "https://github.com/stescobedo92/az-dashboard"
  url "https://github.com/stescobedo92/az-dashboard/archive/refs/tags/v0.2.0.tar.gz"
  sha256 "f37a8525943d9986046f35dcff093ba7fabfe8a587e23f4cf07373d09b6a21a9"
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
