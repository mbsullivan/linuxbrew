require "formula"

class LinuxPam < Formula
  homepage "http://www.linux-pam.org/"
  url "http://www.linux-pam.org/library/Linux-PAM-1.1.8.tar.gz"
  sha1 "d055ed81373280a372468c2434cea6313f8d57a8"

  option "disable-nls", "Build Linux-PAM without National Language Support (translated messages)"

  def install

    opts = []
    opts << "--disable-nls" if build.include? "disable-nls"

    # Remove unrecognized options if warned by configure
    system "./configure", "--disable-debug",
                          "--disable-dependency-tracking",
                          "--disable-selinux",
                          "--prefix=#{prefix}",
                          *opts
    system "make", "install" 
  end
end
