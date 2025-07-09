class Jsonstruct < Formula
  include Language::Python::Virtualenv

  desc "CLI tool to pretty-print JSON and decode JWTs"
  homepage "https://github.com/TylorTian/jsonstruct"
  url "https://files.pythonhosted.org/packages/source/j/jsonstruct-cli/jsonstruct_cli-0.1.5.tar.gz"
  sha256 "9a117f8b4f3c9dba7aa87a5c0113358b8b540c7ddabf2edcbbcccf6c572c7ef4"
  license "MIT"

  depends_on "python@3.11"

  resource "pyjwt" do
    url "https://files.pythonhosted.org/packages/source/p/pyjwt/pyjwt-2.10.1.tar.gz"
    sha256 "adfba0c2e4122ee1ebd9461602d84f907ad7fdc26d3c8700983d646fa6e87048"
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
