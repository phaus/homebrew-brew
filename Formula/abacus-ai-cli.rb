class AbacusAiCli < Formula
  desc "Abacus AI CLI - A powerful desktop AI assistant with agentic browsing, listening, coding CLI and editor. Automate all your work with state of the art AI and the most powerful agent in the world."
  homepage "https://desktop.abacus.ai"
  version "2.2.12"
  url "https://registry.npmjs.org/@abacus-ai/cli/-/cli-2.2.12.tgz"
  sha256 "5f05785aed40d53a7bd9a82fa7daf5e0cabfc51871395c4382bc9df7cc7050dc"

  depends_on "node"

  def install
    system "npm", "install", "-g", *std_npm_args
    bin.install_symlink libexec.glob("bin/*")
  end

  test do
    # add a meaningful test here, version isn't usually meaningful
    assert_match version.to_s, shell_output("#{bin}/abacusai --version")
  end

end