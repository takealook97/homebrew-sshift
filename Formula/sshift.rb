class Sshift < Formula
  desc "SSH server management tool with jump server support"
  homepage "https://github.com/takealook97/sshift"
  url "https://github.com/takealook97/sshift/archive/refs/tags/.tar.gz"
  sha256 "b315b7fa60badf6cee8d7f535e238e6385538c5fb2f7f473e1f8e25f41987572"
  license "MIT"

  depends_on "go" => :build
  depends_on "sshpass"

  def install
    # Set version from git tag
    ldflags = %W[
      -s -w
      -X main.Version=#{version}
    ]

    system "go", "build", *std_go_args(ldflags: ldflags), "-o", bin/"sshift", "main.go"
  end

  test do
    # Test version command
    assert_match "SSHift v#{version}", shell_output("#{bin}/sshift version")

    # Test help command
    assert_match "Usage:", shell_output("#{bin}/sshift help")
  end
end
