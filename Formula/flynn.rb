class Flynn < Formula
    $flynn_hash = "ff3251a66acdafcf5eab0d75daa7a059532810f7f5f38c55cf33ab61528189a61e0b268903b8f5746a2ac84c9ba21b013ad14a70ac53c66d5a8241f3cb28f90e"

    desc "Everything you need to get started with Flynn"
    homepage "https://flynn.io/docs/cli"
    url "https://dl.flynn.io/tuf/targets/#{$flynn_hash}.flynn-darwin-amd64.gz"
    version "v20200329.0-755c956"
    sha256 "faa483efed92e241e5c70518b9d82cdfdbf247841d2bbf56592cb2ff8c7c3367"

    def install
      system "mkdir", "bin"
      system "mv", "#{$flynn_hash}.flynn-darwin-amd64", "bin/flynn"
      bin.install "bin/flynn"
    end

    test do
      system bin/"flynn", "version"
    end
  end
