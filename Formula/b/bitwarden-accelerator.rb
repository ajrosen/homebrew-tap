# rubocop: disable Naming/FileName
# frozen_string_literal: true

# Bitwarden Accelerator
class BitwardenAccelerator < Formula
  homepage 'https://github.com/ajrosen/Bitwarden-Accelerator'
  desc 'Alfred Workflow to make using Bitwarden faster and smoother with all applications'

  version '8.0.1'

  url "#{homepage}/releases/download/bwa-#{version}/Bitwarden.Accelerator.alfredworkflow"
  sha256 'b4ddddf94e75b25014cb754e8b94108d9d5ca575e9647ca3c4d2d0d20b10f654'

  depends_on 'bitwarden-cli'
  uses_from_macos 'jq', since: :sequoia

  def install
    system 'open', cached_download

    # Create something so brew doesn't see an empty installation
    rm_rf bin if bin.exist?
    mkdir_p bin
  end
end

# rubocop: enable Naming/FileName
