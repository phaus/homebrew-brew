class Dmidecode < Formula
  desc "Dmidecode reports information about your system's hardware."
  homepage "https://github.com/cavaliercoder/dmidecode-osx"
  url "https://github.com/phaus/dmidecode-osx/archive/refs/tags/v3.1+p1.tar.gz"
  version "3.1+p1"
  sha256 "5b52ad05b792459e13ef3fee5c3eb054530fdafd5e40f3b5342cde75f96a37a1"

  def install
    system "make", "dmidecode"
    bin.install "dmidecode"
    man8.install "man/dmidecode.8"
  end

  test do
    system "#{bin}/dmidecode"
  end
end
