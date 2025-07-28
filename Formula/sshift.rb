class Sshift < Formula
  desc "SSH server management tool with jump server support"
  homepage "https://github.com/takealook97/sshift"
  version "2.0.0"
  license "MIT"

  url "https://github.com/takealook97/sshift/archive/refs/tags/v2.0.0.tar.gz"
  sha256 "e5a65fd345dea652c7c259fc33e5272fdc2939776c2094dfc8984206432b94d1"

  depends_on "go" => :build

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
