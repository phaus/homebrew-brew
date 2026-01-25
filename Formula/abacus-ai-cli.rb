class AbacusAiCli < Formula
  desc "Abacus AI CLI - A powerful desktop AI assistant with agentic browsing, listening, coding CLI and editor. Automate all your work with state of the art AI and the most powerful agent in the world."
  homepage "https://desktop.abacus.ai"
  version "1.106.25008"
  url "https://registry.npmjs.org/@abacus-ai/cli/-/cli-1.106.25008.tgz"
  sha256 "9e5df83f236ada5940be4e8f8d6087f7f7b1830bf7046dcadbbe2aaa15b02eae"

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