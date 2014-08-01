require "formula"

class LinuxPam < Formula
  homepage "http://www.linux-pam.org/"
  url "http://www.linux-pam.org/library/Linux-PAM-1.1.8.tar.gz"
  sha1 "d055ed81373280a372468c2434cea6313f8d57a8"
 

  depends_on 'pkg-config' => :build
  # depends_on 'intltool' => :build
  depends_on 'flex'
  # depends_on 'gettext'
  # depends_on 'cracklib' => :optional

  # option "disable-nls", "Build Linux-PAM without National Language Support (translated messages)"

  def install

    # opts = []
    # opts << "--disable-nls" if build.include? "disable-nls"

    # fix linker error
    # TODO: make conditional on disable-nls
    # ENV.append "LDFLAGS", "-lintl"

    # Remove unrecognized options if warned by configure
    system "./configure", "--disable-debug",
                          "--disable-dependency-tracking",
                          "--disable-selinux",
                          "--prefix=#{prefix}",
                          "--disable-cracklib",
                          "--disable-nls"
                          # *opts
    system "make"
    system "make check"
    system "make install" 

  end
end
