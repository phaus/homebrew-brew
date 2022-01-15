class DockerMachineDriverQemu < Formula
    desc "Docker Machine driver for qemu"
    homepage "https://github.com/phaus/docker-machine-driver-qemu"
    url "https://github.com/phaus/docker-machine-driver-qemu.git",
        tag:      "v6",
        revision: "ac1473fa6d8fddb6d9ef2e1726ae3fb47c0bc50e"
    license "Apache-2.0"
    head "https://github.com/phaus/docker-machine-driver-qemu.git", branch: "master"

    depends_on "go" => :build
    depends_on "qemu"
    depends_on "docker-machine"

    def install
        (buildpath/"gopath/src/github.com/phaus/docker-machine-driver-qemu").install \
            Dir["{*,.git,.gitignore,.gitmodules}"]

        ENV["GOPATH"] = "#{buildpath}/gopath"
        build_root = buildpath/"gopath/src/github.com/phaus/docker-machine-driver-qemu"
        build_tags = "lib9p"

        cd build_root do
            git_hash = Utils.git_short_head
            git_hash = "HEAD-#{git_hash}" if build.head?

            go_ldflags = "-w -s -X 'github.com/phaus/docker-machine-driver-qemu/qemu.GitCommit=Homebrew#{git_hash}'"
            ENV["GO_LDFLAGS"] = go_ldflags
            ENV["GO_BUILD_TAGS"] = build_tags

            system "make", "build", "CC=#{ENV.cc}"

            bin.install "bin/docker-machine-driver-qemu"
            prefix.install_metafiles
        end
    end
    
    def caveats
        <<~EOS
            This driver requires superuser privileges to access the hypervisor. To
            enable, execute
                sudo chown root:wheel #{opt_prefix}/bin/docker-machine-driver-qemu
                sudo chmod u+s #{opt_prefix}/bin/docker-machine-driver-qemu
        EOS
    end
    
    test do
        assert_match "qemu-memory-size",
        shell_output("#{Formula["docker-machine"].bin}/docker-machine create --driver qemu -h")
    end
    
end