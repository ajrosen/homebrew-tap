# rubocop: disable Naming/FileName
# frozen_string_literal: true

# Bitwarden Accelerator
class BitwardenAccelerator < Formula
  homepage 'https://github.com/ajrosen/Bitwarden-Accelerator'
  desc 'Alfred Workflow to make using Bitwarden faster and smoother with all applications'

  version '8.0.0'

  url "#{homepage}/releases/download/bwa-#{version}/Bitwarden.Accelerator.alfredworkflow"
  sha256 '91e3a95c09163b623dd3b9eacf8e645bb477a41402281ffd6bd9dbf6107f8e24'

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
