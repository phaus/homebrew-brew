class AbacusAiCli < Formula
  desc "Abacus AI CLI - A powerful desktop AI assistant with agentic browsing, listening, coding CLI and editor. Automate all your work with state of the art AI and the most powerful agent in the world."
  homepage "https://desktop.abacus.ai"
  version "2.4.7"
  url "https://registry.npmjs.org/@abacus-ai/cli/-/cli-2.4.7.tgz"
  sha256 "fb6e21cc576194c0bb881f37bc1953163e83b976f7dc02c1cc1b950132a12623"

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