# rubocop: disable Naming/FileName
# frozen_string_literal: true

# Bitwarden Accelerator
class BitwardenAccelerator < Formula
  homepage 'https://github.com/ajrosen/Bitwarden-Accelerator'
  desc 'Alfred Workflow to make using Bitwarden faster and smoother with all applications'

  version '7.1.0'

  url "#{homepage}/releases/download/bwa-#{version}/Bitwarden.Accelerator.alfredworkflow"
  sha256 '1b69777e6aeb23918c459a75c6338282f17e79a1b30101e34a893a636e227d80'

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
