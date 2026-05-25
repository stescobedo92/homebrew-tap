class Azdash < Formula
  desc "Azure cost, trend, and waste diagnostics CLI"
  homepage "https://github.com/stescobedo92/az-dashboard"
  url "https://github.com/stescobedo92/az-dashboard/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "5db009e841448af453703f2063fd4556956db44c730f72f35ece0a2c02ebe6ae"
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
