class Boxes < Formula
  desc "Draw boxes around text"
  homepage "https://boxes.thomasjensen.com/"
  url "https://github.com/ascii-boxes/boxes/archive/v2.0.0.tar.gz"
  sha256 "952c85eccde42d23252dfe590d6f296a2179297ad1c54745330fb794907f5ad9"
  license "GPL-2.0-only"
  head "https://github.com/ascii-boxes/boxes.git"

  bottle do
    sha256 arm64_big_sur: "86b71a2dc84252884cfdf5d49a3ac2c74f6353df0988ff82a91f94f73ae0e0a9"
    sha256 big_sur:       "ac4cba99372fa9c4a07d429769561c51492b244868c6694c3bd09cb872883d31"
    sha256 catalina:      "48a3b6d9b8c23a3ab1f366f6f085361cc8db8cd341dfe9474665d87c4c23bbf8"
    sha256 mojave:        "84b135ad528536233546dbf8d36e0be4a21a89050910e45a4f8e2796c99b7c3f"
    sha256 high_sierra:   "ca1c4e0e76f03ee4a60789f30093d2eee3794ff54b989da1a8a3ae555228f081"
    sha256 sierra:        "d31462128d1f55cd3014ae942b4620f1ec4d06e72e8a47cae5ef56afcf65e791"
  end

  depends_on "libunistring"
  depends_on "pcre2"

  def install
    # distro uses /usr/share/boxes change to prefix
    system "make", "GLOBALCONF=#{share}/boxes-config", "CC=#{ENV.cc}"

    bin.install "src/boxes"
    man1.install "doc/boxes.1"
    share.install "boxes-config"
  end

  test do
    assert_match "test brew", pipe_output("#{bin}/boxes", "test brew")
  end
end
