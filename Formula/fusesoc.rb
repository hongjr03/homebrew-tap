class Fusesoc < Formula
  include Language::Python::Virtualenv

  desc "Package manager and build abstraction tool for HDL code"
  homepage "https://fusesoc.net"
  url "https://files.pythonhosted.org/packages/c3/34/9fac8ca00e59cac6e00a0adf13a9942b69f6c77676ff5ff617943bbb917b/fusesoc-2.4.6-py3-none-any.whl"
  sha256 "68228c4e935d274ffcb126a8d3cb42cf644fbb829be67fd1178f218f7ebd4c2e"
  license "BSD-2-Clause"

  depends_on "python@3.14"

  pypi_packages package_name: "fusesoc"

  def install
    virtualenv_install_with_resources
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/fusesoc --version")
  end
end
