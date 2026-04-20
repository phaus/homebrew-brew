class Butterflow < Formula
  desc "Makes motion interpolated and fluid slow motion videos"
  homepage "https://github.com/dthpham/butterflow"
  url "https://github.com/dthpham/butterflow/archive/refs/tags/0.2.3.tar.gz"
  sha256 "eec527abe798cb095194301ade591b3bc015df6f08f00c39a2228d2cf2722859"

  depends_on "ffmpeg"
  depends_on "numpy"
  depends_on "opencv"

  def install
    ENV.prepend_path "PYTHONPATH", Formula["numpy"].opt_lib/"python2.7/site-packages"
    ENV.prepend_path "PYTHONPATH", Formula["opencv"].opt_lib/"python2.7/site-packages"
    ENV.prepend_create_path "PYTHONPATH", libexec/"lib/python2.7/site-packages"
    system "python", *Language::Python.setup_install_args(libexec)
    bin.install Dir["#{libexec}/bin/*"]
    bin.env_script_all_files(libexec/"bin", PYTHONPATH: ENV["PYTHONPATH"])
  end

  test do
    system "#{bin}/butterflow", "-d"
  end
end
