class AbacusAiCli < Formula
  desc "Abacus AI CLI - A powerful desktop AI assistant with agentic browsing, listening, coding CLI and editor. Automate all your work with state of the art AI and the most powerful agent in the world."
  homepage "https://desktop.abacus.ai"
  version "2.2.5"
  url "https://registry.npmjs.org/@abacus-ai/cli/-/cli-2.2.5.tgz"
  sha256 "b6fff5419079f7ed65d0fc02e50266febf19fee2e8536cd9c8339dc36ae8940c"

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