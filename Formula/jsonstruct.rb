class Jsonstruct < Formula
  include Language::Python::Virtualenv

  desc "CLI tool to pretty-print JSON and decode JWTs"
  homepage "https://github.com/TylorTian/jsonstruct"
  url "https://files.pythonhosted.org/packages/source/j/jsonstruct-cli/jsonstruct_cli-0.1.5.tar.gz"
  sha256 "9a117f8b4f3c9dba7aa87a5c0113358b8b540c7ddabf2edcbbcccf6c572c7ef4"
  license "MIT"

  depends_on "python@3.11"

  def install
    virtualenv_install_with_resources
  end

  test do
    system "#{bin}/jsonstruct", "--help"
  end
end
