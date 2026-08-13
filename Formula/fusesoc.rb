class Fusesoc < Formula
  include Language::Python::Virtualenv

  desc "Package manager and build abstraction tool for HDL code"
  homepage "https://fusesoc.net"
  url "https://files.pythonhosted.org/packages/80/7d/80bd86ba4d4fb5f387f36ea701335930e541a88df9329ac19559880d2938/fusesoc-2.4.6.tar.gz"
  sha256 "774e0316d57bd4292bbd7e75c75f5c9742929f6c8e08c99858646fdc0103f17c"
  license "BSD-2-Clause"

  depends_on "python@3.14"

  pypi_packages

  def install
    virtualenv_install_with_resources
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/fusesoc --version")
  end
end
