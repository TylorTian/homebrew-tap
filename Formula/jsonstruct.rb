class Jsonstruct < Formula
  include Language::Python::Virtualenv

  desc "CLI tool to pretty-print JSON and decode JWTs"
  homepage "https://github.com/TylorTian/jsonstruct"
  url "https://files.pythonhosted.org/packages/source/j/jsonstruct-cli/jsonstruct_cli-0.1.19.tar.gz"
  sha256 "b916037e69a813f1b865dcfd423db8dd1166874ccd0efd046bc79c52b6894318"
  license "MIT"

  depends_on "python@3.11"

  resource "pyjwt" do
    url "https://files.pythonhosted.org/packages/source/p/pyjwt/pyjwt-2.10.1.tar.gz"
    sha256 "3cc5772eb20009233caf06e9d8a0577824723b44e6648ee0a2aedb6cf9381953"
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
