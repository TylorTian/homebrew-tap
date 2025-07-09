class Jsonstruct < Formula
  include Language::Python::Virtualenv

  desc "CLI tool to pretty-print JSON and decode JWTs"
  homepage "https://github.com/TylorTian/jsonstruct"
  url "https://files.pythonhosted.org/packages/source/j/jsonstruct-cli/jsonstruct_cli-0.1.5.tar.gz"
  sha256 "027772756edb2738a86482f818810467151755788facfb6f9fdcbf5d1c559445"
  license "MIT"

  depends_on "python@3.11"

  resource "pyjwt" do
    url "https://files.pythonhosted.org/packages/7b/e9/e4734b68a8e7e6b95a9240408a370d238d6d7c2b1d7358e0174d6d1b9d12/PyJWT-2.8.0.tar.gz"
    sha256 "fe4f087f8ea28928b4c3dba9f74842e416cb33623f0cbb2caaed4000a0df6681"
  end

  def install
    venv = virtualenv_create(libexec, "python3.11")
    venv.pip_install resources
    venv.pip_install_and_link buildpath
  end

  test do
    system "#{bin}/jsonstruct", "--help"
  end
end
