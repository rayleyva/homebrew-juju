require 'formula'

class Jitsu < Formula
  skip_clean :all
  url 'https://launchpad.net/juju-jitsu/trunk/0.20.0/+download/juju-jitsu-0.20.tar.gz'
  head 'lp:juju-jitsu', :using => :bzr
  #url 'lp:juju', :using => :bzr
  homepage 'https://launchpad.net/juju-jitsu'
  md5 '8215515de1721121b92e5ac8814e5048'
  version '0.20'

  depends_on 'bzr'
  depends_on 'coreutils'
  depends_on 'autoconf'
  depends_on "automake"

  def install
    system "autoconf"

    args = ["--prefix=#{prefix}"]
    system "./configure", *args

    system "make install"
  end

  def test
    system "jitsu"
  end
end
