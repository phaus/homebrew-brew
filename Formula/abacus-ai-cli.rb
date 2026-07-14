class AbacusAiCli < Formula
  desc "Desktop AI assistant with agentic browsing, listening, coding CLI and editor"
  homepage "https://desktop.abacus.ai"
  url "https://registry.npmjs.org/@abacus-ai/cli/-/cli-2.6.0.tgz"
  sha256 "9e8e70ab708b628e66004d06f1d64e99240385dd1e6f29901cd8edf979c27664"

  depends_on "node"

  def install
    system "npm", "install", "-g", *std_npm_args
    bin.install_symlink libexec.glob("bin/*")
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/abacusai --version")
  end
end
