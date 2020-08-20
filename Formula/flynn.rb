class Flynn < Formula
  $flynn_hash = "1235acfeacc50df3d6068c1bde9247dd004a74decd737568244be2382b97d23e3dbdf0276dd3ae464de8cd7d74616a9a7d452572ada4ba0c134416b9e8e40bb4"

  desc "Everything you need to get started with Flynn"
  homepage "https://flynn.io/docs/cli"
  url "https://dl.flynn.io/tuf/targets/#{$flynn_hash}.flynn-darwin-amd64.gz"
  version "v20200818.0-eecb13b"
  sha256 "b1f775022e850da953d88a6058415068cba2c91a8fb09ba135ed1332ecc07f36"

  def install
    system "mkdir", "bin"
    system "mv", "#{$flynn_hash}.flynn-darwin-amd64", "bin/flynn"
    bin.install "bin/flynn"
  end

  test do
    system bin/"flynn", "version"
  end
end
