# rubocop: disable Naming/FileName
# frozen_string_literal: true

# Bitwarden Accelerator
class BitwardenAccelerator < Formula
  homepage 'https://github.com/ajrosen/Bitwarden-Accelerator'
  desc 'Alfred Workflow to make using Bitwarden faster and smoother with all applications'

  version '8.2.2'

  url "#{homepage}/releases/download/bwa-#{version}/Bitwarden.Accelerator.alfredworkflow"
  sha256 '75e77184bc24c7cddf0689ccfd71b6fcafc2c6aeadc92831cff64d71d11160fc'

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
