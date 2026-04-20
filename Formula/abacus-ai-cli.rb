class AbacusAiCli < Formula
  desc "Desktop AI assistant with agentic browsing, listening, coding CLI and editor"
  homepage "https://desktop.abacus.ai"
  url "https://registry.npmjs.org/@abacus-ai/cli/-/cli-2.4.8.tgz"
  sha256 "f003551eca508138b92fcecfbd09c219e2e6c2dc942615265edd9e0601cee514"

  depends_on "node"

  def install
    system "npm", "install", "-g", *std_npm_args
    bin.install_symlink libexec.glob("bin/*")
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/abacusai --version")
  end
end
