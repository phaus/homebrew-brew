require "language/node"

class Meshcommander < Formula
  desc "A web based Intel&reg; AMT management console"
  homepage "https://github.com/Ylianst/MeshCommander"
  url "https://registry.npmjs.org/meshcommander/-/meshcommander-0.9.5-a.tgz"
  sha256 "35b17f3001468346d14a31262ae40088837a2c6e5171c0a5d6036a1436c9b0f5"
  depends_on "node"

  def install
    system "npm", "install", *Language::Node.std_npm_install_args(libexec)
    bin.install_symlink Dir["#{libexec}/bin/*"]
  end

  test do
    assert_predicate "#{lib}/node_modules/meshcommander", :exist?
  end
end
