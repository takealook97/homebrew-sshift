class Sshift < Formula
  desc "SSH server management tool with jump server support"
  homepage "https://github.com/takealook97/sshift"
  url "https://github.com/takealook97/sshift/archive/refs/tags/v2.2.6.tar.gz"
  sha256 "c05d9a4e6e17ea3e1ff142d9653cda6f4067a72ec0c03b143255f8d5380452c6"
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
