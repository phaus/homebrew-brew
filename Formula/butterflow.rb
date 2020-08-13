class Butterflow < Formula
    desc "Makes motion interpolated and fluid slow motion videos"
    homepage "https://github.com/dthpham/butterflow"
    url "https://github.com/dthpham/butterflow/archive/0.2.3.tar.gz"
    sha256 "5b4f8e40d632c6dcc27a1c6b33b55b43f7e2f3c060a5b2fcf58b1aaecf58adec"
    version "0.2.3"

    depends_on "ffmpeg"
    depends_on "opencv@2"

    def install
      ENV.prepend_path "PYTHONPATH", Formula["numpy"].opt_lib/"python2.7/site-packages"
      ENV.prepend_path "PYTHONPATH", Formula["opencv@2"].opt_lib/"python2.7/site-packages"
      ENV.prepend_create_path "PYTHONPATH", libexec/"lib/python2.7/site-packages"
      system "python", *Language::Python.setup_install_args(libexec)
      system "pip", "install", "-U", "numpy"
      bin.install Dir["#{libexec}/bin/*"]
      bin.env_script_all_files(libexec/"bin", :PYTHONPATH => ENV["PYTHONPATH"])
    end

    test do
      system "#{bin}/butterflow", "-d"
    end
  end
  