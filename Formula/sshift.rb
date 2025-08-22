class Sshift < Formula
  desc "SSH server management tool with jump server support"
  homepage "https://github.com/takealook97/sshift"
  url "https://github.com/takealook97/sshift/archive/refs/tags/v2.3.1.tar.gz"
  sha256 "df33fa97745bdbab8edc4a94f8a2a374c3dd190f46aa9977957e4c08981f4c8e"
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
# Updated for v2.3.1
