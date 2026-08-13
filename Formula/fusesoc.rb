class Fusesoc < Formula
  include Language::Python::Virtualenv

  desc "Package manager and build abstraction tool for HDL code"
  homepage "https://fusesoc.net"
  url "https://files.pythonhosted.org/packages/80/7d/80bd86ba4d4fb5f387f36ea701335930e541a88df9329ac19559880d2938/fusesoc-2.4.6.tar.gz"
  sha256 "774e0316d57bd4292bbd7e75c75f5c9742929f6c8e08c99858646fdc0103f17c"
  license "BSD-2-Clause"

  depends_on "python@3.14"

  pypi_packages package_name: "", extra_packages: %w[edalize pyparsing pyyaml simplesat fastjsonschema argcomplete]

  resource "fusesoc-wheel" do
    url "https://files.pythonhosted.org/packages/c3/34/9fac8ca00e59cac6e00a0adf13a9942b69f6c77676ff5ff617943bbb917b/fusesoc-2.4.6-py3-none-any.whl"
    sha256 "68228c4e935d274ffcb126a8d3cb42cf644fbb829be67fd1178f218f7ebd4c2e"
  end

  def install
    venv = virtualenv_create(libexec, "python3.14", system_site_packages: true, without_pip: true)
    venv.pip_install(resources.reject { |resource| resource.name == "fusesoc-wheel" })
    venv.pip_install_and_link(resource("fusesoc-wheel"))
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/fusesoc --version")
  end
end
