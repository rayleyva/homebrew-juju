require 'formula'

class Juju < Formula
  skip_clean :all
  #url 'https://launchpad.net/ubuntu/precise/+source/juju/0.5+bzr531-0ubuntu1/+files/juju_0.5+bzr531.orig.tar.gz'
  #head 'lp:juju', :using => :bzr
  url 'lp:juju', :using => :bzr
  homepage 'http://juju.ubuntu.com/'
  md5 '09be4a473644f3c88f64c3e29491c9af'
  version '0.5-bzr'

  depends_on 'bzr'
  depends_on 'zookeeper'

  #depends_on 'python'
  #depends_on 'txzookeeper' => :python
  #depends_on 'PyYAML' => :python
  #depends_on 'txaws' => :python
  #depends_on 'pydot' => :python
  #depends_on 'oauth' => :python


  def install
    ENV.deparallelize
    ENV.no_optimization
    system "sudo", "chgrp", "-R", "staff", "/usr/local"
    system "sudo", "chgrp", "-R", "staff", "/Library/Python"
    system "sudo", "chmod", "-R", "+wg", "/usr/local"
    system "sudo", "chmod", "-R", "+wg", "/Library/Python"
    system "easy_install", "PyYAML", "txaws", "pydot", "oauth", "txzookeeper"
    system "python","setup.py", "install"
  end

  def test
    system "juju"
  end
end
