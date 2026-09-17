class AbacusAiCli < Formula
  desc "Desktop AI assistant with agentic browsing, listening, coding CLI and editor"
  homepage "https://desktop.abacus.ai"
  url "https://registry.npmjs.org/@abacus-ai/cli/-/cli-2.8.1.tgz"
  sha256 "c59b3d0d3e75d2de3f159073a5f00f4a7aa73e844e297c048c8ec2fac1bde82a"

  depends_on "node"

  def install
    system "npm", "install", "-g", *std_npm_args
    bin.install_symlink libexec.glob("bin/*")
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/abacusai --version")
  end
end
