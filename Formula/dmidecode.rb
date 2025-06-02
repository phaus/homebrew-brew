class Dmidecode < Formula
  desc "Dmidecode reports information about your system's hardware."
  homepage "https://github.com/cavaliercoder/dmidecode-osx"
  url "https://github.com/cavaliercoder/dmidecode-osx/archive/refs/heads/v3.1.zip"
  version "3.1"
  sha256 "fc5508e1a84d344fe3a0ec7339bcbae24b7587d828594e228649dbcfeb244a31"

  def install
    system "make", "dmidecode"
    bin.install "dmidecode"
    man8.install "man/dmidecode.8"
  end

  test do
    system "#{bin}/dmidecode"
  end
end
