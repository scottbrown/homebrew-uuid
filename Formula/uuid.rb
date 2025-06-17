# frozen_string_literal: true

VERSION = '1.0.3'
PACKAGE = 'uuid'
REPO = "https://github.com/scottbrown/#{PACKAGE}"

# Homebrew formula
class Uuid < Formula
  desc 'A lightweight, dependency-free Go CLI application for generating and parsing UUIDs. Supports multiple UUID versions with a focus on simplicity, performance, and standards compliance.'
  homepage REPO
  license 'MIT'
  version VERSION

  def self.prefix
    "#{REPO}/releases/download/v#{VERSION}/#{PACKAGE}-v#{VERSION}"
  end

  on_macos do
    if Hardware::CPU.arm?
      url "#{prefix}-darwin-arm64.tar.gz"
      sha256 '5338f58c3b432733c4289f9c361676b99b460b684edae37cfd21765627d667c7'
    else
      url "#{prefix}-darwin-amd64.tar.gz"
      sha256 '0ecc95f0ca4c189056b73c1107961b22c2de1c264b44456956a81e640d4e95a0'
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "#{prefix}-linux-arm64.tar.gz"
      sha256 'c2c7f4031727fc1211d1e9e03c9bed0d98feeb5c4d23d6bc4736f4601ad9d0e5'
    else
      url "#{prefix}-linux-amd64.tar.gz"
      sha256 '0e96d228eb96140abb661c3991a7c11ad30098b5181e9b77ee017b3f12093315'
    end
  end

  def install
    bin.install PACKAGE
  end

  test do
    system "#{bin}/#{PACKAGE}", '--help'
  end
end
