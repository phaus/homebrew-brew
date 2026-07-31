class AbacusAiCli < Formula
  desc "Desktop AI assistant with agentic browsing, listening, coding CLI and editor"
  homepage "https://desktop.abacus.ai"
  url "https://registry.npmjs.org/@abacus-ai/cli/-/cli-2.6.2.tgz"
  sha256 "c020168c4d0bcb9ec4aa70602ffdaba73e354cbccf87b9594e2928fb27a35c29"

  depends_on "node"

  def install
    system "npm", "install", "-g", *std_npm_args
    bin.install_symlink libexec.glob("bin/*")
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/abacusai --version")
  end
end
