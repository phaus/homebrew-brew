class Flynn < Formula
  $flynn_hash = "dc429a95b99d2f75adc906275d317b25a2a6ce09886ea101473e2c4b1cb44426e5ae104db943e2f1a46a165c0f7dd086c2954f1a7b274910b669989651340f3e"

  desc "Everything you need to get started with Flynn"
  homepage "https://flynn.io/docs/cli"
  url "https://dl.flynn.io/tuf/targets/#{$flynn_hash}.flynn-darwin-amd64.gz"
  version "v20200804.1-1ecd12c"
  sha256 "c7906be3ba637ef4c4bfdef4a7964e17e0f27c854fca6ff2351033ba5f2aab2f"

  def install
    system "mkdir", "bin"
    system "mv", "#{$flynn_hash}.flynn-darwin-amd64", "bin/flynn"
    bin.install "bin/flynn"
  end

  test do
    system bin/"flynn", "version"
  end
end
